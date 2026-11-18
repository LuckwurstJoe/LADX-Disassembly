#include "asm.h"
#include "treasure.h"
#pragma bank 0x0A

#define DIR_RIGHT 0
#define DIR_LEFT 1
#define DIR_DOWN 2
#define DIR_UP 3

#define ROOM_DOOR_RIGHT (1 << DIR_RIGHT)
#define ROOM_DOOR_LEFT (1 << DIR_LEFT)
#define ROOM_DOOR_DOWN (1 << DIR_DOWN)
#define ROOM_DOOR_UP (1 << DIR_UP)

#define ROOM_LOCK_RIGHT (0x10 << DIR_RIGHT)
#define ROOM_LOCK_LEFT (0x10 << DIR_LEFT)
#define ROOM_LOCK_DOWN (0x10 << DIR_DOWN)
#define ROOM_LOCK_UP (0x10 << DIR_UP)

#define ROOM_TYPE_NORMAL   0x00
#define ROOM_TYPE_ENTRANCE 0x01
#define ROOM_TYPE_EXIT     0x02
#define ROOM_TYPE_TREASURE 0x03
#define ROOM_TYPE_SPECIAL  0x04
#define ROOM_TYPE_FINAL    0x05
// Village floor room types (tables 6-10 in roomdata.asm, no enemies)
#define ROOM_TYPE_VILLAGE_EMPTY    0x06
#define ROOM_TYPE_VILLAGER         0x07 // one $4D entity, acts according to sLSDRoomRole
#define ROOM_TYPE_VILLAGE_EXIT     0x08 // exit hole without a boss
#define ROOM_TYPE_VILLAGE_SHOP     0x09
#define ROOM_TYPE_VILLAGE_TREASURE 0x0A

// Room roles, keep in sync with const.asm
#define ROLE_NONE           0
#define ROLE_TRADER_YOSHI   1
#define ROLE_TRADER_BANANAS 2
#define ROLE_TRADER_LENS    3
#define ROLE_HINT           4
#define ROLE_OWL_SIGN       5 // owl statue in the entrance room, floors with a secret
#define ROLE_DEVIL          6 // Vire: a heart container for a strong item (floors 6-9)

#define ROOM_SECOND_HALF   0x01
#define ROOM_MAIN_PATH     0x02
#define ROOM_SIDE_PATH     0x04
// Bits 4-7 of randomMapDataTmp: the bombable wall in that direction looks like a normal wall
#define ROOM_HIDDEN_WALL(dir) (0x10 << (dir))

// Run layout: floors 1-4 and 6-9 are random dungeons, floor 5 is the village,
// floor 10 is the final nightmare.
#define VILLAGE_DEPTH 5
#define FINAL_DEPTH   10
#define DEEP_DEPTH    6   // from here on chests and shops get better
#define HINT_DEPTH    4   // floor with the trapped NPC that knows the labyrinth path

uint8_t generateRandomMove(uint8_t from);
uint8_t doMove(uint8_t from, uint8_t dir);
uint8_t flipDir(uint8_t dir);
uint8_t pickRandomTreasure(void);
void buildVillageMap(void);
void makeBombableDeadEnd(uint8_t n, uint8_t hidden);
void placeSecretTreasure(uint8_t treasure);
uint8_t makeSecretRoom(uint8_t hidden);
void placeDevil(void);
uint8_t templateHasEntitySetForDepth(const uint8_t* p);
void placeHintNpc(void);
void placeSpecialTreasure(uint8_t treasure);

const uint8_t random_treasure_list[] = {
    TREASURE_RUPEES_200, TREASURE_RUPEES_50, TREASURE_RUPEES_100, TREASURE_BOMBS,
    TREASURE_RUPEES_200, TREASURE_RUPEES_50, TREASURE_RUPEES_100, TREASURE_BOW,
    TREASURE_RUPEES_50, TREASURE_COMPASS, TREASURE_POTION_2, TREASURE_PIECE_OF_POWER,
    TREASURE_RUPEES_50, TREASURE_POWDER, TREASURE_MAP, TREASURE_POTION_1,
    TREASURE_PIECE_OF_HEART, TREASURE_PIECE_OF_HEART, TREASURE_PIECE_OF_HEART, TREASURE_PIECE_OF_HEART,
    TREASURE_HEART_REFILL, TREASURE_RUPEES_200, TREASURE_RUPEES_100, TREASURE_FAIRY_BOTTLE,
    TREASURE_PIECE_OF_POWER, TREASURE_POTION_1, TREASURE_POWDER, TREASURE_BOMBS,
    TREASURE_RUPEES_100, TREASURE_HEART_REFILL, TREASURE_RUPEES_200, TREASURE_HEART_REFILL,
};

// Floors after the village draw from this list: fewer small rupees, more hearts and power.
const uint8_t random_treasure_list_deep[] = {
    TREASURE_RUPEES_200, TREASURE_RUPEES_100, TREASURE_RUPEES_200, TREASURE_BOMBS,
    TREASURE_PIECE_OF_HEART, TREASURE_PIECE_OF_HEART, TREASURE_PIECE_OF_HEART, TREASURE_PIECE_OF_HEART,
    TREASURE_PIECE_OF_HEART, TREASURE_PIECE_OF_POWER, TREASURE_PIECE_OF_POWER, TREASURE_POTION_2,
    TREASURE_FAIRY_BOTTLE, TREASURE_FAIRY_BOTTLE, TREASURE_POTION_2, TREASURE_HEART_CONTAINER,
    TREASURE_HEART_REFILL, TREASURE_RUPEES_100, TREASURE_BOW, TREASURE_PIECE_OF_POWER,
    TREASURE_PIECE_OF_POWER, TREASURE_POWDER, TREASURE_BOMBS, TREASURE_POTION_1,
    TREASURE_RUPEES_200, TREASURE_HEART_REFILL, TREASURE_RUPEES_100, TREASURE_COMPASS,
    TREASURE_MAP, TREASURE_RUPEES_50, TREASURE_PIECE_OF_HEART, TREASURE_RUPEES_200,
};

uint8_t pickRandomTreasure(void)
{
    if (dungeonDepth >= DEEP_DEPTH)
        return random_treasure_list_deep[rand8range(sizeof(random_treasure_list_deep))];
    return random_treasure_list[rand8range(sizeof(random_treasure_list))];
}

void generateRandomMap(void)
{
    // Grows from 8 (floor 1) to 12 (floor 10), same range as the original 5-floor run.
    uint8_t main_path_length = 7 + ((dungeonDepth + 1) >> 1);
    uint8_t main_path_split = (main_path_length >> 1) - 3 + (rand8() & 3);
    uint8_t side_path_count = 4 + dungeonDepth;

    hMapId = rand8() & 7;

retry:
    for(uint8_t n=0; n<0x40; n++) {
        randomMapDataFlags[n] = 0;
        randomMapDataID[n] = 0;
        randomMapDataTmp[n] = 0;
        sLSDRoomRole[n] = ROLE_NONE;
    }

    if (dungeonDepth >= FINAL_DEPTH) {
        //Time to fight the final nightmare
        hMapRoom = 0;
        randomMapDataID[0] = ROOM_TYPE_FINAL;
        hMapId = 8;
        return;
    }

    if (dungeonDepth == VILLAGE_DEPTH) {
        buildVillageMap();
        return;
    }

    //Build the main path
    uint8_t safety = 0;
    uint8_t start_room = rand8() & 0x3F;
    if ((start_room & 0x38) == 0x38) goto retry; // Final room cannot be in the bottom row (was "== 38", which never matched).
    //Mark the final room, and make a door downwards
    randomMapDataFlags[start_room] = ROOM_DOOR_DOWN;
    randomMapDataID[start_room] = ROOM_TYPE_EXIT;
    randomMapDataTmp[start_room] = ROOM_MAIN_PATH | ROOM_SECOND_HALF;
    //Move one room down.
    uint8_t current_room = start_room + 8;
    randomMapDataFlags[current_room] = ROOM_DOOR_UP;
    randomMapDataTmp[current_room] = ROOM_MAIN_PATH | ROOM_SECOND_HALF;
    for(uint8_t count=0; count<main_path_length;) {
        if (++safety == 0) goto retry;
        uint8_t move_dir = generateRandomMove(current_room);
        if (move_dir == 0xFF) continue;
        uint8_t target_room = doMove(current_room, move_dir);
        if (randomMapDataFlags[target_room]) continue;
        randomMapDataFlags[current_room] |= 1 << move_dir;
        randomMapDataFlags[target_room] |= 1 << (move_dir ^ 1);
        if (count < main_path_split)
            randomMapDataTmp[target_room] = ROOM_MAIN_PATH | ROOM_SECOND_HALF;
        else
            randomMapDataTmp[target_room] = ROOM_MAIN_PATH;
        current_room = target_room;
        count++;
    }
    //Mark start room
    hMapRoom = current_room;
    randomMapDataID[current_room] = ROOM_TYPE_ENTRANCE;

    //Build side paths
    safety = 0;
    for(uint8_t count=0; count<side_path_count; ) {
        if (++safety == 0) goto retry;
        current_room = rand8() & 0x3F;
        if (!randomMapDataFlags[current_room]) continue;
        if (randomMapDataID[current_room] == ROOM_TYPE_EXIT) continue; // no side paths from final room.
        uint8_t move_dir = generateRandomMove(current_room);
        if (move_dir == 0xFF) continue;
        uint8_t target_room = doMove(current_room, move_dir);
        if (randomMapDataFlags[target_room]) continue;
        randomMapDataFlags[current_room] |= 1 << move_dir;
        randomMapDataFlags[target_room] |= 1 << (move_dir ^ 1);
        // Set sidepaths to 5 or 6 depending on where they connect
        randomMapDataTmp[target_room] = (randomMapDataTmp[current_room] & ~ROOM_MAIN_PATH) | ROOM_SIDE_PATH;
        count++;
    }

    //Build cycles paths
    safety = 0;
    for(uint8_t count=0; count<4; ) {
        if (++safety == 0) goto retry;
        current_room = rand8() & 0x3F;
        if (!randomMapDataFlags[current_room]) continue;
        if (randomMapDataID[current_room] == ROOM_TYPE_EXIT) continue; // no cycles from final room.
        uint8_t move_dir = generateRandomMove(current_room);
        if (move_dir == 0xFF) continue;
        uint8_t target_room = doMove(current_room, move_dir);
        if (!randomMapDataFlags[target_room]) continue;
        if (randomMapDataID[target_room] == ROOM_TYPE_EXIT) continue; // no cycles from final room.
        if ((randomMapDataTmp[current_room] & ROOM_SECOND_HALF) != (randomMapDataTmp[target_room] & ROOM_SECOND_HALF)) continue; // No cycles from first to second half
        randomMapDataFlags[current_room] |= 1 << move_dir;
        randomMapDataFlags[target_room] |= 1 << (move_dir ^ 1);
        count++;
    }

    //Search for a connection from tmp == 1 tot tmp == 2 (first half to second half) and add a key door
    while(1) {
        current_room = rand8() & 0x3F;
        if (!(randomMapDataTmp[current_room] & ROOM_MAIN_PATH)) continue;
        uint8_t move_dir = generateRandomMove(current_room);
        if (move_dir == 0xFF) continue;
        uint8_t target_room = doMove(current_room, move_dir);
        if ((randomMapDataTmp[current_room] ^ ROOM_SECOND_HALF) != randomMapDataTmp[target_room]) continue;
        if (!(randomMapDataFlags[current_room] & (1 << move_dir))) continue;
        randomMapDataFlags[current_room] |= 0x10 << move_dir;
        randomMapDataFlags[target_room] |= 0x10 << (move_dir ^ 1);
        break;
    }
    //Search for a connection from main path to side path and add a key door
    while(1) {
        current_room = rand8() & 0x3F;
        if (!(randomMapDataTmp[current_room] & ROOM_MAIN_PATH)) continue;
        uint8_t move_dir = generateRandomMove(current_room);
        if (move_dir == 0xFF) continue;
        uint8_t target_room = doMove(current_room, move_dir);
        if ((randomMapDataTmp[target_room] & ROOM_MAIN_PATH)) continue;
        if (!(randomMapDataFlags[current_room] & (1 << move_dir))) continue;
        randomMapDataFlags[current_room] |= 0x10 << move_dir;
        randomMapDataFlags[target_room] |= 0x10 << (move_dir ^ 1);
        break;
    }

    // Find a spot in first half main path to put a key
    while(1) {
        current_room = rand8() & 0x3F;
        if (!(randomMapDataTmp[current_room] & ROOM_MAIN_PATH)) continue;
        if ((randomMapDataTmp[current_room] & ROOM_SECOND_HALF)) continue;
        if (randomMapDataID[current_room] != ROOM_TYPE_NORMAL) continue;
        randomMapDataID[current_room] = ROOM_TYPE_TREASURE;
        sDungenChestContents[current_room] = TREASURE_SMALL_KEY; // Small key
        break;
    }
    // And another key in the first half anywhere
    while(1) {
        current_room = rand8() & 0x3F;
        if ((randomMapDataTmp[current_room] & ROOM_SECOND_HALF)) continue;
        if (!randomMapDataFlags[current_room]) continue;
        if (randomMapDataID[current_room] != ROOM_TYPE_NORMAL) continue;
        randomMapDataID[current_room] = ROOM_TYPE_TREASURE;
        sDungenChestContents[current_room] = TREASURE_SMALL_KEY; // Small key
        break;
    }

    // Check for rooms with a single entrance that are a sidepath
    // And potentially turn those into bombable walls
    for(uint8_t n=0; n<64; n++) {
        if (!(randomMapDataTmp[n] & ROOM_SIDE_PATH)) continue;
        // Do not overwrite rooms that already have a purpose (the 2nd small key can be
        // in a side room; turning that room into another treasure lost the key).
        if (randomMapDataID[n] != ROOM_TYPE_NORMAL) continue;
        uint8_t flags = randomMapDataFlags[n];
        if (flags == ROOM_DOOR_RIGHT || flags == ROOM_DOOR_LEFT || flags == ROOM_DOOR_DOWN || flags == ROOM_DOOR_UP) {
            if (rand8() < 64) {
                makeBombableDeadEnd(n, 0);

                if (rand8() < 128) {
                    randomMapDataID[n] = ROOM_TYPE_TREASURE;
                    sDungenChestContents[n] = pickRandomTreasure();
                } else {
                    randomMapDataID[n] = ROOM_TYPE_SPECIAL;
                    sDungenChestContents[n] = rand8();
                }
            }
        }
    }

    // The NPC that knows the way through the village labyrinth, behind a bombable wall
    if (dungeonDepth == HINT_DEPTH)
        placeHintNpc();

    // Trade quest items for the village, each hidden in a secret room behind a wall
    // that does not look bombable. Done before the random treasures take the dead ends.
    if (dungeonDepth == 2)
        placeSecretTreasure(TREASURE_TRADE_YOSHI);
    if (dungeonDepth == 3)
        placeSecretTreasure(TREASURE_TRADE_BANANAS);
    if (dungeonDepth == HINT_DEPTH)
        placeSecretTreasure(TREASURE_TRADE_LENS);

    // Devil's deal: Vire waits behind a cracked wall on floors 6-9 (at most one
    // per floor), as long as there is something left to trade.
    if (dungeonDepth >= DEEP_DEPTH && dungeonDepth < FINAL_DEPTH && rand8() < 192)
        placeDevil();

    // Add random treasures
    for(uint8_t n=0; n<64; n++) {
        if (!randomMapDataFlags[n]) continue;
        if (randomMapDataID[n]) continue;
        if (rand8() < 64) {
            randomMapDataID[n] = ROOM_TYPE_TREASURE;
            sDungenChestContents[n] = pickRandomTreasure();
        }
        if ((randomMapDataTmp[n] & 4) && (rand8() < 128)) {
            randomMapDataID[n] = ROOM_TYPE_TREASURE;
            sDungenChestContents[n] = pickRandomTreasure();
        }
        if (randomMapDataID[n]) continue;
        if (rand8() < 64) {
            // Mark room as a special room.
            randomMapDataID[n] = ROOM_TYPE_SPECIAL;
            sDungenChestContents[n] = rand8();
        }
    }

    // Guaranteed bombs for the bombable walls
    if (dungeonDepth == 1 || dungeonDepth == 3 || dungeonDepth == HINT_DEPTH)
        placeSpecialTreasure(TREASURE_BOMBS);

    // Dead ends (one way in, often behind a key door) are never empty:
    // half of them get a heart refill, the rest a random treasure.
    for(uint8_t n=0; n<64; n++) {
        if (!randomMapDataFlags[n]) continue;
        if (randomMapDataID[n] != ROOM_TYPE_NORMAL) continue;
        if (n == hMapRoom) continue; // entrance
        uint8_t ways = (randomMapDataFlags[n] | (randomMapDataFlags[n] >> 4)) & 0x0F;
        if (ways & (ways - 1)) continue; // more than one way in
        randomMapDataID[n] = ROOM_TYPE_TREASURE;
        sDungenChestContents[n] = (rand8() < 128) ? TREASURE_HEART_REFILL : pickRandomTreasure();
    }

    // Owl statue in the entrance: tells that this floor has a secret room
    if (dungeonDepth >= 2 && dungeonDepth <= HINT_DEPTH)
        sLSDRoomRole[hMapRoom] = ROLE_OWL_SIGN;

    SET_SRAM_BANK_CONTAINING(sDungeonMinimap);
    // Update the minimap
    for(uint8_t n=0; n<64; n++) {
        if (randomMapDataID[n] == ROOM_TYPE_TREASURE) 
            sDungeonMinimap[n] = 0xED;
        else if (randomMapDataID[n] == ROOM_TYPE_EXIT)
            sDungeonMinimap[n] = 0xEE;
        else if (randomMapDataFlags[n])
            sDungeonMinimap[n] = 0xEF;
        else
            sDungeonMinimap[n] = 0x7D;
    }
}

// Turn a side room with a single door into a room behind a bombable wall.
// hidden: the wall looks like a normal wall instead of a cracked one.
void makeBombableDeadEnd(uint8_t n, uint8_t hidden)
{
    uint8_t flags = randomMapDataFlags[n];
    if (hidden) {
        for(uint8_t dir=0; dir<4; dir++) {
            if (flags == (1 << dir)) {
                randomMapDataTmp[n] |= ROOM_HIDDEN_WALL(dir);
                randomMapDataTmp[doMove(n, dir)] |= ROOM_HIDDEN_WALL(dir ^ 1);
            }
        }
    }
    randomMapDataFlags[n] = flags << 4;
    if (flags == ROOM_DOOR_RIGHT) {
        randomMapDataFlags[n + 1] &=~ROOM_DOOR_LEFT;
        randomMapDataFlags[n + 1] |= ROOM_LOCK_LEFT;
    }
    if (flags == ROOM_DOOR_LEFT) {
        randomMapDataFlags[n - 1] &=~ROOM_DOOR_RIGHT;
        randomMapDataFlags[n - 1] |= ROOM_LOCK_RIGHT;
    }
    if (flags == ROOM_DOOR_DOWN) {
        randomMapDataFlags[n + 8] &=~ROOM_DOOR_UP;
        randomMapDataFlags[n + 8] |= ROOM_LOCK_UP;
    }
    if (flags == ROOM_DOOR_UP) {
        randomMapDataFlags[n - 8] &=~ROOM_DOOR_DOWN;
        randomMapDataFlags[n - 8] |= ROOM_LOCK_DOWN;
    }
}

void placeHintNpc(void)
{
    uint8_t start = rand8() & 0x3F;
    // A secret room behind a wall without a crack.
    uint8_t secret = makeSecretRoom(1);
    if (secret != 0xFF) {
        randomMapDataID[secret] = ROOM_TYPE_VILLAGER;
        sLSDRoomRole[secret] = ROLE_HINT;
        return;
    }
    // Otherwise: take over a room that is already behind a bombable wall.
    for(uint8_t i=0; i<64; i++) {
        uint8_t n = (start + i) & 0x3F;
        uint8_t flags = randomMapDataFlags[n];
        if (!flags || (flags & 0x0F)) continue;
        if (randomMapDataID[n] == ROOM_TYPE_EXIT || randomMapDataID[n] == ROOM_TYPE_ENTRANCE) continue;
        if (randomMapDataID[n] == ROOM_TYPE_TREASURE && sDungenChestContents[n] == TREASURE_SMALL_KEY) continue;
        randomMapDataID[n] = ROOM_TYPE_VILLAGER;
        sLSDRoomRole[n] = ROLE_HINT;
        return;
    }
    // Last resort: any normal room.
    for(uint8_t i=0; i<64; i++) {
        uint8_t n = (start + i) & 0x3F;
        if (!randomMapDataFlags[n]) continue;
        if (randomMapDataID[n] != ROOM_TYPE_NORMAL) continue;
        randomMapDataID[n] = ROOM_TYPE_VILLAGER;
        sLSDRoomRole[n] = ROLE_HINT;
        return;
    }
}

// Put a treasure in a secret room: a side room behind a wall that has to be bombed,
// and the wall does not look cracked. The room still shows on the minimap.
void placeSecretTreasure(uint8_t treasure)
{
    uint8_t n = makeSecretRoom(1);
    if (n == 0xFF) {
        // Cannot happen on an 8x8 grid with a normal floor, but never lose the item.
        placeSpecialTreasure(treasure);
        return;
    }
    randomMapDataID[n] = ROOM_TYPE_TREASURE;
    sDungenChestContents[n] = treasure;
}

// Returns a room behind a bombable wall that looks like a normal wall.
// Prefers an existing side room with a single door; otherwise adds a new room
// on a free spot next to an existing room. 0xFF if nothing was possible.
// hidden: the bombable wall looks like a normal wall (1) or has a crack (0)
uint8_t makeSecretRoom(uint8_t hidden)
{
    uint8_t start = rand8() & 0x3F;
    for(uint8_t i=0; i<64; i++) {
        uint8_t n = (start + i) & 0x3F;
        if (!(randomMapDataTmp[n] & ROOM_SIDE_PATH)) continue;
        if (randomMapDataID[n] != ROOM_TYPE_NORMAL) continue;
        uint8_t flags = randomMapDataFlags[n];
        if (flags == ROOM_DOOR_RIGHT || flags == ROOM_DOOR_LEFT || flags == ROOM_DOOR_DOWN || flags == ROOM_DOOR_UP) {
            makeBombableDeadEnd(n, hidden);
            return n;
        }
    }
    uint8_t start_dir = rand8() & 3;
    for(uint8_t i=0; i<64; i++) {
        uint8_t n = (start + i) & 0x3F;
        if (!randomMapDataFlags[n]) continue;
        if (randomMapDataID[n] == ROOM_TYPE_EXIT) continue;
        for(uint8_t k=0; k<4; k++) {
            uint8_t dir = (start_dir + k) & 3;
            if (dir == DIR_RIGHT && (n & 0x07) == 0x07) continue;
            if (dir == DIR_LEFT && (n & 0x07) == 0) continue;
            if (dir == DIR_DOWN && (n & 0x38) == 0x38) continue;
            if (dir == DIR_UP && (n & 0x38) == 0) continue;
            uint8_t target = doMove(n, dir);
            if (randomMapDataFlags[target]) continue;
            randomMapDataFlags[n] |= 0x10 << dir;
            randomMapDataFlags[target] |= 0x10 << (dir ^ 1);
            randomMapDataTmp[target] |= ROOM_SIDE_PATH;
            if (hidden) {
                randomMapDataTmp[n] |= ROOM_HIDDEN_WALL(dir);
                randomMapDataTmp[target] |= ROOM_HIDDEN_WALL(dir ^ 1);
            }
            randomMapDataID[target] = ROOM_TYPE_NORMAL;
            return target;
        }
    }
    return 0xFF;
}

// Put a fixed treasure in a chest room on this floor.
void placeSpecialTreasure(uint8_t treasure)
{
    for(uint8_t tries=0; tries<200; tries++) {
        uint8_t n = rand8() & 0x3F;
        if (!randomMapDataFlags[n]) continue;
        if (randomMapDataID[n] != ROOM_TYPE_NORMAL) continue;
        randomMapDataID[n] = ROOM_TYPE_TREASURE;
        sDungenChestContents[n] = treasure;
        return;
    }
    // No free normal room found, replace a random treasure instead.
    for(uint8_t n=0; n<64; n++) {
        if (randomMapDataID[n] != ROOM_TYPE_TREASURE) continue;
        if (sDungenChestContents[n] == TREASURE_SMALL_KEY) continue;
        if (sDungenChestContents[n] >= TREASURE_TRADE_YOSHI && sDungenChestContents[n] <= TREASURE_TRADE_LENS) continue;
        if (sDungenChestContents[n] == TREASURE_BOMBS) continue;
        sDungenChestContents[n] = treasure;
        return;
    }
}

// ---------------------------------------------------------------------------
// Floor 5: the village. Fixed layout (x, y on the 8x8 grid, room = y * 8 + x):
//
//        x=1      x=2       x=3
//  y=0            EXIT
//  y=1   Yoshi -  Plaza A - Bananas
//  y=2   Shop  -  Plaza B - Lens
//  y=3            Entrance
//                   ~ cracked bombable wall ~
//  y=4..7         labyrinth (x=2..5, y=4..7), chest with the L2 sword
//
// Inside the labyrinth only some walls can be bombed, and none of them look cracked.
// Behind the cracked wall below the entrance is the first labyrinth room, which looks
// like a dead end. From there the way is: down, right, right, up, right, down, down.
// The hint NPC on floor HINT_DEPTH tells this (text in village.asm).
#define VR(x, y) ((y) * 8 + (x))
#define V_EXIT      VR(2, 0)
#define V_PLAZA_A   VR(2, 1)
#define V_YOSHI     VR(1, 1)
#define V_BANANAS   VR(3, 1)
#define V_PLAZA_B   VR(2, 2)
#define V_SHOP      VR(1, 2)
#define V_LENS      VR(3, 2)
#define V_ENTRANCE  VR(2, 3)
#define V_LAB_START VR(2, 4)
#define V_LAB_CHEST VR(5, 6)

// Bombable connections inside the labyrinth: room, direction.
const uint8_t village_labyrinth_walls[] = {
    // the correct path
    VR(2, 4), DIR_DOWN,
    VR(2, 5), DIR_RIGHT,
    VR(3, 5), DIR_RIGHT,
    VR(4, 5), DIR_UP,
    VR(4, 4), DIR_RIGHT,
    VR(5, 4), DIR_DOWN,
    VR(5, 5), DIR_DOWN,
    // dead ends
    VR(2, 4), DIR_RIGHT,
    VR(2, 5), DIR_DOWN,
    VR(2, 6), DIR_DOWN,
    VR(2, 7), DIR_RIGHT,
    VR(3, 5), DIR_DOWN,
    VR(3, 6), DIR_RIGHT,
    VR(4, 6), DIR_DOWN,
    VR(5, 6), DIR_DOWN,
};

// bombable: 0 = door, 1 = cracked bombable wall, 2 = bombable wall that looks normal
void villageConnect(uint8_t room, uint8_t dir, uint8_t bombable)
{
    uint8_t target = doMove(room, dir);
    if (bombable == 2) {
        randomMapDataTmp[room] |= ROOM_HIDDEN_WALL(dir);
        randomMapDataTmp[target] |= ROOM_HIDDEN_WALL(dir ^ 1);
    }
    if (bombable) {
        randomMapDataFlags[room] |= 0x10 << dir;
        randomMapDataFlags[target] |= 0x10 << (dir ^ 1);
    } else {
        randomMapDataFlags[room] |= 1 << dir;
        randomMapDataFlags[target] |= 1 << (dir ^ 1);
    }
}

void buildVillageMap(void)
{
    hMapId = 0;

    villageConnect(V_EXIT, DIR_DOWN, 0);
    villageConnect(V_PLAZA_A, DIR_LEFT, 0);
    villageConnect(V_PLAZA_A, DIR_RIGHT, 0);
    villageConnect(V_PLAZA_A, DIR_DOWN, 0);
    villageConnect(V_PLAZA_B, DIR_LEFT, 0);
    villageConnect(V_PLAZA_B, DIR_RIGHT, 0);
    villageConnect(V_PLAZA_B, DIR_DOWN, 0);
    villageConnect(V_ENTRANCE, DIR_DOWN, 1); // cracked wall straight into the labyrinth
    for(uint8_t i=0; i<sizeof(village_labyrinth_walls); i+=2)
        villageConnect(village_labyrinth_walls[i], village_labyrinth_walls[i + 1], 2);

    // Every existing room is an empty room unless set below.
    for(uint8_t n=0; n<64; n++) {
        if (randomMapDataFlags[n])
            randomMapDataID[n] = ROOM_TYPE_VILLAGE_EMPTY;
    }
    randomMapDataID[V_EXIT] = ROOM_TYPE_VILLAGE_EXIT;
    randomMapDataID[V_ENTRANCE] = ROOM_TYPE_ENTRANCE;
    randomMapDataID[V_YOSHI] = ROOM_TYPE_VILLAGER;
    randomMapDataID[V_BANANAS] = ROOM_TYPE_VILLAGER;
    randomMapDataID[V_LENS] = ROOM_TYPE_VILLAGER;
    randomMapDataID[V_SHOP] = ROOM_TYPE_VILLAGE_SHOP;
    randomMapDataID[V_LAB_CHEST] = ROOM_TYPE_VILLAGE_TREASURE;

    sLSDRoomRole[V_YOSHI] = ROLE_TRADER_YOSHI;
    sLSDRoomRole[V_BANANAS] = ROLE_TRADER_BANANAS;
    sLSDRoomRole[V_LENS] = ROLE_TRADER_LENS;
    sDungenChestContents[V_SHOP] = 3; // shop row 3: potion 120 / bombs 100
    sDungenChestContents[V_LAB_CHEST] = TREASURE_SWORD_L2;

    hMapRoom = V_ENTRANCE;

    SET_SRAM_BANK_CONTAINING(sDungeonMinimap);
    for(uint8_t n=0; n<64; n++) {
        uint8_t y = n >> 3;
        if (!randomMapDataFlags[n] || y >= 4) // the labyrinth stays secret
            sDungeonMinimap[n] = 0x7D;
        else if (n == V_EXIT)
            sDungeonMinimap[n] = 0xEE;
        else
            sDungeonMinimap[n] = 0xEF;
    }
}

// p points at the event byte of a room template. Is there an entity set for this floor?
uint8_t templateHasEntitySetForDepth(const uint8_t* p)
{
    p++; // event
    p += *p + 1; // primary data
    uint8_t variation_count = *p++;
    p += variation_count * 3;
    uint8_t entity_set_count = *p++;
    for(uint8_t k=0; k<entity_set_count; k++, p+=4) {
        if (dungeonDepth >= p[0] && dungeonDepth <= p[1])
            return 1;
    }
    return 0;
}

void buildRandomRoomData(void)
{
    for(uint8_t n=0; n<64; n++) {
getDifferentRoomData:
        const const RandomRoomDataTable_T* table = &RandomRoomDataTable[randomMapDataID[n]];
        const uint8_t* static_room_data_ptr = table->table_data[rand8range(table->table_size)];
        uint8_t mask_input = randomMapDataFlags[n] | (randomMapDataFlags[n] >> 4); 
        uint8_t mask_data = mask_input & (*static_room_data_ptr++);
        if (mask_data != *static_room_data_ptr++)
            goto getDifferentRoomData;
        // Some templates only have enemies for deeper floors (like the genie exit room)
        if (!templateHasEntitySetForDepth(static_room_data_ptr))
            goto getDifferentRoomData;
        SET_SRAM_BANK_CONTAINING(sDungeonEventTable);
        sDungeonEventTable[n] = *static_room_data_ptr++;
        SET_SRAM_BANK_CONTAINING(sDynamicRoomData);
        uint8_t* dynamic_room_data_ptr = &sDynamicRoomData[((uint16_t)n) * 0x80];
        uint8_t copy_size = *static_room_data_ptr++;
        do {
            *dynamic_room_data_ptr++ = *static_room_data_ptr++;
        } while(--copy_size);

        if (randomMapDataFlags[n] & ROOM_DOOR_RIGHT) {
            *dynamic_room_data_ptr++ = 0x39;
            if (randomMapDataFlags[n] & ROOM_LOCK_RIGHT) {
                *dynamic_room_data_ptr++ = 0xEF;
            } else {
                *dynamic_room_data_ptr++ = 0xF3;
            }
        } else if (randomMapDataFlags[n] & ROOM_LOCK_RIGHT) {
            *dynamic_room_data_ptr++ = 0x49;
            *dynamic_room_data_ptr++ = (randomMapDataTmp[n] & ROOM_HIDDEN_WALL(DIR_RIGHT)) ? 0x4A : 0x42;
        }
        if (randomMapDataFlags[n] & ROOM_DOOR_LEFT) {
            *dynamic_room_data_ptr++ = 0x30;
            if (randomMapDataFlags[n] & ROOM_LOCK_LEFT) {
                *dynamic_room_data_ptr++ = 0xEE;
            } else {
                *dynamic_room_data_ptr++ = 0xF2;
            }
        } else if (randomMapDataFlags[n] & ROOM_LOCK_LEFT) {
            *dynamic_room_data_ptr++ = 0x40;
            *dynamic_room_data_ptr++ = (randomMapDataTmp[n] & ROOM_HIDDEN_WALL(DIR_LEFT)) ? 0x49 : 0x41;
        }
        if (randomMapDataFlags[n] & ROOM_DOOR_DOWN) {
            *dynamic_room_data_ptr++ = 0x74;
            if (randomMapDataFlags[n] & ROOM_LOCK_DOWN) {
                *dynamic_room_data_ptr++ = 0xED;
            } else {
                *dynamic_room_data_ptr++ = 0xF1;
            }
        } else if (randomMapDataFlags[n] & ROOM_LOCK_DOWN) {
            *dynamic_room_data_ptr++ = 0x74;
            *dynamic_room_data_ptr++ = (randomMapDataTmp[n] & ROOM_HIDDEN_WALL(DIR_DOWN)) ? 0x48 : 0x40;
        }
        if (randomMapDataFlags[n] & ROOM_DOOR_UP) {
            *dynamic_room_data_ptr++ = 0x04;
            if (randomMapDataFlags[n] & ROOM_LOCK_UP) {
                *dynamic_room_data_ptr++ = 0xEC;
            } else {
                *dynamic_room_data_ptr++ = 0xF0;
            }
        } else if (randomMapDataFlags[n] & ROOM_LOCK_UP) {
            *dynamic_room_data_ptr++ = 0x04;
            *dynamic_room_data_ptr++ = (randomMapDataTmp[n] & ROOM_HIDDEN_WALL(DIR_UP)) ? 0x47 : 0x3F;
        }
        uint8_t variation_count = *static_room_data_ptr++;
        while(variation_count) {
            if (rand8() <= *static_room_data_ptr++) {
                const uint8_t* variation_ptr = *(const uint8_t**)static_room_data_ptr;
                copy_size = *variation_ptr++;
                do {
                    *dynamic_room_data_ptr++ = *variation_ptr++;
                } while(--copy_size);
            }
            static_room_data_ptr += 2;
            variation_count -= 1;
        }
        *dynamic_room_data_ptr = 0xFE;

        SET_SRAM_BANK_CONTAINING(sDynamicEntityData);
        uint8_t* dynamic_entity_data_ptr = &sDynamicEntityData[((uint16_t)n) * 0x80];
        uint8_t entity_set_count = *static_room_data_ptr++;
retry_entities:
        uint8_t entity_set_nr = rand8range(entity_set_count);
        if (dungeonDepth < static_room_data_ptr[entity_set_nr * 4 + 0]) goto retry_entities;
        if (dungeonDepth > static_room_data_ptr[entity_set_nr * 4 + 1]) goto retry_entities;
        const uint8_t* entity_data_ptr = *(const uint8_t**)&static_room_data_ptr[entity_set_nr * 4 + 2];
        copy_size = *entity_data_ptr++;
        // Below the village the sets are crowded: randomly leave out 0-3 (floor 8+: 0-2)
        // enemies, so rooms vary from calm to full. Only enemies that have another
        // enemy of the same type earlier in the set are left out (puzzle enemies are
        // unique), starting at the end, and at least 2 entities stay.
        uint8_t skip_mask = 0;
        if (randomMapDataID[n] == ROOM_TYPE_NORMAL && dungeonDepth > VILLAGE_DEPTH) {
            uint8_t drop = rand8range(dungeonDepth >= 8 ? 4 : 5);
            if (drop >= (dungeonDepth >= 8 ? 3 : 4)) drop = 0;
            uint8_t count = copy_size >> 1;
            for (uint8_t j = count - 1; j > 0 && drop && count > 2 && j < 8; j--) {
                uint8_t id = entity_data_ptr[j * 2 + 1];
                for (uint8_t k = 0; k < j; k++) {
                    if (entity_data_ptr[k * 2 + 1] == id) {
                        skip_mask |= 1 << j;
                        count--;
                        drop--;
                        break;
                    }
                }
            }
        }
        for (uint8_t j = 0; copy_size; j++, copy_size -= 2) {
            if (skip_mask & (1 << j)) {
                entity_data_ptr += 2;
                continue;
            }
            *dynamic_entity_data_ptr++ = *entity_data_ptr++;
            *dynamic_entity_data_ptr++ = *entity_data_ptr++;
        }
        *dynamic_entity_data_ptr++ = 0xFF;
    }
}


uint8_t generateRandomMove(uint8_t from)
{
    uint8_t move_dir = rand8() & 3;
    switch(move_dir) {
    case DIR_RIGHT:
        if ((from & 0x07) == 0x07) return 0xFF;
        return move_dir;
    case DIR_LEFT:
        if ((from & 0x07) == 0) return 0xFF;
        return move_dir;
    case DIR_DOWN:
        if ((from & 0x38) == 0x38) return 0xFF;
        return move_dir;
    case DIR_UP:
        if ((from & 0x38) == 0) return 0xFF;
        return move_dir;
    }
}

uint8_t doMove(uint8_t from, uint8_t dir)
{
    switch(dir) {
    case DIR_RIGHT: return from + 1;
    case DIR_LEFT: return from - 1;
    case DIR_DOWN: return from + 8;
    case DIR_UP: return from - 8;
    }
    return from;
}

void placeDevil(void)
{
    // Offers: the endless magic rod, and one of the two tunics (they replace each other)
    uint8_t rod_left = !(wLSDDevilDeals & 0x04);
    uint8_t tunic_left = (wTunicType == 0);
    if (!rod_left && !tunic_left)
        return;
    uint8_t n = makeSecretRoom(0);
    if (n == 0xFF)
        return;
    randomMapDataID[n] = ROOM_TYPE_VILLAGER;
    sLSDRoomRole[n] = ROLE_DEVIL;
}

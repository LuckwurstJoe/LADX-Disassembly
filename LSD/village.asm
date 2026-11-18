; LSD village: villagers (traders + the hint NPC) and their texts.
;
; Villagers are shop owner entities ($4D) in rooms that have a role in sLSDRoomRole
; (set by mapgen.c). LSD_ShopOwnerEntityHandler (shop.asm) stores the role in
; wEntitiesPrivateState1Table and calls into here for entity states 3 and 4.
;   state 3: idle, waiting to be talked to
;   state 4: dialog open; when it closes, a pending reward
;            (wEntitiesPrivateState2Table) is handed to Link.
; wEntitiesPrivateState3Table: set once the villager loaded its own spritesheet.
;
; Looks (spritesheets from the original game, see the room spritesheet tables):
;   Yoshi doll trader   = kid from the Mabe village square (sheet $DC)
;   bananas trader      = Kiki the monkey                  (sheet $67)
;   magnifying lens     = grandpa Ulrira                   (sheet $46)
;   hint NPC            = shop owner                       (sheet $88)
;   owl sign            = the owl from the overworld       (sheet $A2)
;   devil's deal        = Vire from Eagle's Tower          (sheet $7A)
;
; Vire (ROLE_DEVIL) asks a yes/no question; wEntitiesPrivateState2Table = 1 while
; we wait for the answer, DevilDoDeal runs when the player picked "Yes".

#SECTION "LSD_Villager", ROMX, BANK[$36] {
; Indexed by ROLE_* - 1
VillagerSheets:
    db   $DC, $67, $46, $88, $A2, $7A

VillagerSprites: ; shop owner
    db   $40, $03, $42, $03
    db   $42, $23, $40, $23
OwlSprites: ; eyes open, blinking
    db   $48, $01, $48, $21
    db   $4A, $01, $4A, $21
KidSprites:
    db   $40, $00, $42, $00
    db   $42, $20, $40, $20
KikiSprites:
    db   $48, $02, $42, $02
    db   $40, $02, $42, $02
VireSprites: ; y, x, tile, attributes; 24x16, two frames (tiles normalized to slot 0)
    db   $00, $FC, $40, $02, $00, $04, $42, $02, $00, $0C, $40, $22
    db   $00, $FC, $44, $02, $00, $04, $46, $02, $00, $0C, $44, $22
UlriraSprites: ; y, x, tile, attributes; 16x32, two frames
    db   $F7, $00, $40, $02, $F7, $08, $42, $02, $07, $00, $44, $02, $07, $08, $46, $02
    db   $F7, $00, $48, $02, $F7, $08, $4A, $02, $07, $00, $4C, $02, $07, $08, $4E, $02

; Indexed by ROLE_TRADER_* - 1
TraderRewards:
    db   INVENTORY_SPIN_POWERUP    ; for the Yoshi doll
    db   INVENTORY_BOOMERANG       ; for the bananas
    db   INVENTORY_PEGASUS_BOOTS   ; for the magnifying lens
TraderTextsWant:
    dw   TextYoshiWant, TextBananasWant, TextLensWant
TraderTextsGive:
    dw   TextYoshiGive, TextBananasGive, TextLensGive
TraderTextsDone:
    dw   TextYoshiDone, TextBananasDone, TextLensDone

LSD_VillagerEntityHandler:
    ; First frame: load the spritesheet that belongs to our role.
    ld   hl, wEntitiesPrivateState3Table
    add  hl, bc
    ld   a, [hl]
    and  a, a
    if   z {
        ld   [hl], 1
        call VillagerGetRole
        dec  a
        ld   e, a
        ld   d, 0
        ld   hl, VillagerSheets
        add  hl, de
        ld   a, [hl]
        ldh  [hLSDTemporary1], a
        farcall LSD_LoadSheetForEntity
    }

    call VillagerGetRole
    cp   ROLE_OWL_SIGN
    ldh  a, [hFrameCounter]
    if   z {
        ; the owl only blinks now and then
        and  $F0
        cp   $F0
        ld   a, 0
        if   z {
            inc  a
        }
    } else {
        swap a
        and  a, 1
    }
    call SetEntitySpriteVariant
    call VillagerDraw
    call PushLinkOutOfEntity_36

    ldh  a, [hActiveEntityState]
    cp   4
    jr   z, .stateTalking

.stateIdle:
    call GetEntityTransitionCountdown
    ret  nz
    call VillagerCheckTalk
    ret  nc
    ; Dialog 0 shows wMessageBuffer, fill it with our text.
    ld   a, $00
    call OpenDialogInTable0
    call VillagerSelectText
    ld   de, wMessageBuffer
.copyLoop:
    ld   a, [hl+]
    ld   [de], a
    inc  de
    cp   $FF
    jr   nz, .copyLoop
    ld   hl, wEntitiesStateTable
    add  hl, bc
    ld   [hl], 4
    ret

.stateTalking:
    ld   a, [wDialogState]
    and  a, a
    ret  nz ; still talking
    ld   hl, wEntitiesStateTable
    add  hl, bc
    ld   [hl], 3
    call GetEntityTransitionCountdown
    ld   [hl], $18 ; short pause before we can be talked to again

    ; Vire: act on the answer to his question
    call VillagerGetRole
    cp   ROLE_DEVIL
    if   z {
        ld   hl, wEntitiesPrivateState2Table
        add  hl, bc
        ld   a, [hl]
        and  a, a
        ret  z
        ld   [hl], 0
        ld   a, [wDialogAskSelectionIndex]
        and  a, a
        ret  nz ; "No"
        jp   DevilDoDeal
    }

    ; Hand out a pending reward
    ld   hl, wEntitiesPrivateState2Table
    add  hl, bc
    ld   a, [hl]
    and  a, a
    ret  z
    ld   [hl], 0
    ldh  [hLSDTemporary1], a
    ld   a, $13 ; ENTITY_INVENTORY_DROP, state 0 = picked up right away
    call SpawnNewEntity_trampoline
    if   c {
        ; No free entity slot, try again next time we are talked to
        ld   hl, wEntitiesPrivateState2Table
        add  hl, bc
        ldh  a, [hLSDTemporary1]
        ld   [hl], a
        ret
    }
    ld   hl, wEntitiesSpriteVariantTable
    add  hl, de
    ldh  a, [hLSDTemporary1]
    ld   [hl], a
    ld   hl, wEntitiesPrivateState3Table
    add  hl, de
    ld   [hl], $10 ; default item amount
    ret

; Out: a = ROLE_* of this villager
VillagerGetRole:
    ld   hl, wEntitiesPrivateState1Table
    add  hl, bc
    ld   a, [hl]
    ret

VillagerDraw:
    call VillagerGetRole
    cp   ROLE_DEVIL
    jr   z, .drawVire
    cp   ROLE_TRADER_LENS
    jr   z, .drawUlrira
    ld   de, VillagerSprites
    cp   ROLE_TRADER_YOSHI
    if   z {
        ld   de, KidSprites
    }
    cp   ROLE_TRADER_BANANAS
    if   z {
        ld   de, KikiSprites
    }
    cp   ROLE_OWL_SIGN
    if   z {
        ld   de, OwlSprites
    }
    jp   RenderActiveEntitySpritesPair

.drawVire:
    ldh  a, [hActiveEntitySpriteVariant]
    ld   e, a ; 12 bytes per frame
    add  a, a
    add  a, e
    add  a, a
    add  a, a
    ld   e, a
    ld   d, 0
    ld   hl, VireSprites
    add  hl, de
    ld   c, 3
    call RenderActiveEntitySpritesRect
    ld   a, 3
    call func_015_7964_trampoline
    ; restore our entity index
    ld   a, [wActiveEntityIndex]
    ld   c, a
    ld   b, 0
    ret

.drawUlrira:
    ldh  a, [hActiveEntitySpriteVariant]
    swap a ; 16 bytes per frame
    ld   e, a
    ld   d, 0
    ld   hl, UlriraSprites
    add  hl, de
    ld   c, 4
    call RenderActiveEntitySpritesRect
    ld   a, 4
    call func_015_7964_trampoline
    ; restore our entity index
    ld   a, [wActiveEntityIndex]
    ld   c, a
    ld   b, 0
    ret

; Out: carry set when Link stands next to us and presses A.
VillagerCheckTalk:
    ldh  a, [hLinkPositionX]
    ld   hl, hActiveEntityPosX
    sub  [hl]
    add  $14
    cp   $28
    ret  nc
    ldh  a, [hLinkPositionY]
    ld   hl, hActiveEntityPosY
    sub  [hl]
    add  $14
    cp   $28
    ret  nc
    ; Close enough: A talks instead of using the item on A
    ld   hl, wItemUsageContext
    ld   [hl], $01 ; ITEM_USAGE_NEAR_NPC
    ld   a, [wDialogState]
    and  a, a
    jr   nz, .no
    ldh  a, [hLinkInteractiveMotionBlocked]
    and  a, a
    jr   nz, .no
    ldh  a, [hJoypadState]
    and  $10 ; A
    jr   z, .no
    scf
    ret
.no:
    and  a, a ; clear carry
    ret

; Out: hl = text for this villager. Trades the item if Link carries it.
VillagerSelectText:
    ld   hl, wEntitiesPrivateState1Table
    add  hl, bc
    ld   a, [hl]
    cp   ROLE_DEVIL
    jp   z, DevilSelectText
    cp   ROLE_HINT
    if   z {
        ld   hl, TextHint
        ret
    }
    cp   ROLE_OWL_SIGN
    if   z {
        ; floor 4 has two secrets: the magnifying lens and the hint NPC
        ld   a, [wDungeonDepth]
        cp   4
        ld   hl, TextOwlSign
        ret  nz
        ld   hl, TextOwlSignTwo
        ret
    }
    dec  a ; trade index 0-2
    ld   e, a
    ld   d, $01
    and  a, a
    jr   z, .maskDone
.maskLoop:
    sla  d
    dec  a
    jr   nz, .maskLoop
.maskDone:
    ; d = "carrying" bit of our item, d << 4 = "already traded" bit
    ld   hl, wLSDTradeItems
    ld   a, d
    swap a
    and  [hl]
    jr   nz, .done
    ld   a, [hl]
    and  d
    jr   z, .want
    ; Trade: clear the carrying bit, set the traded bit, remember the reward
    ld   a, d
    swap a
    or   d
    xor  [hl]
    ld   [hl], a
    ld   d, 0
    ld   hl, TraderRewards
    add  hl, de
    ld   a, [hl]
    ld   hl, wEntitiesPrivateState2Table
    add  hl, bc
    ld   [hl], a
    ld   hl, TraderTextsGive
    jr   .pickText
.done:
    ld   hl, TraderTextsDone
    jr   .pickText
.want:
    ld   hl, TraderTextsWant
.pickText:
    ld   d, 0
    add  hl, de
    add  hl, de
    ld   a, [hl+]
    ld   h, [hl]
    ld   l, a
    ret

; ---------------------------------------------------------------- devil's deal

; Out: a = offer of the Vire in this room: 0 red tunic, 1 blue tunic, 2 magic rod, $FF = nothing left. Which one depends on the room, so it stays the
; same while we talk.
DevilGetOffer:
    ldh  a, [hMapRoom]
.mod3:
    cp   3
    jr   c, .modDone
    sub  3
    jr   .mod3
.modDone:
    ld   e, a
    ld   d, 3
.try:
    ld   a, e
    call DevilOfferAvailable
    ret  c
    inc  e
    ld   a, e
    cp   3
    jr   nz, .noWrap
    ld   e, 0
.noWrap:
    dec  d
    jr   nz, .try
    ld   a, $FF
    ret

; In: a = offer. Out: carry set if it can still be traded. Keeps a, d, e.
DevilOfferAvailable:
    push af
    cp   2
    jr   z, .rod
    ; the two tunics replace each other: only while Link wears the green one
    ld   a, [wTunicType]
    and  a, a
    jr   nz, .no
.yes:
    pop  af
    scf
    ret
.rod:
    ld   a, [wLSDDevilDeals]
    and  $04
    jr   z, .yes
.no:
    pop  af
    and  a, a ; clear carry
    ret

; Out: hl = text. Asks the question when a deal is possible.
DevilSelectText:
    ld   a, [wDungeonDepth]
    ld   hl, wLSDDevilFloor
    cp   [hl]
    ld   hl, TextDevilDone
    ret  z ; already made a deal on this floor
    call DevilGetOffer
    cp   $FF
    ld   hl, TextDevilDone
    ret  z
    ld   e, a
    ld   a, [wMaxHearts]
    cp   4
    ld   hl, TextDevilWeak
    ret  c ; keep at least 3 heart containers
    ld   hl, wEntitiesPrivateState2Table
    add  hl, bc
    ld   [hl], 1 ; waiting for the answer
    ld   a, e
    add  a, a
    ld   e, a
    ld   d, 0
    ld   hl, DevilOfferTexts
    add  hl, de
    ld   a, [hl+]
    ld   h, [hl]
    ld   l, a
    ret

; The player said yes: take a heart container, give the item.
DevilDoDeal:
    call DevilGetOffer
    cp   $FF
    ret  z
    cp   2
    jr   nz, .tunic
    ; the magic rod needs a free inventory slot
    ld   hl, wInventoryItems
    loop e, $0C {
        ld   a, [hl+]
        and  a, a
        jr   z, .slotFound
    }
    ld   hl, TextDevilFull
    jp   VillagerShowText
.slotFound:
    dec  hl
    ld   [hl], INVENTORY_MAGIC_ROD
    ld   hl, wLSDDevilDeals
    set  2, [hl]
    jr   .pay
.tunic:
    ld   hl, wLSDDevilDeals
    and  a, a
    jr   nz, .blue
    set  0, [hl]
    jr   .setTunic
.blue:
    set  1, [hl]
.setTunic:
    inc  a ; 1 = red, 2 = blue
    ld   [wTunicType], a
.pay:
    ld   hl, wMaxHearts
    dec  [hl]
    ld   a, [hl]
    add  a, a
    add  a, a
    add  a, a ; 8 health per heart
    ld   hl, wHealth
    cp   [hl]
    jr   nc, .healthOk
    ld   [hl], a
.healthOk:
    ; The hearts in the HUD are only redrawn when the health changes: take 1/8
    ; heart now and give it back right away, so the lost container shows.
    dec  [hl]
    ld   hl, wAddHealthBuffer
    inc  [hl]
    ld   a, [wDungeonDepth]
    ld   [wLSDDevilFloor], a
    ld   a, $01 ; JINGLE_TREASURE_FOUND
    ldh  [hJingle], a
    pushpop bc {
        call DrawABButtonSlots
    }
    ld   hl, TextDevilThanks
    ; fall through

; In: hl = text. Opens dialog 0 with it, and waits for it to close (state 4).
VillagerShowText:
    push hl
    ld   a, $00
    call OpenDialogInTable0
    pop  hl
    ld   de, wMessageBuffer
.copy:
    ld   a, [hl+]
    ld   [de], a
    inc  de
    cp   $FF
    jr   nz, .copy
    ld   hl, wEntitiesStateTable
    add  hl, bc
    ld   [hl], 4
    ret

DevilOfferTexts:
    dw   TextDevilRed, TextDevilBlue, TextDevilRod

; $FE = the yes/no choice (<ask> in the original dialogs)
TextDevilRed:
    db   "Hehehe... A Red Tunic: double   attack! For one heart?          ", "    Yes  No", $FE, $ff
TextDevilBlue:
    db   "Hehehe... A BlueTunic: half the damage! For one heart?          ", "    Yes  No", $FE, $ff
TextDevilRod:
    db   "Hehehe... The   Magic Rod! For  one heart?      ", "    Yes  No", $FE, $ff
TextDevilDone:
    db   "Hehehe... A dealis a deal!", $ff
TextDevilWeak:
    db   "Hehehe... You   have too few    hearts to deal!", $ff
TextDevilThanks:
    db   "Hehehe... It is yours now!", $ff
TextDevilFull:
    db   "Your inventory  is full!", $ff

; Texts: the dialog box shows 16 characters per line, so lines are padded with spaces.
; Item symbols from the dialog font (see src/constants/charmaps/dialog.asm):
; $E0 Yoshi doll, $E3 bananas, $EC magnifying lens.
; Max $5F characters (wMessageBuffer is $60 bytes).
TextOwlSign:
    db   "Hoo hoo!        Something is    hidden on this  floor...", $ff
TextOwlSignTwo:
    db   "Hoo hoo!        Two things are  hidden on this  floor...", $ff
TextHint:
    db   "Dead end in the village? Bomb   your way: down, 2x right, up,   right, 2x down!", $ff
TextYoshiWant:
    db   "I love dolls! Doyou have a ", $E0, " forme?", $ff
TextYoshiGive:
    db   "A ", $E0, "! I love to  spin around withit - and now youcan, too!", $ff
TextYoshiDone:
    db   "Wheee! Spinning is so much fun!", $ff
TextBananasWant:
    db   "Ook ook! So     hungry... Got   any bananas?", $ff
TextBananasGive:
    db   "Mmmh, ", $E3, " yummy!  Here, a stick   that always     comes back!", $ff
TextBananasDone:
    db   "Ook! Those      bananas were    tasty!", $ff
TextLensWant:
    db   "My eyes are so  bad... If only Ihad my          magnifying lens.", $ff
TextLensGive:
    db   "Thanks for the  ", $EC, "! I see so     badly and I am  slow anyway.    Here, you bettertake these!", $ff
TextLensDone:
    db   "Now I can read  again. Thanks!", $ff
}

#SECTION "LSD_VillagerSheet", ROMX, BANK[$20] {
; Load spritesheet [hLSDTemporary1] for entity bc and point the entity at it.
; Same as LSD_ResetEntity (entitygfx.asm), but with a given sheet instead of
; the one that belongs to the entity type.
LSD_LoadSheetForEntity:
    ldh  a, [hLSDTemporary1]
    ld   b, a

    ; Check if the sheet is already loaded
    ld   hl, wLoadedEntitySpritesheets
    ld   e, $00
    loop d, 4 {
        ld   a, b
        cp   [hl]
        if z {
            pushpop de {
                ld   de, wLoadedEntitySpritesheetsAge - wLoadedEntitySpritesheets
                add  hl, de
                ld   [hl], 0
            }
            ld  b, 0
            ld   hl, wEntitiesSpriteOffsetTable
            add  hl, bc
            ld   [hl], e
            ret
        }
        ld   a, e
        add  a, $10
        ld   e, a
        inc  hl
    }

    ; Sheet not found, search the oldest wLoadedEntitySpritesheets and replace that.
    ld   hl, wLoadedEntitySpritesheetsAge
    ld   a, 0
    loop d, 4 { ; loop over all ages, find the highest and increase all with 1.
        inc [hl]
        cp  [hl]
        if  c {
            ld  a, [hl]
        }
        inc hl
    }
    ld   hl, wLoadedEntitySpritesheetsAge + 3
    loop d, 4 {
        cp  [hl] ; if highest age, replace it.
        if z {
            ld  [hl], 0
            pushpop de {
                ld   de, $10000 + wLoadedEntitySpritesheets - wLoadedEntitySpritesheetsAge
                add  hl, de
                ld   [hl], b ; store required sheet
            }
            ld   b, 0

            ld   a, d
            dec  a
            swap a
            ld   hl, wEntitiesSpriteOffsetTable
            add  hl, bc
            ld   [hl], a

            ldh  a, [hNeedsUpdatingEntityTilesA]
            and  a, a
            ld   a, d
            if   z {
                ldh  [hNeedsUpdatingEntityTilesA], a
                dec  a
                ld   [wEntityTilesSpriteslotIndexA], a
            } else {
                ld   [wNeedsUpdatingEntityTilesB], a
                dec  a
                ld   [wEntityTilesSpriteslotIndexB], a
            }
            ret
        }
        dec hl
    }
    ld   b, 0
    ret
}

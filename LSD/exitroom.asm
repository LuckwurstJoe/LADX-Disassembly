#SECTION "LSD_ExitRoomEntityHandler", ROMX, BANK[$3E] {
LSD_ExitRoomEntityHandler:
    ldh a, [hActiveEntityState]
    rst 0
    dw  WaitForEnemyDeath
    dw  WaitForLinkToClearHole

WaitForEnemyDeath:
    ld   e, $0F
    ld   d, $00
.loopOverEntities:
    ld   hl, wEntitiesStatusTable
    add  hl, de
    ld   a, [hl]
    ; If the entity is none or disabled, continue with the next entity
    and  a
    if   nz {
        ; If the entity is active, and not excluded from the "Kill all" trigger,
        ; then the trigger is not resolved: return immediately.
        ld   hl, wEntitiesOptions1Table
        add  hl, de
        ld   a, [hl]
        and  $02 ; ENTITY_OPT1_EXCLUDED_FROM_KILL_ALL
        ret  z
    }
    dec  e
    ld   a, e
    cp   -1
    jr   nz, .loopOverEntities
    ; All entites dead
    jp   IncrementEntityState

WaitForLinkToClearHole:
    ldh  a, [hLinkPositionX]
    sub  a, $38
    cp   a, $30
    jr   nc, .safe
    ldh  a, [hLinkPositionY]
    sub  a, $40 ; LSD: the hole is only the lower row now (was $30/$30 for 2x2)
    cp   a, $20
    ret  c
.safe:

    ld   a, [wRoomTransitionState]
    and  a, a
    ret  nz ; We entered the room while it is solved, the normal scrolling will draw the tiles so we do not have to.

    ld   a, $02 ; JINGLE_PUZZLE_SOLVED
    ldh  [hJingle], a

    ; LSD: a 2x1 hole (object $1D, a pit that is one object high) instead of 2x2,
    ; so falling in always puts Link low enough for the next room's boss.
    ld   hl, wRoomObjects + $44
    ld   [hl], $1D
    inc  hl
    ld   [hl], $1D

    ld   a, $40
    ldh  [hIntersectedObjectTop], a
    ld   a, $40
    ldh  [hIntersectedObjectLeft], a
    call label_2887

    ld   hl, wDrawCommand
    ld   a, [wDrawCommandsSize]
    ld   e, a
    add  $14 ; 4 commands of 5 bytes
    ld   [wDrawCommandsSize], a
    ld   d, $00
    add  hl, de

    ldh  a, [hIntersectedObjectBGAddressHigh]
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressLow]
    ld   [hl+], a
    ld   a, $81 ; 2 tiles downwards
    ld   [hl+], a
    ld   a, $76
    ld   [hl+], a
    ld   a, $49
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressHigh]
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressLow]
    inc  a
    ld   [hl+], a
    ld   a, $81 ; 2 tiles downwards
    ld   [hl+], a
    ld   a, $76
    ld   [hl+], a
    ld   a, $49
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressHigh]
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressLow]
    add  a, 2
    ld   [hl+], a
    ld   a, $81 ; 2 tiles downwards
    ld   [hl+], a
    ld   a, $76
    ld   [hl+], a
    ld   a, $49
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressHigh]
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressLow]
    add  a, 3
    ld   [hl+], a
    ld   a, $81 ; 2 tiles downwards
    ld   [hl+], a
    ld   a, $76
    ld   [hl+], a
    ld   a, $49
    ld   [hl+], a
    ld   a, $00
    ld   [hl+], a

    ld   hl, wDrawCommandVRAM1
    ld   a, [wDrawCommandsVRAM1Size]
    ld   e, a
    add  $14 ; 4 commands of 5 bytes
    ld   [wDrawCommandsVRAM1Size], a
    ld   d, $00
    add  hl, de

    ldh  a, [hIntersectedObjectBGAddressHigh]
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressLow]
    ld   [hl+], a
    ld   a, $81 ; 2 tiles downwards
    ld   [hl+], a
    ld   a, $07
    ld   [hl+], a
    ld   a, $07
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressHigh]
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressLow]
    inc  a
    ld   [hl+], a
    ld   a, $81 ; 2 tiles downwards
    ld   [hl+], a
    ld   a, $07
    ld   [hl+], a
    ld   a, $07
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressHigh]
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressLow]
    add  a, 2
    ld   [hl+], a
    ld   a, $81 ; 2 tiles downwards
    ld   [hl+], a
    ld   a, $07
    ld   [hl+], a
    ld   a, $07
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressHigh]
    ld   [hl+], a
    ldh  a, [hIntersectedObjectBGAddressLow]
    add  a, 3
    ld   [hl+], a
    ld   a, $81 ; 2 tiles downwards
    ld   [hl+], a
    ld   a, $07
    ld   [hl+], a
    ld   a, $07
    ld   [hl+], a
    ld   a, $00
    ld   [hl+], a

    call UnloadEntity
    ret
}

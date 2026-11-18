#SECTION "RandomRoomData", ROMX, BANK[$0A] {
_RandomRoomDataTable:
  db 21
  dw RandomRoomDataTable0
  db 1
  dw RandomRoomDataTable1
  db 2
  dw RandomRoomDataTable2
  db 8
  dw RandomRoomDataTable3
  db 4
  dw RandomRoomDataTable4
  db 1
  dw RandomRoomDataTable5
  db 1
  dw RandomRoomDataTable6
  db 1
  dw RandomRoomDataTable7
  db 1
  dw RandomRoomDataTable8
  db 1
  dw RandomRoomDataTable9
  db 1
  dw RandomRoomDataTable10
RandomRoomDataTable0:
  dw random_room_0 ; Basic Room
  dw random_room_1 ; Vertical Hallway
  dw random_room_2 ; Horizontal Hallway
  dw random_room_3 ; Random Corners
  dw random_room_8 ; H-Split
  dw random_room_15 ; Water Room
  dw random_room_18 ; Corner UL
  dw random_room_26 ; Lava Moat
  dw random_room_27 ; Spike Stripes
  dw random_room_28 ; Conveyor Belts
  dw random_room_29 ; Statue Garden
  dw random_room_30 ; Pot Chamber
  dw random_room_31 ; Water Corners
  dw random_room_34 ; Lava River
  dw random_room_35 ; Corner Rubble
  dw random_room_36 ; Pit Field
  dw random_room_37 ; Pond
  dw random_room_38 ; Spike Corners
  dw random_room_39 ; Block Maze
  dw random_room_40 ; Peninsula
  dw random_room_41 ; Conveyor Chaos
RandomRoomDataTable1:
  dw random_room_5 ; Entrance 1
RandomRoomDataTable2:
  dw random_room_4 ; Exit 1
  dw random_room_25 ; Exit Genie
RandomRoomDataTable3:
  dw random_room_6 ; Treasure 1
  dw random_room_7 ; Treasure Ledge
  dw random_room_9 ; Treasure 2
  dw random_room_11 ; Treasure Kill Room
  dw random_room_16 ; Treasure Block Push
  dw random_room_17 ; Hole Filler Treasure
  dw random_room_32 ; Lava Island Treasure
  dw random_room_33 ; Spike Treasure
RandomRoomDataTable4:
  dw random_room_12 ; Big Fairy
  dw random_room_13 ; Shop 1
  dw random_room_14 ; Shop 2
  dw random_room_19 ; Pick One
RandomRoomDataTable5:
  dw random_room_10 ; Final Nightmare
RandomRoomDataTable6:
  dw random_room_20 ; Village Empty
RandomRoomDataTable7:
  dw random_room_21 ; Villager
RandomRoomDataTable8:
  dw random_room_22 ; Village Exit
RandomRoomDataTable9:
  dw random_room_23 ; Village Shop
RandomRoomDataTable10:
  dw random_room_24 ; Village Treasure
random_room_0: ; Basic Room
  db $00, $00 ; allowed filter
  db $21 ; event
  ; Primary data
  db 18, $04, $0D, $03, $C7, $06, $C7, $20, $C9, $29, $CA, $50, $C9, $59, $CA, $73, $C8, $76, $C8
  ; Variations
  db 7
  db $80
  dw random_room_0_variation_0
  db $80
  dw random_room_0_variation_1
  db $80
  dw random_room_0_variation_2
  db $80
  dw random_room_0_variation_3
  db $80
  dw random_room_0_variation_4
  db $80
  dw random_room_0_variation_5
  db $80
  dw random_room_0_variation_6
  ; Entity sets
  db 26
  db $00, $04
  dw random_room_0_entity_set_0
  db $00, $01
  dw random_room_0_entity_set_1
  db $02, $04
  dw random_room_0_entity_set_2
  db $03, $05
  dw random_room_0_entity_set_3
  db $06, $08
  dw random_room_0_entity_set_4
  db $03, $05
  dw random_room_0_entity_set_5
  db $06, $FF
  dw random_room_0_entity_set_6
  db $03, $05
  dw random_room_0_entity_set_7
  db $06, $08
  dw random_room_0_entity_set_8
  db $00, $01
  dw random_room_0_entity_set_9
  db $02, $04
  dw random_room_0_entity_set_10
  db $00, $01
  dw random_room_0_entity_set_11
  db $02, $04
  dw random_room_0_entity_set_12
  db $00, $05
  dw random_room_0_entity_set_13
  db $06, $06
  dw random_room_0_entity_set_14
  db $03, $05
  dw random_room_0_entity_set_15
  db $06, $FF
  dw random_room_0_entity_set_16
  db $07, $07
  dw random_room_0_entity_set_17
  db $08, $FF
  dw random_room_0_entity_set_18
  db $07, $FF
  dw random_room_0_entity_set_19
  db $07, $07
  dw random_room_0_entity_set_20
  db $08, $FF
  dw random_room_0_entity_set_21
  db $05, $05
  dw random_room_0_entity_set_22
  db $06, $FF
  dw random_room_0_entity_set_23
  db $09, $FF
  dw random_room_0_entity_set_24
  db $09, $FF
  dw random_room_0_entity_set_25
random_room_0_variation_0:
  db 2, $62, $DF
random_room_0_variation_1:
  db 2, $57, $DF
random_room_0_variation_2:
  db 2, $23, $DF
random_room_0_variation_3:
  db 2, $36, $DF
random_room_0_variation_4:
  db 6, $C2, $34, $0F, $C2, $35, $0F
random_room_0_variation_5:
  db 2, $52, $AE
random_room_0_variation_6:
  db 2, $27, $AE
random_room_0_entity_set_0:
  db 6
  db $43, $0B
  db $36, $0B
  db $23, $0B
random_room_0_entity_set_1:
  db 6
  db $34, $19
  db $35, $19
  db $45, $19
random_room_0_entity_set_2:
  db 8
  db $34, $19
  db $35, $19
  db $45, $19
  db $44, $19
random_room_0_entity_set_3:
  db 6
  db $33, $1A
  db $46, $1E
  db $17, $1A
random_room_0_entity_set_4:
  db 10
  db $33, $1A
  db $46, $1E
  db $17, $1A
  db $26, $1A
  db $37, $1A
random_room_0_entity_set_5:
  db 4
  db $44, $1F
  db $43, $1F
random_room_0_entity_set_6:
  db 8
  db $44, $1F
  db $43, $1F
  db $56, $1F
  db $17, $1F
random_room_0_entity_set_7:
  db 4
  db $43, $29
  db $61, $29
random_room_0_entity_set_8:
  db 8
  db $43, $29
  db $61, $29
  db $28, $29
  db $44, $29
random_room_0_entity_set_9:
  db 6
  db $45, $9B
  db $34, $1B
  db $54, $1B
random_room_0_entity_set_10:
  db 8
  db $45, $9B
  db $44, $9B
  db $34, $1B
  db $54, $1B
random_room_0_entity_set_11:
  db 6
  db $57, $9B
  db $34, $1B
  db $21, $1B
random_room_0_entity_set_12:
  db 8
  db $57, $9B
  db $22, $9B
  db $34, $1B
  db $21, $1B
random_room_0_entity_set_13:
  db 6
  db $53, $A1
  db $26, $A1
  db $32, $A1
random_room_0_entity_set_14:
  db 10
  db $53, $A1
  db $26, $A1
  db $32, $A1
  db $55, $A1
  db $68, $19
random_room_0_entity_set_15:
  db 6
  db $34, $14
  db $45, $0B
  db $37, $14
random_room_0_entity_set_16:
  db 10
  db $34, $14
  db $45, $0B
  db $37, $14
  db $55, $14
  db $11, $14
random_room_0_entity_set_17:
  db 10
  db $34, $1A
  db $45, $1A
  db $44, $1E
  db $53, $1A
  db $37, $1A
random_room_0_entity_set_18:
  db 12
  db $34, $1A
  db $45, $1A
  db $44, $1E
  db $53, $1A
  db $37, $1A
  db $17, $1E
random_room_0_entity_set_19:
  db 10
  db $43, $1F
  db $36, $1F
  db $13, $1F
  db $22, $1F
  db $54, $19
random_room_0_entity_set_20:
  db 10
  db $45, $14
  db $44, $14
  db $35, $0B
  db $34, $0B
  db $32, $14
random_room_0_entity_set_21:
  db 12
  db $45, $14
  db $44, $14
  db $35, $0B
  db $34, $0B
  db $32, $14
  db $26, $14
random_room_0_entity_set_22:
  db 6
  db $43, $29
  db $36, $29
  db $33, $29
random_room_0_entity_set_23:
  db 10
  db $43, $29
  db $36, $29
  db $33, $29
  db $55, $29
  db $62, $19
random_room_0_entity_set_24:
  db 12
  db $34, $1F
  db $35, $1F
  db $45, $1A
  db $44, $1A
  db $55, $1F
  db $66, $1F
random_room_0_entity_set_25:
  db 12
  db $45, $29
  db $44, $29
  db $35, $1E
  db $13, $29
  db $56, $29
  db $18, $1E
random_room_1: ; Vertical Hallway
  db $03, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 34, $04, $93, $02, $25, $84, $03, $21, $07, $26, $C6, $12, $23, $C6, $13, $0D, $C6, $14, $0D, $C6, $15, $0D, $C6, $16, $0D, $C6, $17, $24, $72, $27, $84, $73, $22, $77, $28
  ; Variations
  db 3
  db $80
  dw random_room_1_variation_0
  db $80
  dw random_room_1_variation_1
  db $80
  dw random_room_1_variation_2
  ; Entity sets
  db 10
  db $00, $04
  dw random_room_1_entity_set_0
  db $03, $05
  dw random_room_1_entity_set_1
  db $06, $FF
  dw random_room_1_entity_set_2
  db $05, $05
  dw random_room_1_entity_set_3
  db $06, $FF
  dw random_room_1_entity_set_4
  db $00, $04
  dw random_room_1_entity_set_5
  db $03, $05
  dw random_room_1_entity_set_6
  db $06, $08
  dw random_room_1_entity_set_7
  db $07, $FF
  dw random_room_1_entity_set_8
  db $09, $FF
  dw random_room_1_entity_set_9
random_room_1_variation_0:
  db 6, $C6, $14, $0F, $C6, $15, $0F
random_room_1_variation_1:
  db 8, $13, $AC, $16, $AC, $63, $AC, $66, $AC
random_room_1_variation_2:
  db 28, $21, $25, $22, $29, $27, $2A, $28, $26, $C2, $31, $23, $C2, $32, $20, $C2, $37, $20, $C2, $38, $24, $51, $27, $52, $2B, $57, $2C, $58, $28
random_room_1_entity_set_0:
  db 6
  db $43, $0B
  db $36, $0B
  db $46, $0B
random_room_1_entity_set_1:
  db 4
  db $35, $B9
  db $24, $B9
random_room_1_entity_set_2:
  db 8
  db $35, $B9
  db $24, $B9
  db $25, $B9
  db $36, $B9
random_room_1_entity_set_3:
  db 6
  db $34, $8F
  db $45, $8F
  db $46, $8F
random_room_1_entity_set_4:
  db 10
  db $34, $8F
  db $45, $8F
  db $46, $8F
  db $54, $8F
  db $56, $19
random_room_1_entity_set_5:
  db 6
  db $44, $9B
  db $35, $9B
  db $24, $1B
random_room_1_entity_set_6:
  db 4
  db $45, $29
  db $53, $29
random_room_1_entity_set_7:
  db 8
  db $45, $29
  db $53, $29
  db $25, $29
  db $23, $29
random_room_1_entity_set_8:
  db 10
  db $43, $14
  db $36, $14
  db $33, $14
  db $24, $14
  db $34, $19
random_room_1_entity_set_9:
  db 12
  db $34, $8F
  db $45, $8F
  db $35, $B9
  db $33, $8F
  db $24, $8F
  db $55, $B9
random_room_2: ; Horizontal Hallway
  db $0C, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 77, $04, $93, $11, $25, $86, $12, $21, $13, $C7, $16, $C7, $18, $26, $20, $25, $21, $29, $86, $22, $B0, $C4, $23, $0D, $C4, $24, $0D, $C4, $25, $0D, $C4, $26, $0D, $28, $2A, $29, $26, $C2, $30, $23, $C2, $31, $0D, $C2, $32, $0D, $C2, $37, $0D, $C2, $38, $0D, $C2, $39, $24, $50, $27, $51, $2B, $52, $AF, $57, $AF, $58, $2C, $59, $28, $61, $27, $86, $62, $22, $63, $C8, $66, $C8, $68, $28
  ; Variations
  db 4
  db $80
  dw random_room_2_variation_0
  db $80
  dw random_room_2_variation_1
  db $80
  dw random_room_2_variation_2
  db $80
  dw random_room_2_variation_3
  ; Entity sets
  db 7
  db $00, $05
  dw random_room_2_entity_set_0
  db $06, $06
  dw random_room_2_entity_set_1
  db $01, $05
  dw random_room_2_entity_set_2
  db $06, $08
  dw random_room_2_entity_set_3
  db $03, $FF
  dw random_room_2_entity_set_4
  db $07, $07
  dw random_room_2_entity_set_5
  db $08, $FF
  dw random_room_2_entity_set_6
random_room_2_variation_0:
  db 3, $84, $53, $AF
random_room_2_variation_1:
  db 3, $84, $23, $B0
random_room_2_variation_2:
  db 4, $47, $AF, $57, $01
random_room_2_variation_3:
  db 4, $22, $01, $32, $B0
random_room_2_entity_set_0:
  db 6
  db $43, $20
  db $36, $20
  db $35, $20
random_room_2_entity_set_1:
  db 10
  db $43, $20
  db $36, $20
  db $35, $20
  db $46, $20
  db $37, $19
random_room_2_entity_set_2:
  db 4
  db $45, $A0
  db $44, $A0
random_room_2_entity_set_3:
  db 8
  db $45, $A0
  db $44, $A0
  db $43, $A0
  db $34, $A0
random_room_2_entity_set_4:
  db 4
  db $27, $B2
  db $52, $B2
random_room_2_entity_set_5:
  db 10
  db $43, $20
  db $36, $20
  db $45, $A0
  db $33, $20
  db $35, $20
random_room_2_entity_set_6:
  db 12
  db $43, $20
  db $36, $20
  db $45, $A0
  db $33, $20
  db $35, $20
  db $42, $A0
random_room_3: ; Random Corners
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 14, $04, $0D, $82, $12, $DF, $82, $16, $DF, $83, $61, $DF, $83, $66, $DF
  ; Variations
  db 5
  db $80
  dw random_room_3_variation_0
  db $80
  dw random_room_3_variation_1
  db $80
  dw random_room_3_variation_2
  db $80
  dw random_room_3_variation_3
  db $80
  dw random_room_3_variation_4
  ; Entity sets
  db 13
  db $00, $04
  dw random_room_3_entity_set_0
  db $03, $05
  dw random_room_3_entity_set_1
  db $06, $08
  dw random_room_3_entity_set_2
  db $05, $05
  dw random_room_3_entity_set_3
  db $06, $FF
  dw random_room_3_entity_set_4
  db $05, $FF
  dw random_room_3_entity_set_5
  db $01, $05
  dw random_room_3_entity_set_6
  db $06, $08
  dw random_room_3_entity_set_7
  db $00, $05
  dw random_room_3_entity_set_8
  db $06, $06
  dw random_room_3_entity_set_9
  db $07, $07
  dw random_room_3_entity_set_10
  db $08, $FF
  dw random_room_3_entity_set_11
  db $09, $FF
  dw random_room_3_entity_set_12
random_room_3_variation_0:
  db 16, $C2, $00, $03, $C2, $01, $03, $02, $25, $12, $23, $20, $25, $21, $21, $22, $29
random_room_3_variation_1:
  db 16, $50, $27, $51, $22, $52, $2B, $C2, $60, $03, $C2, $61, $03, $62, $23, $72, $27
random_room_3_variation_2:
  db 16, $07, $26, $C2, $08, $03, $C2, $09, $03, $17, $24, $27, $2A, $28, $21, $29, $26
random_room_3_variation_3:
  db 16, $57, $2C, $58, $22, $59, $28, $67, $24, $C2, $68, $03, $C2, $69, $03, $77, $28
random_room_3_variation_4:
  db 6, $C2, $34, $C0, $C2, $35, $C0
random_room_3_entity_set_0:
  db 6
  db $34, $19
  db $35, $19
  db $63, $19
random_room_3_entity_set_1:
  db 6
  db $43, $18
  db $36, $18
  db $46, $18
random_room_3_entity_set_2:
  db 10
  db $43, $18
  db $36, $18
  db $46, $18
  db $33, $18
  db $37, $19
random_room_3_entity_set_3:
  db 4
  db $36, $91
  db $56, $91
random_room_3_entity_set_4:
  db 8
  db $36, $91
  db $56, $91
  db $54, $91
  db $33, $91
random_room_3_entity_set_5:
  db 6
  db $43, $EC
  db $46, $EE
  db $25, $ED
random_room_3_entity_set_6:
  db 6
  db $43, $1A
  db $36, $1A
  db $53, $1A
random_room_3_entity_set_7:
  db 10
  db $43, $1A
  db $36, $1A
  db $53, $1A
  db $24, $1A
  db $54, $19
random_room_3_entity_set_8:
  db 6
  db $43, $0D
  db $36, $0D
  db $42, $0D
random_room_3_entity_set_9:
  db 10
  db $43, $0D
  db $36, $0D
  db $42, $0D
  db $55, $0D
  db $33, $19
random_room_3_entity_set_10:
  db 10
  db $43, $18
  db $36, $18
  db $34, $19
  db $35, $19
  db $24, $18
random_room_3_entity_set_11:
  db 12
  db $43, $18
  db $36, $18
  db $34, $19
  db $35, $19
  db $24, $18
  db $46, $18
random_room_3_entity_set_12:
  db 12
  db $43, $18
  db $36, $18
  db $23, $1A
  db $56, $1A
  db $55, $18
  db $16, $18
random_room_4: ; Exit 1
  db $00, $00 ; allowed filter
  db $21 ; event
  ; Primary data
  db 7, $04, $0D, $E1, $00, $FF, $58, $52
  ; Variations
  db 5
  db $80
  dw random_room_4_variation_0
  db $80
  dw random_room_4_variation_1
  db $80
  dw random_room_4_variation_2
  db $80
  dw random_room_4_variation_3
  db $80
  dw random_room_4_variation_4
  ; Entity sets
  db 4
  db $00, $06
  dw random_room_4_entity_set_0
  db $03, $FF
  dw random_room_4_entity_set_1
  db $05, $FF
  dw random_room_4_entity_set_2
  db $00, $04
  dw random_room_4_entity_set_3
random_room_4_variation_0:
  db 7, $58, $AF, $82, $66, $AF, $68, $01
random_room_4_variation_1:
  db 7, $51, $AF, $61, $01, $82, $62, $AF
random_room_4_variation_2:
  db 7, $82, $16, $B0, $18, $01, $28, $B0
random_room_4_variation_3:
  db 7, $11, $01, $82, $12, $B0, $21, $B0
random_room_4_variation_4:
  db 6, $C4, $34, $0F, $C4, $35, $0F
random_room_4_entity_set_0:
  db 4
  db $24, $89
  db $00, $E7
random_room_4_entity_set_1:
  db 4
  db $34, $59
  db $00, $E7
random_room_4_entity_set_2:
  db 4
  db $34, $5B
  db $00, $E7
random_room_4_entity_set_3:
  db 4
  db $25, $51
  db $00, $E7
random_room_5: ; Entrance 1
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 10, $04, $0D, $22, $AC, $27, $AC, $52, $AC, $57, $AC
  ; Variations
  db 6
  db $80
  dw random_room_5_variation_0
  db $80
  dw random_room_5_variation_1
  db $80
  dw random_room_5_variation_2
  db $80
  dw random_room_5_variation_3
  db $80
  dw random_room_5_variation_4
  db $80
  dw random_room_5_variation_5
  ; Entity sets
  db 3
  db $00, $01
  dw random_room_5_entity_set_0
  db $05, $FF
  dw random_room_5_entity_set_1
  db $02, $04
  dw random_room_5_entity_set_2
random_room_5_variation_0:
  db 3, $84, $53, $0F
random_room_5_variation_1:
  db 3, $C2, $37, $0F
random_room_5_variation_2:
  db 3, $84, $23, $0F
random_room_5_variation_3:
  db 3, $C2, $32, $0F
random_room_5_variation_4:
  db 4, $33, $AF, $43, $B0
random_room_5_variation_5:
  db 4, $36, $AF, $46, $B0
random_room_5_entity_set_0:
  db 0
random_room_5_entity_set_1:
  db 0
random_room_5_entity_set_2:
  db 2
  db $11, $4D
random_room_6: ; Treasure 1
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 6, $04, $0D, $12, $A0, $22, $0F
  ; Variations
  db 4
  db $80
  dw random_room_6_variation_0
  db $80
  dw random_room_6_variation_1
  db $80
  dw random_room_6_variation_2
  db $80
  dw random_room_6_variation_3
  ; Entity sets
  db 11
  db $00, $04
  dw random_room_6_entity_set_0
  db $00, $05
  dw random_room_6_entity_set_1
  db $06, $06
  dw random_room_6_entity_set_2
  db $01, $05
  dw random_room_6_entity_set_3
  db $06, $08
  dw random_room_6_entity_set_4
  db $03, $05
  dw random_room_6_entity_set_5
  db $06, $FF
  dw random_room_6_entity_set_6
  db $05, $05
  dw random_room_6_entity_set_7
  db $06, $FF
  dw random_room_6_entity_set_8
  db $07, $FF
  dw random_room_6_entity_set_9
  db $09, $FF
  dw random_room_6_entity_set_10
random_room_6_variation_0:
  db 2, $64, $DF
random_room_6_variation_1:
  db 4, $14, $DF, $36, $DF
random_room_6_variation_2:
  db 16, $60, $27, $61, $2B, $68, $2C, $69, $28, $70, $03, $71, $27, $78, $28, $79, $03
random_room_6_variation_3:
  db 16, $00, $03, $01, $25, $08, $26, $09, $03, $10, $25, $11, $29, $18, $2A, $19, $26
random_room_6_entity_set_0:
  db 0
random_room_6_entity_set_1:
  db 4
  db $44, $9B
  db $66, $1B
random_room_6_entity_set_2:
  db 8
  db $44, $9B
  db $66, $1B
  db $34, $1B
  db $16, $1B
random_room_6_entity_set_3:
  db 6
  db $45, $0B
  db $43, $0B
  db $23, $0B
random_room_6_entity_set_4:
  db 10
  db $45, $0B
  db $43, $0B
  db $23, $0B
  db $47, $0B
  db $32, $19
random_room_6_entity_set_5:
  db 6
  db $53, $1E
  db $36, $1A
  db $17, $1E
random_room_6_entity_set_6:
  db 10
  db $53, $1E
  db $36, $1A
  db $17, $1E
  db $28, $1E
  db $62, $1E
random_room_6_entity_set_7:
  db 6
  db $43, $0E
  db $46, $0E
  db $45, $0E
random_room_6_entity_set_8:
  db 10
  db $43, $0E
  db $46, $0E
  db $45, $0E
  db $34, $0E
  db $33, $19
random_room_6_entity_set_9:
  db 10
  db $45, $23
  db $43, $23
  db $34, $23
  db $54, $23
  db $52, $19
random_room_6_entity_set_10:
  db 12
  db $45, $23
  db $43, $23
  db $53, $1A
  db $52, $23
  db $25, $23
  db $67, $1A
random_room_7: ; Treasure Ledge
  db $08, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 53, $04, $0D, $02, $26, $03, $2A, $06, $29, $07, $25, $C2, $12, $24, $84, $13, $0F, $14, $A0, $C2, $17, $23, $84, $23, $0F, $32, $2A, $84, $33, $21, $82, $34, $97, $37, $29, $82, $44, $0F, $60, $27, $61, $2B, $68, $2C, $69, $28, $70, $03, $71, $27, $78, $28, $79, $03
  ; Variations
  db 2
  db $80
  dw random_room_7_variation_0
  db $80
  dw random_room_7_variation_1
  ; Entity sets
  db 5
  db $00, $04
  dw random_room_7_entity_set_0
  db $01, $05
  dw random_room_7_entity_set_1
  db $06, $FF
  dw random_room_7_entity_set_2
  db $00, $05
  dw random_room_7_entity_set_3
  db $06, $FF
  dw random_room_7_entity_set_4
random_room_7_variation_0:
  db 5, $13, $20, $82, $15, $20
random_room_7_variation_1:
  db 4, $52, $AB, $57, $AB
random_room_7_entity_set_0:
  db 0
random_room_7_entity_set_1:
  db 4
  db $24, $14
  db $23, $14
random_room_7_entity_set_2:
  db 8
  db $24, $14
  db $23, $14
  db $26, $14
  db $25, $14
random_room_7_entity_set_3:
  db 6
  db $44, $9B
  db $45, $9B
  db $24, $1B
random_room_7_entity_set_4:
  db 10
  db $44, $9B
  db $45, $9B
  db $24, $1B
  db $23, $1B
  db $25, $1B
random_room_8: ; H-Split
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 24, $04, $0D, $11, $20, $18, $20, $32, $2C, $84, $33, $22, $37, $2B, $42, $2A, $84, $43, $21, $47, $29, $61, $20, $68, $20
  ; Variations
  db 4
  db $80
  dw random_room_8_variation_0
  db $80
  dw random_room_8_variation_1
  db $80
  dw random_room_8_variation_2
  db $80
  dw random_room_8_variation_3
  ; Entity sets
  db 13
  db $00, $04
  dw random_room_8_entity_set_0
  db $03, $05
  dw random_room_8_entity_set_1
  db $06, $FF
  dw random_room_8_entity_set_2
  db $00, $05
  dw random_room_8_entity_set_3
  db $06, $06
  dw random_room_8_entity_set_4
  db $00, $01
  dw random_room_8_entity_set_5
  db $02, $04
  dw random_room_8_entity_set_6
  db $05, $05
  dw random_room_8_entity_set_7
  db $06, $FF
  dw random_room_8_entity_set_8
  db $07, $07
  dw random_room_8_entity_set_9
  db $08, $FF
  dw random_room_8_entity_set_10
  db $09, $FF
  dw random_room_8_entity_set_11
  db $09, $FF
  dw random_room_8_entity_set_12
random_room_8_variation_0:
  db 3, $82, $53, $DF
random_room_8_variation_1:
  db 3, $82, $25, $DF
random_room_8_variation_2:
  db 8, $11, $AC, $18, $AC, $61, $AC, $68, $AC
random_room_8_variation_3:
  db 14, $33, $2B, $C2, $34, $0F, $C2, $35, $0F, $36, $2C, $43, $29, $46, $2A
random_room_8_entity_set_0:
  db 6
  db $55, $0B
  db $24, $0B
  db $12, $0B
random_room_8_entity_set_1:
  db 6
  db $53, $14
  db $26, $14
  db $67, $14
random_room_8_entity_set_2:
  db 10
  db $53, $14
  db $26, $14
  db $67, $14
  db $16, $14
  db $58, $19
random_room_8_entity_set_3:
  db 6
  db $57, $A1
  db $22, $A1
  db $23, $A1
random_room_8_entity_set_4:
  db 10
  db $57, $A1
  db $22, $A1
  db $23, $A1
  db $53, $A1
  db $13, $19
random_room_8_entity_set_5:
  db 6
  db $57, $9B
  db $27, $9B
  db $63, $1B
random_room_8_entity_set_6:
  db 8
  db $57, $9B
  db $27, $9B
  db $22, $9B
  db $63, $1B
random_room_8_entity_set_7:
  db 6
  db $56, $9C
  db $23, $9C
  db $12, $9C
random_room_8_entity_set_8:
  db 10
  db $56, $9C
  db $23, $9C
  db $12, $9C
  db $66, $9C
  db $17, $19
random_room_8_entity_set_9:
  db 10
  db $53, $14
  db $26, $14
  db $55, $0B
  db $24, $0B
  db $16, $14
random_room_8_entity_set_10:
  db 12
  db $53, $14
  db $26, $14
  db $55, $0B
  db $24, $0B
  db $16, $14
  db $62, $14
random_room_8_entity_set_11:
  db 12
  db $57, $14
  db $27, $14
  db $22, $14
  db $52, $14
  db $26, $19
  db $16, $19
random_room_8_entity_set_12:
  db 12
  db $56, $9C
  db $23, $9C
  db $53, $14
  db $26, $14
  db $28, $9C
  db $62, $9C
random_room_9: ; Treasure 2
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 18, $04, $0D, $11, $A0, $12, $C0, $17, $C0, $18, $0F, $61, $0F, $62, $C0, $67, $C0, $68, $0F
  ; Variations
  db 6
  db $80
  dw random_room_9_variation_0
  db $80
  dw random_room_9_variation_1
  db $80
  dw random_room_9_variation_2
  db $80
  dw random_room_9_variation_3
  db $80
  dw random_room_9_variation_4
  db $80
  dw random_room_9_variation_5
  ; Entity sets
  db 9
  db $00, $06
  dw random_room_9_entity_set_0
  db $00, $05
  dw random_room_9_entity_set_1
  db $06, $FF
  dw random_room_9_entity_set_2
  db $00, $05
  dw random_room_9_entity_set_3
  db $06, $06
  dw random_room_9_entity_set_4
  db $05, $07
  dw random_room_9_entity_set_5
  db $08, $FF
  dw random_room_9_entity_set_6
  db $05, $07
  dw random_room_9_entity_set_7
  db $08, $FF
  dw random_room_9_entity_set_8
random_room_9_variation_0:
  db 6, $C2, $34, $A6, $C2, $35, $A6
random_room_9_variation_1:
  db 4, $73, $C8, $76, $C8
random_room_9_variation_2:
  db 4, $03, $C7, $06, $C7
random_room_9_variation_3:
  db 4, $20, $C9, $50, $C9
random_room_9_variation_4:
  db 4, $29, $CA, $59, $CA
random_room_9_variation_5:
  db 6, $84, $33, $12, $84, $43, $13
random_room_9_entity_set_0:
  db 0
random_room_9_entity_set_1:
  db 6
  db $32, $23
  db $47, $23
  db $56, $23
random_room_9_entity_set_2:
  db 10
  db $32, $23
  db $47, $23
  db $56, $23
  db $52, $23
  db $27, $19
random_room_9_entity_set_3:
  db 6
  db $53, $0B
  db $26, $14
  db $27, $0B
random_room_9_entity_set_4:
  db 10
  db $53, $0B
  db $26, $14
  db $27, $0B
  db $23, $0B
  db $47, $0B
random_room_9_entity_set_5:
  db 10
  db $56, $0B
  db $23, $0B
  db $26, $14
  db $53, $14
  db $25, $0B
random_room_9_entity_set_6:
  db 12
  db $56, $0B
  db $23, $0B
  db $26, $14
  db $53, $14
  db $25, $0B
  db $18, $0B
random_room_9_entity_set_7:
  db 10
  db $22, $9B
  db $57, $9B
  db $55, $1B
  db $24, $1B
  db $61, $1B
random_room_9_entity_set_8:
  db 12
  db $22, $9B
  db $57, $9B
  db $27, $9B
  db $55, $1B
  db $24, $1B
  db $61, $1B
random_room_10: ; Final Nightmare
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 42, $04, $0D, $00, $00, $01, $25, $08, $26, $09, $00, $10, $25, $11, $29, $18, $2A, $19, $26, $60, $27, $61, $2B, $68, $2C, $69, $28, $70, $00, $71, $27, $78, $28, $79, $00, $34, $E7, $35, $E8, $44, $E9, $45, $EA
  ; Variations
  db 0
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_10_entity_set_0
random_room_10_entity_set_0:
  db 2
  db $34, $E6
random_room_11: ; Treasure Kill Room
  db $00, $00 ; allowed filter
  db $61 ; event
  ; Primary data
  db 20, $04, $0D, $02, $C7, $07, $C7, $20, $C9, $28, $A1, $29, $CA, $50, $C9, $59, $CA, $72, $C8, $77, $C8
  ; Variations
  db 5
  db $80
  dw random_room_11_variation_0
  db $80
  dw random_room_11_variation_1
  db $80
  dw random_room_11_variation_2
  db $80
  dw random_room_11_variation_3
  db $80
  dw random_room_11_variation_4
  ; Entity sets
  db 11
  db $00, $04
  dw random_room_11_entity_set_0
  db $03, $05
  dw random_room_11_entity_set_1
  db $06, $07
  dw random_room_11_entity_set_2
  db $08, $08
  dw random_room_11_entity_set_3
  db $05, $05
  dw random_room_11_entity_set_4
  db $06, $07
  dw random_room_11_entity_set_5
  db $08, $FF
  dw random_room_11_entity_set_6
  db $00, $01
  dw random_room_11_entity_set_7
  db $02, $04
  dw random_room_11_entity_set_8
  db $05, $07
  dw random_room_11_entity_set_9
  db $08, $FF
  dw random_room_11_entity_set_10
random_room_11_variation_0:
  db 8, $34, $A6, $36, $A6, $43, $A6, $45, $A6
random_room_11_variation_1:
  db 4, $62, $AB, $67, $AB
random_room_11_variation_2:
  db 4, $13, $20, $16, $20
random_room_11_variation_3:
  db 4, $32, $DF, $56, $DF
random_room_11_variation_4:
  db 11, $82, $14, $DF, $C2, $31, $DF, $48, $DF, $82, $64, $DF
random_room_11_entity_set_0:
  db 6
  db $52, $A1
  db $26, $A1
  db $53, $A1
random_room_11_entity_set_1:
  db 8
  db $54, $0B
  db $22, $0B
  db $46, $14
  db $21, $0B
random_room_11_entity_set_2:
  db 10
  db $54, $0B
  db $22, $0B
  db $46, $14
  db $21, $0B
  db $61, $0B
random_room_11_entity_set_3:
  db 12
  db $54, $0B
  db $22, $0B
  db $46, $14
  db $21, $0B
  db $61, $0B
  db $33, $14
random_room_11_entity_set_4:
  db 8
  db $68, $09
  db $18, $09
  db $11, $09
  db $61, $09
random_room_11_entity_set_5:
  db 10
  db $68, $09
  db $18, $09
  db $11, $09
  db $61, $09
  db $37, $19
random_room_11_entity_set_6:
  db 12
  db $68, $09
  db $18, $09
  db $11, $09
  db $61, $09
  db $37, $19
  db $24, $19
random_room_11_entity_set_7:
  db 6
  db $22, $1E
  db $53, $0B
  db $25, $0B
random_room_11_entity_set_8:
  db 8
  db $22, $1E
  db $57, $1E
  db $53, $0B
  db $25, $0B
random_room_11_entity_set_9:
  db 10
  db $22, $1E
  db $57, $1E
  db $53, $0B
  db $25, $0B
  db $24, $1E
random_room_11_entity_set_10:
  db 12
  db $22, $1E
  db $57, $1E
  db $53, $0B
  db $25, $0B
  db $24, $1E
  db $55, $1E
random_room_12: ; Big Fairy
  db $08, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 70, $0C, $0D, $00, $03, $01, $25, $08, $26, $09, $03, $84, $10, $25, $11, $29, $C3, $12, $10, $82, $14, $21, $84, $16, $26, $C3, $17, $11, $18, $2A, $23, $23, $82, $24, $1B, $26, $24, $33, $27, $82, $34, $22, $36, $28, $42, $94, $84, $43, $12, $47, $93, $52, $C0, $57, $C0, $60, $27, $61, $2B, $68, $2C, $69, $28, $70, $03, $71, $27, $78, $28, $79, $03
  ; Variations
  db 0
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_12_entity_set_0
random_room_12_entity_set_0:
  db 2
  db $24, $84
random_room_13: ; Shop 1
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 11, $04, $0D, $85, $22, $00, $85, $32, $00, $85, $42, $00
  ; Variations
  db 2
  db $80
  dw random_room_13_variation_0
  db $80
  dw random_room_13_variation_1
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_13_entity_set_0
random_room_13_variation_0:
  db 9, $85, $22, $07, $85, $32, $07, $85, $42, $07
random_room_13_variation_1:
  db 8, $11, $AC, $18, $AC, $61, $AC, $68, $AC
random_room_13_entity_set_0:
  db 2
  db $24, $4D
random_room_14: ; Shop 2
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 20, $04, $0D, $85, $11, $07, $85, $21, $07, $85, $31, $07, $85, $44, $00, $85, $54, $00, $85, $64, $00
  ; Variations
  db 3
  db $80
  dw random_room_14_variation_0
  db $80
  dw random_room_14_variation_1
  db $80
  dw random_room_14_variation_2
  ; Entity sets
  db 4
  db $03, $FF
  dw random_room_14_entity_set_0
  db $00, $FF
  dw random_room_14_entity_set_1
  db $00, $FF
  dw random_room_14_entity_set_2
  db $05, $FF
  dw random_room_14_entity_set_3
random_room_14_variation_0:
  db 4, $18, $C0, $61, $C0
random_room_14_variation_1:
  db 10, $C2, $26, $DF, $37, $DF, $82, $42, $DF, $53, $DF
random_room_14_variation_2:
  db 18, $85, $11, $00, $85, $21, $00, $85, $31, $00, $85, $44, $07, $85, $54, $07, $85, $64, $07
random_room_14_entity_set_0:
  db 4
  db $46, $4D
  db $13, $4D
random_room_14_entity_set_1:
  db 2
  db $13, $4D
random_room_14_entity_set_2:
  db 2
  db $46, $4D
random_room_14_entity_set_3:
  db 4
  db $46, $4D
  db $13, $4D
random_room_15: ; Water Room
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 26, $0C, $0D, $C4, $23, $1B, $C4, $24, $1B, $C4, $25, $1B, $C4, $26, $1B, $86, $32, $1B, $84, $33, $0E, $86, $42, $1B, $84, $43, $0E
  ; Variations
  db 3
  db $80
  dw random_room_15_variation_0
  db $80
  dw random_room_15_variation_1
  db $80
  dw random_room_15_variation_2
  ; Entity sets
  db 8
  db $00, $FF
  dw random_room_15_entity_set_0
  db $00, $06
  dw random_room_15_entity_set_1
  db $05, $05
  dw random_room_15_entity_set_2
  db $06, $FF
  dw random_room_15_entity_set_3
  db $00, $01
  dw random_room_15_entity_set_4
  db $02, $08
  dw random_room_15_entity_set_5
  db $07, $07
  dw random_room_15_entity_set_6
  db $08, $FF
  dw random_room_15_entity_set_7
random_room_15_variation_0:
  db 12, $51, $1B, $58, $1B, $61, $0E, $62, $1B, $67, $1B, $68, $0E
random_room_15_variation_1:
  db 12, $11, $0E, $12, $1B, $17, $1B, $18, $0E, $21, $1B, $28, $1B
random_room_15_variation_2:
  db 4, $34, $A6, $45, $A6
random_room_15_entity_set_0:
  db 4
  db $44, $CB
  db $36, $CB
random_room_15_entity_set_1:
  db 4
  db $54, $CC
  db $26, $CC
random_room_15_entity_set_2:
  db 8
  db $32, $99
  db $25, $99
  db $36, $99
  db $55, $99
random_room_15_entity_set_3:
  db 10
  db $32, $99
  db $25, $99
  db $36, $99
  db $55, $99
  db $44, $19
random_room_15_entity_set_4:
  db 6
  db $52, $C5
  db $57, $C5
  db $27, $C5
random_room_15_entity_set_5:
  db 8
  db $52, $C5
  db $57, $C5
  db $27, $C5
  db $22, $C5
random_room_15_entity_set_6:
  db 10
  db $53, $A0
  db $42, $A0
  db $26, $A0
  db $46, $CB
  db $33, $CB
random_room_15_entity_set_7:
  db 12
  db $53, $A0
  db $42, $A0
  db $26, $A0
  db $46, $CB
  db $33, $CB
  db $16, $A0
random_room_16: ; Treasure Block Push
  db $00, $00 ; allowed filter
  db $67 ; event
  ; Primary data
  db 10, $04, $0D, $28, $A1, $84, $33, $A7, $82, $34, $0F
  ; Variations
  db 4
  db $80
  dw random_room_16_variation_0
  db $80
  dw random_room_16_variation_1
  db $80
  dw random_room_16_variation_2
  db $80
  dw random_room_16_variation_3
  ; Entity sets
  db 4
  db $00, $FF
  dw random_room_16_entity_set_0
  db $03, $FF
  dw random_room_16_entity_set_1
  db $07, $07
  dw random_room_16_entity_set_2
  db $08, $FF
  dw random_room_16_entity_set_3
random_room_16_variation_0:
  db 6, $C2, $43, $A6, $C2, $46, $A6
random_room_16_variation_1:
  db 4, $18, $20, $61, $20
random_room_16_variation_2:
  db 6, $C2, $44, $DF, $C2, $45, $DF
random_room_16_variation_3:
  db 12, $C2, $11, $DF, $12, $DF, $17, $DF, $C2, $58, $DF, $67, $DF
random_room_16_entity_set_0:
  db 4
  db $23, $17
  db $26, $17
random_room_16_entity_set_1:
  db 6
  db $26, $17
  db $68, $17
  db $32, $16
random_room_16_entity_set_2:
  db 10
  db $44, $15
  db $24, $9B
  db $45, $9B
  db $25, $15
  db $22, $15
random_room_16_entity_set_3:
  db 12
  db $44, $15
  db $24, $9B
  db $45, $9B
  db $25, $15
  db $22, $15
  db $35, $15
random_room_17: ; Hole Filler Treasure
  db $00, $00 ; allowed filter
  db $6E ; event
  ; Primary data
  db 26, $04, $0D, $82, $22, $AF, $82, $26, $AF, $28, $A1, $32, $B0, $C2, $33, $01, $C2, $36, $01, $37, $B0, $84, $53, $B0, $82, $54, $AE
  ; Variations
  db 6
  db $80
  dw random_room_17_variation_0
  db $80
  dw random_room_17_variation_1
  db $80
  dw random_room_17_variation_2
  db $80
  dw random_room_17_variation_3
  db $80
  dw random_room_17_variation_4
  db $80
  dw random_room_17_variation_5
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_17_entity_set_0
random_room_17_variation_0:
  db 4, $24, $AF, $34, $B0
random_room_17_variation_1:
  db 4, $25, $AF, $35, $B0
random_room_17_variation_2:
  db 6, $82, $44, $AF, $82, $54, $B0
random_room_17_variation_3:
  db 5, $C2, $37, $01, $57, $B0
random_room_17_variation_4:
  db 8, $03, $C7, $06, $C7, $73, $C8, $76, $C8
random_room_17_variation_5:
  db 8, $20, $C9, $29, $CA, $50, $C9, $59, $CA
random_room_17_entity_set_0:
  db 2
  db $42, $B1
random_room_18: ; Corner UL
  db $0F, $0A ; allowed filter
  db $00 ; event
  ; Primary data
  db 72, $04, $0D, $83, $00, $03, $03, $25, $06, $26, $83, $07, $03, $82, $10, $03, $12, $25, $13, $29, $16, $2A, $17, $21, $18, $26, $C2, $19, $03, $20, $25, $21, $21, $22, $29, $28, $24, $85, $35, $2C, $36, $97, $37, $22, $38, $28, $45, $24, $50, $27, $84, $51, $22, $52, $97, $55, $28, $60, $2C, $61, $2B, $68, $2C, $69, $28, $70, $24, $71, $27, $78, $28, $79, $03
  ; Variations
  db 3
  db $80
  dw random_room_18_variation_0
  db $80
  dw random_room_18_variation_1
  db $80
  dw random_room_18_variation_2
  ; Entity sets
  db 9
  db $00, $01
  dw random_room_18_entity_set_0
  db $02, $05
  dw random_room_18_entity_set_1
  db $06, $06
  dw random_room_18_entity_set_2
  db $03, $05
  dw random_room_18_entity_set_3
  db $06, $FF
  dw random_room_18_entity_set_4
  db $03, $05
  dw random_room_18_entity_set_5
  db $06, $FF
  dw random_room_18_entity_set_6
  db $07, $07
  dw random_room_18_entity_set_7
  db $08, $FF
  dw random_room_18_entity_set_8
random_room_18_variation_0:
  db 2, $24, $A9
random_room_18_variation_1:
  db 4, $23, $AB, $67, $AB
random_room_18_variation_2:
  db 9, $C2, $33, $DF, $C2, $34, $DF, $82, $47, $DF
random_room_18_entity_set_0:
  db 6
  db $58, $A1
  db $63, $A1
  db $27, $16
random_room_18_entity_set_1:
  db 8
  db $58, $A1
  db $63, $A1
  db $27, $16
  db $32, $A1
random_room_18_entity_set_2:
  db 10
  db $58, $A1
  db $63, $A1
  db $27, $16
  db $32, $A1
  db $44, $A1
random_room_18_entity_set_3:
  db 4
  db $57, $12
  db $33, $12
random_room_18_entity_set_4:
  db 8
  db $57, $12
  db $33, $12
  db $43, $12
  db $34, $12
random_room_18_entity_set_5:
  db 4
  db $34, $BA
  db $26, $BA
random_room_18_entity_set_6:
  db 8
  db $34, $BA
  db $26, $BA
  db $32, $BA
  db $27, $BA
random_room_18_entity_set_7:
  db 10
  db $57, $12
  db $58, $A1
  db $63, $A1
  db $33, $A1
  db $25, $A1
random_room_18_entity_set_8:
  db 12
  db $57, $12
  db $58, $A1
  db $63, $A1
  db $33, $A1
  db $25, $A1
  db $26, $12
random_room_19: ; Pick One
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 47, $04, $0D, $00, $03, $01, $25, $03, $C7, $06, $C7, $08, $26, $09, $03, $10, $25, $11, $29, $18, $2A, $19, $26, $86, $22, $0F, $86, $32, $0F, $86, $42, $0F, $60, $27, $61, $2B, $68, $2C, $69, $28, $70, $03, $71, $27, $78, $28, $79, $03
  ; Variations
  db 3
  db $80
  dw random_room_19_variation_0
  db $80
  dw random_room_19_variation_1
  db $80
  dw random_room_19_variation_2
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_19_entity_set_0
random_room_19_variation_0:
  db 4, $12, $AC, $17, $AC
random_room_19_variation_1:
  db 4, $52, $C0, $57, $C0
random_room_19_variation_2:
  db 6, $82, $62, $AF, $82, $66, $AF
random_room_19_entity_set_0:
  db 2
  db $24, $F6
random_room_20: ; Village Empty
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 18, $04, $0D, $03, $C7, $06, $C7, $20, $C9, $29, $CA, $50, $C9, $59, $CA, $73, $C8, $76, $C8
  ; Variations
  db 0
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_20_entity_set_0
random_room_20_entity_set_0:
  db 0
random_room_21: ; Villager
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 10, $04, $0D, $22, $AC, $27, $AC, $52, $AC, $57, $AC
  ; Variations
  db 0
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_21_entity_set_0
random_room_21_entity_set_0:
  db 2
  db $34, $4D
random_room_22: ; Village Exit
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 7, $04, $0D, $E1, $00, $FF, $58, $52
  ; Variations
  db 0
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_22_entity_set_0
random_room_22_entity_set_0:
  db 2
  db $00, $E7
random_room_23: ; Village Shop
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 11, $04, $0D, $85, $22, $00, $85, $32, $00, $85, $42, $00
  ; Variations
  db 0
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_23_entity_set_0
random_room_23_entity_set_0:
  db 2
  db $24, $4D
random_room_24: ; Village Treasure
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 6, $04, $0D, $12, $A0, $22, $0F
  ; Variations
  db 0
  ; Entity sets
  db 1
  db $00, $FF
  dw random_room_24_entity_set_0
random_room_24_entity_set_0:
  db 0
random_room_25: ; Exit Genie
  db $00, $00 ; allowed filter
  db $21 ; event
  ; Primary data
  db 11, $04, $0D, $11, $AC, $18, $AC, $E1, $00, $FF, $58, $52
  ; Variations
  db 0
  ; Entity sets
  db 1
  db $07, $FF
  dw random_room_25_entity_set_0
random_room_25_entity_set_0:
  db 4
  db $24, $5C
  db $00, $E7
random_room_26: ; Lava Moat
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 22, $06, $0D, $82, $22, $06, $82, $26, $06, $32, $06, $37, $06, $42, $06, $47, $06, $82, $52, $06, $82, $56, $06
  ; Variations
  db 0
  ; Entity sets
  db 10
  db $00, $01
  dw random_room_26_entity_set_0
  db $02, $04
  dw random_room_26_entity_set_1
  db $00, $04
  dw random_room_26_entity_set_2
  db $03, $05
  dw random_room_26_entity_set_3
  db $06, $08
  dw random_room_26_entity_set_4
  db $03, $05
  dw random_room_26_entity_set_5
  db $06, $08
  dw random_room_26_entity_set_6
  db $07, $07
  dw random_room_26_entity_set_7
  db $08, $FF
  dw random_room_26_entity_set_8
  db $09, $FF
  dw random_room_26_entity_set_9
random_room_26_entity_set_0:
  db 6
  db $12, $9B
  db $16, $9B
  db $34, $1B
random_room_26_entity_set_1:
  db 8
  db $12, $9B
  db $16, $9B
  db $36, $9B
  db $34, $1B
random_room_26_entity_set_2:
  db 6
  db $28, $A1
  db $18, $A1
  db $24, $A1
random_room_26_entity_set_3:
  db 6
  db $16, $14
  db $36, $14
  db $11, $14
random_room_26_entity_set_4:
  db 10
  db $16, $14
  db $36, $14
  db $11, $14
  db $17, $14
  db $58, $19
random_room_26_entity_set_5:
  db 6
  db $51, $1A
  db $34, $1A
  db $35, $1A
random_room_26_entity_set_6:
  db 10
  db $51, $1A
  db $34, $1A
  db $35, $1A
  db $33, $1A
  db $61, $19
random_room_26_entity_set_7:
  db 10
  db $62, $1A
  db $58, $1A
  db $24, $1E
  db $18, $1A
  db $21, $1A
random_room_26_entity_set_8:
  db 12
  db $62, $1A
  db $58, $1A
  db $24, $1E
  db $18, $1A
  db $21, $1A
  db $11, $1E
random_room_26_entity_set_9:
  db 12
  db $17, $8F
  db $66, $8F
  db $18, $B9
  db $61, $8F
  db $12, $8F
  db $16, $B9
random_room_27: ; Spike Stripes
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 8, $04, $0D, $86, $22, $D4, $86, $52, $D4
  ; Variations
  db 0
  ; Entity sets
  db 9
  db $00, $04
  dw random_room_27_entity_set_0
  db $00, $01
  dw random_room_27_entity_set_1
  db $02, $04
  dw random_room_27_entity_set_2
  db $03, $05
  dw random_room_27_entity_set_3
  db $06, $08
  dw random_room_27_entity_set_4
  db $03, $05
  dw random_room_27_entity_set_5
  db $06, $08
  dw random_room_27_entity_set_6
  db $07, $FF
  dw random_room_27_entity_set_7
  db $09, $FF
  dw random_room_27_entity_set_8
random_room_27_entity_set_0:
  db 6
  db $46, $A1
  db $44, $A1
  db $63, $A1
random_room_27_entity_set_1:
  db 6
  db $62, $19
  db $12, $19
  db $63, $19
random_room_27_entity_set_2:
  db 8
  db $62, $19
  db $12, $19
  db $63, $19
  db $61, $19
random_room_27_entity_set_3:
  db 6
  db $17, $1A
  db $32, $1A
  db $33, $1A
random_room_27_entity_set_4:
  db 10
  db $17, $1A
  db $32, $1A
  db $33, $1A
  db $43, $1A
  db $61, $19
random_room_27_entity_set_5:
  db 6
  db $63, $18
  db $43, $18
  db $66, $18
random_room_27_entity_set_6:
  db 10
  db $63, $18
  db $43, $18
  db $66, $18
  db $18, $18
  db $34, $19
random_room_27_entity_set_7:
  db 10
  db $42, $1F
  db $17, $1F
  db $13, $1F
  db $28, $1F
  db $63, $19
random_room_27_entity_set_8:
  db 12
  db $11, $8F
  db $43, $8F
  db $28, $B9
  db $51, $8F
  db $63, $8F
  db $34, $B9
random_room_28: ; Conveyor Belts
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 26, $07, $0D, $83, $11, $D2, $83, $16, $D1, $88, $21, $D1, $86, $32, $D2, $86, $42, $D1, $88, $51, $D2, $83, $61, $D1, $83, $66, $D2
  ; Variations
  db 0
  ; Entity sets
  db 6
  db $00, $04
  dw random_room_28_entity_set_0
  db $00, $04
  dw random_room_28_entity_set_1
  db $03, $08
  dw random_room_28_entity_set_2
  db $03, $08
  dw random_room_28_entity_set_3
  db $07, $FF
  dw random_room_28_entity_set_4
  db $09, $FF
  dw random_room_28_entity_set_5
random_room_28_entity_set_0:
  db 4
  db $35, $A1
  db $18, $A1
random_room_28_entity_set_1:
  db 6
  db $68, $9B
  db $12, $9B
  db $18, $9B
random_room_28_entity_set_2:
  db 4
  db $44, $29
  db $66, $29
random_room_28_entity_set_3:
  db 4
  db $12, $18
  db $35, $18
random_room_28_entity_set_4:
  db 6
  db $12, $1A
  db $18, $1A
  db $44, $1E
random_room_28_entity_set_5:
  db 6
  db $33, $8F
  db $37, $8F
  db $68, $B9
random_room_29: ; Statue Garden
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 18, $04, $0D, $11, $C0, $18, $C0, $23, $C0, $26, $C0, $53, $C0, $56, $C0, $61, $C0, $68, $C0
  ; Variations
  db 0
  ; Entity sets
  db 10
  db $00, $01
  dw random_room_29_entity_set_0
  db $02, $04
  dw random_room_29_entity_set_1
  db $00, $04
  dw random_room_29_entity_set_2
  db $03, $05
  dw random_room_29_entity_set_3
  db $06, $08
  dw random_room_29_entity_set_4
  db $03, $05
  dw random_room_29_entity_set_5
  db $06, $08
  dw random_room_29_entity_set_6
  db $07, $07
  dw random_room_29_entity_set_7
  db $08, $FF
  dw random_room_29_entity_set_8
  db $09, $FF
  dw random_room_29_entity_set_9
random_room_29_entity_set_0:
  db 6
  db $35, $19
  db $16, $19
  db $51, $19
random_room_29_entity_set_1:
  db 8
  db $35, $19
  db $16, $19
  db $51, $19
  db $22, $19
random_room_29_entity_set_2:
  db 6
  db $57, $0B
  db $47, $0B
  db $62, $0B
random_room_29_entity_set_3:
  db 6
  db $52, $1A
  db $37, $1A
  db $32, $1A
random_room_29_entity_set_4:
  db 10
  db $52, $1A
  db $37, $1A
  db $32, $1A
  db $27, $1A
  db $35, $19
random_room_29_entity_set_5:
  db 6
  db $24, $18
  db $43, $18
  db $42, $18
random_room_29_entity_set_6:
  db 10
  db $24, $18
  db $43, $18
  db $42, $18
  db $12, $18
  db $47, $19
random_room_29_entity_set_7:
  db 10
  db $44, $14
  db $57, $14
  db $21, $14
  db $47, $14
  db $63, $19
random_room_29_entity_set_8:
  db 12
  db $44, $14
  db $57, $14
  db $21, $14
  db $47, $14
  db $63, $19
  db $45, $19
random_room_29_entity_set_9:
  db 12
  db $66, $8F
  db $67, $8F
  db $17, $B9
  db $16, $8F
  db $46, $8F
  db $43, $B9
random_room_30: ; Pot Chamber
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 22, $04, $0D, $82, $11, $20, $82, $17, $20, $21, $20, $28, $20, $51, $20, $58, $20, $82, $61, $20, $82, $67, $20
  ; Variations
  db 0
  ; Entity sets
  db 11
  db $00, $01
  dw random_room_30_entity_set_0
  db $02, $04
  dw random_room_30_entity_set_1
  db $00, $01
  dw random_room_30_entity_set_2
  db $02, $04
  dw random_room_30_entity_set_3
  db $03, $05
  dw random_room_30_entity_set_4
  db $06, $08
  dw random_room_30_entity_set_5
  db $03, $05
  dw random_room_30_entity_set_6
  db $06, $08
  dw random_room_30_entity_set_7
  db $07, $07
  dw random_room_30_entity_set_8
  db $08, $FF
  dw random_room_30_entity_set_9
  db $09, $FF
  dw random_room_30_entity_set_10
random_room_30_entity_set_0:
  db 6
  db $47, $19
  db $42, $19
  db $22, $19
random_room_30_entity_set_1:
  db 8
  db $47, $19
  db $42, $19
  db $22, $19
  db $44, $19
random_room_30_entity_set_2:
  db 6
  db $54, $9B
  db $53, $9B
  db $26, $1B
random_room_30_entity_set_3:
  db 8
  db $54, $9B
  db $53, $9B
  db $24, $9B
  db $26, $1B
random_room_30_entity_set_4:
  db 6
  db $42, $18
  db $55, $18
  db $47, $18
random_room_30_entity_set_5:
  db 10
  db $42, $18
  db $55, $18
  db $47, $18
  db $34, $18
  db $53, $19
random_room_30_entity_set_6:
  db 6
  db $36, $1A
  db $34, $1A
  db $42, $1A
random_room_30_entity_set_7:
  db 10
  db $36, $1A
  db $34, $1A
  db $42, $1A
  db $35, $1A
  db $56, $19
random_room_30_entity_set_8:
  db 10
  db $63, $14
  db $47, $14
  db $25, $14
  db $43, $14
  db $42, $19
random_room_30_entity_set_9:
  db 12
  db $63, $14
  db $47, $14
  db $25, $14
  db $43, $14
  db $42, $19
  db $33, $19
random_room_30_entity_set_10:
  db 12
  db $47, $8F
  db $22, $8F
  db $42, $B9
  db $13, $8F
  db $54, $8F
  db $23, $B9
random_room_31: ; Water Corners
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 30, $0C, $0D, $82, $11, $0E, $82, $17, $0E, $21, $0E, $22, $1B, $27, $1B, $28, $0E, $51, $0E, $52, $1B, $57, $1B, $58, $0E, $82, $61, $0E, $82, $67, $0E
  ; Variations
  db 0
  ; Entity sets
  db 10
  db $00, $01
  dw random_room_31_entity_set_0
  db $02, $04
  dw random_room_31_entity_set_1
  db $00, $04
  dw random_room_31_entity_set_2
  db $03, $05
  dw random_room_31_entity_set_3
  db $06, $08
  dw random_room_31_entity_set_4
  db $03, $05
  dw random_room_31_entity_set_5
  db $06, $08
  dw random_room_31_entity_set_6
  db $07, $07
  dw random_room_31_entity_set_7
  db $08, $FF
  dw random_room_31_entity_set_8
  db $09, $FF
  dw random_room_31_entity_set_9
random_room_31_entity_set_0:
  db 6
  db $56, $19
  db $43, $19
  db $13, $19
random_room_31_entity_set_1:
  db 8
  db $56, $19
  db $43, $19
  db $13, $19
  db $24, $19
random_room_31_entity_set_2:
  db 6
  db $43, $A1
  db $35, $A1
  db $47, $A1
random_room_31_entity_set_3:
  db 6
  db $37, $14
  db $55, $14
  db $35, $14
random_room_31_entity_set_4:
  db 10
  db $37, $14
  db $55, $14
  db $35, $14
  db $44, $14
  db $47, $19
random_room_31_entity_set_5:
  db 6
  db $26, $1A
  db $35, $1A
  db $66, $1A
random_room_31_entity_set_6:
  db 10
  db $26, $1A
  db $35, $1A
  db $66, $1A
  db $47, $1A
  db $36, $19
random_room_31_entity_set_7:
  db 10
  db $13, $A0
  db $16, $A0
  db $42, $0B
  db $44, $A0
  db $25, $A0
random_room_31_entity_set_8:
  db 12
  db $13, $A0
  db $16, $A0
  db $42, $0B
  db $44, $A0
  db $25, $A0
  db $56, $0B
random_room_31_entity_set_9:
  db 12
  db $34, $8F
  db $46, $8F
  db $13, $B9
  db $36, $8F
  db $54, $8F
  db $33, $B9
random_room_32: ; Lava Island Treasure
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 21, $06, $0D, $86, $22, $06, $32, $06, $34, $A0, $37, $06, $42, $06, $47, $06, $83, $52, $06, $82, $56, $06
  ; Variations
  db 0
  ; Entity sets
  db 5
  db $00, $02
  dw random_room_32_entity_set_0
  db $02, $05
  dw random_room_32_entity_set_1
  db $06, $06
  dw random_room_32_entity_set_2
  db $05, $05
  dw random_room_32_entity_set_3
  db $06, $FF
  dw random_room_32_entity_set_4
random_room_32_entity_set_0:
  db 0
random_room_32_entity_set_1:
  db 6
  db $62, $0B
  db $12, $0B
  db $55, $0B
random_room_32_entity_set_2:
  db 10
  db $62, $0B
  db $12, $0B
  db $55, $0B
  db $18, $0B
  db $11, $19
random_room_32_entity_set_3:
  db 6
  db $36, $14
  db $43, $14
  db $21, $14
random_room_32_entity_set_4:
  db 10
  db $36, $14
  db $43, $14
  db $21, $14
  db $58, $14
  db $63, $19
random_room_33: ; Spike Treasure
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 21, $04, $0D, $86, $22, $D4, $32, $D4, $34, $A0, $37, $D4, $42, $D4, $47, $D4, $83, $52, $D4, $82, $56, $D4
  ; Variations
  db 0
  ; Entity sets
  db 6
  db $00, $02
  dw random_room_33_entity_set_0
  db $02, $05
  dw random_room_33_entity_set_1
  db $06, $06
  dw random_room_33_entity_set_2
  db $05, $05
  dw random_room_33_entity_set_3
  db $06, $07
  dw random_room_33_entity_set_4
  db $08, $FF
  dw random_room_33_entity_set_5
random_room_33_entity_set_0:
  db 0
random_room_33_entity_set_1:
  db 6
  db $61, $0B
  db $44, $0B
  db $28, $0B
random_room_33_entity_set_2:
  db 10
  db $61, $0B
  db $44, $0B
  db $28, $0B
  db $43, $0B
  db $16, $19
random_room_33_entity_set_3:
  db 8
  db $21, $1A
  db $11, $1A
  db $28, $1E
  db $67, $1A
random_room_33_entity_set_4:
  db 10
  db $21, $1A
  db $11, $1A
  db $28, $1E
  db $67, $1A
  db $55, $1A
random_room_33_entity_set_5:
  db 12
  db $21, $1A
  db $11, $1A
  db $28, $1E
  db $67, $1A
  db $55, $1A
  db $43, $1E
random_room_34: ; Lava River
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 16, $06, $0D, $82, $16, $06, $82, $25, $06, $34, $06, $82, $53, $06, $82, $61, $06
  ; Variations
  db 0
  ; Entity sets
  db 11
  db $00, $01
  dw random_room_34_entity_set_0
  db $02, $04
  dw random_room_34_entity_set_1
  db $00, $01
  dw random_room_34_entity_set_2
  db $02, $04
  dw random_room_34_entity_set_3
  db $03, $05
  dw random_room_34_entity_set_4
  db $06, $08
  dw random_room_34_entity_set_5
  db $03, $05
  dw random_room_34_entity_set_6
  db $06, $08
  dw random_room_34_entity_set_7
  db $07, $07
  dw random_room_34_entity_set_8
  db $08, $FF
  dw random_room_34_entity_set_9
  db $09, $FF
  dw random_room_34_entity_set_10
random_room_34_entity_set_0:
  db 6
  db $35, $19
  db $56, $19
  db $45, $19
random_room_34_entity_set_1:
  db 8
  db $35, $19
  db $56, $19
  db $45, $19
  db $36, $19
random_room_34_entity_set_2:
  db 6
  db $23, $9B
  db $51, $9B
  db $55, $1B
random_room_34_entity_set_3:
  db 8
  db $23, $9B
  db $51, $9B
  db $36, $9B
  db $55, $1B
random_room_34_entity_set_4:
  db 6
  db $11, $18
  db $33, $18
  db $24, $18
random_room_34_entity_set_5:
  db 10
  db $11, $18
  db $33, $18
  db $24, $18
  db $68, $18
  db $56, $19
random_room_34_entity_set_6:
  db 6
  db $37, $1A
  db $44, $1A
  db $57, $1A
random_room_34_entity_set_7:
  db 10
  db $37, $1A
  db $44, $1A
  db $57, $1A
  db $24, $1A
  db $11, $19
random_room_34_entity_set_8:
  db 10
  db $12, $1A
  db $18, $1A
  db $32, $1E
  db $27, $1A
  db $47, $1A
random_room_34_entity_set_9:
  db 12
  db $12, $1A
  db $18, $1A
  db $32, $1E
  db $27, $1A
  db $47, $1A
  db $52, $1E
random_room_34_entity_set_10:
  db 12
  db $51, $14
  db $44, $14
  db $57, $14
  db $37, $14
  db $63, $19
  db $43, $19
random_room_35: ; Corner Rubble
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 14, $04, $0D, $83, $11, $A6, $82, $21, $A6, $82, $57, $20, $83, $66, $20
  ; Variations
  db 0
  ; Entity sets
  db 10
  db $00, $04
  dw random_room_35_entity_set_0
  db $00, $01
  dw random_room_35_entity_set_1
  db $02, $04
  dw random_room_35_entity_set_2
  db $03, $05
  dw random_room_35_entity_set_3
  db $06, $08
  dw random_room_35_entity_set_4
  db $03, $05
  dw random_room_35_entity_set_5
  db $06, $08
  dw random_room_35_entity_set_6
  db $07, $07
  dw random_room_35_entity_set_7
  db $08, $FF
  dw random_room_35_entity_set_8
  db $09, $FF
  dw random_room_35_entity_set_9
random_room_35_entity_set_0:
  db 6
  db $43, $0B
  db $46, $0B
  db $63, $0B
random_room_35_entity_set_1:
  db 6
  db $24, $9B
  db $37, $9B
  db $33, $1B
random_room_35_entity_set_2:
  db 8
  db $24, $9B
  db $37, $9B
  db $61, $9B
  db $33, $1B
random_room_35_entity_set_3:
  db 6
  db $52, $29
  db $23, $29
  db $25, $29
random_room_35_entity_set_4:
  db 10
  db $52, $29
  db $23, $29
  db $25, $29
  db $32, $29
  db $46, $19
random_room_35_entity_set_5:
  db 6
  db $42, $14
  db $35, $14
  db $47, $14
random_room_35_entity_set_6:
  db 10
  db $42, $14
  db $35, $14
  db $47, $14
  db $17, $14
  db $28, $19
random_room_35_entity_set_7:
  db 10
  db $33, $14
  db $42, $14
  db $23, $14
  db $16, $14
  db $54, $19
random_room_35_entity_set_8:
  db 12
  db $33, $14
  db $42, $14
  db $23, $14
  db $16, $14
  db $54, $19
  db $37, $19
random_room_35_entity_set_9:
  db 12
  db $16, $1F
  db $52, $1F
  db $42, $1A
  db $27, $1A
  db $28, $1F
  db $37, $1F
random_room_36: ; Pit Field
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 18, $04, $0D, $83, $22, $AF, $27, $AE, $83, $32, $B0, $82, $46, $AF, $52, $AE, $82, $56, $B0
  ; Variations
  db 0
  ; Entity sets
  db 10
  db $00, $01
  dw random_room_36_entity_set_0
  db $02, $04
  dw random_room_36_entity_set_1
  db $00, $04
  dw random_room_36_entity_set_2
  db $03, $05
  dw random_room_36_entity_set_3
  db $06, $08
  dw random_room_36_entity_set_4
  db $03, $05
  dw random_room_36_entity_set_5
  db $06, $08
  dw random_room_36_entity_set_6
  db $07, $07
  dw random_room_36_entity_set_7
  db $08, $FF
  dw random_room_36_entity_set_8
  db $09, $FF
  dw random_room_36_entity_set_9
random_room_36_entity_set_0:
  db 6
  db $61, $19
  db $12, $19
  db $62, $19
random_room_36_entity_set_1:
  db 8
  db $61, $19
  db $12, $19
  db $62, $19
  db $16, $19
random_room_36_entity_set_2:
  db 6
  db $16, $A1
  db $26, $A1
  db $37, $A1
random_room_36_entity_set_3:
  db 6
  db $36, $14
  db $67, $14
  db $35, $14
random_room_36_entity_set_4:
  db 10
  db $36, $14
  db $67, $14
  db $35, $14
  db $58, $14
  db $11, $19
random_room_36_entity_set_5:
  db 6
  db $26, $29
  db $62, $29
  db $55, $29
random_room_36_entity_set_6:
  db 10
  db $26, $29
  db $62, $29
  db $55, $29
  db $42, $29
  db $44, $19
random_room_36_entity_set_7:
  db 10
  db $35, $A0
  db $68, $A0
  db $17, $0B
  db $11, $A0
  db $36, $A0
random_room_36_entity_set_8:
  db 12
  db $35, $A0
  db $68, $A0
  db $17, $0B
  db $11, $A0
  db $36, $A0
  db $54, $0B
random_room_36_entity_set_9:
  db 12
  db $53, $14
  db $43, $14
  db $21, $14
  db $66, $14
  db $44, $19
  db $62, $19
random_room_37: ; Pond
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 28, $0C, $0D, $83, $11, $1B, $21, $1B, $82, $22, $0E, $24, $1B, $31, $1B, $82, $32, $0E, $34, $1B, $37, $C0, $82, $42, $1B, $57, $C0, $63, $C0
  ; Variations
  db 0
  ; Entity sets
  db 11
  db $00, $01
  dw random_room_37_entity_set_0
  db $02, $04
  dw random_room_37_entity_set_1
  db $00, $01
  dw random_room_37_entity_set_2
  db $02, $04
  dw random_room_37_entity_set_3
  db $03, $05
  dw random_room_37_entity_set_4
  db $06, $08
  dw random_room_37_entity_set_5
  db $03, $05
  dw random_room_37_entity_set_6
  db $06, $08
  dw random_room_37_entity_set_7
  db $07, $07
  dw random_room_37_entity_set_8
  db $08, $FF
  dw random_room_37_entity_set_9
  db $09, $FF
  dw random_room_37_entity_set_10
random_room_37_entity_set_0:
  db 6
  db $45, $19
  db $35, $19
  db $52, $19
random_room_37_entity_set_1:
  db 8
  db $45, $19
  db $35, $19
  db $52, $19
  db $18, $19
random_room_37_entity_set_2:
  db 6
  db $67, $9B
  db $55, $9B
  db $16, $1B
random_room_37_entity_set_3:
  db 8
  db $67, $9B
  db $55, $9B
  db $46, $9B
  db $16, $1B
random_room_37_entity_set_4:
  db 6
  db $62, $29
  db $27, $29
  db $25, $29
random_room_37_entity_set_5:
  db 10
  db $62, $29
  db $27, $29
  db $25, $29
  db $46, $29
  db $55, $19
random_room_37_entity_set_6:
  db 6
  db $28, $18
  db $67, $18
  db $47, $18
random_room_37_entity_set_7:
  db 10
  db $28, $18
  db $67, $18
  db $47, $18
  db $62, $18
  db $17, $19
random_room_37_entity_set_8:
  db 10
  db $17, $A0
  db $18, $A0
  db $35, $0B
  db $27, $A0
  db $36, $A0
random_room_37_entity_set_9:
  db 12
  db $17, $A0
  db $18, $A0
  db $35, $0B
  db $27, $A0
  db $36, $A0
  db $61, $0B
random_room_37_entity_set_10:
  db 12
  db $35, $14
  db $61, $14
  db $45, $14
  db $58, $14
  db $62, $19
  db $67, $19
random_room_38: ; Spike Corners
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 18, $04, $0D, $83, $11, $D4, $83, $21, $D4, $25, $A6, $54, $A6, $83, $56, $D4, $83, $66, $D4
  ; Variations
  db 0
  ; Entity sets
  db 9
  db $00, $04
  dw random_room_38_entity_set_0
  db $00, $04
  dw random_room_38_entity_set_1
  db $03, $05
  dw random_room_38_entity_set_2
  db $06, $08
  dw random_room_38_entity_set_3
  db $03, $05
  dw random_room_38_entity_set_4
  db $06, $08
  dw random_room_38_entity_set_5
  db $07, $07
  dw random_room_38_entity_set_6
  db $08, $FF
  dw random_room_38_entity_set_7
  db $09, $FF
  dw random_room_38_entity_set_8
random_room_38_entity_set_0:
  db 6
  db $45, $A1
  db $51, $A1
  db $28, $A1
random_room_38_entity_set_1:
  db 6
  db $28, $0B
  db $26, $0B
  db $42, $0B
random_room_38_entity_set_2:
  db 6
  db $37, $14
  db $18, $14
  db $28, $14
random_room_38_entity_set_3:
  db 10
  db $37, $14
  db $18, $14
  db $28, $14
  db $53, $14
  db $34, $19
random_room_38_entity_set_4:
  db 6
  db $33, $18
  db $32, $18
  db $16, $18
random_room_38_entity_set_5:
  db 10
  db $33, $18
  db $32, $18
  db $16, $18
  db $55, $18
  db $53, $19
random_room_38_entity_set_6:
  db 10
  db $26, $14
  db $37, $14
  db $61, $14
  db $43, $14
  db $16, $19
random_room_38_entity_set_7:
  db 12
  db $26, $14
  db $37, $14
  db $61, $14
  db $43, $14
  db $16, $19
  db $27, $19
random_room_38_entity_set_8:
  db 12
  db $43, $1F
  db $62, $1F
  db $52, $1A
  db $45, $1A
  db $33, $1F
  db $24, $1F
random_room_39: ; Block Maze
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 23, $04, $0D, $13, $A6, $82, $22, $A6, $82, $26, $A6, $36, $A6, $43, $A6, $82, $52, $A6, $55, $A6, $57, $A6, $63, $A6
  ; Variations
  db 0
  ; Entity sets
  db 11
  db $00, $01
  dw random_room_39_entity_set_0
  db $02, $04
  dw random_room_39_entity_set_1
  db $00, $01
  dw random_room_39_entity_set_2
  db $02, $04
  dw random_room_39_entity_set_3
  db $03, $05
  dw random_room_39_entity_set_4
  db $06, $08
  dw random_room_39_entity_set_5
  db $03, $05
  dw random_room_39_entity_set_6
  db $06, $08
  dw random_room_39_entity_set_7
  db $07, $07
  dw random_room_39_entity_set_8
  db $08, $FF
  dw random_room_39_entity_set_9
  db $09, $FF
  dw random_room_39_entity_set_10
random_room_39_entity_set_0:
  db 6
  db $58, $19
  db $18, $19
  db $21, $19
random_room_39_entity_set_1:
  db 8
  db $58, $19
  db $18, $19
  db $21, $19
  db $66, $19
random_room_39_entity_set_2:
  db 6
  db $25, $9B
  db $45, $9B
  db $32, $1B
random_room_39_entity_set_3:
  db 8
  db $25, $9B
  db $45, $9B
  db $11, $9B
  db $32, $1B
random_room_39_entity_set_4:
  db 6
  db $17, $18
  db $42, $18
  db $45, $18
random_room_39_entity_set_5:
  db 10
  db $17, $18
  db $42, $18
  db $45, $18
  db $34, $18
  db $12, $19
random_room_39_entity_set_6:
  db 6
  db $21, $1A
  db $42, $1A
  db $46, $1A
random_room_39_entity_set_7:
  db 10
  db $21, $1A
  db $42, $1A
  db $46, $1A
  db $35, $1A
  db $16, $19
random_room_39_entity_set_8:
  db 10
  db $21, $A0
  db $61, $A0
  db $56, $0B
  db $62, $A0
  db $47, $A0
random_room_39_entity_set_9:
  db 12
  db $21, $A0
  db $61, $A0
  db $56, $0B
  db $62, $A0
  db $47, $A0
  db $37, $0B
random_room_39_entity_set_10:
  db 12
  db $17, $8F
  db $32, $8F
  db $46, $B9
  db $42, $8F
  db $34, $8F
  db $51, $B9
random_room_40: ; Peninsula
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 21, $04, $0D, $22, $AF, $83, $23, $AE, $26, $AF, $32, $01, $36, $01, $42, $01, $44, $C0, $46, $B0, $52, $B0
  ; Variations
  db 0
  ; Entity sets
  db 10
  db $00, $01
  dw random_room_40_entity_set_0
  db $02, $04
  dw random_room_40_entity_set_1
  db $00, $04
  dw random_room_40_entity_set_2
  db $03, $05
  dw random_room_40_entity_set_3
  db $06, $08
  dw random_room_40_entity_set_4
  db $03, $05
  dw random_room_40_entity_set_5
  db $06, $08
  dw random_room_40_entity_set_6
  db $07, $07
  dw random_room_40_entity_set_7
  db $08, $FF
  dw random_room_40_entity_set_8
  db $09, $FF
  dw random_room_40_entity_set_9
random_room_40_entity_set_0:
  db 6
  db $34, $9B
  db $43, $9B
  db $13, $1B
random_room_40_entity_set_1:
  db 8
  db $34, $9B
  db $43, $9B
  db $27, $9B
  db $13, $1B
random_room_40_entity_set_2:
  db 6
  db $67, $A1
  db $16, $A1
  db $62, $A1
random_room_40_entity_set_3:
  db 6
  db $12, $18
  db $68, $18
  db $45, $18
random_room_40_entity_set_4:
  db 10
  db $12, $18
  db $68, $18
  db $45, $18
  db $54, $18
  db $17, $19
random_room_40_entity_set_5:
  db 6
  db $63, $29
  db $54, $29
  db $13, $29
random_room_40_entity_set_6:
  db 10
  db $63, $29
  db $54, $29
  db $13, $29
  db $45, $29
  db $61, $19
random_room_40_entity_set_7:
  db 10
  db $16, $14
  db $13, $14
  db $35, $14
  db $43, $14
  db $57, $19
random_room_40_entity_set_8:
  db 12
  db $16, $14
  db $13, $14
  db $35, $14
  db $43, $14
  db $57, $19
  db $18, $19
random_room_40_entity_set_9:
  db 12
  db $55, $14
  db $33, $14
  db $62, $14
  db $11, $14
  db $13, $19
  db $53, $19
random_room_41: ; Conveyor Chaos
  db $00, $00 ; allowed filter
  db $00 ; event
  ; Primary data
  db 80, $07, $0D, $11, $CF, $12, $D1, $13, $CF, $82, $16, $D2, $18, $CF, $21, $D2, $22, $D0, $23, $D2, $24, $D0, $25, $CF, $26, $D0, $27, $D1, $28, $CF, $32, $D0, $33, $CF, $82, $34, $D2, $36, $D0, $37, $CF, $42, $D2, $43, $D0, $44, $D1, $45, $CF, $46, $D2, $47, $D0, $51, $D0, $52, $D1, $53, $CF, $54, $D0, $55, $D2, $56, $CF, $57, $D1, $58, $CF, $61, $D0, $62, $D2, $63, $D0, $66, $D1, $67, $D0, $68, $D2
  ; Variations
  db 0
  ; Entity sets
  db 6
  db $00, $04
  dw random_room_41_entity_set_0
  db $00, $04
  dw random_room_41_entity_set_1
  db $03, $08
  dw random_room_41_entity_set_2
  db $03, $08
  dw random_room_41_entity_set_3
  db $07, $FF
  dw random_room_41_entity_set_4
  db $09, $FF
  dw random_room_41_entity_set_5
random_room_41_entity_set_0:
  db 4
  db $43, $A1
  db $63, $A1
random_room_41_entity_set_1:
  db 6
  db $13, $9B
  db $57, $9B
  db $18, $9B
random_room_41_entity_set_2:
  db 4
  db $18, $29
  db $58, $29
random_room_41_entity_set_3:
  db 4
  db $34, $1A
  db $28, $1A
random_room_41_entity_set_4:
  db 4
  db $13, $1F
  db $12, $1F
random_room_41_entity_set_5:
  db 8
  db $17, $14
  db $28, $14
  db $67, $14
  db $61, $14
}

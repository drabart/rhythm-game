INCLUDE "hardware.inc/hardware.inc"

SECTION "Arrows", ROM0

InitArrows::
    ; Create arrow sprites
    ; Tile indices and flags
    ld a, $C
    ld [OAMBuffer + 50], a
    ld [OAMBuffer + 54], a
    ld [OAMBuffer + 58], a
    ld [OAMBuffer + 62], a
    ld [OAMBuffer + 66], a
    ld [OAMBuffer + 70], a
    ld [OAMBuffer + 74], a
    ld [OAMBuffer + 78], a
    ld a, $24
    ld [OAMBuffer + 51], a
    ld [OAMBuffer + 59], a
    ld [OAMBuffer + 67], a
    ld [OAMBuffer + 75], a
    ld a, $4 
    ld [OAMBuffer + 55], a
    ld [OAMBuffer + 63], a
    ld [OAMBuffer + 71], a
    ld [OAMBuffer + 79], a
    ; Positions
    ld a, $87
    ld [OAMBuffer + 48], a
    ld [OAMBuffer + 52], a
    ld [OAMBuffer + 56], a
    ld [OAMBuffer + 60], a
    ld [OAMBuffer + 64], a
    ld [OAMBuffer + 68], a
    ld [OAMBuffer + 72], a
    ld [OAMBuffer + 76], a
    ld a, $28
    ld [OAMBuffer + 49], a
    ld a, $38
    ld [OAMBuffer + 53], a
    ld a, $40
    ld [OAMBuffer + 57], a
    ld a, $50
    ld [OAMBuffer + 61], a
    ld a, $58
    ld [OAMBuffer + 65], a
    ld a, $68
    ld [OAMBuffer + 69], a
    ld a, $70
    ld [OAMBuffer + 73], a
    ld a, $80
    ld [OAMBuffer + 77], a

    ret

ArrowPress::
    ld a, [wKeysDown]
    ld b, a
    and a, PADF_LEFT
    cp a, $0
    jp nz, .noLeft

    ld a, $28
    ld [OAMBuffer + 49], a
    ld a, $38
    ld [OAMBuffer + 53], a
    
    jp .noNoLeft
.noLeft

    ld a, $2A
    ld [OAMBuffer + 49], a
    ld a, $36
    ld [OAMBuffer + 53], a
.noNoLeft

    ld a, b
    and a, PADF_RIGHT
    cp a, $0
    jp nz, .noRight

    ld a, $40
    ld [OAMBuffer + 57], a
    ld a, $50
    ld [OAMBuffer + 61], a

    jp .noNoRight
.noRight

    ld a, $42
    ld [OAMBuffer + 57], a
    ld a, $4E
    ld [OAMBuffer + 61], a
.noNoRight
    
    ld a, b
    and a, PADF_B
    cp a, $0
    jp nz, .noB

    ld a, $58
    ld [OAMBuffer + 65], a
    ld a, $68
    ld [OAMBuffer + 69], a

    jp .noNoB
.noB

    ld a, $5A
    ld [OAMBuffer + 65], a
    ld a, $66
    ld [OAMBuffer + 69], a
.noNoB

    ld a, b
    and a, PADF_A
    cp a, $0
    jp nz, .noA

    ld a, $70
    ld [OAMBuffer + 73], a
    ld a, $80
    ld [OAMBuffer + 77], a

    jp .noNoA
.noA

    ld a, $72
    ld [OAMBuffer + 73], a
    ld a, $7E
    ld [OAMBuffer + 77], a
.noNoA
    ret
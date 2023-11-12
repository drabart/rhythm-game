INCLUDE "hardware.inc/hardware.inc"

SECTION "GameState", ROM0


GameState::

.loop
    call WaitForVBlank
    call UpdateKeys

    ld a, [rSCY]
    sub a, $1
    ld [rSCY], a

    ld b, a
    and a, $7
    cp a, $0
    push bc
    call z, NewNoteSpace
    pop bc

    ld a, b
    and a, $7
    cp a, $4
    call z, ClearOldSpace

    ; DMA OAMBuffer -> OAM
    ld a, $C0
    call hOAMDMA

    ; DEBUG ONLY spawn indicator on press
    ld a, [wKeysJustPressed]
    ld b, a
    and a, PADF_LEFT
    cp a, $0
    jp z, .noLeft

    ld c, $0
    ld d, $0
    call SetIndicator

.noLeft

    ld a, b
    and a, PADF_RIGHT
    cp a, $0
    jp z, .noRight

    ld c, $1
    ld d, $1
    call SetIndicator

.noRight
    
    ld a, b
    and a, PADF_B
    cp a, $0
    jp z, .noB

    ld c, $2
    ld d, $2
    call SetIndicator

.noB

    ld a, b
    and a, PADF_A
    cp a, $0
    jp z, .noA

    ld c, $3
    ld d, $3
    call SetIndicator

.noA

    call UpdateIndicators

    jp .loop

; @param b rSCY
NewNoteSpace::

    ld a, b

    and a, $18
    ret nz

    ld a, b
    sub a, $8

    ld h, $0
    ld l, a
    
    ; b is already 8 times too large...
    ; hl *= 32
    add hl, hl
    add hl, hl

    ld bc, $9804
    add hl, bc


    call Rng
    ld b, a

    ld a, b
    srl a
    srl a
    and a, $3
.inchl
    cp a, $0
    jp z, .inchlend
    dec a
    inc hl
    inc hl
    inc hl
    jp .inchl
.inchlend

    ld a, $4
    ld [hl+], a
    ld a, $5
    ld [hl+], a
    ld a, $4
    ld [hl+], a
    ret

ClearOldSpace::
    ld a, b
    add a, $94

    ld h, $0
    ld l, a
    
    ; b is already 8 times too large...
    ; hl *= 32
    add hl, hl
    add hl, hl

    ld bc, $9804
    add hl, bc

    ld a, $2
    ld [hl+], a
    ld a, $3
    ld [hl+], a
    ld a, $2
    ld [hl+], a
    ld [hl+], a
    ld a, $3
    ld [hl+], a
    ld a, $2
    ld [hl+], a
    ld [hl+], a
    ld a, $3
    ld [hl+], a
    ld a, $2
    ld [hl+], a
    ld [hl+], a
    ld a, $3
    ld [hl+], a
    ld a, $2
    ld [hl+], a

    ret


SECTION "GameVariables", WRAM0



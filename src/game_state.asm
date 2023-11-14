INCLUDE "hardware.inc/hardware.inc"

SECTION "GameState", ROM0

EmptyLine:: db $00, $00

GameState::
    call InitArrows

.loop
    ld a, [rSCY]
    sub a, $1
    ld [rSCY], a
    ld b, a
    and a, $7
    cp a, $0
    call z, BufferNewLine

    call WaitForVBlank
    call UpdateKeys


    ld a, [rSCY]

    ld b, a
    and a, $7
    cp a, $0
    call z, CopyNewLine    

    call ArrowPress

    call PlayMusic

    ; DMA OAMBuffer -> OAM
    ld a, HIGH(OAMBuffer)
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
BufferNewLine::
    ; Get Line from ROM
    ld a, [wLevelCounter]
    ld h, a
    ld a, [wLevelCounter + 1]
    ld l, a
    ld a, [hl+]
    ld d, a
    ld a, [hl+]
    ld e, a

    ld a, h
    cp a, HIGH(CustomLevel.end)
    jp nz, .checkAlreadyEmpty
    ld a, l
    cp a, LOW(CustomLevel.end)
    jp nz, .checkAlreadyEmpty

    jp .setPermanentEmptyLine
.checkAlreadyEmpty
    ld a, h
    cp a, HIGH(EmptyLine + 2)
    jp nz, .increment
    ld a, l
    cp a, LOW(EmptyLine + 2)
    jp nz, .increment

    jp .levelCounterEnd
.setPermanentEmptyLine
    ld hl, EmptyLine
.increment
    ld a, h
    ld [wLevelCounter], a
    ld a, l
    ld [wLevelCounter + 1], a
.levelCounterEnd
    

    ld a, b

    ; and a, $18
    ; ret nz

    ld a, b
    sub a, $8

    ld h, $0
    ld l, a
    
    ; b is already 8 times too large...
    ; hl *= 32
    add hl, hl
    add hl, hl

    ld bc, wNewLine + 4
    add hl, bc

    ld a, d
    and a, %00111000 
    srl a
    srl a
    add a, $2

    ld [hl+], a
    inc a
    ld [hl+], a
    dec a
    ld [hl+], a

    ld a, d
    and a, %00000111 
    sla a
    add a, $2

    ld [hl+], a
    inc a
    ld [hl+], a
    dec a
    ld [hl+], a

    ld a, e
    and a, %00111000 
    srl a
    srl a
    add a, $2

    ld [hl+], a
    inc a
    ld [hl+], a
    dec a
    ld [hl+], a

    ld a, e
    and a, %00000111 
    sla a
    add a, $2

    ld [hl+], a
    inc a
    ld [hl+], a
    dec a
    ld [hl+], a
    ret

; @param b rSCY
CopyNewLine::
    ld a, b

    ; and a, $18
    ; ret nz

    ld a, b
    sub a, $8

    ld h, $0
    ld l, a
    
    ; b is already 8 times too large...
    ; hl *= 32
    add hl, hl
    add hl, hl

    ld bc, wNewLine +  4

    push hl

    add hl, bc

    ld d, h
    ld e, l

    pop hl

    ld bc, $9804
    add hl, bc

    ld b, $0
    ld c, $C
    
    call Memcpy

    ret

SECTION "GameVariables", WRAM0, ALIGN[8]

wNewLine:: ds 32 * 32
wLevelCounter:: ds 2


SECTION "CustomLevel", ROM0


CustomLevel::
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000

    db %00_000_000, %00_000_011
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_101
    db %00_000_000, %00_000_110

    db %00_000_000, %00_011_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_110_000

    db %00_000_000, %00_011_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_101_000
    db %00_000_000, %00_110_000

    db %00_000_011, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_101, %00_000_000
    db %00_000_110, %00_000_000

    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000
    db %00_000_000, %00_000_000


.end

INCLUDE "hardware.inc/hardware.inc"

SECTION "InitState", ROM0


InitState::
    call WaitForVBlank

    ; Turn off the display
    ld a, LCDCF_OFF
    ld [rLCDC], a

    ; Loading tiles into memory
    ld de, Tiles
    ld hl, $9000
    ld bc, Tiles.end - Tiles
    call Memcpy

    call InitBg

    ; Set background palette
    ld a, BCPSF_AUTOINC
    ld [rBCPS], a

    ld c, BackgroundPalette.end - BackgroundPalette
    ld hl, BackgroundPalette.end

.rep
    ; load full color
    dec hl
    ld a, [hl]
    ld [rBCPD], a
    dec hl
    ld a, [hl]
    ld [rBCPD], a

    dec c
    ld a, c
    cp a, 0
    jr nz, .rep

    ; Turn on the display
    ld a, LCDCF_ON | LCDCF_BGON
    ld [rLCDC], a

    ; Copy DMA transfer routing into High RAM
    call CopyDMATransfer

    ; Init wKeys
    xor a
    ld [wKeysDown], a
    ld [wKeysJustPressed], a

    ; Turn on thre timer
    ld a, $4
    ld [rTAC], a

    call GameState
    jp InitState

InitBg::
    ld a, $20
    ld hl, $9800
.loopBegin
    cp a, $0
    ret z

    call InitEmptyLine
    ld c, $c
    add hl, bc
    dec a

    jp .loopBegin

; Inits an empty line
; @params hl beginning of the line
InitEmptyLine::
    push af 
    push hl
    ld a, $0
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld a, $1
    ld [hl+], a
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
    ld a, $1
    ld [hl+], a
    ld a, $0
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    pop hl
    ld a, $1
    ld [rVBK], a
    ld a, %00100000
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld [hl+], a
    inc hl
    inc hl
    ld [hl+], a
    inc hl
    inc hl
    ld [hl+], a
    inc hl
    inc hl
    ld [hl+], a
    ld [hl+], a
    inc hl
    inc hl
    inc hl

    xor a
    ld [rVBK], a
    pop af
    ret
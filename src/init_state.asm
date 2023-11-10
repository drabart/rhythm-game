INCLUDE "hardware.inc/hardware.inc"

SECTION "InitState", ROM0


InitState::
    call WaitForVBlank

    ; Turn off the display
    ld a, LCDCF_OFF
    ld [rLCDC], a

    ; Loading tiles into memory
    ld de, Tiles
    ld hl, $9000 + $10
    ld bc, Tiles.end - Tiles
    call Memcpy

    call InitBg

    ; Set background palette
    ld a, %11100100
    ld [rBGP], a

    ; Turn on the display
    ld a, LCDCF_ON | LCDCF_BGON
    ld [rLCDC], a

    ; Copy DMA transfer routing int High RAM
    call CopyDMATransfer

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
    
    ld a, $0
    ld [hl+], a
    ld [hl+], a
    ld a, $1
    ld [hl+], a
    ld a, $2
    ld [hl+], a
    ld [hl+], a
    ld a, $1
    ld [hl+], a
    ld [hl+], a
    ld a, $2
    ld [hl+], a
    ld [hl+], a
    ld a, $1
    ld [hl+], a
    ld [hl+], a
    ld a, $2
    ld [hl+], a
    ld [hl+], a
    ld a, $1
    ld [hl+], a
    ld [hl+], a
    ld a, $2
    ld [hl+], a
    ld [hl+], a
    ld a, $1
    ld [hl+], a
    ld a, $0
    ld [hl+], a
    ld [hl+], a

    ret
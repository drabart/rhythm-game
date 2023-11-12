INCLUDE "hardware.inc/hardware.inc"

SECTION "Utility", ROM0

; Memcpy
; Copies data
; @param de Beginning of source data
; @param hl Beginning of target space
; @param bc data size
Memcpy::
    ld a, [de]      ; 2
    ld [hl+], a     ; 2
    inc de          ; 2
    dec bc          ; 2
    ld a, b         ; 1
    or a, c         ; 1
    jr nz, Memcpy   ; 3
    ret             ; 4

; Memset
; Sets data
; @param d value to be set
; @param hl beginning of target space
; @param bc data size
Memset::
    ld a, d
    ld [hl+], a
    dec bc
    ld a, b
    or a, c
    jr nz, Memset
    ret

; Subroutine to copy subroutine into HRAM
; https://gbdev.gg8.se/wiki/articles/OAM_DMA_tutorial
; (Cursed as hell)
CopyDMATransfer::
    ld hl, DMATransfer
    ld b, DMATransferEnd - DMATransfer
    ld c, LOW(hOAMDMA)
.copy:
    ld  a, [hli]
    ldh [c], a
    inc c
    dec b
    jr  nz, .copy
    ret

; DMATransfer
; Copies OAM data from high RAM
; @param a Place in high ram divided by $100
; https://gbdev.io/pandocs/OAM_DMA_Transfer.html
DMATransfer::
    ldh [rDMA], a  ; start DMA transfer (starts right after instruction)
    ld a, 40        ; delay for a total of 4×40 = 160 cycles
.wait:
    dec a
    jr nz, .wait
    ret
DMATransferEnd::

; Zero
; Sets bytes to 0
; @param hl start of data
; @param bc length
Zero::
    xor a           ; 1
    ld [hl+], a     ; 2
    dec bc          ; 2
    ld a, b         ; 1
    or a, c         ; 1
    jr nz, Zero   ; 3
    ret             ; 4


; Memswap
; Swaps data
; @param de Beginning of source data
; @param hl Beginning of target space
; @param bc data size
Memswap::
    push bc         ; 4
    ld a, [de]      ; 2
    ld b, a         ; 1
    ld a, [hl]      ; 2
    ld [de], a      ; 2
    ld a, b         ; 1
    ld [hl+], a     ; 2
    pop bc          ; 3

    dec bc          ; 2
    inc de          ; 2

    ld a, b         ; 1
    or a, c         ; 1
    jr nz, Memswap  ; 3
    ret             ; 4

; Sub16
; Decreases all values at a given range by $10
; @param hl Beginning of data
; @param b length
Sub16::
    ld a, b
    cp a, $0
    ret z
    ld a, [hl]
    sub a, $10     
    ld [hl+], a
    dec b
    jr Sub16

; Add16
; Increases all values at a given range by $10
; @param hl Beginning of data
; @param b length
Add16::
    ld a, b
    cp a, $0
    ret z
    ld a, [hl]
    add a, $10     
    ld [hl+], a
    dec b
    jr Add16

; WaitPorVBlank
; Waits until VBlank (duh)
WaitForVBlank::
    ld a, [rLY]
    cp 144
    jr nz, WaitForVBlank
    ret


; ClearOam
; Resets all OAM values to 0
; @param de - OAMBuffer
ClearOam::
    xor a
    ld b, $A0
    ld hl, _OAMRAM
.clearOamLoop:
    ld [hl+], a
    dec b
    jr nz, ClearOam.clearOamLoop

    ld b, $A0
    ld h, d
    ld l, e
.clearOamBufferLoop:
    ld [hl+], a
    dec b
    jr nz, ClearOam.clearOamBufferLoop
    ret

; @param hl - palette id
SetPalette::
    ld a, [wGameboyColor]
    cp a, 1
    jp z, .color
    ; gameboy classic here

    ; load palette from id
    ld a, [hl]
    ; set current palette
    ld [rBGP], a

    jp .end
.color
    ; gameboy color here

.end
    ret

; UpdateKeys
; Updates wKeyJustsPressed and wKeysDown variables, storing information about keys pressed to bits:
; %000000001 ($01) - A key
; %000000010 ($02) - B key
; %000000100 ($04) - START key
; %000001000 ($08) - SELECT key
; %000010000 ($10) - RIGHT key
; %000100000 ($20) - LEFT key
; %001000000 ($40) - UP key
; %010000000 ($80) - DOWN key
; use PADF_{key} define from hardware.inc
UpdateKeys::
    ld a, [wKeysDown]
    ld e, a

    ld a, P1F_GET_BTN
    ldh [rP1], a

    call PollKeys

    or a, $F0
    ld b, a

    ld a, P1F_GET_DPAD
    ldh [rP1], a

    call PollKeys

    or a, $F0
    swap a
    xor a, b
    
    ld [wKeysDown], a

    ld b, a

    xor a, e
    and a, b

    ld [wKeysJustPressed], a

    ld a, P1F_GET_NONE
    ldh [rP1], a

    ret

; PollKeys
; Polls keys enough times
PollKeys::
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ret

; Rng
; @return a the random number
Rng::
    ld a, [rDIV] ; xD
    ret


SECTION "HardwareInfo", WRAM0

wGameboyColor:: db

SECTION "VariablesMovement", WRAM0

wKeysDown:: db
wKeysJustPressed:: db

SECTION "OAM Data", WRAM0, ALIGN[8]

OAMBuffer:: ds 160

SECTION "OAM DMA", HRAM

hOAMDMA:: ds DMATransferEnd - DMATransfer
INCLUDE "hardware.inc/hardware.inc"

SECTION "Indicators", ROM0

InitIndicators::
    
    ; X position of each Indicator sprite is fixed
    ld a, $28
    ld b, $0
    ld c, $1
.initXLoop
    cp a, $88
    jp z, .initXLoopEnd

    ld hl, OAMBuffer
    add hl, bc
    ld [hl], a
    
    add a, $8 
    push af
    ld a, c
    add a, $4
    ld c, a
    pop af

    jp .initXLoop
.initXLoopEnd

    ; Init all variables to 0
    ld d, $0
    ld hl, IndicatorVariables
    ld bc, IndicatorVariablesEnd - IndicatorVariables
    call Memset

    ret

UpdateIndicators::

    ld b, $0
    ld c, $0
.updateLoop
    ld a, c 
    cp a, $4
    jp z, .updateLoopEnd

    ; Check if the timer is above zero
    ld hl, wIndTimer1
    add hl, bc
    ld a, [hl]
    cp a, $0
    jp nz, .timerNotZero

    ; On 0, put the sprite to Y pos 0 (off screen)
.timerZero
    ld hl, wIndYPos1
    add hl, bc
    ld a, $0
    ld [hl], a

    inc c
    jp .updateLoop

    ; Otherwise decrement timer and move text up
.timerNotZero
    ; inc c

    ld hl, wIndTimer1
    add hl, bc
    ld a, [hl]
    dec a
    ld [hl], a
    ; and a, $1
    ; cp a, $0
    ; jp z, .updateLoop

    ld hl, wIndYPos1
    add hl, bc
    ld a, [hl]
    dec a
    ld [hl], a

    inc c
    jp .updateLoop
.updateLoopEnd

    ; Move wInds to OAMBuffer
    ld a, [wIndYPos1]
    ld [OAMBuffer + 0], a
    ld [OAMBuffer + 4], a
    ld [OAMBuffer + 8], a
    ld a, [wIndYPos2]
    ld [OAMBuffer + 12], a
    ld [OAMBuffer + 16], a
    ld [OAMBuffer + 20], a
    ld a, [wIndYPos3]
    ld [OAMBuffer + 24], a
    ld [OAMBuffer + 28], a
    ld [OAMBuffer + 32], a
    ld a, [wIndYPos4]
    ld [OAMBuffer + 36], a
    ld [OAMBuffer + 40], a
    ld [OAMBuffer + 44], a

    ld a, [wIndFlag1]
    ld [OAMBuffer + 3], a
    ld [OAMBuffer + 7], a
    ld [OAMBuffer + 11], a
    ld a, [wIndFlag2]
    ld [OAMBuffer + 15], a
    ld [OAMBuffer + 19], a
    ld [OAMBuffer + 23], a
    ld a, [wIndFlag3]
    ld [OAMBuffer + 27], a
    ld [OAMBuffer + 31], a
    ld [OAMBuffer + 35], a
    ld a, [wIndFlag4]
    ld [OAMBuffer + 39], a
    ld [OAMBuffer + 43], a
    ld [OAMBuffer + 47], a

    ret

; @param c lane
; | 0 | 1 | 2 | 3 |
; @param d type
; 0 - PERFECT!
; 1 - GREAT!
; 2 - GOOD!
; 3 - MISS!
SetIndicator::

    ld b, $0
    ld hl, wIndYPos1
    add hl, bc
    ld a, $80
    ld [hl], a

    ld hl, wIndTimer1
    add hl, bc
    ld a, $18
    ld [hl], a

    ld hl, wIndFlag1
    add hl, bc
    ld a, c
    ld [hl], a


    ; d *= 3
    ld a, d
    sla a
    add a, d
    ld d, a

    ; c *= 12
    ld a, c
    sla a
    add a, c    
    sla a
    sla a
    ld c, a

    ld hl, OAMBuffer
    inc hl
    inc hl
    ld b, $0
    add hl, bc
    ld c, $4
    
    ld a, d
    ld [hl], a
    add hl, bc
    inc a
    ld [hl], a
    add hl, bc
    inc a
    ld [hl], a

    ret

SECTION "Indicatos Variables", WRAM0

IndicatorVariables:

wIndYPos1:: db
wIndYPos2:: db
wIndYPos3:: db
wIndYPos4:: db

wIndFlag1:: db
wIndFlag2:: db
wIndFlag3:: db
wIndFlag4:: db

wIndTimer1:: db
wIndTimer2:: db
wIndTimer3:: db
wIndTimer4:: db

IndicatorVariablesEnd:
INCLUDE "hardware.inc/hardware.inc"

SECTION "GameState", ROM0


GameState::
    call Init

.loop
    call WaitForVBlank

    ld a, [rSCX]
    inc a
    ld [rSCX], a

    jp .loop

Init:
    call WaitForVBlank

    call CopyDMATransfer

    ret
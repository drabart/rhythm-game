INCLUDE "hardware.inc/hardware.inc"

SECTION "GameState", ROM0


GameState::
    call Init

.loop
    call WaitForVBlank
    call UpdateKeys

    ld a, [rSCX]
    add a, $10
    ld [rSCX], a

    jp .loop

Init:
    call WaitForVBlank

    ret
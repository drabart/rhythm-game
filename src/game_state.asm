INCLUDE "hardware.inc/hardware.inc"

SECTION "GameState", ROM0


GameState::

.loop
    call WaitForVBlank
    call UpdateKeys

    ld a, [wKeysJustPressed]
    cp a, PADF_DOWN
    jp nz, .noScroll

    ld a, [rSCY]
    sub a, $10
    ld [rSCY], a
.noScroll

    jp .loop
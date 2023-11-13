INCLUDE "hardware.inc/hardware.inc"

SECTION "Palettes", ROM0

BackgroundPalette::
    ; Palette 1
    db $7C, $1D, $7D, $9E, $7E, $5F, $7F, $7F
.end::

SpritesPalettes::
    ; Palette 5 (Arrows)
    db $00, $00, $00, $11, $00, $0A, $00, $00
    ; Palette 4 (Miss!)
    db $00, $00, $00, $00, $00, $1B, $00, $00
    ; Palette 3 (Good!)
    db $00, $00, $00, $00, $01, $DB, $00, $00
    ; Palette 2 (Great!)
    db $00, $00, $00, $00, $7C, $00, $00, $00
    ; Palette 1 (Prfct!)
    db $00, $00, $00, $00, $03, $E0, $00, $00
.end::
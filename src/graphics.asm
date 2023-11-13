INCLUDE "hardware.inc/hardware.inc"

SECTION "Graphics", ROM0

Tiles::
    incbin "assets/tiles.2bpp"
.end::

Indicators::
    incbin "assets/indicators.2bpp"
.end::

FontTiles::
    incbin "assets/font.2bpp"
FontTilesEnd::

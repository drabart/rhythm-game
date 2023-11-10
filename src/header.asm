INCLUDE "hardware.inc/hardware.inc"

SECTION "Header", ROM0[$100]
	nop
	jp EntryPoint

	ds $150 - @, 0

SECTION "Entry point", ROM0

EntryPoint:
	; Here is where the fun begins, happy coding :)
    call GameState
	jp EntryPoint

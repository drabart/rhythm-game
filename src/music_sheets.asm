INCLUDE "include/music_symbols.inc"

SECTION "MusicSheets", ROM0

/*
MUSIC SHEET GUIDE:

NOTES must be at least of length 2 (to not make infinite loop lol)

commands channel 1,2: (1st byte)
    01 - play note
        1. number of frames to be played
        2. volume and sweep control
        3. note frequency lower
        4. note frequency higher
        (volume = 0 will not play sound and just pause)
    A1 - set vibrato
        1. 4 sets of 2 bits for duty cycle
    EE - loop
        1. address to loop back to (high)
        2. address to loop back to (low)
        3. number of times (1 makes infinite loop)
    FF - end of music

commands channel 3: (1st byte)
    01 - play note
        1. number of frames to be played
        2. volume (%0000 %0110 %0100 %0010)
        3. note frequency lower
        4. note frequency higher
        (volume = 0 will not play sound and just pause)
    25 - change wave pattern
        1. wave mode (sth from presets) (turns channel off and on causing an audio pop)
    EE - loop
        1. address to loop back to (high)
        2. address to loop back to (low)
        3. number of times (1 makes infinite loop)
    FF - end of music

commands channel 4: (1st byte)
    01 - play note
        1. number of frames to be played
        2. volume (%0000 %0110 %0100 %0010)
        3. note frequency (%11110111) and mode (%00001000)
        (volume = 0 will not play sound and just pause)
    EE - loop
        1. address to loop back to (high)
        2. address to loop back to (low)
        3. number of times (1 makes infinite loop)
    FF - end of music
*/


MainTheme1::
	db NOTE, $7, VOL_MUTE
	dw 0
	db NOTE, $eb, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $7, VOL_MUTE
	dw 0
	db NOTE, $eb, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $8, VOL_MUTE
	dw 0
	db NOTE, $ea, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $8, VOL_MUTE
	dw 0
	db NOTE, $6f, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $77, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ee, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ef, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ef, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $3, VOL_MUTE
	dw 0
	db NOTE, $ef, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MUTE
	dw 0
.loopStart:
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ee, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ee, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ee, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ef, VOL_MAX
	dw A4s
	db NOTE, $3, VOL_MUTE
	dw 0

	db LOOP
	dw .loopStart
	db $1
MainTheme2::
	db NOTE, $3, VOL_MUTE
	dw 0
	db NOTE, $ef, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ee, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ee, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $ee, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MUTE
	dw 0
	db NOTE, $f, VOL_MUTE
	dw 0
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $3, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $3, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $3, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $3, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $3, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $3, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $3, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $3, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $3, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $3, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $3, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $3, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $3, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $3, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $3, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $3, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $3, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $3, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $3, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $3, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $3, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $3, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $3, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $3, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
.loopStart:
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $3, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $3, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $3, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $3, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $3, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $3, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $3, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $3, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3
	db NOTE, $4, VOL_MAX
	dw F3s
	db NOTE, $3, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4
	db NOTE, $4, VOL_MAX
	dw F4s
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $3, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $3, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $3, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $3, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $3, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E3
	db NOTE, $3, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $3, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $3, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $3, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $3, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $3, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw B3
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw G5
	db NOTE, $3, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw B4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $3, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $3, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $3, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $3, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $3, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $3, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $3, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $4, VOL_MAX
	dw A3s
	db NOTE, $3, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $4, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4
	db NOTE, $3, VOL_MAX
	dw A3s
	db NOTE, $4, VOL_MAX
	dw G3
	db NOTE, $4, VOL_MAX
	dw E5
	db NOTE, $4, VOL_MAX
	dw D5
	db NOTE, $4, VOL_MAX
	dw A4s
	db NOTE, $4, VOL_MAX
	dw G4
	db NOTE, $3, VOL_MAX
	dw E4
	db NOTE, $4, VOL_MAX
	dw D4

	db LOOP
	dw .loopStart
	db $1
MainTheme3::
	db NOTE, $f2, VOL3_MAX
	dw D2
	db NOTE, $4, VOL3_MUTE
	dw 0
	db NOTE, $f2, VOL3_MAX
	dw E2
	db NOTE, $4, VOL3_MUTE
	dw 0
	db NOTE, $f2, VOL3_MAX
	dw G2
	db NOTE, $4, VOL3_MUTE
	dw 0
	db NOTE, $f2, VOL3_MAX
	dw G2
	db NOTE, $4, VOL3_MUTE
	dw 0
	db NOTE, $f2, VOL3_MAX
	dw D2
	db NOTE, $4, VOL3_MUTE
	dw 0
	db NOTE, $f3, VOL3_MAX
	dw E2
	db NOTE, $3, VOL3_MUTE
	dw 0
	db NOTE, $f3, VOL3_MAX
	dw G2
	db NOTE, $4, VOL3_MUTE
	dw 0
	db NOTE, $f2, VOL3_MAX
	dw G2
	db NOTE, $4, VOL3_MUTE
	dw 0
.loopStart:
	db NOTE, $f2, VOL3_MAX
	dw D2
	db NOTE, $4, VOL3_MUTE
	dw 0
	db NOTE, $f2, VOL3_MAX
	dw E2
	db NOTE, $4, VOL3_MUTE
	dw 0
	db NOTE, $f2, VOL3_MAX
	dw G2
	db NOTE, $4, VOL3_MUTE
	dw 0
	db NOTE, $f3, VOL3_MAX
	dw G2
	db NOTE, $3, VOL3_MUTE
	dw 0

	db LOOP
	dw .loopStart
	db $1
MainTheme4::
	db NOTE, $f6, VOLD_MUTE
	dw 0
	db NOTE, $f6, VOLD_MUTE
	dw 0
	db NOTE, $f6, VOLD_MUTE
	dw 0
	db NOTE, $f6, VOLD_MUTE
	dw 0
	db NOTE, $f6, VOLD_MUTE
	dw 0
	db NOTE, $f6, VOLD_MUTE
	dw 0
	db NOTE, $f7, VOLD_MUTE
	dw 0
	db NOTE, $f6, VOLD_MUTE
	dw 0
.loopStart:
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $7, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dG7s
	db NOTE, $8, VOLD_MAX_S
	dw dD7
	db NOTE, $7, VOLD_MAX_S
	dw dG7s

	db LOOP
	dw .loopStart
	db $1

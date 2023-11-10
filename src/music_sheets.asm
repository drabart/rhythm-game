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
    db END

MainTheme2::
    db END

MainTheme3::
    db END

MainTheme4::
    db END


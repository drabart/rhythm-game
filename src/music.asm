INCLUDE "include/hardware.inc/hardware.inc"
INCLUDE "include/music_symbols.inc"

SECTION "Music", ROM0

InitMusic::
    ; set starting points for each channel
    call SwitchToMainTheme

    ; turn on all channels
    ld a, 1
    ld [wOn1], a
    ld [wOn2], a
    ld [wOn3], a
    ld [wOn4], a

    xor a
    ld [wInterrupt1], a
    ld [wSkipMusic1], a

    ; prepare for the first note
    xor a
    ld [wNoteFrame1], a
    ld [wNoteFrame2], a
    ld [wNoteFrame3], a
    ld [wNoteFrame4], a
    
    ; prepare for the first loop
    xor a
    ld [wLoopTimes1], a
    ld [wLoopTimes2], a
    ld [wLoopTimes3], a
    ld [wLoopTimes4], a

    ; turn the music on
    ld a, %10000000
    ld [rNR52], a

    ; mix every channel into every output
    ld a, $FF
    ld [rNR51], a

    ; max out the volume and give output on both
    ld a, $FF
    ld [rNR50], a

    ; max out channels volumes
    ld a, %11111000
    ld [rNR12], a
    ld [rNR22], a
    ld [rNR42], a

    ld a, %00000000
    ld [rNR32], a
    ld a, %10000000
    ld [rNR30], a

    ret

SwitchToMainTheme::
    xor a
    ld [wNoteFrame1], a
    ld [wNoteFrameCopy1], a
    ld [wNoteFrame2], a
    ld [wNoteFrame3], a
    ld [wNoteFrame4], a
    ld [wLoopTimes1], a
    ld [wLoopTimes2], a
    ld [wLoopTimes3], a
    ld [wLoopTimes4], a

    ld hl, MainTheme1
    ld a, h
    ld [wPosition1], a
    ld [wPositionCopy1], a
    ld a, l
    ld [wPosition1 + 1], a
    ld [wPositionCopy1 + 1], a

    ld hl, MainTheme2
    ld a, h
    ld [wPosition2], a
    ld a, l
    ld [wPosition2 + 1], a

    ld hl, MainTheme3
    ld a, h
    ld [wPosition3], a
    ld a, l
    ld [wPosition3 + 1], a
    
    ld hl, MainTheme4
    ld a, h
    ld [wPosition4], a
    ld a, l
    ld [wPosition4 + 1], a

    ret

; param @bc address of sound's music sheet
StartSoundEffect::
    ld a, [wPosition1]
    ld [wPositionCopy1], a
    ld a, [wPosition1 + 1]
    ld [wPositionCopy1 + 1], a

    ld a, [wNoteFrame1]
    ld [wNoteFrameCopy1], a

    ld a, b
    ld [wInterruptPosition1], a
    ld a, c
    ld [wInterruptPosition1 + 1], a

    ld a, 1
    ld [wInterrupt1], a
    xor a
    ld [wInterruptNoteFrame1], a

    ret

EndSoundEffect::
    ld a, [wPositionCopy1]
    ld [wPosition1], a
    ld a, [wPositionCopy1 + 1]
    ld [wPosition1 + 1], a

    ld a, [wNoteFrameCopy1]
    ld [wNoteFrame1], a

    xor a
    ld [wInterrupt1], a

    ret

PlayMusic::

    ld a, [wOn1]
    cp a, 0
    jr z, .off1

    ld a, [wInterrupt1]
    cp a, 0
    jr nz, .interrupt1

    call Play1
    jr .off1

.interrupt1:
    ; real position should be loaded
    ; play default with skip
    ld a, 1
    ld [wSkipMusic1], a
    call Play1
    ; store real position
    ld a, [wPosition1]
    ld [wPositionCopy1], a
    ld a, [wPosition1 + 1]
    ld [wPositionCopy1 + 1], a
    ld a, [wNoteFrame1]
    ld [wNoteFrameCopy1], a
    
    ; load interrupt position
    ld a, [wInterruptPosition1]
    ld [wPosition1], a
    ld a, [wInterruptPosition1 + 1]
    ld [wPosition1 + 1], a
    ld a, [wInterruptNoteFrame1]
    ld [wNoteFrame1], a
    ; play interrupt without skip
    xor a
    ld [wSkipMusic1], a
    call Play1
    ; store interrupt position
    ld a, [wPosition1]
    ld [wInterruptPosition1], a
    ld a, [wPosition1 + 1]
    ld [wInterruptPosition1 + 1], a
    ld a, [wNoteFrame1]
    ld [wInterruptNoteFrame1], a
    ; load real position (necessary here because of interrupting interrupt)
    ld a, [wPositionCopy1]
    ld [wPosition1], a
    ld a, [wPositionCopy1 + 1]
    ld [wPosition1 + 1], a
    ld a, [wNoteFrameCopy1]
    ld [wNoteFrame1], a

.off1

    ld a, [wOn2]
    cp a, 0
    jr z, .off2
    call Play2

.off2

    ld a, [wOn3]
    cp a, 0
    jr z, .off3
    call Play3

.off3

    ld a, [wOn4]
    cp a, 0
    jr z, .off4
    call Play4

.off4
    ret

; --------------------------------------------------------------------------------------------------------
SECTION "Engine1", ROM0

RestoreSound1:
    ; load position into hl
    ld a, [wPosition1]
    ld h, a
    ld a, [wPosition1 + 1]
    ld l, a

    ld a, [hl+] ; load command (+0)
    cp a, NOTE  ; check if a note is played
    ret nz      ; if not return

    ld a, [hl+] ; load note length
    ld a, [hl+] ; load volume and sweep (+2)

    ; set volume and sweep
    ld [rNR12], a

    ld a, [hl+] ; frequency lower (+3)
    ld c, a
    ld a, [hl+] ; frequency higher (+4)
    ld d, a

    ; set frequency
    ld a, c
    ld [rNR13], a
    ld a, d
    or a, %10000000 ; trigger channel
    ld [rNR14], a

    ret

Play1:
    ; load position into hl
    ld a, [wPosition1]
    ld h, a
    ld a, [wPosition1 + 1]
    ld l, a

    ld a, [hl+] ; load command (+0)
    
    ; check which command it is
.case01: ; Play note --------------------------------------------
    cp a, NOTE
    jr nz, .caseEE
    
    ld a, [hl+] ; load note length (+1)
    ld c, a

    ld a, [wNoteFrame1]
    ld b, a
    xor a
    cp a, b
    ; if var == 0 set note length
    jr z, .initNote
.alreadySet:
    ld a, [wNoteFrame1]
    dec a
    ld [wNoteFrame1], a

    cp a, 0             ; if frame == 0
    jp nz, .endSwitch

    ld bc, 3            ; set it to next byte of music sheet
    add hl, bc
    ld a, h
    ld [wPosition1], a
    ld a, l
    ld [wPosition1 + 1], a

    jp .endSwitch
.initNote:
    ld a, c                     ; set intital note length
    dec a
    ld [wNoteFrame1], a
    ld e, a

    ld a, [wSkipMusic1]
    cp a, 0
    jr nz, .handleSkip

    ld a, [hl+] ; load volume and sweep (+2)

    ; set volume and sweep
    ld [rNR12], a

    ld a, [hl+] ; frequency lower (+3)
    ld c, a
    ld a, [hl+] ; frequency higher (+4)
    ld d, a

    ; set frequency
    ld a, c
    ld [rNR13], a
    ld a, d
    or a, %10000000 ; trigger channel
    ld [rNR14], a

    jr .noSkip

.handleSkip

    ld bc, 3    ; adding position of program counter
    add hl, bc

.noSkip

    ld a, e
    cp a, 0
    jp nz, .endSwitch

    ld a, h
    ld [wPosition1], a
    ld a, l
    ld [wPosition1 + 1], a

    jp .endSwitch
.caseEE: ; Loop -----------------------------------------------------
    cp a, LOOP
    jr nz, .caseFF

    ld a, [wLoopTimes1]
    cp a, 0
    jr z, .initLoop
    ; loop again
    dec a
    ld [wLoopTimes1], a
    cp a, 0
    jr nz, .noLoopEnd

    ; move sheet pointer after loop command
    ld bc, 3
    add hl, bc
    ld a, h
    ld [wPosition1], a
    ld a, l
    ld [wPosition1 + 1], a

    jp Play1
.noLoopEnd:
    ld a, [hl+] ; add 1
    ld [wPosition1 + 1], a
    ld a, [hl+] ; add 2
    ld [wPosition1], a

    jp Play1
.initLoop:
    ld a, [hl+] ; add 1
    ld [wPosition1 + 1], a
    ld a, [hl+] ; add 2
    ld [wPosition1], a
    ld a, [hl+] ; times
    dec a ; already did 1 time when coming here
    ld [wLoopTimes1], a

    jp Play1
.caseFF: ; music end command --------------------------------------
    cp a, END
    jr nz, .endSwitch

    ld a, [wInterrupt1]
    cp a, 0
    jr nz, .interruptEnded

    xor a
    ld [wOn1], a            ; turn off channel in music engine
    ld [rNR12], a                   ; set volume to 0

    ; rewind the music to the start
    ld hl, MainTheme1
    ld a, h
    ld [wPosition1], a
    ld a, l
    ld [wPosition1 + 1], a

    jr .endSwitch

.interruptEnded:

    xor a
    ld [wInterrupt1], a
    ; load real position back
    ld a, [wPositionCopy1]
    ld [wPosition1], a
    ld a, [wPositionCopy1 + 1]
    ld [wPosition1 + 1], a
    ld a, [wNoteFrameCopy1]
    ld [wNoteFrame1], a

    call RestoreSound1

.endSwitch:

    ret

; --------------------------------------------------------------------------------------------------------
SECTION "Engine2", ROM0

Play2:
    ; load position into hl
    ld a, [wPosition2]
    ld h, a
    ld a, [wPosition2 + 1]
    ld l, a

    ld a, [hl+] ; load command (+0)
    
    ; check which command it is
.case01: ; Play note --------------------------------------------
    cp a, NOTE
    jr nz, .caseEE
    
    ld a, [hl+] ; load note length (+1)
    ld c, a

    ld a, [wNoteFrame2]
    ld b, a
    xor a
    cp a, b
    ; if var == 0 set note length
    jr z, .initNote
.alreadySet:
    ld a, [wNoteFrame2]
    dec a
    ld [wNoteFrame2], a

    cp a, 0             ; if frame == 0
    jp nz, .endSwitch

    ld bc, 3            ; set it to next byte of music sheet
    add hl, bc
    ld a, h
    ld [wPosition2], a
    ld a, l
    ld [wPosition2 + 1], a

    jr .endSwitch
.initNote:
    ld a, c                     ; set intital note length
    dec a
    ld [wNoteFrame2], a

    ld a, [hl+] ; load volume and sweep (+2)

    ; set volume and sweep
    ld [rNR22], a

    ld a, [hl+] ; frequency lower (+3)
    ld c, a
    ld a, [hl+] ; frequency higher (+4)
    ld d, a

    ; set frequency
    ld a, c
    ld [rNR23], a
    ld a, d
    or a, %10000000 ; trigger channel
    ld [rNR24], a

    jr .endSwitch
.caseEE: ; Loop -----------------------------------------------------
    cp a, LOOP
    jr nz, .caseFF

    ld a, [wLoopTimes2]
    cp a, 0
    jr z, .initLoop
    ; loop again
    dec a
    ld [wLoopTimes2], a
    cp a, 0
    jr nz, .noLoopEnd

    ; move sheet pointer after loop command
    ld bc, 3
    add hl, bc
    ld a, h
    ld [wPosition2], a
    ld a, l
    ld [wPosition2 + 1], a

    jp Play2
.noLoopEnd:
    ld a, [hl+] ; add 1
    ld [wPosition2 + 1], a
    ld a, [hl+] ; add 2
    ld [wPosition2], a

    jp Play2
.initLoop:
    ld a, [hl+] ; add 1
    ld [wPosition2 + 1], a
    ld a, [hl+] ; add 2
    ld [wPosition2], a
    ld a, [hl+] ; times
    dec a ; already did 1 time when coming here
    ld [wLoopTimes2], a

    jp Play2
.caseFF: ; music end command --------------------------------------
    cp a, END
    jr nz, .endSwitch

    xor a
    ld [wOn2], a            ; turn off channel in music engine
    ld [rNR22], a                   ; set volume to 0

    ; rewind the music to the start
    ld hl, MainTheme2
    ld a, h
    ld [wPosition2], a
    ld a, l
    ld [wPosition2 + 1], a

.endSwitch:

    ret

; --------------------------------------------------------------------------------------------------------
SECTION "Engine3", ROM0

Play3:
    ; load position into hl
    ld a, [wPosition3]
    ld h, a
    ld a, [wPosition3 + 1]
    ld l, a

    ld a, [hl+] ; load command (+0)
    
    ; check which command it is
.case01: ; Play note --------------------------------------------
    cp a, NOTE
    jr nz, .case25
    
    ld a, [hl+] ; load note length (+1)
    ld c, a

    ld a, [wNoteFrame3]
    ld b, a
    xor a
    cp a, b
    ; if var == 0 set note length
    jr z, .initNote
.alreadySet:
    ld a, [wNoteFrame3]
    dec a
    ld [wNoteFrame3], a

    cp a, 0             ; if frame == 0
    jp nz, .endSwitch

    ld bc, 3            ; set it to next byte of music sheet
    add hl, bc
    ld a, h
    ld [wPosition3], a
    ld a, l
    ld [wPosition3 + 1], a

    jp .endSwitch
.initNote:
    ld a, c                     ; set intital note length
    dec a
    ld [wNoteFrame3], a

    ld a, [hl+] ; load volume and sweep (+2)

    ; set volume
    ld [rNR32], a

    ld a, [hl+] ; frequency lower (+3)
    ld c, a
    ld a, [hl+] ; frequency higher (+4)
    ld d, a

    ; set frequency
    ld a, c
    ld [rNR33], a
    ld a, d
    or a, %10000000 ; trigger channel
    ld [rNR34], a

    jp .endSwitch
.case25: ; Set waveform ---------------------------------------------
    cp a, $25
    jr nz, .caseEE
    
    xor a
    ld [rNR30], a ; turn off channel

    ld a, [hl+] ; get waveform pattern
    sla a       ; multiply by 16
    sla a
    sla a
    sla a

    push hl
    
    ld hl, WavePatterns ; get first wave pattern
    ld c, a             ; move to the selected one
    ld b, 0
    add hl, bc
    ld d, h
    ld e, l             ; de = pattern + offset * 16

    ld bc, $10          ; len = 16
    ld hl, _AUD3WAVERAM ; destination
    call Memcpy

    pop hl

    ld a, %10000000     ; turn channel back on
    ld [rNR30], a

    ld a, h
    ld [wPosition3 + 1], a
    ld a, l
    ld [wPosition3 + 1], a

    jr Play3
.caseEE: ; Loop -----------------------------------------------------
    cp a, LOOP
    jr nz, .caseFF

    ld a, [wLoopTimes3]
    cp a, 0
    jr z, .initLoop
    ; loop again
    dec a
    ld [wLoopTimes3], a
    cp a, 0
    jr nz, .noLoopEnd

    ; move sheet pointer after loop command
    ld bc, 3
    add hl, bc
    ld a, h
    ld [wPosition3], a
    ld a, l
    ld [wPosition3 + 1], a

    jp Play3
.noLoopEnd:
    ld a, [hl+] ; add 1
    ld [wPosition3 + 1], a
    ld a, [hl+] ; add 2
    ld [wPosition3], a

    jp Play3
.initLoop:
    ld a, [hl+] ; add 1
    ld [wPosition3 + 1], a
    ld a, [hl+] ; add 2
    ld [wPosition3], a
    ld a, [hl+] ; times
    dec a ; already did 1 time when coming here
    ld [wLoopTimes3], a

    jp Play3
.caseFF: ; music end command --------------------------------------
    cp a, END
    jr nz, .endSwitch

    xor a
    ld [wOn3], a            ; turn off channel in music engine
    ld [rNR32], a                   ; set volume to 0
    ld [rNR30], a                   ; set volume to 0

    ; rewind the music to the start
    ld hl, MainTheme3
    ld a, h
    ld [wPosition3], a
    ld a, l
    ld [wPosition3 + 1], a

.endSwitch:

    ret

; --------------------------------------------------------------------------------------------------------
SECTION "Engine4", ROM0

Play4:
    ; load position into hl
    ld a, [wPosition4]
    ld h, a
    ld a, [wPosition4 + 1]
    ld l, a

    ld a, [hl+] ; load command (+0)
    
    ; check which command it is
.case01: ; Play note --------------------------------------------
    cp a, NOTE
    jr nz, .caseEE
    
    ld a, [hl+] ; load note length (+1)
    ld c, a

    ld a, [wNoteFrame4]
    ld b, a
    xor a
    cp a, b
    ; if var == 0 set note length
    jr z, .initNote
.alreadySet:
    ld a, [wNoteFrame4]
    dec a
    ld [wNoteFrame4], a

    cp a, 0             ; if frame == 0
    jr nz, .endSwitch

    ld bc, 3            ; set it to next byte of music sheet
    add hl, bc
    ld a, h
    ld [wPosition4], a
    ld a, l
    ld [wPosition4 + 1], a

    jr .endSwitch
.initNote:
    ld a, c                     ; set intital note length
    dec a
    ld [wNoteFrame4], a

    ld a, [hl+] ; load volume and sweep (+2)

    ; set volume and sweep
    ld [rNR42], a

    ld a, [hl+] ; frequency lower (+3)
    ld c, a

    ; set frequency
    ld a, c
    ld [rNR43], a
    ld a, %10000000 ; trigger channel
    ld [rNR44], a

    jr .endSwitch
.caseEE: ; Loop -----------------------------------------------------
    cp a, LOOP
    jr nz, .caseFF

    ld a, [wLoopTimes4]
    cp a, 0
    jr z, .initLoop
    ; loop again
    dec a
    ld [wLoopTimes4], a
    cp a, 0
    jr nz, .noLoopEnd

    ; move sheet pointer after loop command
    ld bc, 3
    add hl, bc
    ld a, h
    ld [wPosition4], a
    ld a, l
    ld [wPosition4 + 1], a

    jr Play4
.noLoopEnd:
    ld a, [hl+] ; add 1
    ld [wPosition4 + 1], a
    ld a, [hl+] ; add 2
    ld [wPosition4], a

    jr Play4
.initLoop:
    ld a, [hl+] ; add 1
    ld [wPosition4 + 1], a
    ld a, [hl+] ; add 2
    ld [wPosition4], a
    ld a, [hl+] ; times
    dec a ; already did 1 time when coming here
    ld [wLoopTimes4], a

    jr Play4
.caseFF: ; music end command --------------------------------------
    cp a, END
    jr nz, .endSwitch

    xor a
    ld [wOn4], a            ; turn off channel in music engine
    ld [rNR42], a                   ; set volume to 0

    ; rewind the music to the start
    ld hl, MainTheme4
    ld a, h
    ld [wPosition4], a
    ld a, l
    ld [wPosition4 + 1], a

.endSwitch:

    ret

SECTION "MusicVariables", WRAM0

wOn1: ds 1               ; is channel 1 on
wOn2: ds 1               ; is channel 2 on
wOn3: ds 1               ; is channel 3 on
wOn4: ds 1               ; is channel 4 on
wPosition1: ds 2         ; pointer to current command in channel 1
wPositionCopy1: ds 2     ; pointer to current command in channel 1
wPosition2: ds 2         ; pointer to current command in channel 2
wPosition3: ds 2         ; pointer to current command in channel 3
wPosition4: ds 2         ; pointer to current command in channel 4
wInterrupt1: ds 1        ; flag for the interrupt being carried out
wSkipMusic1: ds 1        ; flag for the interrupt being carried out
wInterruptPosition1: ds 2  ; position of the current interrupt 
wInterruptNoteFrame1: ds 1  ; number of frames of last note 1
wNoteFrame1: ds 1        ; number of frames of last note 1
wNoteFrameCopy1: ds 1        ; number of frames of last note 1
wNoteFrame2: ds 1        ; number of frames of last note 2
wNoteFrame3: ds 1        ; number of frames of last note 3
wNoteFrame4: ds 1        ; number of frames of last note 4
wLoopTimes1: ds 1        ; number times to loop back 1
wLoopTimes2: ds 1        ; number times to loop back 2
wLoopTimes3: ds 1        ; number times to loop back 3
wLoopTimes4: ds 1        ; number times to loop back 4

SECTION "WavePatterns", ROM0

WavePatterns:
    db $02, $46, $8A, $CE, $FF, $FE, $ED, $DC, $CB, $A9, $87, $65, $44, $33, $22, $11
    db $31, $23, $45, $67, $8A, $CD, $EE, $FA, $AF, $EE, $DC, $A8, $76, $54, $32, $13

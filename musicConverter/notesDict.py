# Channel Notes

noteFrequency = {
    "C2": 44,
    "C2s": 157,
    "D2": 263,
    "D2s": 363,
    "E2": 457,
    "F2": 547,
    "F2s": 631,
    "G2": 711,
    "G2s": 786,
    "A2": 856,
    "A2s": 923,
    "B2": 986,
    "C3": 1046,
    "C3s": 1102,
    "D3": 1155,
    "D3s": 1205,
    "E3": 1253,
    "F3": 1297,
    "F3s": 1339,
    "G3": 1379,
    "G3s": 1417,
    "A3": 1452,
    "A3s": 1486,
    "B3": 1517,
    "C4": 1547,
    "C4s": 1575,
    "D4": 1602,
    "D4s": 1627,
    "E4": 1650,
    "F4": 1673,
    "F4s": 1694,
    "G4": 1714,
    "G4s": 1732,
    "A4": 1750,
    "A4s": 1767,
    "B4": 1783,
    "C5": 1798,
    "C5s": 1812,
    "D5": 1825,
    "D5s": 1837,
    "E5": 1849,
    "F5": 1860,
    "F5s": 1871,
    "G5": 1881,
    "G5s": 1890,
    "A5": 1899,
    "A5s": 1907,
    "B5": 1915
}

# DrumNotes

drumNotes = {
    "dB8": 0x34,
    "dG8s": 0x35,  #
    "dF8": 0x36,
    "dD8": 0x37,  #
    "dC8": 0x44,
    "dG7s": 0x45,  #
    "dF7": 0x46,
    "dD7": 0x47,  #
    "dC7": 0x54,
    "dG6s": 0x55, #
    "dF6": 0x56,
    "dD6": 0x57,#
    "dC6": 0x64,
    "dG5s": 0x65,#
    "dF5": 0x66,
    "dD5": 0x67,#
    "dC5": 0x74,
    "dG4s": 0x75,#
    "dD4": 0x77,
    "dC4": 0x84,#
    "dG3s": 0x85,
    "dF3": 0x86,#
    "dD3": 0x87,
    "dC3": 0x94,#
    "dG2s": 0x95,
    "dF2": 0x96,
    "dD2": 0x97,
    "dC2": 0xA4
}

drum = [0x75, 0x67, 0x65, 0x57, 0x55, 0x47, 0x45, 0x37, 0x35]

notes = {
    "C": 0,
    "Cs": 1,
    "D": 2,
    "Ds": 3,
    "E": 4,
    "F": 5,
    "Fs": 6,
    "G": 7,
    "Gs": 8,
    "A": 9,
    "As": 10,
    "B": 11
}

# different volume settings
volumeControl = {
    "VOL_MAX": 0xF8,
    "VOL_34": 0xC8,
    "VOL_34F": 0xC4,
    "VOL_24": 0x88,
    "VOL_24F": 0x84,
    "VOL_14": 0x58,
    "VOL_MUTE": 0x08,
    "VOL3_MAX": 0x20,
    "VOL3_12": 0x40,
    "VOL3_14": 0x60,
    "VOL3_MUTE": 0x00,
    "VOLD_MAX_S": 0xD1,
    "VOLD_MAX_L": 0xD2,
    "VOLD_MID_S": 0xA1,
    "VOLD_MID_L": 0xA2,
    "VOLD_LOW_S": 0x81,
    "VOLD_LOW_L": 0x82,
    "VOLD_MUTE": 0x00
}

START_PAUSE = 0x20  # pause for the music chip to initialize

import json
import codecs
import notesDict

with codecs.open("input.json", encoding="utf-8") as file:
    beepboxSave = json.load(file)

# print(beepboxSave)

bpm = beepboxSave["beatsPerMinute"]
tpb = beepboxSave["ticksPerBeat"]
bpb = beepboxSave["beatsPerBar"]
FPS = 60.0 / 2.0  # bc sth is weird
tps = 1.0 * tpb * bpm / 60.0
tickToFrames = FPS / tps
ticksPerBar = tpb * bpb

print(tickToFrames)

channels = []
for channel in beepboxSave["channels"]:
    channelA = []
    patterns = [[[0, ticksPerBar]]]
    for pattern in channel["patterns"]:
        notes = [[0, 0]]
        for note in pattern["notes"]:
            notes[-1][1] = note["points"][0]["tick"] - notes[-1][1]
            newNote = [note["pitches"][0],
                       note["points"][1]["tick"] -
                       note["points"][0]["tick"]]
            notes.append(newNote)
            notes.append([0, note["points"][1]["tick"]])
        notes[-1][1] = ticksPerBar - notes[-1][1]

        patterns.append(notes)

        print(notes)
    print("\n")

    sequence = channel["sequence"]
    seqID = 0
    for pattern in sequence:
        channelA.extend(patterns[pattern])
        seqID += 1
        if seqID == beepboxSave["introBars"]:
            channelA.append([-1, "loopStart"])
        if seqID == beepboxSave["introBars"] + beepboxSave["loopBars"]:
            channelA.append([-2, "loopStart", 1])
            break

    channels.append(channelA)


def convertPitch12(pitch):
    if pitch == 0:
        return 0
    noteID = notesDict.notes[beepboxSave["key"]]
    octave = 0
    for _ in range(pitch):
        noteID += 1
        if noteID == 12:
            noteID = 0
            octave += 1

    noteCode = list(notesDict.notes.keys())[noteID]
    noteCode = noteCode[0] + str(octave) + noteCode[1:]

    return notesDict.noteFrequency[noteCode]


def convertPitch3(pitch):
    if pitch == 0:
        return 0
    noteID = notesDict.notes[beepboxSave["key"]]
    octave = 1
    for _ in range(pitch):
        noteID += 1
        if noteID == 12:
            noteID = 0
            octave += 1

    noteCode = list(notesDict.notes.keys())[noteID]
    noteCode = noteCode[0] + str(octave) + noteCode[1:]

    return notesDict.noteFrequency[noteCode]


def convertPitch4(pitch):
    if pitch == 0:
        return 0

    return notesDict.drum[pitch]


outputFile = open("output1.bin", "w")
outputFile.write("Music1::\n")

print(channels[0])

rl = 0
for note in channels[0]:
    if note[1] == 0:
        continue

    if note[0] == -1:
        output = "." + note[1] + ":" + "\n"
        outputFile.write(output)
        continue

    if note[0] == -2:
        output = "\n\tdb $EE" + "\n" + "\tdw " + note[1] + "\n\tdb $" + hex(note[2])[2:] + "\n"
        outputFile.write(output)
        continue

    freq = convertPitch12(note[0])
    length = note[1] * tickToFrames
    nrl = rl + length
    if nrl - int(nrl) < rl - int(rl):
        length = int(length) + 1
    else:
        length = int(length)
    rl = nrl

    output = "\tdb $A1, "
    output += "$" + hex(length)[2:] + ", "
    if freq != 0:
        output += "$" + hex(notesDict.volumeControl["VOL_MAX"])[2:] + ", "
    else:
        output += "$" + hex(notesDict.volumeControl["VOL_MUTE"])[2:] + ", "
    output += "$" + hex(freq % 256)[2:] + ", "
    output += "$" + hex(int(freq / 256))[2:] + "\n"
    outputFile.write(output)
    print(output)

outputFile.close()

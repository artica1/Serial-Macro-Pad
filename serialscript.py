import serial

rawValues = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14]

s = serial.Serial(port="/dev/cu.usbserial-1130", baudrate=9600)

key = 0
raw = 0
lastKey = 0

while True:
    # wait for serial input
    try:
        raw = int(s.readline().decode("utf-8"))
    except:
        pass

    # really stupid python
    # sets key to correct raw value
    if raw < 0:
        key = abs(raw)
        if key == lastKey:
            key = -key
        print(key)
        lastKey = key
        with open("applescripts/button.txt", mode="w", encoding="utf-8") as file:
            file.write(str(key))

    else:
        print(raw)
        with open("applescripts/volume.txt", mode="w", encoding="utf-8") as file:
            file.write(str(raw))

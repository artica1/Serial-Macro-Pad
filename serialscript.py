import serial

rawValues = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14]

s = serial.Serial(port="/dev/cu.usbserial-1130", baudrate=9600)

key = 0

while True:
    # wait for serial input
    raw = int(s.readline().decode("utf-8"))

    # really stupid python
    # sets key to correct raw value
    if raw < 0:
        for val in rawValues:
            if raw == val:
                key = abs(raw)
        print(key)
        with open("button.txt", mode="w", encoding="utf-8") as file:
            file.write(str(key))

    else:
        print(raw)
        with open("volume.txt", mode="w", encoding="utf-8") as file:
            file.write(str(raw))

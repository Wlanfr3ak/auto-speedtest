import RPi.GPIO as gpio
import sys
from RPLCD import CharLCD

maxlen = None

for i in range(3,5):
	arglen = len(sys.argv[i].split(".")[0])
	if maxlen is None:
		maxlen = arglen
	elif arglen > maxlen:
		maxlen = arglen

def formatvalue(value):
	width = len(value.split(".")[0])
	if width < maxlen:
		pad = maxlen - width
		return "{}{}".format(" " * pad, value)
	return value

def formatline(*args):
	line = "".join(args)
	linelen = len(line)
	if linelen < 20:
		pad = 20 - linelen
		return "{}{}{}".format(args[0], " " * pad, args[1])

gpio.setmode(gpio.BCM) # Pin Belegung festlegen
lcd = CharLCD(pin_rs=7, pin_rw=4, pin_e=8, pins_data=[23, 18, 15, 14], numbering_mode=gpio.BCM, cols=20, rows=4, dotsize=8)


lcd.write_string(sys.argv[2]) # Uhrzeit
lcd.write_string("  ") # Freistelle
lcd.write_string(sys.argv[1]) # Datum/ Ende mit Stelle 20

lcd.write_string(formatline("P: ", sys.argv[3]))
lcd.write_string(formatline("D: ", sys.argv[4]))
lcd.write_string(formatline("U: ", sys.argv[5]))

#Display nicht loeschen nach Script stop mit false sonst nullt er das !
lcd.close(clear=false)

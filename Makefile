MCU = atmega328p
F_CPU = 16000000UL

CC = avr-gcc
OBJCOPY = avr-objcopy
AVRDUDE = avrdude
PORT = COM3
PROGRAMMER = arduino

CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os
LDFLAGS = -mmcu=$(MCU)

all: main.hex

main.elf: main.c
	$(CC) $(CFLAGS) main.c -o main.elf

main.hex: main.elf
	$(OBJCOPY) -O ihex -R .eeprom main.elf main.hex

flash: main.hex
	$(AVRDUDE) -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -U flash:w:main.hex:i

clean:
	del *.elf *.hex

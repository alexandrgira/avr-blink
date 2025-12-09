MCU = atmega328p
F_CPU = 16000000UL
PORT := $(shell ls /dev/ttyUSB* 2>/dev/null | head -n 1)
ifeq ($(PORT),)
PORT := $(shell ls /dev/ttyACM* 2>/dev/null | head -n 1)
endif

$(info Using port: $(PORT))

CC = avr-gcc
OBJCOPY = avr-objcopy
AVRDUDE = avrdude
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
	rm *.elf *.hex

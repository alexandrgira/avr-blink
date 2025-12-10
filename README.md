# AVR-BLINK
AVR-BLINK - a simple AVR project of blinking the onboard LED on Arduino boards.
# Description
This project demonstrates basic I/O port manipulation on ATmega microcontroller. The onboard LED on Arduino Nano/Uno (connected to PORTB5) blinks with a defined period.
# Requirements
### Hardware
- Arduino Nano/Uno board
- Any programmer
### Software
- avr-gcc
- avr-libc
- avrdude
# Installation and Build
##### Install required tools
For Linux:
```
sudo apt update
sudo apt install avr-gcc avr-libc avrdude
```
For Windows I recommend using this [guide](https://tinusaur.com/guides/avr-gcc-toolchain/) to set up your environment.
##### Build
Replace `<MCU_Clock>` with your microcontroller's clock frequency and `<programmer>` with your programmer type (e.g., `arduino` for the build-in Arduino programmer).
```
avr-gcc -mmcu=atmega328p -DF_CPU=<MCU_Clock> -Os main.c -o main.elf
avr-objcopy -O ihex main.elf main.hex
avrdude -c <programmer> -p atmega328p -U flash:w:main.hex:i
```
>Note: instead of -DF_CPU option in avr-gcc you can define MCU clock in main.c
>```
>#define F_CPU <MCU_Clock>
>```
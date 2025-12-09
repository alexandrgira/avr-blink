/***********************************************************************
* @file main.c
* @brief LED Blink example for Arduino Nano based on ATmega328
* @version 1.0
* @date 2025-12-10
* @author Alexandr Kim

* @details
* AVR example demonstrating simple I/O configuration and Arduino onboard LED blinking.
************************************************************************/

#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>
#include <stddef.h>

#define BLINK_PERIOD 2000 // Period of one blink cycle (in ms)

/***********************************************************************
* @brief Main function
* @param none
* @return none
*
* @details
* Setting PINB5 (Arduino onboard LED) as output.
* Uses bitwise XOR operation in the infinite loop to toggle the LED state.
* The LED blinks with a period defined by BLINK_PERIOD.
***********************************************************************/
int main(void) {
    DDRB |= (1 << DDB5);
    
    while (true) {
        PORTB ^= (1 << DDB5);
        _delay_ms(BLINK_PERIOD / 2);
    }
}

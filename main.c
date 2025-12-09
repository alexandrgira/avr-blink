#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>
#include <stddef.h>

#define BLINK_PERIOD 2000 // Period of one blink cycle (in ms)

int main(void) {
    DDRB |= (1 << DDB5);
    
    while (true) {
        PORTB ^= (1 << DDB5);
        _delay_ms(BLINK_PERIOD / 2);
    }
}

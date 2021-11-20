#include "gpio.h"
#include "util.h"

/**
 * Defines the pin mapping for led usage.
 * The values match to the FE310. Be careful, the connection pins to the Red-V Board may differ.
 * Red-V-Pins: RED = 11, GREEN = 2, BLUE = 5, YELLOW = 8
 * 
 */
pin_mapping LEDS[4] = {{RED, 3}, {GREEN, 18}, {BLUE, 21}, {YELLOW, 0}};

/**
 * Defines the pin mapping for button usage.
 * The values match to the FE310. Be careful, the connection pins to the Red-V Board may differ.
 * Red-V-Pins: RED = 10, GREEN = 3, BLUE = 4, YELLOW = 9
 * 
 */
pin_mapping BUTTON[4] = {{RED, 2}, {GREEN, 19}, {BLUE, 20}, {YELLOW, 1}};


void init_gpio(void) {
    for (int i = 0; i < COLOR_COUNT; i++) {
	    REG(GPIO_BASE + GPIO_IOF_EN) &= ~(1 << LEDS[i].pin);
	    REG(GPIO_BASE + GPIO_INPUT_EN) &= ~(1 << LEDS[i].pin);
	    REG(GPIO_BASE + GPIO_OUTPUT_EN) |= 1 << LEDS[i].pin;
	    REG(GPIO_BASE + GPIO_OUTPUT_VAL) &= ~(1 << LEDS[i].pin);
        LEDS[i].active = false;
    }
}

void get_input(bool *pressed) {
    int input;
    scanf("%d", &input);
    if (input >= 0 && input < COLOR_COUNT) {
        pressed[input] = true;
    }
}

void toggle_led(color c) {
    if (c < 0 || c >= COLOR_COUNT) {
        return;
    }
    if (LEDS[c].active) {
        REG(GPIO_BASE + GPIO_OUTPUT_VAL) &= ~(1 << LEDS[c].pin);
        LEDS[c].active = false;
    } else {
        REG(GPIO_BASE + GPIO_OUTPUT_VAL) |= (1 << LEDS[c].pin);
        LEDS[c].active = true;
    }
}

void toggle_all_led(void) {
    for (int i = 0; i < COLOR_COUNT; i++) {
        toggle_led((color) i);
    }
}
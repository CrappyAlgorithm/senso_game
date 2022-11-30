#include "gpio.h"
#include "util.h"

/**
 * Defines the pin mapping for led usage.
 * The values match to the FE310. Be careful, the connection pins to the Red-V Board may differ.
 * Red-V-Pins: RED = 11, GREEN = 2, BLUE = 5, YELLOW = 8
 * 
 */
pin_mapping LEDS[4] = {{RED, 3}, {YELLOW, 0}, {BLUE, 21}, {GREEN, 18}};

/**
 * Defines the pin mapping for button usage.
 * The values match to the FE310. Be careful, the connection pins to the Red-V Board may differ.
 * Red-V-Pins: RED = 10, GREEN = 3, BLUE = 4, YELLOW = 9
 * 
 */
pin_mapping BUTTON[4] = {{RED, 2}, {YELLOW, 1}, {BLUE, 20}, {GREEN, 19}};


void init_gpio(void) {
    for (int i = 0; i < COLOR_COUNT; i++) {
        // init leds
	    REG(GPIO_BASE + GPIO_IOF_EN) &= ~(1 << LEDS[i].pin);
	    REG(GPIO_BASE + GPIO_INPUT_EN) &= ~(1 << LEDS[i].pin);
	    REG(GPIO_BASE + GPIO_OUTPUT_EN) |= 1 << LEDS[i].pin;
	    REG(GPIO_BASE + GPIO_OUTPUT_VAL) &= ~(1 << LEDS[i].pin);
        LEDS[i].active = false;

        // init button
        REG(GPIO_BASE + GPIO_IOF_EN) &= ~(1 << BUTTON[i].pin);
        REG(GPIO_BASE + GPIO_PUE) |= 1 << BUTTON[i].pin;
	    REG(GPIO_BASE + GPIO_INPUT_EN) |= 1 << BUTTON[i].pin;
	    REG(GPIO_BASE + GPIO_OUTPUT_EN) &= ~(1 << BUTTON[i].pin);
	    REG(GPIO_BASE + GPIO_OUTPUT_VAL) &= ~(1 << BUTTON[i].pin);
    }
}

bool check_button(color_t color) {
    bool active;
    if (REG(GPIO_BASE + GPIO_INPUT_VAL) & (1 << BUTTON[color].pin)) {
        active = false;
    } else {
        active = true;
    }
    return active;
}

color_t button_pressed(color_t colors[], size_t color_count) {
    bool pressed[color_count];
    for (int i = 0; i < color_count; i++) {
        pressed[i] = check_button(colors[i]);
    }
    ms_delay(DEBOUNCE_DELAY);
    uint32_t pressed_count = 0;
    color_t pressed_button = -1;
    for (int i = 0; i < color_count; i++) {
        if (pressed[i] && check_button(colors[i])) {
            pressed_button = colors[i];
            pressed_count++;
        } 
    }
    if (pressed_count != 1) {
        pressed_button = -1;
    }
    return pressed_button;
}

void print_level_binary(int level) {
    for (int i = 0; i < COLOR_COUNT; i++) {
        if (level & 1 << LEDS[i].color) {
            set_led(LEDS[i].color, true);
        }
    }
}

void set_led(color_t color, bool active) {
    if (color < 0 || color >= COLOR_COUNT) {
        return;
    }
    if (active) {
        REG(GPIO_BASE + GPIO_OUTPUT_VAL) |= (1 << LEDS[color].pin);
    } else { 
        REG(GPIO_BASE + GPIO_OUTPUT_VAL) &= ~(1 << LEDS[color].pin);
    }
}

#include "gpio.h"
#include "util.h"

static const pin_mapping LEDS[4] = {{RED, 11}, {GREEN, 2}, {BLUE, 5}, {YELLOW, 8}};

static const pin_mapping BUTTON[4] = {{RED, 10}, {GREEN, 3}, {BLUE, 4}, {YELLOW, 9}};

void enable_input(void) {
    /* not implemented in console mode */
}

void disable_input(void) {
    /* not implemented in console mode */
}

void get_input(bool *pressed) {
    int input;
    scanf("%d", &input);
    if (input >= 0 && input < COLOR_COUNT) {
        pressed[input] = true;
    }
}

void toggle_led(color c) {
    printf("%d=", c);
    c == 0 ? printf("%s\n", "RED") : 0;
    c == 1 ? printf("%s\n", "GREEN") : 0;
    c == 2 ? printf("%s\n", "BLUE") : 0;
    c == 3 ? printf("%s\n", "YELLOW") : 0;
}

void toggle_all_led(void) {
    for (int i = 0; i < COLOR_COUNT; i++) {
        toggle_led((color) i);
    }
}

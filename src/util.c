#include "util.h"

bool ms_delay_with_button_callback(u_int64_t msec, color_t (*callback)(void), color_t wanted) {
    const volatile u_int64_t * now = (u_int64_t *) (CLINT_BASE_ADDR + CLINT_MTIME);
	volatile u_int64_t save = *now + msec * CLOCK_FREQUENCY;
    bool wanted_pressed = false;
	while (*now < save) {
        if (callback && (*callback)() == wanted) {
		    wanted_pressed = true;
            break;
        }
	}
    return wanted_pressed;
}

void ms_delay(u_int64_t msec) {
    ms_delay_with_button_callback(msec, 0, -1);
}

color_t get_random_led(void) {
    const volatile u_int64_t * now = (u_int64_t *) (CLINT_BASE_ADDR + CLINT_MTIME);
    int random = *now % COLOR_COUNT;
    return (color_t) random;
}

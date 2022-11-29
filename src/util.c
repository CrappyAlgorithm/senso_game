#include "util.h"

void ms_delay(u_int64_t msec) {
    volatile u_int64_t * now = (u_int64_t *) (CLINT_BASE_ADDR + CLINT_MTIME);
	volatile u_int64_t save = *now + msec * CLOCK_FREQUENCY;
	volatile u_int32_t loop = 0;
	while (*now < save) {
		loop++;
	}
}

clock_t duration_in_clocks(long msec) {
    return (clock_t) msec * CLOCKS_PER_SEC;
}

color get_random_led(void) {
    volatile u_int64_t * now = (u_int64_t *) (CLINT_BASE_ADDR + CLINT_MTIME);
    int random = *now % COLOR_COUNT;
    return (color) random;
}
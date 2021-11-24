#include "util.h"

void ms_delay(u_int32_t msec) {
    if (msec < 0) {
        return;
    }
    volatile uint64_t i = 0;
    for (i = 0; i < MS_SECONDS_AQUIVALENT * msec; i++){}
}

clock_t duration_in_clocks(long msec) {
    return (clock_t) msec * CLOCKS_PER_SEC;
}

color get_random_led(void) {
    int random = rand() % COLOR_COUNT;
    return (color) random;
}
#include "util.h"

bool ms_sleep(long msec) {
    if (msec < 0) {
        return false;
    }
    struct timespec ts;
    ts.tv_sec = msec / 1000;
    ts.tv_nsec = (msec % 1000) * 1000000;
    nanosleep(&ts, NULL);
    return true;
}

clock_t duration_in_clocks(long msec) {
    return (clock_t) msec / 1000 * CLOCKS_PER_SEC;
}

color get_random_led(void) {
    int random = rand() % COLOR_COUNT;
    return (color) random;
}
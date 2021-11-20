#include "util.h"

bool ms_sleep(long msec) {
    if (msec < 0) {
        return false;
    }
    delay(msec);
    /*
    struct timespec ts;
    ts.tv_sec = msec / 1000;
    ts.tv_nsec = (msec % 1000) * 1000000;
    nanosleep(&ts, NULL);
    */
    //volatile uint32_t i = 0;
    //for (i = 0; i < 184210; i++){}
    return true;
}

clock_t duration_in_clocks(long msec) {
    return (clock_t) msec * CLOCKS_PER_SEC;
}

color get_random_led(void) {
    int random = rand() % COLOR_COUNT;
    return (color) random;
}
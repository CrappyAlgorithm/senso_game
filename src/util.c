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
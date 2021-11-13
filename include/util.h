#ifndef UTIL_H
#define UTIL_H

#include "game_setup.h"
#include "gpio.h"

#include <stdbool.h>
#include <time.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

bool ms_sleep(long msec);

clock_t duration_in_clocks(long msec);

color get_random_led(void);

#ifdef __cplusplus
}
#endif

#endif
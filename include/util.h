#ifndef UTIL_H
#define UTIL_H

#include "game_setup.h"
#include "gpio.h"

#include <stdbool.h>
#include <time.h>
#include <stdlib.h>

#define CLINT_BASE_ADDR 0x2000000
#define CLINT_MTIME 0xBFF8

#define CLOCK_FREQUENCY 32.768

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Run a delay with given milliseconds. It is actually only simulated on not the correct time value.
 * 
 * @param msec delay value in milliseconds
 */
void ms_delay(u_int64_t msec);

/**
 * @brief Get a random led.
 * 
 */
color get_random_led(void);

#ifdef __cplusplus
}
#endif

#endif
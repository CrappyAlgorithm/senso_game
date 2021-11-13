#ifndef GPIO_H
#define GPIO_H

#include "game_setup.h"
#include "util.h"
 
#include <stdio.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    color c;
    int pin;
} pin_mapping;

void enable_input(void);

void disable_input(void);

void get_input(bool *pressed);

void toggle_led(color c);

void toggle_all_led(void);

#ifdef __cplusplus
}
#endif

#endif
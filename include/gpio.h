#ifndef GPIO_H
#define GPIO_H

#include "game_setup.h"
#include "util.h"
 
#include <stdio.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define REG(P) (*(volatile uint32_t *) (P))

#define GPIO_BASE 0x10012000
#define GPIO_INPUT_EN 0x4
#define GPIO_OUTPUT_EN 0x8
#define GPIO_INPUT_VAL 0x0
#define GPIO_PUE 0x10
#define GPIO_OUTPUT_VAL 0xc
#define GPIO_IOF_EN 0x38

typedef struct {
    color c;
    int pin;
    bool active;
} pin_mapping;

/**
 * @brief Initiate the gpio pins.
 * 
 */
void init_gpio(void);

bool check_button(color c, u_int32_t msec, bool ignore_wrong);

void toggle_led(color c);

void toggle_all_led(void);

#ifdef __cplusplus
}
#endif

#endif
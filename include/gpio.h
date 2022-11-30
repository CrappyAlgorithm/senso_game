#ifndef GPIO_H
#define GPIO_H

#include "game_setup.h"
 
#include <stdio.h>

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

#define DEBOUNCE_DELAY 50

typedef enum { false, true } bool;

typedef struct {
    color_t color;
    u_int32_t pin;
} pin_mapping;

/**
 * @brief Initiate the gpio pins.
 * 
 */
void init_gpio(void);

/**
 * @brief Check if given Buttons are pressed.
 * 
 */
bool check_button(color_t color);

/**
 * @brief Checks if one of the given button is pressed.
 * 
 * @return returns the color of the pressed button. If multiple or no button is pressed it will return -1 as invalid color_t.
 */
color_t button_pressed(color_t colors[], size_t color_count);

void print_level_binary(int level);

void set_led(color_t color, bool active);

#ifdef __cplusplus
}
#endif

#endif

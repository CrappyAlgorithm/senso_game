 #include "game_setup.h"
 #include "util.h"
 
 #include <stdio.h>
 #include <stdbool.h>

#ifndef GPIO_H
#define GPIO_H

typedef enum {RED_LED, YELLOW_LED, BLUE_LED, GREEN_LED} led;

typedef enum {RED_BUTTON, YELLOW_BUTTON, BLUE_BUTTON, GREEN_BUTTON} button;

#ifdef __cplusplus
extern "C" {
#endif

bool check_next_input(button b);

void toggle_led(led l);

void toggle_all_led(void);

#ifdef __cplusplus
}
#endif

#endif
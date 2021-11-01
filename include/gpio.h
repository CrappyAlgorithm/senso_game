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

void switch_led_state(led l);

#ifdef __cplusplus
}
#endif

#endif
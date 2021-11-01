#include "gpio.h"

bool check_next_input(button b) {
    int input;
    scanf("%d", &input);
    if (input == b) {
        return true;
    }
    return false;
}
    

void switch_led_state(led l) {
    printf("%d\n", l);
}

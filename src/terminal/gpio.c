#include "gpio.h"
#include "util.h"

bool check_next_input(button b) {
    int input;
    scanf("%d", &input);
    if (input == b) {
        return true;
    }
    return false;
}
    

void toggle_led(led l) {
    printf("%d\n", l);
}

void toggle_all_led(void) {
    toggle_led(RED_LED);
    toggle_led(YELLOW_LED);
    toggle_led(BLUE_LED);
    toggle_led(GREEN_LED);
}

#include "senso.h"

int main() {
    button b = GREEN_LED;
    switch_led_state(b);
    if (check_next_input(b)) {
        printf("%s\n", "true");
    } else {
        printf("%s\n", "false");
    }
    return EXIT_SUCCESS;
}
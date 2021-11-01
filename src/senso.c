#include "senso.h"

state_t current_state = INIT;

void senso(event_t event) {
    switch(current_state) {
        case INIT:
            toggle_all_led();
            ms_sleep(T_SHORT);
            current_state = ON;
            break;
        case ON:
            toggle_all_led();
            ms_sleep(T_SHORT);
            current_state = OFF;
            break;
        case OFF:
            /* switch to standby */
            break;
    }
}

int main() {
    while(true) {
        if(current_state == OFF) {
            return EXIT_SUCCESS;
        }
        senso(toogle_all);
    }
    return EXIT_FAILURE;
}
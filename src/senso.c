#include "senso.h"

state_t state = OFF;
int n = N;
int t = T_LONG;
int level = 1;
color targets[MAX_N];
int i = 0;
bool success = false;
bool failure = false;

void senso(event_t event) {
    switch(state) {
        case OFF:
            if (event == init) {
                toggle_all_led();
                ms_sleep(T_SHORT);
                state = RGBY;
            } else if (event == play_standby) {
                toggle_led(RED);
                ms_sleep(T_SHORT);
                state = R;
            } else if (event == play_standby_y) {
                toggle_led(YELLOW);
                ms_sleep(T_SHORT);
                state = Y;
            } else if (event == play_standby_b) {
                toggle_led(BLUE);
                ms_sleep(T_SHORT);
                state = B;
            } else if (event == play_standby_g) {
                toggle_led(GREEN);
                ms_sleep(T_SHORT);
                state = G;
            } else if (event == demo) {
                toggle_all_led();
                ms_sleep(T_NDEF);
                state = RGBY;
            } else if (event == create_target) {
                state = add_target_led();
            } else if (event == imitate) {
                if (match_next_button()) {
                    toggle_led(targets[i]);
                    ms_sleep(T_SHORT);
                    toggle_led(targets[i]);
                } else {
                    failure = true;
                }
                state = OFF;
                /* reset button needed? */
            } else if (event == play_break) {
                toggle_led(GREEN);
                toggle_led(YELLOW);
                ms_sleep(T_SHORT);
                state = GY;
            } else if (event == play_lose) {
                toggle_led(RED);
                ms_sleep(T_SHORT);
                state = R;
            } else if (event == play_end) {
                toggle_all_led();
                ms_sleep(T_SHORT);
                state = RGBY;
            } else if (event == play_end_long) {
                toggle_all_led();
                ms_sleep(T_LONG);
                state = RGBY;
            }
            break;
        case RGBY:
            if (event == init) {
                toggle_all_led();
                ms_sleep(T_SHORT);
                state = OFF;
            } else if (event == demo) {
                toggle_led(RED);
                ms_sleep(T_NDEF);
                state = GBY;
            } else if (event == imitate) {
                toggle_all_led();
                state = OFF;
            } else if (event == play_end) {
                toggle_all_led();
                ms_sleep(T_LONG);
                state = OFF;
            }
            break;
        case GBY:
            if (event == demo) {
                toggle_led(YELLOW);
                ms_sleep(T_NDEF);
                state = GB;
            }
            break;
        case GB:
            if (event == demo) {
                toggle_led(BLUE);
                ms_sleep(T_NDEF);
                state = G;
            }
            break;
        case GY:
            if (event == play_break) {
                toggle_all_led();
                ms_sleep(T_SHORT);
                state = RB;
            }
            break;
        case RB:
            if (event == play_break) {
                toggle_all_led();
                ms_sleep(T_SHORT);
                state = GY;
            } else if (event == end_break) {
                toggle_led(RED);
                toggle_led(BLUE);
                state = OFF;
            }
        case R:
            if (event == play_standby) {
                toggle_led(RED);
                ms_sleep(T_SHORT);
                state = OFF;
            } else if (event == create_target) {
                toggle_led(RED);
                ms_sleep(T_SHORT);
                state = OFF;
            } else if (event == play_lose) {
                toggle_led(RED);
                ms_sleep(T_SHORT);
                state = OFF;
            }
            break;
        case G:
            if (event == play_standby) {
                toggle_led(GREEN);
                ms_sleep(T_SHORT);
                state = OFF;
            } else if (event == demo) {
                toggle_led(GREEN);
                ms_sleep(T_NDEF);
                state = OFF;
            } else if (event == create_target) {
                toggle_led(GREEN);
                ms_sleep(T_SHORT);
                state = OFF;
            }
            break;
        case B:
            if (event == play_standby) {
                toggle_led(BLUE);
                ms_sleep(T_SHORT);
                state = OFF;
            } else if (event == create_target) {
                toggle_led(BLUE);
                ms_sleep(T_SHORT);
                state = OFF;
            }
            break;
        case Y:
            if (event == play_standby) {
                toggle_led(YELLOW);
                ms_sleep(T_SHORT);
                state = OFF;
            } else if (event == create_target) {
                toggle_led(YELLOW);
                ms_sleep(T_SHORT);
                state = OFF;
            }
            break;
        default:
            /* error if reached */
            break;
    
    }
    printf("%s", "-------------------\n");
}

state_t add_target_led(void) {
    targets[i] = get_random_led();
    toggle_led(targets[i]);
    ms_sleep(t);

    if (targets[i] == RED) {
        return R;
    }
    if (targets[i] == GREEN) {
        return G;
    }
    if (targets[i] == BLUE) {
        return B;
    }
    return Y;
}

bool match_next_button(void) {
    clock_t end = duration_in_clocks(t) + clock();
    enable_input();
    while (clock() < end) {
        bool right_button = false;
        bool wrong_button = false;
        bool pressed[COLOR_COUNT] = {'\0'};
        get_input(&pressed[0]);
        for (int j = 0; j < COLOR_COUNT; j++) {
            if (pressed[j] != '\0') {
                if ((color) j == targets[i]) {
                    right_button = true;
                } else {
                    wrong_button = true;
                }
            }
        }
        if (wrong_button) {
            disable_input();
            return false;
        } else if (right_button) {
            disable_input();
            return true;
        }
    }
    disable_input();
    return false;
} 

void raise_level(void) {
    level++;
    if (level <= 4 ||  (level >= 9 && level <= 12)) {
        n++;
    } else {
        t = t - t / 10;
    }
}

void reset_game(void) {
    n = N;
    t = T;
    level = 1;
}

void play_init_sequence(void) {
    printf("%s\n", "start init");
    /* init phase */
    senso(init);    /* all on -> RGBY */
    senso(init);    /* all off -> OFF */
}

void play_standby_sequence(void) {
    printf("%s\n", "start standby");
    senso(play_standby);
    senso(play_standby);
    senso(play_standby_y);
    senso(play_standby);
    senso(play_standby_b);
    senso(play_standby);
    senso(play_standby_g);
    senso(play_standby);
}

void play_demo_sequence(void) {
    printf("\n%s\n", "start demo");
    /* demo phase */
    senso(demo);    /* all on -> RGBY */
    senso(demo);    /* red off -> GBY */
    senso(demo);    /* yellow off -> GB */
    senso(demo);    /* blue off -> G */
    senso(demo);    /* green off -> OFF */
    for (i = 0; i < n; i++) { /* add n led to target */
        senso(create_target); /* choose and toggle random target led -> R/G/B/Y */
        senso(create_target); /* turn off target led -> OFF*/
    }
    senso(init); /* all on -> RGBY */
    senso(imitate); /* all off -> OFF */
}

void play_imitation_sequence(void) {
    printf("%s\n", "start imitation");
    /* imitation phase */
    i = 0;
    while (i < n && !failure) { /* check user input for all n leds */
        printf("%s= ", "target");
        senso(imitate);
        i++;
    }
}

void play_break_sequence(void) {
    printf("%s\n", "start break");
    /* sequence phase for break */
    for (i = 0; i <= SEQUENCE_ROUNDS; i++) {
        senso(play_break);
    }
    senso(end_break);
}

void play_lose_sequence(void) {
    printf("%s\n", "start lose");
    /* sequence phase for lose */
    for (i = 0; i <= SEQUENCE_ROUNDS; i++) {
        senso(play_lose);
    }
}

void play_end_sequence(void) {
    printf("%s\n", "start end");
    for (int j = 0; j < END_SEQUENCE_ROUNDS; j++) {
        if (j % 2 == 0) {
            senso(play_end_long);
        } else {
            senso(play_end);
        }
        senso(play_end);
    }
}

int main() {
    printf("level=%d, n=%d, t=%d\n", level, n, t);
    for (int j = 1; j < MAX_LVL; j++) {
        raise_level();
        printf("level=%d, n=%d, t=%d\n", level, n, t);
    }
    reset_game();
    printf("level=%d, n=%d, t=%d\n", level, n, t);
}
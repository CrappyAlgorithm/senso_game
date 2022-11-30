#include "senso.h"

static volatile state_t state = INITIAL_OFF;
static int n = N;
static int t = T_LONG;
static int level = 1;
static color_t targets[MAX_N];
static int target_index = 0;
static bool standby = false;
static bool failure = false;

color_t button_callback_all(void);
color_t button_callback_yellow(void);

void senso(event_t event) {
    switch(state) {
        case INITIAL_OFF:
            if (event == all_on) {
                for (int i = 0; i < COLOR_COUNT; i++) {
                    set_led(i, true);
                }
                state = INITIAL_ON;
                ms_delay(T_SHORT);
            } 
            break;
        case INITIAL_ON:
            if (event == all_off) {
                for (int i = 0; i < COLOR_COUNT; i++) {
                    set_led(i, false);
                }
                state = STANDBY_OFF;
                ms_delay(T_SHORT);
                standby = true;
            }
            break;
        case STANDBY_OFF:
            if (event == g_on) {
                set_led(GREEN, true);
                state = STANDBY_G;
                standby = !ms_delay_with_button_callback(T_SHORT, button_callback_yellow, YELLOW);
            } else if (event == b_on) {
                set_led(BLUE, true);
                state = STANDBY_B;
                standby = !ms_delay_with_button_callback(T_SHORT, button_callback_yellow, YELLOW);
            } else if (event == y_on) {
                set_led(YELLOW, true);
                state = STANDBY_Y;
                standby = !ms_delay_with_button_callback(T_SHORT, button_callback_yellow, YELLOW);
            } else if (event == r_on) {
                set_led(RED, true);
                state = STANDBY_R;
                standby = !ms_delay_with_button_callback(T_SHORT, button_callback_yellow, YELLOW);
            } else if (event == all_off) {
                state = DEMO_OFF;
                reset_game();
            }
            break;
        case STANDBY_G:
            if (event == g_off) {
                set_led(GREEN, false);
                state = STANDBY_OFF;
                standby = !ms_delay_with_button_callback(T_SHORT, button_callback_yellow, YELLOW);
            } else if (event == all_off) {
                set_led(GREEN, false);
                state = DEMO_OFF;
                reset_game();
            }
            break;
        case STANDBY_B:
            if (event == b_off) {
                set_led(BLUE, false);
                state = STANDBY_OFF;
                standby = !ms_delay_with_button_callback(T_SHORT, button_callback_yellow, YELLOW);
            } else if (event == all_off) {
                set_led(BLUE, false);
                state = DEMO_OFF;
                reset_game();
            }
            break;
        case STANDBY_Y:
            if (event == y_off) {
                set_led(YELLOW, false);
                state = STANDBY_OFF;
                standby = !ms_delay_with_button_callback(T_SHORT, button_callback_yellow, YELLOW);
            } else if (event == all_off) {
                set_led(YELLOW, false);
                state = DEMO_OFF;
                reset_game();
            }
            break;
        case STANDBY_R:
            if (event == r_off) {
                set_led(RED, false);
                state = STANDBY_OFF;
                standby = !ms_delay_with_button_callback(T_SHORT, button_callback_yellow, YELLOW);
            } else if (event == all_off) {
                set_led(RED, false);
                state = DEMO_OFF;
                reset_game();
            }
            break;
        case DEMO_OFF:
            if (event == all_on) {
                target_index = 0;
                memset(targets, -1, sizeof(targets));
                for (int i = 0; i < COLOR_COUNT; i++)
                {
                    set_led(i, true);
                }
                state = DEMO_ON;
                ms_delay(T_SHORT);
            } else if (event == random_led) {
                targets[target_index] = get_random_led();
                set_led(targets[target_index], true);
                state = DEMO_RAND_ON;
                ms_delay(t);
            } else if (event == end_demo) {
                for (int i = 0; i < COLOR_COUNT; i++) {
                    set_led(i, true);
                }
                state = DEMO_ON;
                ms_delay(T_SHORT);
            }
            break;
        case DEMO_ON:
            if (event == g_off) {
                set_led(GREEN, false);
                state = DEMO_BYR;
                ms_delay(T_SHORT);
            } else if (event == end_demo) {
                for (int i = 0; i < COLOR_COUNT; i++) {
                    set_led(i, false);
                }
                state = IMITATE_OFF;
                target_index = 0;
            }
            break;
        case DEMO_BYR:
            if (event == b_off) {
                set_led(BLUE, false);
                state = DEMO_YR;
                ms_delay(T_SHORT);
            }
            break;
        case DEMO_YR:
            if (event == y_off) {
                set_led(YELLOW, false);
                state = DEMO_R;
                ms_delay(T_SHORT);
            }
            break;
        case DEMO_R:
            if (event == r_off) {
                set_led(RED, false);
                state = DEMO_OFF;
                ms_delay(T_SHORT);
            }
            break;
        case DEMO_RAND_ON:
            if (event == random_led) {
                set_led(targets[target_index], false);
                state = DEMO_OFF;
                target_index++;
                ms_delay(T_SHORT);
            }
            break;
        case IMITATE_OFF:
            if (event == check_input) {
                bool correct_button = ms_delay_with_button_callback(t, button_callback_all, targets[target_index]);
                if (correct_button) {
                    set_led(targets[target_index], true);
                    state = IMITATE_RAND_ON;
                    ms_delay(T_SHORT);
                } else {
                    failure = true;
                    target_index = n;
                    state = LOSE_OFF;
                }
            } else if (event == start_break) {
                if (level < MAX_LVL) {
                    state = BREAK_OFF;
                } else {
                    state = END_OFF;
                }
            }
            break;
        case IMITATE_RAND_ON:
            if (event == disable_random_led) {
                set_led(targets[target_index], false);
                state = IMITATE_OFF;
                target_index++;
            }
            break;
        case LOSE_OFF:
            if (event == r_on) {
                set_led(RED, true);
                ms_delay(T_SHORT);
                state = LOSE_R;
            } else if (event == binary) {
                print_level_binary(level);
                state = LOSE_BINARY;
                ms_delay(T_VERY_LONG);
            }
            break;
        case LOSE_R:
            if (event == r_off) {
                set_led(RED, false);
                ms_delay(T_SHORT);
                state = LOSE_OFF;
            }
            break;
        case LOSE_BINARY:
            if (event == go_standby) {
                for (int i = 0; i < COLOR_COUNT; i++) {
                    set_led(i, false);
                }
                reset_game();
                state = STANDBY_OFF;
                standby = true;
            }
            break;
        case BREAK_OFF:
            if (event == break_switch) {
                raise_level();
                set_led(GREEN, true);
                set_led(YELLOW, true);
                ms_delay(T_SHORT);
                state = BREAK_GY;
            }
            break;
        case BREAK_GY:
            if (event == break_switch) {
                set_led(GREEN, false);
                set_led(YELLOW, false);
                set_led(BLUE, true);
                set_led(RED, true);
                ms_delay(T_SHORT);
                state = BREAK_BR;
            }
            break;
        case BREAK_BR:
            if (event == break_switch) {
                set_led(GREEN, true);
                set_led(YELLOW, true);
                set_led(BLUE, false);
                set_led(RED, false);
                ms_delay(T_SHORT);
                state = BREAK_GY;
            } else if (event == end_break) {
                set_led(BLUE, false);
                set_led(RED, false);
                if (level <= MAX_LVL) {
                    state = DEMO_OFF;
                } else {
                    state = END_OFF;
                }
            }
            break;
        case END_OFF:
            if (event == short_end) {
                for (int i = 0; i < COLOR_COUNT; i++) {
                    set_led(i, true);
                }
                ms_delay(T_SHORT);
                state = END_ON;
            } else if (event == long_end) {
                for (int i = 0; i < COLOR_COUNT; i++) {
                    set_led(i, true);
                }
                ms_delay(T_LONG);
                state = END_ON;
            } else if (event == go_standby) {
                state = STANDBY_OFF;
                standby = true;
            }
            break;
        case END_ON:
            if (event == all_off) {
                for (int i = 0; i < COLOR_COUNT; i++) {
                    set_led(i, false);
                }
                ms_delay(T_LONG);
                state = END_OFF;
            }
            break;
        default:
            /* error if reached */
            break;
    
    }
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
    failure = false;
}

color_t button_callback_all(void) {
    color_t colors[COLOR_COUNT];
    for (int i = 0; i < COLOR_COUNT; i++) {
        colors[i] = i;
    }
    return button_pressed(colors, COLOR_COUNT);
}

color_t button_callback_yellow(void) {
    color_t colors[] = {YELLOW};
    return button_pressed(colors, 1);
}

void play_init_sequence(void) {
    senso(all_on);
    senso(all_off);
}

void play_standby_sequence(void) {
    standby = true;
    event_t standby_events[] = {g_on, g_off, b_on, b_off, y_on, y_off, r_on, r_off};
    while (standby) {
        for (int i = 0; i < sizeof(standby_events) / sizeof(event_t); i++) {
            senso(standby_events[i]);
            if (!standby) {
                senso(all_off);
                break;
            }
        }
    }
}

void play_demo_sequence(void) {
    senso(all_on);
    senso(g_off);
    senso(b_off);
    senso(y_off);
    senso(r_off);
    for (int i = 0; i < n; i++) {
        senso(random_led);
        senso(random_led);
    }
    senso(end_demo);
    senso(end_demo);
}

void play_imitation_sequence(void) {
    while (target_index < n) {
        senso(check_input);
        if (!failure) {
            senso(disable_random_led);
        }
    }
    if (!failure) {
        senso(start_break);
    }
}

void play_lose_sequence(void) {
    for (int i = 0; i < LOSE_BREAK_SEQUENCE_ROUNDS; i++) {
        senso(r_on);
        senso(r_off);
    }
    senso(binary);
    senso(go_standby);
}

void play_break_sequence(void) {
    for (int i = 0; i < LOSE_BREAK_SEQUENCE_ROUNDS; i++) {
        senso(break_switch);
        senso(break_switch);
    }
    senso(end_break);
}

void play_end_sequence(void) {
    for (int i = 0; i < END_SEQUENCE_ROUNDS; i++) {
        senso(short_end);
        senso(all_off);
        senso(long_end);
        senso(all_off);
    }
    senso(go_standby);
}

int main(void) {
    init_gpio();
    play_init_sequence();
    while (1) {
        while (standby) {
            play_standby_sequence();
        }
        while (!failure && level <= MAX_LVL) {
            play_demo_sequence();
            play_imitation_sequence();
            if (!failure) {
                play_break_sequence();
            }
        }
        if (failure) {
            play_lose_sequence();
        } else {
            play_end_sequence();
        }
    }
    return EXIT_SUCCESS;
}

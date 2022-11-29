#include "senso.h"

static volatile state_t state = OFF;
static int n = N;
static int t = T_LONG;
static int level = 1;
static color targets[MAX_N];
static volatile int i = 0;
static bool failure = false;

void senso(event_t event) {
    switch(state) {
        case OFF:
            if (event == init) {
                toggle_all_led();
                ms_delay(T_SHORT);
                state = RGBY;
            } else if (event == play_standby) {
                toggle_led(RED);
                ms_delay(T_SHORT);
                state = R;
            } else if (event == play_standby_y) {
                toggle_led(YELLOW);
                ms_delay(T_SHORT);
                state = Y;
            } else if (event == play_standby_b) {
                toggle_led(BLUE);
                ms_delay(T_SHORT);
                state = B;
            } else if (event == play_standby_g) {
                toggle_led(GREEN);
                ms_delay(T_SHORT);
                state = G;
            } else if (event == demo) {
                toggle_all_led();
                ms_delay(T_NDEF);
                state = RGBY;
            } else if (event == create_target) {
                add_target_led();
                state = OFF;
            } else if (event == imitate) {
                if (check_button(targets[i], T_SHORT, false)) {
                    toggle_led(targets[i]);
                    ms_delay(T_SHORT);
                    toggle_led(targets[i]);
                } else {
                    failure = true;
                }
                state = OFF;
            } else if (event == play_break) {
                toggle_led(GREEN);
                toggle_led(YELLOW);
                ms_delay(T_SHORT);
                state = GY;
            } else if (event == play_lose) {
                toggle_led(RED);
                ms_delay(T_SHORT);
                state = R;
            } else if (event == play_end) {
                toggle_all_led();
                ms_delay(T_SHORT);
                state = RGBY;
            } else if (event == play_end_long) {
                toggle_all_led();
                ms_delay(T_LONG);
                state = RGBY;
            }
            break;
        case RGBY:
            if (event == init) {
                toggle_all_led();
                ms_delay(T_SHORT);
                state = OFF;
            } else if (event == demo) {
                toggle_led(RED);
                ms_delay(T_NDEF);
                state = GBY;
            } else if (event == imitate) {
                toggle_all_led();
                state = OFF;
            } else if (event == play_end) {
                toggle_all_led();
                ms_delay(T_LONG);
                state = OFF;
            }
            break;
        case GBY:
            if (event == demo) {
                toggle_led(YELLOW);
                ms_delay(T_NDEF);
                state = GB;
            }
            break;
        case GB:
            if (event == demo) {
                toggle_led(BLUE);
                ms_delay(T_NDEF);
                state = G;
            }
            break;
        case GY:
            if (event == play_break) {
                toggle_all_led();
                ms_delay(T_SHORT);
                state = RB;
            }
            break;
        case RB:
            if (event == play_break) {
                toggle_all_led();
                ms_delay(T_SHORT);
                state = GY;
            } else if (event == end_break) {
                toggle_led(RED);
                toggle_led(BLUE);
                state = OFF;
            }
        case R:
            if (event == play_standby) {
                toggle_led(RED);
                ms_delay(T_SHORT);
                state = OFF;
            } else if (event == create_target) {
                toggle_led(RED);
                ms_delay(T_SHORT);
                state = OFF;
            } else if (event == play_lose) {
                toggle_led(RED);
                ms_delay(T_SHORT);
                state = OFF;
            }
            break;
        case G:
            if (event == play_standby) {
                toggle_led(GREEN);
                ms_delay(T_SHORT);
                state = OFF;
            } else if (event == demo) {
                toggle_led(GREEN);
                ms_delay(T_NDEF);
                state = OFF;
            } else if (event == create_target) {
                toggle_led(GREEN);
                ms_delay(T_SHORT);
                state = OFF;
            }
            break;
        case B:
            if (event == play_standby) {
                toggle_led(BLUE);
                ms_delay(T_SHORT);
                state = OFF;
            } else if (event == create_target) {
                toggle_led(BLUE);
                ms_delay(T_SHORT);
                state = OFF;
            }
            break;
        case Y:
            if (event == play_standby) {
                toggle_led(YELLOW);
                ms_delay(T_SHORT);
                state = OFF;
            } else if (event == create_target) {
                toggle_led(YELLOW);
                ms_delay(T_SHORT);
                state = OFF;
            }
            break;
        default:
            /* error if reached */
            break;
    
    }
}

void add_target_led(void) {
    color new = get_random_led();
    toggle_led(new);
    ms_delay(T_SHORT);
    toggle_led(new);
    targets[i] = new;
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
    senso(init);    /* all on -> RGBY */
    senso(init);    /* all off -> OFF */
}

void play_standby_sequence(void) {
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
    senso(demo);    /* all on -> RGBY */
    senso(demo);    /* red off -> GBY */
    senso(demo);    /* yellow off -> GB */
    senso(demo);    /* blue off -> G */
    senso(demo);    /* green off -> OFF */
    i = 0;
    for (; i < n; i++) { /* add n led to target */
        senso(create_target); /* choose and toggle random target led -> R/G/B/Y */
        senso(create_target); /* turn off target led -> OFF*/
    }
    senso(init); /* all on -> RGBY */
    senso(imitate); /* all off -> OFF */
}

void play_imitation_sequence(void) {
    i = 0;
    while (i < n && !failure) { /* check user input for all n leds */
        senso(imitate);
        i++;
    }
}

void play_break_sequence(void) {
    for (i = 0; i <= SEQUENCE_ROUNDS; i++) {
        senso(play_break);
    }
    senso(end_break);
}

void play_lose_sequence(void) {
    for (i = 0; i <= SEQUENCE_ROUNDS; i++) {
        senso(play_lose);
    }
}

void play_end_sequence(void) {
    for (int j = 0; j < END_SEQUENCE_ROUNDS; j++) {
        if (j % 2 == 0) {
            senso(play_end_long);
        } else {
            senso(play_end);
        }
        senso(play_end);
    }
}

int main(void) {
    init_gpio();
    play_init_sequence();
    play_standby_sequence();
    play_demo_sequence();

    /*
    init_gpio();
    play_init_sequence();
    play_demo_sequence();
    while (1) {
        play_standby_sequence();
        if (check_button(RED, T_SHORT, true)) {
            while (1) {
                play_demo_sequence();
                play_imitation_sequence();
                if (!failure) {
                    play_lose_sequence();
                    reset_game();
                    break;
                } else {
                    play_break_sequence();
                    if (level < 16) {
                        raise_level();
                    } else {
                        play_end_sequence();
                        reset_game();
                        break;
                    }
                }
            }
        }
    }
    */
    return EXIT_SUCCESS;
}
#ifndef SENSO_H
#define SENSO_H

#include "gpio.h"
#include "game_setup.h"
#include "util.h"

#include <stdlib.h>
#include <time.h>
#include <string.h>

/**
 * @brief Defines the possible states of the state machine.
 * 
 */
typedef enum {
    INITIAL_OFF, INITIAL_ON,   // init states
    STANDBY_OFF, STANDBY_G, STANDBY_B, STANDBY_Y, STANDBY_R,  // standby states
    DEMO_OFF, DEMO_ON, DEMO_BYR, DEMO_YR, DEMO_R, DEMO_RAND_ON,   // demo states
    IMITATE_OFF, IMITATE_RAND_ON,    // imitate states
    LOSE_OFF, LOSE_R, LOSE_BINARY,   // lose states
    BREAK_OFF, BREAK_GY, BREAK_BR, BREAK_CONTINUE,   // break states
    END_OFF, END_ON
} state_t;

/**
 * @brief Defines the possible events of the state machine.
 * 
 */
typedef enum {
    all_on, all_off, 
    g_on, b_on, y_on, r_on,
    g_off, b_off, y_off, r_off,
    random_led, end_demo, check_input, 
    disable_random_led, binary, start_break,
    break_switch, end_break, short_end, 
    long_end, go_standby
} event_t;

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief 
 * 
 */
void senso(event_t event);

/**
 * @brief Raise the game level.
 * 
 */
void raise_level(void);

/**
 * @brief Reset the game level.
 * 
 */
void reset_game(void);

/**
 * @brief Play the init sequence.
 * 
 */
void play_init_sequence(void);

/**
 * @brief Play the standby sequence.
 * 
 */
void play_standby_sequence(void);

/**
 * @brief Play the demo sequence.
 * 
 */
void play_demo_sequence(void);

/**
 * @brief Play the imitation sequence.
 * 
 */
void play_imitation_sequence(void);

/**
 * @brief Play the lose sequence.
 * 
 */
void play_lose_sequence(void);

/**
 * @brief Play the break sequence.
 * 
 */
void play_break_sequence(void);

/**
 * @brief Play the end sequence.
 * 
 */
void play_end_sequence(void);

#ifdef __cplusplus
}
#endif

#endif

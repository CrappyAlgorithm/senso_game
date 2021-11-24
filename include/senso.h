#ifndef SENSO_H
#define SENSO_H

#include "gpio.h"
#include "game_setup.h"

#include <stdlib.h>
#include <time.h>

/**
 * @brief Defines the possible states of the state machine.
 * 
 */
typedef enum {OFF, RGBY, GBY, GB, GY, RB, G, R, B, Y} state_t;

/**
 * @brief Defines the possible events of the state machine.
 * 
 */
typedef enum {
    init, play_standby, play_standby_y, play_standby_b, 
    play_standby_g, demo, create_target, imitate, 
    play_break, end_break, play_lose, play_end, play_end_long
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
 * @brief Add a random led to led targets.
 * 
 */
void add_target_led(void);

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
 * @brief Play the break sequence.
 * 
 */
void play_break_sequence(void);

/**
 * @brief Play the lose sequence.
 * 
 */
void play_lose_sequence(void);

/**
 * @brief Play the end sequence.
 * 
 */
void play_end_sequence(void);

#ifdef __cplusplus
}
#endif

#endif
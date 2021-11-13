#ifndef SENSO_H
#define SENSO_H

#include "gpio.h"
#include "game_setup.h"

#include <stdlib.h>
#include <time.h>

typedef enum {OFF, RGBY, GBY, GB, GY, RB, G, R, B, Y} state_t;
typedef enum {
    init, demo, create_target, imitate, 
    play_break, end_break, play_lose
} event_t;

#ifdef __cplusplus
extern "C" {
#endif

void senso(event_t event);

state_t add_target_led(void);

bool match_next_button(void);

void raise_level(void);

void play_init_sequence(void);

void play_demo_sequence(void);

void play_imitation_sequence(void);

void play_break_sequence(void);

void play_lose_sequence(void);

#ifdef __cplusplus
}
#endif

#endif
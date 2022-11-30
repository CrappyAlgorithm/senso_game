#ifndef GAME_SETUP_H
#define GAME_SETUP_H

/**
 * @brief Defines the milliseconds value for T_SHORT.
 * 
 */
#define T_SHORT 500

/**
 * @brief Defines the milliseconds value for T_LONG.
 * 
 */
#define T_LONG 2*T_SHORT

/**
 * @brief Defines the milliseconds value for T_VERY_LONG.
 * 
 */
#define T_VERY_LONG 2*T_LONG

/**
 * @brief Defines the start value for N.
 * 
 */
#define N 3

/**
 * @brief Dfines the max value for N.
 * 
 */
#define MAX_N N+7

/**
 * @brief Defines the milliseconds start value for T.
 * 
 */
#define T T_LONG

/**
 * @brief Defines the max level.
 * 
 */
#define MAX_LVL 16

/**
 * @brief Defines the count of rounds used for lose and break sequences.
 * 
 */
#define LOSE_BREAK_SEQUENCE_ROUNDS 5

/**
 * @brief Defines the rounds of the end sequence.
 * 
 */
#define END_SEQUENCE_ROUNDS 2

/**
 * @brief Defines the count of colors.
 * 
 */
#define COLOR_COUNT 4

/**
 * @brief Defines the avaible colors.
 * 
 */
typedef enum {RED, YELLOW, BLUE, GREEN} color_t;

#endif

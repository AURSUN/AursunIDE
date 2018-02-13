#include<Arduino.h>
#include<Wiring.h>
#include <math.h>
#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/power.h>
#include <avr/pgmspace.h>
#include <avr/sleep.h>
#include <util/delay.h>
#include<Arduino.h>
#include "WConstants.h"
#include "Binary.h"

#define NOT_A_TIMER 0

#define TIMER0  1
#define TIMER0A 1
#define TIMER0B 2
#define TIMER1A 3
#define TIMER1B 4
#define TIMER1C 5
#define TIMER2  6
#define TIMER2A 6
#define TIMER2B 7
#define TIMER3A 8
#define TIMER3B 9
#define TIMER3C 10
#define TIMER4A 11
#define TIMER4B 12
#define TIMER4C 13
#define TIMER5A 14
#define TIMER5B 15
#define TIMER5C 16


#define POWER_ADC 0
#define POWER_SPI 1
#define POWER_WIRE 2
#define POWER_TIMER0 3
#define POWER_TIMER1 4
#define POWER_TIMER2 5
#define POWER_TIMER3 6
#define POWER_TIMER4 7
#define POWER_TIMER5 8
#define POWER_SERIAL0 9
#define POWER_SERIAL1 10
#define POWER_SERIAL2 11
#define POWER_SERIAL3 12
#define POWER_USB 13
#define POWER_ALL 14

#include "WPower.h"

#define SLEEP_IDLE 0
#define SLEEP_ADC 1
#define SLEEP_POWER_DOWN 2
#define SLEEP_POWER_SAVE 3
#define SLEEP_STANDBY 4
#define SLEEP_EXTENDED_STANDBY 5

#include "WSleep.h"



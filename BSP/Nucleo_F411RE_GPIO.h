#ifndef BSP_NUCLEO_F411RE_GPIO_H_
#define BSP_NUCLEO_F411RE_GPIO_H_

#include <stdint.h>


//Create a typedef defining a simple function pointer
//to be used for LED
typedef void (*GPIOFunc)(void);

//this struct holds function pointers to turn each LED
//on and off
typedef struct
{
	const GPIOFunc On;
	const GPIOFunc Off;
}LED;

uint_fast8_t ReadPushButton( void );

extern LED GreenLed;

#endif /* BSP_NUCLEO_F411RE_GPIO_H_ */

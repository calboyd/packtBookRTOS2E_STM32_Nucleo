/**
 * LED implementation for Green discrete LED on Nucleo-F411RE
 */

#include <Nucleo_F411RE_GPIO.h>
#include <stm32f4xx_hal.h>

void GreenOn ( void ) {HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);}
void GreenOff ( void ) {HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);}
LED GreenLed = { GreenOn, GreenOff };

uint_fast8_t ReadPushButton( void ){ return HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_13);}

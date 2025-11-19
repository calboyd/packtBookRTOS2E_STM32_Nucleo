/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

#include <stdlib.h>
#include <time.h>
// Include for using SEGGER_SYSVIEW_PrintfHost()
#include "../../Middleware/SystemView/SYSVIEW/SEGGER_SYSVIEW.h"

// Include for using the micro-second delay function
// * It is in the folder ../Inc/
#include "systick_timer_us_delay.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
/* USER CODE BEGIN PFP */

// Function declaration
uint32_t getRandomNumberInRange( uint32_t Min, uint32_t Max );

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

// Flag, shared by main() and the SysTick ISR
volatile uint8_t timerDone;

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  // ###############################################
  // Super-loop initialization
  // ###############################################

  // Indicates whether debug-messages are to be generated
  const uint8_t debug_generateMessages = 1;

  // Local variables
  uint32_t debug_timerDoneBeforeSleepCount = 0;
  uint32_t debug_superLoopIterationCount = 0;
  uint32_t doStuffTime_us;

  // Disable interrupts during initialization, before the super-loop
  __disable_irq();

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  /* USER CODE BEGIN 2 */

  // Initialize SEGGER SystemView
  if (debug_generateMessages == 1){
      SEGGER_SYSVIEW_Conf();
  }

  // Keep the debugger active, during and after sleep mode
  HAL_DBGMCU_EnableDBGSleepMode();

  // Initialize counter
  debug_superLoopIterationCount = 0;

  // Synchronize with SystemView Recorder and SysTick timer
  //
  // Enable IRQs, so the SysTick ISR can run, if it's pending
  __enable_irq();
  // __ISB() is a memory-barrier instruction.  It's needed after __enable_irq().
  __ISB(); // Allow pended interrupts to be recognized

  // If debug messages will be generated, wait for the user to start SystemView Recorder
  if (debug_generateMessages == 1){
      while(SEGGER_SYSVIEW_IsStarted()==0);
      SEGGER_SYSVIEW_PrintfHost("Super-loop starting...\n");
  }
  // Synchronize the super-loop's first iteration with the SysTick timer's period
  // Spin until the SysTick ISR runs
  timerDone = 0;
  while(timerDone==0);
  // Disable IRQs again.  IRQs should be disabled when the super-loop is entered.
  __disable_irq();

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */

  // #########################
  // The super-loop
  // #########################
  while (1)
  {
      // Enable interrupts
      __enable_irq();
      __ISB();

      // Set iteration variables
      //
      // Increment number of super-loop iterations
      debug_superLoopIterationCount++;
      // Set timer-done flag
      timerDone = 0;

      // ##################
      // Run functions
      // ##################

      // Generate a delay of random length, to simulate functions being run

      // Turn on the green LED.
      // * The pin can be attached to an oscilloscope, to measure the iteration
      //   period and how long the simulated functions take
      HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_SET);

      // Get a random-number.  It will be the delay length, in micro-seconds.
      doStuffTime_us = getRandomNumberInRange(200,600);
      // Delay (spin)
      delay_us(doStuffTime_us);
      //HAL_Delay(1);

      // Turn off the green LED.
      HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_RESET);

      // If the timer has already expired, then record that
      if ( timerDone == 1 )
      {
          debug_timerDoneBeforeSleepCount++;
          // Turn on blue LED
          // HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_RESET);
          if (debug_generateMessages == 1){
              SEGGER_SYSVIEW_PrintfHost("Iteration: %u,  debug_timerDoneBeforeSleepCount: %u\n",
                      debug_superLoopIterationCount, debug_timerDoneBeforeSleepCount);
          }
      }

      // ##################################################
      // Sleep for the remainder of the iteration period
      // ##################################################

      // Disable interrupts
      __disable_irq();

      // Sleep until the timer expires for the super-loop iteration
      //
      // When the timer expires, the timer's ISR will set timerDone to 0
      while (timerDone == 0) {

          // Sleep until there is a pending interrupt
          HAL_PWR_EnterSLEEPMode(0, PWR_SLEEPENTRY_WFI);

          // Enable interrupts, so that pending interrupts' ISRs can run
          __enable_irq();
          __ISB();
          // Disable interrupts
          __disable_irq();

      }  //  END: while (timerDone == 0)
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 16;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : B1_Pin */
  GPIO_InitStruct.Pin = B1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(B1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : USART_TX_Pin USART_RX_Pin */
  GPIO_InitStruct.Pin = USART_TX_Pin|USART_RX_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = GPIO_AF7_USART2;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pin : LD2_Pin */
  GPIO_InitStruct.Pin = LD2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LD2_GPIO_Port, &GPIO_InitStruct);

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/*
 Function:  getRandomNumberInRange()

 Title: Get a random-number, in a specified range

 Description:
 * Returns a random number, in the specified number-range.
 * The MCU's RNG is used.

 Parameters:
 * Specifies the number-range, for the returned random-number
 * The number-range includes the values in Min and Max
 * Requirements for valid values:
   * Max >= Min
   * Max and Min each must be between 0 and 0XFFFFFFFF, inclusive
   * (Max-Min+1) <= 0XFFFFFFFF

 Return: a random number, in the specified range

 */
uint32_t getRandomNumberInRange( uint32_t Min, uint32_t Max ){
        uint32_t randomNumber;
        if (Min > Max)
        {
        	Error_Handler();
        }
        srand(clock());
        randomNumber = (uint32_t)rand();

        return ( (randomNumber % ((Max-Min)+1)) + Min );

}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

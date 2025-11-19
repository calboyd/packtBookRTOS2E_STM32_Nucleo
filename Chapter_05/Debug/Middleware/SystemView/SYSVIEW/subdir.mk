################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middleware/SystemView/SYSVIEW/SEGGER_SYSVIEW.c 

OBJS += \
./Middleware/SystemView/SYSVIEW/SEGGER_SYSVIEW.o 

C_DEPS += \
./Middleware/SystemView/SYSVIEW/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
Middleware/SystemView/SYSVIEW/%.o Middleware/SystemView/SYSVIEW/%.su Middleware/SystemView/SYSVIEW/%.cyclo: ../Middleware/SystemView/SYSVIEW/%.c Middleware/SystemView/SYSVIEW/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Middleware/RTT/Config -I../Middleware/RTT/RTT -I../Middleware/SystemView/SEGGER -I../Middleware/SystemView/SYSVIEW -I../Middleware/SystemView/Config -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middleware-2f-SystemView-2f-SYSVIEW

clean-Middleware-2f-SystemView-2f-SYSVIEW:
	-$(RM) ./Middleware/SystemView/SYSVIEW/SEGGER_SYSVIEW.cyclo ./Middleware/SystemView/SYSVIEW/SEGGER_SYSVIEW.d ./Middleware/SystemView/SYSVIEW/SEGGER_SYSVIEW.o ./Middleware/SystemView/SYSVIEW/SEGGER_SYSVIEW.su

.PHONY: clean-Middleware-2f-SystemView-2f-SYSVIEW


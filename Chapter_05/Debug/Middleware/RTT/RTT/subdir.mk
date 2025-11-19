################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middleware/RTT/RTT/SEGGER_RTT.c \
../Middleware/RTT/RTT/SEGGER_RTT_printf.c 

S_UPPER_SRCS += \
../Middleware/RTT/RTT/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./Middleware/RTT/RTT/SEGGER_RTT.o \
./Middleware/RTT/RTT/SEGGER_RTT_ASM_ARMv7M.o \
./Middleware/RTT/RTT/SEGGER_RTT_printf.o 

S_UPPER_DEPS += \
./Middleware/RTT/RTT/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./Middleware/RTT/RTT/SEGGER_RTT.d \
./Middleware/RTT/RTT/SEGGER_RTT_printf.d 


# Each subdirectory must supply rules for building sources it contributes
Middleware/RTT/RTT/%.o Middleware/RTT/RTT/%.su Middleware/RTT/RTT/%.cyclo: ../Middleware/RTT/RTT/%.c Middleware/RTT/RTT/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Middleware/RTT/Config -I../Middleware/RTT/RTT -I../Middleware/SystemView/SEGGER -I../Middleware/SystemView/SYSVIEW -I../Middleware/SystemView/Config -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middleware/RTT/RTT/%.o: ../Middleware/RTT/RTT/%.S Middleware/RTT/RTT/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I../Middleware/SystemView/Config -I../Middleware/SystemView/SEGGER -I../Middleware/SystemView/SYSVIEW -I../Middleware/RTT/Config -I../Middleware/RTT/RTT -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Middleware-2f-RTT-2f-RTT

clean-Middleware-2f-RTT-2f-RTT:
	-$(RM) ./Middleware/RTT/RTT/SEGGER_RTT.cyclo ./Middleware/RTT/RTT/SEGGER_RTT.d ./Middleware/RTT/RTT/SEGGER_RTT.o ./Middleware/RTT/RTT/SEGGER_RTT.su ./Middleware/RTT/RTT/SEGGER_RTT_ASM_ARMv7M.d ./Middleware/RTT/RTT/SEGGER_RTT_ASM_ARMv7M.o ./Middleware/RTT/RTT/SEGGER_RTT_printf.cyclo ./Middleware/RTT/RTT/SEGGER_RTT_printf.d ./Middleware/RTT/RTT/SEGGER_RTT_printf.o ./Middleware/RTT/RTT/SEGGER_RTT_printf.su

.PHONY: clean-Middleware-2f-RTT-2f-RTT


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_GCC.c \
../Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_IAR.c \
../Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_KEIL.c \
../Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_SES.c 

OBJS += \
./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_GCC.o \
./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_IAR.o \
./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_KEIL.o \
./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_SES.o 

C_DEPS += \
./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_GCC.d \
./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_IAR.d \
./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_KEIL.d \
./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_SES.d 


# Each subdirectory must supply rules for building sources it contributes
Middleware/RTT/Syscalls/%.o Middleware/RTT/Syscalls/%.su Middleware/RTT/Syscalls/%.cyclo: ../Middleware/RTT/Syscalls/%.c Middleware/RTT/Syscalls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Middleware/RTT/Config -I../Middleware/RTT/RTT -I../Middleware/SystemView/SEGGER -I../Middleware/SystemView/SYSVIEW -I../Middleware/SystemView/Config -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middleware-2f-RTT-2f-Syscalls

clean-Middleware-2f-RTT-2f-Syscalls:
	-$(RM) ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_GCC.cyclo ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_GCC.d ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_GCC.o ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_GCC.su ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_IAR.cyclo ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_IAR.d ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_IAR.o ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_IAR.su ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_KEIL.cyclo ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_KEIL.d ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_KEIL.o ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_KEIL.su ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_SES.cyclo ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_SES.d ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_SES.o ./Middleware/RTT/Syscalls/SEGGER_RTT_Syscalls_SES.su

.PHONY: clean-Middleware-2f-RTT-2f-Syscalls


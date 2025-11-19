################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middleware/RTT/Examples/Main_RTT_InputEchoApp.c \
../Middleware/RTT/Examples/Main_RTT_MenuApp.c \
../Middleware/RTT/Examples/Main_RTT_PrintfTest.c \
../Middleware/RTT/Examples/Main_RTT_SpeedTestApp.c 

OBJS += \
./Middleware/RTT/Examples/Main_RTT_InputEchoApp.o \
./Middleware/RTT/Examples/Main_RTT_MenuApp.o \
./Middleware/RTT/Examples/Main_RTT_PrintfTest.o \
./Middleware/RTT/Examples/Main_RTT_SpeedTestApp.o 

C_DEPS += \
./Middleware/RTT/Examples/Main_RTT_InputEchoApp.d \
./Middleware/RTT/Examples/Main_RTT_MenuApp.d \
./Middleware/RTT/Examples/Main_RTT_PrintfTest.d \
./Middleware/RTT/Examples/Main_RTT_SpeedTestApp.d 


# Each subdirectory must supply rules for building sources it contributes
Middleware/RTT/Examples/%.o Middleware/RTT/Examples/%.su Middleware/RTT/Examples/%.cyclo: ../Middleware/RTT/Examples/%.c Middleware/RTT/Examples/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Middleware/RTT/Config -I../Middleware/RTT/RTT -I../Middleware/SystemView/SEGGER -I../Middleware/SystemView/SYSVIEW -I../Middleware/SystemView/Config -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middleware-2f-RTT-2f-Examples

clean-Middleware-2f-RTT-2f-Examples:
	-$(RM) ./Middleware/RTT/Examples/Main_RTT_InputEchoApp.cyclo ./Middleware/RTT/Examples/Main_RTT_InputEchoApp.d ./Middleware/RTT/Examples/Main_RTT_InputEchoApp.o ./Middleware/RTT/Examples/Main_RTT_InputEchoApp.su ./Middleware/RTT/Examples/Main_RTT_MenuApp.cyclo ./Middleware/RTT/Examples/Main_RTT_MenuApp.d ./Middleware/RTT/Examples/Main_RTT_MenuApp.o ./Middleware/RTT/Examples/Main_RTT_MenuApp.su ./Middleware/RTT/Examples/Main_RTT_PrintfTest.cyclo ./Middleware/RTT/Examples/Main_RTT_PrintfTest.d ./Middleware/RTT/Examples/Main_RTT_PrintfTest.o ./Middleware/RTT/Examples/Main_RTT_PrintfTest.su ./Middleware/RTT/Examples/Main_RTT_SpeedTestApp.cyclo ./Middleware/RTT/Examples/Main_RTT_SpeedTestApp.d ./Middleware/RTT/Examples/Main_RTT_SpeedTestApp.o ./Middleware/RTT/Examples/Main_RTT_SpeedTestApp.su

.PHONY: clean-Middleware-2f-RTT-2f-Examples


#ifndef __AT_UART_H__
#define __AT_UART_H__

#include "mcu.h"
#include "pdl_user.h"

#define AT_UART_CH &UART3

void init_at_uart();
uint8_t sendAtCommand(char * cmd);
void sendChar(char c);
int readAnswer(char* ptr);


#endif 
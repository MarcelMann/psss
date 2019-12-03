/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/
#include "mcu.h"
#include "pdl_header.h"
#include "at_uart.h"

#define SAMPLE_UART_RX_BUFFSIZE sizeof(text)/sizeof(char)
int main(void){	
    Uart_Io_Init();
    init_at_uart();
    printf("Welcome to use Cypress PDL 2.1!\n");
    char answer[10];
    sendAtCommand("blabla");
    readAnswer(answer);
}

/* [] END OF FILE */

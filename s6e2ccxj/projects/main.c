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
#include "delay.h"

 int main(void){	
    int i = 0;
		Uart_Io_Init();
    init_at_uart();
    printf("This is USB-Terminal 0.5s delay\n");    
    //sendAtCommand("This is AT-Terminal");   
    delay(500);

    sendAtCommand("AT");
    readAnswer();
    delay(1000);
    sendAtCommand("AT+CWMODE_CUR=1");
    readAnswer();
    delay(1000);
    sendAtCommand("AT+CWLAPOPT=1,14");
    readAnswer();
    delay(1000);
    sendAtCommand("AT+CWLAP");
    readAnswer();
    delay(1000);
    printf("Inf Loop\r\n");
    while(1){       
      delay(10000);               
    }
}

/* [] END OF FILE */

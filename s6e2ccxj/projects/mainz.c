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

#define SAMPLE_UART_RX_BUFFSIZE sizeof(text)/sizeof(char)


int main(void){	
		char answer[100]; 
    int i = 0;
		Uart_Io_Init();
    init_at_uart();
	Mfs_Uart_EnableIrq(AT_UART_CH, UartRxIrq);
    printf("Welcome\r\n");    
    sendAtCommand("This is AT-Terminal");   
    
    while(1){      
      printf("Secs: %d\r\n", i++);
      if (stcRxFifoInfo.bRxFinish == TRUE){
        printf("sucess\r\n");
      }
      delay(1000);
    }
}

/* [] END OF FILE */

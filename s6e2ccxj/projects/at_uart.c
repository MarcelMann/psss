#include "at_uart.h"
#include "mfs\mfs.h"
#include "gpio\gpio.h"   

uint8_t sendAtCommand(char* cmd){
	while(*cmd != '\0'){
        sendChar(*cmd);
        cmd++;
	}
	sendChar('\r');
	sendChar('\n');
	return 0;
}
int readAnswer(char* ptr){
	while (TRUE != Mfs_Uart_GetStatus(AT_UART_CH, UartRxFull)){}
	*ptr++ = (char)Mfs_Uart_ReceiveData(AT_UART_CH);
	return 0;	
}

void sendChar(char c){
	while (TRUE != Mfs_Uart_GetStatus(AT_UART_CH, UartTxEmpty)); /* wait until TX buffer empty */
    Mfs_Uart_SendData(AT_UART_CH, c); 
}
void init_at_uart(){
    stc_mfs_uart_config_t stcUartConfig;
    PDL_ZERO_STRUCT(stcUartConfig);

    /* Initialize UART */
    stcUartConfig.enMode         = UartNormal;
    stcUartConfig.u32BaudRate    = 115200;
    stcUartConfig.enDataLength   = UartEightBits;
    stcUartConfig.enParity       = UartParityNone;
    stcUartConfig.enStopBit      = UartOneStopBit;
    stcUartConfig.enBitDirection = UartDataLsbFirst;
    stcUartConfig.bInvertData    = FALSE;
    stcUartConfig.bHwFlow        = FALSE;
    stcUartConfig.pstcFifoConfig = NULL;
    
    Mfs_Uart_Init(AT_UART_CH, &stcUartConfig);

    SetPinFunc_SOT3_1();    
    Mfs_Uart_EnableFunc(AT_UART_CH, UartTx);    
    SetPinFunc_SIN3_1();
    Mfs_Uart_EnableFunc(AT_UART_CH, UartRx);
}





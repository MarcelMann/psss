/******************************************************************************/
/* Include files                                                              */
/******************************************************************************/
#include "pdl_header.h"
#include "delay.h"

#define AT_UART_CH &UART3
         

stc_mfs_uart_config_t stcUartConfig;
stc_mfs_fifo_config_t stcFifoConfig;
stc_uart_irq_cb_t stcUart6IrqCb;
stc_rx_fifo_info_t stcRxFifoInfo = {0};

/******************************************************************************/
/* Local variable definitions ('static')                                      */
/******************************************************************************/

static uint8_t au8UartRxBuf[SAMPLE_UART_RX_BUFFSIZE];


/*******************************************************************************
* Function Name: InitUart
********************************************************************************
* Initialization of the UART
*******************************************************************************/
void InitUart(void)
{   
    stcRxFifoInfo.u32RxCnt = SAMPLE_UART_RX_BUFFSIZE;
    stcRxFifoInfo.pRxBuf = au8UartRxBuf;
    stcRxFifoInfo.bRxFinish = FALSE;
    
    /* Clear all configuration structures */
    PDL_ZERO_STRUCT(stcUartConfig);
    PDL_ZERO_STRUCT(stcFifoConfig);
    PDL_ZERO_STRUCT(stcUart6IrqCb);
    
    /* Initialize FIFO configuration */
    stcFifoConfig.enFifoSel = MfsTxFifo1RxFifo2;
    stcFifoConfig.u8ByteCount1 = 0;
    stcFifoConfig.u8ByteCount2 = 8;
    
    /* Initialize interrupt callback structure */
    stcUart6IrqCb.pfnRxIrqCb = Uart6RxIntCallback;
    
    /* Initialize UART TX and RX channel */
    stcUartConfig.enMode = UartNormal;
    stcUartConfig.u32BaudRate = 115200;
    stcUartConfig.enDataLength = UartEightBits;
    stcUartConfig.enParity = UartParityNone;
    stcUartConfig.enStopBit = UartOneStopBit;
    stcUartConfig.enBitDirection = UartDataLsbFirst; 
    stcUartConfig.bInvertData = FALSE;
    stcUartConfig.bHwFlow = FALSE;
    stcUartConfig.pstcFifoConfig = &stcFifoConfig;
    stcUartConfig.bUseExtClk = FALSE;
    stcUartConfig.pstcIrqEn = NULL;
    stcUartConfig.bTouchNvic = TRUE;
    
    /* The configuration is same for both channels except interrupt callback functions */
    stcUartConfig.pstcIrqCb = &stcUart6IrqCb; 
    Mfs_Uart_Init(AT_UART_CH, &stcUartConfig);
}

int readAnswer(void){//char* ptr){
	int length=0;
    char answer[100];
    int p = 0;
	do{
		while (TRUE != Mfs_Uart_GetStatus(AT_UART_CH, UartRxFull));
                answer[p] = (char)Mfs_Uart_ReceiveData(AT_UART_CH);
                printf("received char: '%c'\r\n", (char)answer[p]);
                p++;length++;
	}while(answer[p-1] != '\n');
        
        printf("");
        answer[p++]='\0';
        printf("done: \"%s\"", answer);
	return length;	
}
void sendChar(char c){
	while (TRUE != Mfs_Uart_GetStatus(AT_UART_CH, UartTxEmpty)); /* wait until TX buffer empty */
    Mfs_Uart_SendData(AT_UART_CH, c); 
}
uint8_t sendAtCommand(char* cmd){
  printf("Command\n");
	while(*cmd != '\0'){
        sendChar(*cmd);
        cmd++;
	}
	sendChar('\r');
	sendChar('\n');
        //char* ptr;
  printf("reading");
        readAnswer();
	return 0;
}

int main(void)
{   
    Uart_Io_Init();
    /* Initialize UART function I/O */
    SetPinFunc_SIN3_1();
    SetPinFunc_SOT3_1();
    
    /* UART initialization */
    InitUart();
    
    /* Enable RX function of UART6 */
    Mfs_Uart_EnableFunc(AT_UART_CH, UartRx);
    Mfs_Uart_EnableFunc(AT_UART_CH, UartTx);
    /* Configure interrupt */    
    
    
    printf("This is Board\n");
    sendAtCommand("This is AT-Terminal");

    int i = 0;
    Mfs_Uart_EnableIrq(AT_UART_CH, UartRxIrq);
    while(stcRxFifoInfo.bRxFinish != TRUE)
    {
      /* Wait while all data is not sent */
      delay(1000);
      printf("Counter: [%d]\n", i++);
  	  printf("u32RxCnt: [%d]\n", stcRxFifoInfo.u32RxCnt);
	    printf("pRxBuf: [%d]\n\n", *stcRxFifoInfo.pRxBuf);
                
    }
    printf("sucess\n");

    Mfs_Uart_DeInit(AT_UART_CH, TRUE);
   
}


/* [] END OF FILE */

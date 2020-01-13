#include "at_uart.h"
#include "mfs\mfs.h"
#include "gpio\gpio.h"   
#include "pdl_header.h"
#define SAMPLE_UART_FIFO_RX_CNT               (8u)



static uint8_t au8UartRxBuf[100];
static uint8_t u8RxCnt=0;
stc_rx_fifo_info_t stcRxFifoInfo = {0};

struct stc_rx_fifo_info{
    uint32_t u32RxCnt;
    uint8_t* pRxBuf;
    boolean_t bRxFinish;    
};

uint8_t sendAtCommand(char* cmd){
	while(*cmd != '\0'){
        sendChar(*cmd);
        cmd++;
	}
	sendChar('\r');
	sendChar('\n');
        //char* ptr;
        //readAnswer();
	return 0;
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

void UartRxIntCallback(void){
    printf("Callback called");
    au8UartRxBuf[u8RxCnt] = Mfs_Uart_ReceiveData(AT_UART_CH);
    if(au8UartRxBuf[u8RxCnt] == '\n')      printf("complete\r\n");
    u8RxCnt++;
}
void UartRxIntCallback2(void){
    printf("Callback 2 called");
    uint8_t u8i = 0;
    if(stcRxFifoInfo.u32RxCnt > SAMPLE_UART_FIFO_RX_CNT) 
    {
        /* Receive data when RX FIFO count match with SAMPLE_UART_FIFO_RX_CNT */
        while(u8i < SAMPLE_UART_FIFO_RX_CNT)
        {
            *stcRxFifoInfo.pRxBuf++ = Mfs_Uart_ReceiveData(AT_UART_CH); 
            u8i++;
        }
        stcRxFifoInfo.u32RxCnt -= SAMPLE_UART_FIFO_RX_CNT;
        return;
    }
    
    /* Receive data when RX FIFO is idle */
    /* idle means FIFO count is less than SAMPLE_UART_FIFO_RX_CNT and
       RX FIFO don't receive data from then on for a short time. */
    while(u8i < stcRxFifoInfo.u32RxCnt)
    {
        *stcRxFifoInfo.pRxBuf++ = Mfs_Uart_ReceiveData(AT_UART_CH);
        u8i++;
    }
    
    Mfs_Uart_DisableIrq(AT_UART_CH, UartRxIrq);
    
    stcRxFifoInfo.bRxFinish = TRUE;
}


void init_at_uart(){
	//stcRxFifoInfo = {0};    
	
	stcRxFifoInfo.u32RxCnt = SAMPLE_UART_RX_BUFFSIZE;
    stcRxFifoInfo.pRxBuf = au8UartRxBuf;
    stcRxFifoInfo.bRxFinish = FALSE;
	
	stcRxFifoInfo.u32RxCnt = 100;
    stcRxFifoInfo.pRxBuf = au8UartRxBuf;
    stcRxFifoInfo.bRxFinish = FALSE;

    stc_mfs_uart_config_t stcUartConfig;
    stc_mfs_fifo_config_t stcFifoConfig;
	stc_uart_irq_cb_t stcUartIrqCb;

    PDL_ZERO_STRUCT(stcUartConfig);
    PDL_ZERO_STRUCT(stcFifoConfig);
	PDL_ZERO_STRUCT(stcUartIrqCb);
    
	// Set IRQ
	stcUartIrqCb.pfnRxIrqCb = UartRxIntCallback2;
	
    /* Initialize UART */
    stcUartConfig.enMode         = UartNormal;
    stcUartConfig.u32BaudRate    = 115200;
    stcUartConfig.enDataLength   = UartEightBits;
    stcUartConfig.enParity       = UartParityNone;
    stcUartConfig.enStopBit      = UartOneStopBit;
    stcUartConfig.enBitDirection = UartDataLsbFirst;
    stcUartConfig.bInvertData    = FALSE;
    stcUartConfig.bHwFlow        = FALSE;
    stcUartConfig.bUseExtClk 	 = FALSE;
    stcUartConfig.bTouchNvic 	 = TRUE;
	
	// NULL for some reason
	stcUartConfig.pstcIrqEn = NULL;
	stcUartConfig.pstcIrqCb = &stcUartIrqCb;
	
	// Config FIFO
	stcFifoConfig.enFifoSel = MfsTxFifo1RxFifo2;
    stcFifoConfig.u8ByteCount1 = 0;
    stcFifoConfig.u8ByteCount2 = 8;
	
	// Enable/Disable FIFO config
	stcUartConfig.pstcFifoConfig = &stcFifoConfig;
    stcUartConfig.pstcFifoConfig = NULL;
	
	stcUartIrqCb.pfnRxIrqCb = UartRxIntCallback;
    
    Mfs_Uart_Init(AT_UART_CH, &stcUartConfig);

    SetPinFunc_SOT3_1();    
    Mfs_Uart_EnableFunc(AT_UART_CH, UartTx);    
    SetPinFunc_SIN3_1();
    Mfs_Uart_EnableFunc(AT_UART_CH, UartRx);
}
#include "at_uart.h"
#include "mfs\mfs.h"
#include "gpio\gpio.h"   
#include "pdl_header.h"
#define SAMPLE_UART_FIFO_RX_CNT               (8u)



uint8_t sendAtCommand(char* cmd){
  //printf("sending [%s]\n", cmd);
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
#define ANSWER_MAX_LINES 20
#define ANSWER_MAX_LENGTH 100
#define OK_LINE "OK\r\n"
#define ERROR_LINE "ERROR\r\n"
int wasLastLine(char * line){
  //printf("OK:    [%s]\n", OK_LINE);
  //printf("ERROR: [%s]\n", ERROR_LINE);
  //printf("LINE:  [%s]\n", line);
  int result = !strcmp(line, OK_LINE) || !strcmp(line, ERROR_LINE);
  //printf("compare result: [%d]\n", result);
  return result;
}


int readAnswer(void){
  printf("Receiving Answer\n");
  //printf("\\n is [%d]", '\n');
  int l, c, i;
  char answer[ANSWER_MAX_LINES][ANSWER_MAX_LENGTH];//={"","","","",""};
  
  int lineLengths[ANSWER_MAX_LINES];
  for (i = 0; i<ANSWER_MAX_LINES; i++) lineLengths[i]=0;
  
  
  // iterate over lines, until line is OK or ERROR 
  for(l=0; l<ANSWER_MAX_LINES; l++){
    //printf("reading in Line [%d]\n", l);       
    // iterate over chars in line
    for(c=0; c<ANSWER_MAX_LENGTH && answer[l][c-1] != '\n'; c++){
		  while (TRUE != Mfs_Uart_GetStatus(AT_UART_CH, UartRxFull));
      answer[l][c] = (char)Mfs_Uart_ReceiveData(AT_UART_CH);
      lineLengths[l]++;
      //printf("a%d%d=[%c]\n", l,c,(char)answer[l][c],(char)answer[l][c]);
    }
    
    answer[l][lineLengths[l]]='\0';
    //printf("L%d[%s]\n", l, answer[l]);
    if(wasLastLine(answer[l])){
      //printf("Line ended by OK or ERROR");
      break;
    }
	}  
  //printf("reading done");
  i=0;
  while(lineLengths[i] != 0 && i < ANSWER_MAX_LINES){
    printf("L%d: [%s]\n", i, answer[i]);
    i++;
  }
  return ;	
}

void sendChar(char c){
	while (TRUE != Mfs_Uart_GetStatus(AT_UART_CH, UartTxEmpty)); /* wait until TX buffer empty */
    Mfs_Uart_SendData(AT_UART_CH, c); 
}
void UartRxIntCallback(void){
  readAnswer();
}



void init_at_uart(){
	
  stc_mfs_uart_config_t stcUartConfig;
  stc_mfs_fifo_config_t stcFifoConfig;
	

  PDL_ZERO_STRUCT(stcUartConfig);
  PDL_ZERO_STRUCT(stcFifoConfig);
	/*
  stc_uart_irq_cb_t stcUartIrqCb;
  PDL_ZERO_STRUCT(stcUartIrqCb);
  stcUartIrqCb.pfnRxIrqCb = UartRxIntCallback;
	stcUartConfig.pstcIrqCb = &stcUartIrqCb;
  */
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

	
	// Config FIFO
  stcFifoConfig.enFifoSel = MfsTxFifo1RxFifo2;
  stcFifoConfig.u8ByteCount1 = 0;
  stcFifoConfig.u8ByteCount2 = 128;
	
	// Enable/Disable FIFO config
	stcUartConfig.pstcFifoConfig = &stcFifoConfig;

  
  Mfs_Uart_Init(AT_UART_CH, &stcUartConfig);

  SetPinFunc_SOT3_1();    
  Mfs_Uart_EnableFunc(AT_UART_CH, UartTx);    
  SetPinFunc_SIN3_1();
  Mfs_Uart_EnableFunc(AT_UART_CH, UartRx);
  
  //Mfs_Uart_EnableIrq(AT_UART_CH, UartRxIrq);
}
/*******************************************************************************
* \file             main.c
* 
* \version          1.10
*
* \brief            Demo the communication between UART3 and UART6
*
********************************************************************************
* \copyright
* Copyright 2016, Cypress Semiconductor Corporation. All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
* CYPRESS PROVIDES THIS SOFTWARE "AS IS" AND MAKES NO WARRANTY
* OF ANY KIND, EXPRESS OR IMPLIED, WITH REGARD TO THIS SOFTWARE,
* INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR
* PURPOSE.
*******************************************************************************/

/******************************************************************************/
/* Include files                                                              */
/******************************************************************************/
#include "pdl_header.h"

/******************************************************************************/
/* Local pre-processor symbols/macros ('#define')                             */
/******************************************************************************/
#define SAMPLE_UART_RX_BUFFSIZE sizeof(au8UartTxBuf)/sizeof(char)
#define SAMPLE_UART_TX_BUFFSIZE SAMPLE_UART_RX_BUFFSIZE

#if (PDL_MCU_CORE == PDL_FM0P_CORE)
#if (PDL_MCU_TYPE == PDL_FM0P_TYPE1) || (PDL_MCU_TYPE == PDL_FM0P_TYPE2)
#define SAMPLE_UART_FIFO_MAX_CAPACITY         (128u)
#else
#define SAMPLE_UART_FIFO_MAX_CAPACITY         (64u)
#endif
#elif (PDL_MCU_CORE == PDL_FM4_CORE)          
#define SAMPLE_UART_FIFO_MAX_CAPACITY         (64u)
#elif (PDL_MCU_CORE == PDL_FM3_CORE)          
#define SAMPLE_UART_FIFO_MAX_CAPACITY         (16u)
#endif

#define SAMPLE_UART_FIFO_RX_CNT               (8u)

/*******************************************************************************
* UART TX FIFO information structure 
*******************************************************************************/
typedef struct stc_tx_fifo_info
{
    uint32_t u32TxCnt;
    uint8_t* pTxBuf;
    boolean_t bTxFinish;
    
}stc_tx_fifo_info_t;

/*******************************************************************************
* UART RX FIFO information structure
*******************************************************************************/
typedef struct stc_rx_fifo_info
{
    uint32_t u32RxCnt;
    uint8_t* pRxBuf;
    boolean_t bRxFinish;
    
}stc_rx_fifo_info_t;

/******************************************************************************/
/* Global variable definitions (declared in header file with 'extern')        */
/******************************************************************************/
stc_mfs_uart_config_t stcUartConfig;
stc_mfs_fifo_config_t stcFifoConfig;
stc_uart_irq_cb_t stcUART3IrqCb, stcUart6IrqCb;
stc_tx_fifo_info_t stcTxFifoInfo = {0};
stc_rx_fifo_info_t stcRxFifoInfo = {0};

/******************************************************************************/
/* Local variable definitions ('static')                                      */
/******************************************************************************/
volatile stc_mfsn_uart_t* UartCh3 = &UART3;
volatile stc_mfsn_uart_t* UartCh6 = &UART6;
static uint8_t au8UartTxBuf[200] = "bcbvdfghfghjfhdg";//Data sent from UART3 to UART6";
static uint8_t au8UartRxBuf[SAMPLE_UART_RX_BUFFSIZE];

/******************************************************************************/
/* Function implementation - global ('extern') and local ('static')           */
/******************************************************************************/

/*******************************************************************************
* Function Name: CompareData
********************************************************************************
* Compare each data in the input two buffers
*
* \param pBuf1      First buffer
*
* \param pBuf2      Second buffer
* 
* \param u8Length   Buffer length 
*       
* \return Ok        The data in a buffer1 are the same with that in a buffer2
* \return Error     The data in the buffer1 are not the same with that in the 
*                   buffer2 
*******************************************************************************/
static en_result_t CompareData(uint8_t* pBuf1, uint8_t* pBuf2, uint8_t u8Length)
{
    while(u8Length--)
    {
        if(*pBuf1++ != *pBuf2++)
        {
            return Error;
        }
    }
    return Ok;
}

/*******************************************************************************
* Function Name: UART3FifoTxIntCallback
********************************************************************************
* UART3 FIFO TX interrupt callback function
*******************************************************************************/
void UART3FifoTxIntCallback(void)
{
    uint8_t u8i = 0;
    if(stcTxFifoInfo.u32TxCnt > SAMPLE_UART_FIFO_MAX_CAPACITY)
    {
        while(u8i < SAMPLE_UART_FIFO_MAX_CAPACITY)
        {
            Mfs_Uart_SendData(UartCh3, *stcTxFifoInfo.pTxBuf++);
            u8i++;
        }
        stcTxFifoInfo.u32TxCnt -= SAMPLE_UART_FIFO_MAX_CAPACITY;
        return;
    }
    
    while(u8i < stcTxFifoInfo.u32TxCnt)
    {
        Mfs_Uart_SendData(UartCh3, *stcTxFifoInfo.pTxBuf++);
        u8i++;
    }
  
    Mfs_Uart_DisableIrq(UartCh3, UartTxFifoIrq);
    
    stcTxFifoInfo.bTxFinish = TRUE;
}

/*******************************************************************************
* Function Name: Uart6RxIntCallback
********************************************************************************
* UART3 RX interrupt callback function
*******************************************************************************/
void Uart6RxIntCallback(void)
{
    uint8_t u8i = 0;
    if(stcRxFifoInfo.u32RxCnt > SAMPLE_UART_FIFO_RX_CNT) 
    {
        /* Receive data when RX FIFO count match with SAMPLE_UART_FIFO_RX_CNT */
        while(u8i < SAMPLE_UART_FIFO_RX_CNT)
        {
            *stcRxFifoInfo.pRxBuf++ = Mfs_Uart_ReceiveData(UartCh6); 
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
        *stcRxFifoInfo.pRxBuf++ = Mfs_Uart_ReceiveData(UartCh6);
        u8i++;
    }
    
    Mfs_Uart_DisableIrq(UartCh6, UartRxIrq);
    
    stcRxFifoInfo.bRxFinish = TRUE;
}

/*******************************************************************************
* Function Name: InitUart
********************************************************************************
* Initialization of the UART
*******************************************************************************/
void InitUart(void)
{
    /* Initialize the FIFO information */
    stcTxFifoInfo.u32TxCnt = SAMPLE_UART_TX_BUFFSIZE;
    stcTxFifoInfo.pTxBuf = au8UartTxBuf;
    stcTxFifoInfo.bTxFinish = FALSE;
    
    stcRxFifoInfo.u32RxCnt = SAMPLE_UART_RX_BUFFSIZE;
    stcRxFifoInfo.pRxBuf = au8UartRxBuf;
    stcRxFifoInfo.bRxFinish = FALSE;
    
    /* Clear all configuration structures */
    PDL_ZERO_STRUCT(stcUartConfig);
    PDL_ZERO_STRUCT(stcFifoConfig);
    PDL_ZERO_STRUCT(stcUART3IrqCb);
    PDL_ZERO_STRUCT(stcUart6IrqCb);
    
    /* Initialize FIFO configuration */
    stcFifoConfig.enFifoSel = MfsTxFifo1RxFifo2;
    stcFifoConfig.u8ByteCount1 = 0;
    stcFifoConfig.u8ByteCount2 = 8;
    
    /* Initialize interrupt callback structure */
    stcUART3IrqCb.pfnTxFifoIrqCb = UART3FifoTxIntCallback;
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
    stcUartConfig.pstcIrqCb = &stcUART3IrqCb;
    stcUartConfig.bTouchNvic = TRUE;
    Mfs_Uart_Init(UartCh3, &stcUartConfig);
    
    /* The configuration is same for both channels except interrupt callback functions */
    stcUartConfig.pstcIrqCb = &stcUart6IrqCb; 
    Mfs_Uart_Init(UartCh6, &stcUartConfig);
}

/*******************************************************************************
* Function Name: main
********************************************************************************
* Main function of project for FM family.
*
* \return int return value, if needed
*******************************************************************************/
int main(void)
{   
    /* Initialize UART function I/O */
    SetPinFunc_SIN3_1();
    SetPinFunc_SOT3_1();
    SetPinFunc_SIN6_1();
    SetPinFunc_SOT6_1();
    
    /* UART initialization */
    InitUart();
    Uart_Io_Init();
    
    printf("Start");
    
    /* Enable RX function of UART6 */
    Mfs_Uart_EnableFunc(UartCh6, UartRx);
    /* Enable TX function of UART3 */
    Mfs_Uart_EnableFunc(UartCh3, UartTx);
    
    /* Configure interrupt */    
    Mfs_Uart_EnableIrq(UartCh6, UartRxIrq);
    Mfs_Uart_EnableIrq(UartCh3, UartTxFifoIrq);
    
    while(stcRxFifoInfo.bRxFinish != TRUE)
    {
        /* Wait while all data is not sent */        
    }
        
    Mfs_Uart_DeInit(UartCh3, TRUE);
    Mfs_Uart_DeInit(UartCh6, TRUE);
    
    /* Compare receive data with transfer data */
    if(Error == CompareData(au8UartTxBuf, au8UartRxBuf, SAMPLE_UART_RX_BUFFSIZE))
    {
        while(1)
        {
            /* If code runs here, the communicate error occurs */
          
        }
        printf("PIMMEL");
    }    
    printf("PENIS");
    while(1)
    {
        /* Data is normally sent and received */
      
    } 
}


/* [] END OF FILE */

/*******************************************************************************
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

                MODULE  ?cstartup

                ;; Forward declaration of sections.
                SECTION CSTACK:DATA:NOROOT(3)

                SECTION .intvec:CODE:NOROOT(2)

                EXTERN  __iar_program_start
                EXTERN  SystemInit
                PUBLIC  __vector_table

                DATA
__vector_table  DCD     sfe(CSTACK)               ; Top of Stack
		        DCD     Reset_Handler             ; Reset
                DCD     NMI_Handler               ; NMI
                DCD     HardFault_Handler         ; Hard Fault
                DCD     MemManage_Handler         ; MPU Fault
                DCD     BusFault_Handler          ; Bus Fault
                DCD     UsageFault_Handler        ; Usage Fault
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall
                DCD     DebugMon_Handler          ; Debug Monitor
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV
                DCD     SysTick_Handler           ; SysTick

; Numbered IRQ handler vectors

; Note: renaming to device dependent ISR function names are done in
;       pdl.h (section "IRQ name definition for all type MCUs"

                DCD     CSV_IRQHandler
                DCD     SWDT_IRQHandler
                DCD     LVD_IRQHandler
                DCD     IRQ003SEL_IRQHandler
                DCD     IRQ004SEL_IRQHandler
                DCD     IRQ005SEL_IRQHandler
                DCD     IRQ006SEL_IRQHandler
                DCD     IRQ007SEL_IRQHandler
                DCD     IRQ008SEL_IRQHandler
                DCD     IRQ009SEL_IRQHandler
                DCD     IRQ010SEL_IRQHandler
                DCD     EXINT0_IRQHandler
                DCD     EXINT1_IRQHandler
                DCD     EXINT2_IRQHandler
                DCD     EXINT3_IRQHandler
                DCD     EXINT4_IRQHandler
                DCD     EXINT5_IRQHandler
                DCD     EXINT6_IRQHandler
                DCD     EXINT7_IRQHandler
                DCD     QPRC0_IRQHandler
                DCD     QPRC1_IRQHandler
                DCD     MFT0_WFG_DTIF_IRQHandler
                DCD     MFT1_WFG_DTIF_IRQHandler
                DCD     MFT2_WFG_DTIF_IRQHandler
                DCD     MFT0_FRT_PEAK_IRQHandler
                DCD     MFT0_FRT_ZERO_IRQHandler
                DCD     MFT0_ICU_IRQHandler
                DCD     MFT0_OCU_IRQHandler
                DCD     MFT1_FRT_PEAK_IRQHandler
                DCD     MFT1_FRT_ZERO_IRQHandler
                DCD     MFT1_ICU_IRQHandler
                DCD     MFT1_OCU_IRQHandler
                DCD     MFT2_FRT_PEAK_IRQHandler
                DCD     MFT2_FRT_ZERO_IRQHandler
                DCD     MFT2_ICU_IRQHandler
                DCD     MFT2_OCU_IRQHandler
                DCD     PPG00_02_04_IRQHandler
                DCD     PPG08_10_12_IRQHandler
                DCD     PPG16_18_20_IRQHandler
                DCD     BT0_IRQHandler
                DCD     BT1_IRQHandler
                DCD     BT2_IRQHandler
                DCD     BT3_IRQHandler
                DCD     BT4_IRQHandler
                DCD     BT5_IRQHandler
                DCD     BT6_IRQHandler
                DCD     BT7_IRQHandler
                DCD     DT_IRQHandler
                DCD     WC_IRQHandler
                DCD     EXTBUS_ERR_IRQHandler
                DCD     RTC_IRQHandler
                DCD     EXINT8_IRQHandler
                DCD     EXINT9_IRQHandler
                DCD     EXINT10_IRQHandler
                DCD     EXINT11_IRQHandler
                DCD     EXINT12_IRQHandler
                DCD     EXINT13_IRQHandler
                DCD     EXINT14_IRQHandler
                DCD     EXINT15_IRQHandler
                DCD     TIM_IRQHandler
                DCD     MFS0_RX_IRQHandler
                DCD     MFS0_TX_IRQHandler
                DCD     MFS1_RX_IRQHandler
                DCD     MFS1_TX_IRQHandler
                DCD     MFS2_RX_IRQHandler
                DCD     MFS2_TX_IRQHandler
                DCD     MFS3_RX_IRQHandler
                DCD     MFS3_TX_IRQHandler
                DCD     MFS4_RX_IRQHandler
                DCD     MFS4_TX_IRQHandler
                DCD     MFS5_RX_IRQHandler
                DCD     MFS5_TX_IRQHandler
                DCD     MFS6_RX_IRQHandler
                DCD     MFS6_TX_IRQHandler
                DCD     MFS7_RX_IRQHandler
                DCD     MFS7_TX_IRQHandler
                DCD     ADC0_IRQHandler
                DCD     ADC1_IRQHandler
                DCD     USB0_F_IRQHandler
                DCD     USB0_H_F_IRQHandler
                DCD     CAN0_IRQHandler
                DCD     CAN1_CANFD0_IRQHandler
                DCD     ETHER0_IRQHandler
                DCD     DMAC0_IRQHandler
                DCD     DMAC1_IRQHandler
                DCD     DMAC2_IRQHandler
                DCD     DMAC3_IRQHandler
                DCD     DMAC4_IRQHandler
                DCD     DMAC5_IRQHandler
                DCD     DMAC6_IRQHandler
                DCD     DMAC7_IRQHandler
                DCD     DSTC_IRQHandler
                DCD     EXINT16_19_IRQHandler
                DCD     EXINT20_23_IRQHandler
                DCD     EXINT24_27_IRQHandler
                DCD     EXINT28_31_IRQHandler
                DCD     QPRC2_IRQHandler
                DCD     QPRC3_IRQHandler
                DCD     BT8_IRQHandler
                DCD     BT9_IRQHandler
                DCD     BT10_IRQHandler
                DCD     BT11_IRQHandler
                DCD     BT12_15_IRQHandler
                DCD     MFS8_RX_IRQHandler
                DCD     MFS8_TX_IRQHandler
                DCD     MFS9_RX_IRQHandler
                DCD     MFS9_TX_IRQHandler
                DCD     MFS10_RX_IRQHandler
                DCD     MFS10_TX_IRQHandler
                DCD     MFS11_RX_IRQHandler
                DCD     MFS11_TX_IRQHandler
                DCD     ADC2_IRQHandler
                DCD     DSTC_HW_IRQHandler
                DCD     USB1_F_IRQHandler
                DCD     USB1_H_F_IRQHandler
                DCD     HSSPI_IRQHandler
                DCD     Dummy
                DCD     PCRC_I2S0_1_IRQHandler
                DCD     SD_IRQHandler
                DCD     FLASHIF_IRQHandler
                DCD     MFS12_RX_IRQHandler
                DCD     MFS12_TX_IRQHandler
                DCD     MFS13_RX_IRQHandler
                DCD     MFS13_TX_IRQHandler
                DCD     MFS14_RX_IRQHandler
                DCD     MFS14_TX_IRQHandler
                DCD     MFS15_RX_IRQHandler
                DCD     MFS15_TX_IRQHandler


                THUMB
; Dummy Exception Handlers (infinite loops which can be modified)

                PUBWEAK Reset_Handler
                SECTION .text:CODE:REORDER:NOROOT(2)
Reset_Handler

                LDR.W R0, =0xE000ED88            ; CPACR is located at address 0xE000ED88
                LDR R1, [R0]                     ; Read CPACR
                ORR R1, R1, #(0xF << 20)         ; Set bits 20-23 to enable CP10 and CP11 coprocessors
                STR R1, [R0]                     ; Write back the modified value to the CPACR

                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__iar_program_start
                BX      R0
                
                PUBWEAK NMI_Handler
                SECTION .text:CODE:REORDER:NOROOT(1)
NMI_Handler
                B       NMI_Handler

                PUBWEAK HardFault_Handler
                SECTION .text:CODE:REORDER:NOROOT(1)
HardFault_Handler
                B       HardFault_Handler

                PUBWEAK MemManage_Handler
                SECTION .text:CODE:REORDER:NOROOT(1)
MemManage_Handler
                B       MemManage_Handler

                PUBWEAK BusFault_Handler
                SECTION .text:CODE:REORDER:NOROOT(1)
BusFault_Handler
                B       BusFault_Handler

                PUBWEAK UsageFault_Handler
                SECTION .text:CODE:REORDER:NOROOT(1)
UsageFault_Handler
                B       UsageFault_Handler

                PUBWEAK SVC_Handler
                SECTION .text:CODE:REORDER:NOROOT(1)
SVC_Handler
                B       SVC_Handler

                PUBWEAK DebugMon_Handler
                SECTION .text:CODE:REORDER:NOROOT(1)
DebugMon_Handler
                B       DebugMon_Handler

                PUBWEAK PendSV_Handler
                SECTION .text:CODE:REORDER:NOROOT(1)
PendSV_Handler
                B       PendSV_Handler

                PUBWEAK SysTick_Handler
                SECTION .text:CODE:REORDER:NOROOT(1)
SysTick_Handler
                B       SysTick_Handler

                
                PUBWEAK CSV_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
CSV_IRQHandler
                B       CSV_IRQHandler

                PUBWEAK SWDT_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
SWDT_IRQHandler
                B       SWDT_IRQHandler

                PUBWEAK LVD_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
LVD_IRQHandler
                B       LVD_IRQHandler

                PUBWEAK IRQ003SEL_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
IRQ003SEL_IRQHandler
                B       IRQ003SEL_IRQHandler

                PUBWEAK IRQ004SEL_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
IRQ004SEL_IRQHandler
                B       IRQ004SEL_IRQHandler

                PUBWEAK IRQ005SEL_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
IRQ005SEL_IRQHandler
                B       IRQ005SEL_IRQHandler

                PUBWEAK IRQ006SEL_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
IRQ006SEL_IRQHandler
                B       IRQ006SEL_IRQHandler

                PUBWEAK IRQ007SEL_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
IRQ007SEL_IRQHandler
                B       IRQ007SEL_IRQHandler

                PUBWEAK IRQ008SEL_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
IRQ008SEL_IRQHandler
                B       IRQ008SEL_IRQHandler

                PUBWEAK IRQ009SEL_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
IRQ009SEL_IRQHandler
                B       IRQ009SEL_IRQHandler

                PUBWEAK IRQ010SEL_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
IRQ010SEL_IRQHandler
                B       IRQ010SEL_IRQHandler

                PUBWEAK EXINT0_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT0_IRQHandler
                B       EXINT0_IRQHandler

                PUBWEAK EXINT1_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT1_IRQHandler
                B       EXINT1_IRQHandler

                PUBWEAK EXINT2_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT2_IRQHandler
                B       EXINT2_IRQHandler

                PUBWEAK EXINT3_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT3_IRQHandler
                B       EXINT3_IRQHandler

                PUBWEAK EXINT4_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT4_IRQHandler
                B       EXINT4_IRQHandler

                PUBWEAK EXINT5_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT5_IRQHandler
                B       EXINT5_IRQHandler

                PUBWEAK EXINT6_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT6_IRQHandler
                B       EXINT6_IRQHandler

                PUBWEAK EXINT7_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT7_IRQHandler
                B       EXINT7_IRQHandler

                PUBWEAK QPRC0_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
QPRC0_IRQHandler
                B       QPRC0_IRQHandler

                PUBWEAK QPRC1_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
QPRC1_IRQHandler
                B       QPRC1_IRQHandler

                PUBWEAK MFT0_WFG_DTIF_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT0_WFG_DTIF_IRQHandler
                B       MFT0_WFG_DTIF_IRQHandler

                PUBWEAK MFT1_WFG_DTIF_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT1_WFG_DTIF_IRQHandler
                B       MFT1_WFG_DTIF_IRQHandler

                PUBWEAK MFT2_WFG_DTIF_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT2_WFG_DTIF_IRQHandler
                B       MFT2_WFG_DTIF_IRQHandler

                PUBWEAK MFT0_FRT_PEAK_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT0_FRT_PEAK_IRQHandler
                B       MFT0_FRT_PEAK_IRQHandler

                PUBWEAK MFT0_FRT_ZERO_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT0_FRT_ZERO_IRQHandler
                B       MFT0_FRT_ZERO_IRQHandler

                PUBWEAK MFT0_ICU_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT0_ICU_IRQHandler
                B       MFT0_ICU_IRQHandler

                PUBWEAK MFT0_OCU_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT0_OCU_IRQHandler
                B       MFT0_OCU_IRQHandler

                PUBWEAK MFT1_FRT_PEAK_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT1_FRT_PEAK_IRQHandler
                B       MFT1_FRT_PEAK_IRQHandler

                PUBWEAK MFT1_FRT_ZERO_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT1_FRT_ZERO_IRQHandler
                B       MFT1_FRT_ZERO_IRQHandler

                PUBWEAK MFT1_ICU_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT1_ICU_IRQHandler
                B       MFT1_ICU_IRQHandler

                PUBWEAK MFT1_OCU_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT1_OCU_IRQHandler
                B       MFT1_OCU_IRQHandler

                PUBWEAK MFT2_FRT_PEAK_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT2_FRT_PEAK_IRQHandler
                B       MFT2_FRT_PEAK_IRQHandler

                PUBWEAK MFT2_FRT_ZERO_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT2_FRT_ZERO_IRQHandler
                B       MFT2_FRT_ZERO_IRQHandler

                PUBWEAK MFT2_ICU_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT2_ICU_IRQHandler
                B       MFT2_ICU_IRQHandler

                PUBWEAK MFT2_OCU_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFT2_OCU_IRQHandler
                B       MFT2_OCU_IRQHandler

                PUBWEAK PPG00_02_04_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
PPG00_02_04_IRQHandler
                B       PPG00_02_04_IRQHandler

                PUBWEAK PPG08_10_12_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
PPG08_10_12_IRQHandler
                B       PPG08_10_12_IRQHandler

                PUBWEAK PPG16_18_20_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
PPG16_18_20_IRQHandler
                B       PPG16_18_20_IRQHandler

                PUBWEAK BT0_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT0_IRQHandler
                B       BT0_IRQHandler

                PUBWEAK BT1_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT1_IRQHandler
                B       BT1_IRQHandler

                PUBWEAK BT2_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT2_IRQHandler
                B       BT2_IRQHandler

                PUBWEAK BT3_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT3_IRQHandler
                B       BT3_IRQHandler

                PUBWEAK BT4_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT4_IRQHandler
                B       BT4_IRQHandler

                PUBWEAK BT5_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT5_IRQHandler
                B       BT5_IRQHandler

                PUBWEAK BT6_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT6_IRQHandler
                B       BT6_IRQHandler

                PUBWEAK BT7_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT7_IRQHandler
                B       BT7_IRQHandler

                PUBWEAK DT_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DT_IRQHandler
                B       DT_IRQHandler

                PUBWEAK WC_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
WC_IRQHandler
                B       WC_IRQHandler

                PUBWEAK EXTBUS_ERR_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXTBUS_ERR_IRQHandler
                B       EXTBUS_ERR_IRQHandler

                PUBWEAK RTC_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
RTC_IRQHandler
                B       RTC_IRQHandler

                PUBWEAK EXINT8_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT8_IRQHandler
                B       EXINT8_IRQHandler

                PUBWEAK EXINT9_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT9_IRQHandler
                B       EXINT9_IRQHandler

                PUBWEAK EXINT10_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT10_IRQHandler
                B       EXINT10_IRQHandler

                PUBWEAK EXINT11_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT11_IRQHandler
                B       EXINT11_IRQHandler

                PUBWEAK EXINT12_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT12_IRQHandler
                B       EXINT12_IRQHandler

                PUBWEAK EXINT13_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT13_IRQHandler
                B       EXINT13_IRQHandler

                PUBWEAK EXINT14_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT14_IRQHandler
                B       EXINT14_IRQHandler

                PUBWEAK EXINT15_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT15_IRQHandler
                B       EXINT15_IRQHandler

                PUBWEAK TIM_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
TIM_IRQHandler
                B       TIM_IRQHandler

                PUBWEAK MFS0_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS0_RX_IRQHandler
                B       MFS0_RX_IRQHandler

                PUBWEAK MFS0_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS0_TX_IRQHandler
                B       MFS0_TX_IRQHandler

                PUBWEAK MFS1_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS1_RX_IRQHandler
                B       MFS1_RX_IRQHandler

                PUBWEAK MFS1_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS1_TX_IRQHandler
                B       MFS1_TX_IRQHandler

                PUBWEAK MFS2_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS2_RX_IRQHandler
                B       MFS2_RX_IRQHandler

                PUBWEAK MFS2_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS2_TX_IRQHandler
                B       MFS2_TX_IRQHandler

                PUBWEAK MFS3_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS3_RX_IRQHandler
                B       MFS3_RX_IRQHandler

                PUBWEAK MFS3_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS3_TX_IRQHandler
                B       MFS3_TX_IRQHandler

                PUBWEAK MFS4_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS4_RX_IRQHandler
                B       MFS4_RX_IRQHandler

                PUBWEAK MFS4_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS4_TX_IRQHandler
                B       MFS4_TX_IRQHandler

                PUBWEAK MFS5_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS5_RX_IRQHandler
                B       MFS5_RX_IRQHandler

                PUBWEAK MFS5_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS5_TX_IRQHandler
                B       MFS5_TX_IRQHandler

                PUBWEAK MFS6_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS6_RX_IRQHandler
                B       MFS6_RX_IRQHandler

                PUBWEAK MFS6_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS6_TX_IRQHandler
                B       MFS6_TX_IRQHandler

                PUBWEAK MFS7_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS7_RX_IRQHandler
                B       MFS7_RX_IRQHandler

                PUBWEAK MFS7_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS7_TX_IRQHandler
                B       MFS7_TX_IRQHandler

                PUBWEAK ADC0_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
ADC0_IRQHandler
                B       ADC0_IRQHandler

                PUBWEAK ADC1_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
ADC1_IRQHandler
                B       ADC1_IRQHandler

                PUBWEAK USB0_F_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
USB0_F_IRQHandler
                B       USB0_F_IRQHandler

                PUBWEAK USB0_H_F_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
USB0_H_F_IRQHandler
                B       USB0_H_F_IRQHandler

                PUBWEAK CAN0_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
CAN0_IRQHandler
                B       CAN0_IRQHandler

                PUBWEAK CAN1_CANFD0_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
CAN1_CANFD0_IRQHandler
                B       CAN1_CANFD0_IRQHandler

                PUBWEAK ETHER0_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
ETHER0_IRQHandler
                B       ETHER0_IRQHandler

                PUBWEAK DMAC0_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DMAC0_IRQHandler
                B       DMAC0_IRQHandler

                PUBWEAK DMAC1_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DMAC1_IRQHandler
                B       DMAC1_IRQHandler

                PUBWEAK DMAC2_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DMAC2_IRQHandler
                B       DMAC2_IRQHandler

                PUBWEAK DMAC3_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DMAC3_IRQHandler
                B       DMAC3_IRQHandler

                PUBWEAK DMAC4_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DMAC4_IRQHandler
                B       DMAC4_IRQHandler

                PUBWEAK DMAC5_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DMAC5_IRQHandler
                B       DMAC5_IRQHandler

                PUBWEAK DMAC6_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DMAC6_IRQHandler
                B       DMAC6_IRQHandler

                PUBWEAK DMAC7_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DMAC7_IRQHandler
                B       DMAC7_IRQHandler

                PUBWEAK DSTC_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DSTC_IRQHandler
                B       DSTC_IRQHandler

                PUBWEAK EXINT16_19_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT16_19_IRQHandler
                B       EXINT16_19_IRQHandler

                PUBWEAK EXINT20_23_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT20_23_IRQHandler
                B       EXINT20_23_IRQHandler

                PUBWEAK EXINT24_27_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT24_27_IRQHandler
                B       EXINT24_27_IRQHandler

                PUBWEAK EXINT28_31_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
EXINT28_31_IRQHandler
                B       EXINT28_31_IRQHandler

                PUBWEAK QPRC2_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
QPRC2_IRQHandler
                B       QPRC2_IRQHandler

                PUBWEAK QPRC3_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
QPRC3_IRQHandler
                B       QPRC3_IRQHandler

                PUBWEAK BT8_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT8_IRQHandler
                B       BT8_IRQHandler

                PUBWEAK BT9_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT9_IRQHandler
                B       BT9_IRQHandler

                PUBWEAK BT10_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT10_IRQHandler
                B       BT10_IRQHandler

                PUBWEAK BT11_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT11_IRQHandler
                B       BT11_IRQHandler

                PUBWEAK BT12_15_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
BT12_15_IRQHandler
                B       BT12_15_IRQHandler

                PUBWEAK MFS8_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS8_RX_IRQHandler
                B       MFS8_RX_IRQHandler

                PUBWEAK MFS8_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS8_TX_IRQHandler
                B       MFS8_TX_IRQHandler

                PUBWEAK MFS9_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS9_RX_IRQHandler
                B       MFS9_RX_IRQHandler

                PUBWEAK MFS9_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS9_TX_IRQHandler
                B       MFS9_TX_IRQHandler

                PUBWEAK MFS10_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS10_RX_IRQHandler
                B       MFS10_RX_IRQHandler

                PUBWEAK MFS10_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS10_TX_IRQHandler
                B       MFS10_TX_IRQHandler

                PUBWEAK MFS11_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS11_RX_IRQHandler
                B       MFS11_RX_IRQHandler

                PUBWEAK MFS11_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS11_TX_IRQHandler
                B       MFS11_TX_IRQHandler

                PUBWEAK ADC2_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
ADC2_IRQHandler
                B       ADC2_IRQHandler

                PUBWEAK DSTC_HW_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
DSTC_HW_IRQHandler
                B       DSTC_HW_IRQHandler

                PUBWEAK USB1_F_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
USB1_F_IRQHandler
                B       USB1_F_IRQHandler

                PUBWEAK USB1_H_F_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
USB1_H_F_IRQHandler
                B       USB1_H_F_IRQHandler

                PUBWEAK HSSPI_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
HSSPI_IRQHandler
                B       HSSPI_IRQHandler

                PUBWEAK PCRC_I2S0_1_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
PCRC_I2S0_1_IRQHandler
                B       PCRC_I2S0_1_IRQHandler

                PUBWEAK SD_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
SD_IRQHandler
                B       SD_IRQHandler

                PUBWEAK FLASHIF_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
FLASHIF_IRQHandler
                B       FLASHIF_IRQHandler

                PUBWEAK MFS12_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS12_RX_IRQHandler
                B       MFS12_RX_IRQHandler

                PUBWEAK MFS12_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS12_TX_IRQHandler
                B       MFS12_TX_IRQHandler

                PUBWEAK MFS13_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS13_RX_IRQHandler
                B       MFS13_RX_IRQHandler

                PUBWEAK MFS13_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS13_TX_IRQHandler
                B       MFS13_TX_IRQHandler

                PUBWEAK MFS14_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS14_RX_IRQHandler
                B       MFS14_RX_IRQHandler

                PUBWEAK MFS14_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS14_TX_IRQHandler
                B       MFS14_TX_IRQHandler

                PUBWEAK MFS15_RX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS15_RX_IRQHandler
                B       MFS15_RX_IRQHandler

                PUBWEAK MFS15_TX_IRQHandler
                SECTION .text:CODE:REORDER:NOROOT(1)
MFS15_TX_IRQHandler
                B       MFS15_TX_IRQHandler




                PUBWEAK Dummy
                SECTION .text:CODE:REORDER:NOROOT(1)
Dummy
                B       Dummy

                END

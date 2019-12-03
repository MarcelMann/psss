/*******************************************************************************
*  Abstract    : This file contains interrupt vector and startup code.
*
*  Functions   : Reset_Handler
*
*  Target      : Cypress FM microcontrollers
*
*  Environment : Atollic TrueSTUDIO(R)
*
********************************************************************************
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
  .syntax unified
  .thumb

  .global Reset_Handler
  .global InterruptVector
  .global Default_Handler

  /* Linker script definitions */
  /* start address for the initialization values of the .data section */
  .word _sidata
  /* start address for the .data section */
  .word _sdata
  /* end address for the .data section */
  .word _edata
  /* start address for the .bss section */
  .word _sbss
  /* end address for the .bss section */
  .word _ebss

/**
**===========================================================================
**  Program - Reset_Handler
**  Abstract: This code gets called after reset.
**===========================================================================
*/
  .section  .text.Reset_Handler,"ax", %progbits
  .type Reset_Handler, %function
Reset_Handler:
  /* Set stack pointer */
  ldr r0,=_estack
  mov sp, r0
  
  
  ldr     r0, =0xe000ed88           
  ldr     r1,[r0]
  ldr     r2, =0xf00000
  orr     r1,r1,r2
  str     r1,[r0]
  
  
  /* Branch to SystemInit function */
  bl SystemInit

  /* Copy data initialization values */
  ldr r1,=_sidata
  ldr r2,=_sdata
  ldr r3,=_edata
  b cmpdata
CopyLoop:
  ldr r0, [r1]
  adds r1, r1, #4
  str r0, [r2]
  adds r2, r2, #4
cmpdata:
  cmp r2, r3
  blt CopyLoop

  /* Clear BSS section */
  movs r0, #0
  ldr r2,=_sbss
  ldr r3,=_ebss
  b cmpbss
ClearLoop:
  str r0, [r2]
  adds r2, r2, #4
cmpbss:
  cmp r2, r3
  blt ClearLoop

  /* Call static constructors */
  bl __libc_init_array

  /* Branch to main */
  bl main

  /* If main returns, branch to Default_Handler. */
  b Default_Handler

  .size  Reset_Handler, .-Reset_Handler

/**
**===========================================================================
**  Program - Default_Handler
**  Abstract: This code gets called when the processor receives an
**    unexpected interrupt.
**===========================================================================
*/
  .section  .text.Default_Handler,"ax", %progbits
Default_Handler:
  b  Default_Handler

  .size  Default_Handler, .-Default_Handler

/**
**===========================================================================
**  Interrupt vector table
**===========================================================================
*/
  .section .isr_vector,"a", %progbits
InterruptVector:
  .word _estack                   /* 0 - Stack pointer */
  .word Reset_Handler             /* 1 - Reset */
  .word NMI_Handler               /* 2 - NMI  */
  .word HardFault_Handler         /* 3 - Hard fault */
  .word MemManage_Handler         /* 4 - Memory management fault */
  .word BusFault_Handler          /* 5 - Bus fault */
  .word UsageFault_Handler        /* 6 - Usage fault */
  .word 0                         /* 7 - Reserved */
  .word 0                         /* 8 - Reserved */
  .word 0                         /* 9 - Reserved */
  .word 0                         /* 10 - Reserved */
  .word SVC_Handler               /* 11 - SVCall */
  .word DebugMonitor_Handler      /* 12 - Reserved for Debug */
  .word 0                         /* 13 - Reserved */
  .word PendSV_Handler            /* 14 - PendSV */
  .word SysTick_Handler           /* 15 - Systick */

  /* External Interrupts */
  .word CSV_IRQHandler		/* IRQ #0 */
  .word SWDT_IRQHandler		/* IRQ #1 */
  .word LVD_IRQHandler		/* IRQ #2 */
  .word IRQ003SEL_IRQHandler		/* IRQ #3 */
  .word IRQ004SEL_IRQHandler		/* IRQ #4 */
  .word IRQ005SEL_IRQHandler		/* IRQ #5 */
  .word IRQ006SEL_IRQHandler		/* IRQ #6 */
  .word IRQ007SEL_IRQHandler		/* IRQ #7 */
  .word IRQ008SEL_IRQHandler		/* IRQ #8 */
  .word IRQ009SEL_IRQHandler		/* IRQ #9 */
  .word IRQ010SEL_IRQHandler		/* IRQ #10 */
  .word EXINT0_IRQHandler		/* IRQ #11 */
  .word EXINT1_IRQHandler		/* IRQ #12 */
  .word EXINT2_IRQHandler		/* IRQ #13 */
  .word EXINT3_IRQHandler		/* IRQ #14 */
  .word EXINT4_IRQHandler		/* IRQ #15 */
  .word EXINT5_IRQHandler		/* IRQ #16 */
  .word EXINT6_IRQHandler		/* IRQ #17 */
  .word EXINT7_IRQHandler		/* IRQ #18 */
  .word QPRC0_IRQHandler		/* IRQ #19 */
  .word QPRC1_IRQHandler		/* IRQ #20 */
  .word MFT0_WFG_DTIF_IRQHandler		/* IRQ #21 */
  .word MFT1_WFG_DTIF_IRQHandler		/* IRQ #22 */
  .word MFT2_WFG_DTIF_IRQHandler		/* IRQ #23 */
  .word MFT0_FRT_PEAK_IRQHandler		/* IRQ #24 */
  .word MFT0_FRT_ZERO_IRQHandler		/* IRQ #25 */
  .word MFT0_ICU_IRQHandler		/* IRQ #26 */
  .word MFT0_OCU_IRQHandler		/* IRQ #27 */
  .word MFT1_FRT_PEAK_IRQHandler		/* IRQ #28 */
  .word MFT1_FRT_ZERO_IRQHandler		/* IRQ #29 */
  .word MFT1_ICU_IRQHandler		/* IRQ #30 */
  .word MFT1_OCU_IRQHandler		/* IRQ #31 */
  .word MFT2_FRT_PEAK_IRQHandler		/* IRQ #32 */
  .word MFT2_FRT_ZERO_IRQHandler		/* IRQ #33 */
  .word MFT2_ICU_IRQHandler		/* IRQ #34 */
  .word MFT2_OCU_IRQHandler		/* IRQ #35 */
  .word PPG00_02_04_IRQHandler		/* IRQ #36 */
  .word PPG08_10_12_IRQHandler		/* IRQ #37 */
  .word PPG16_18_20_IRQHandler		/* IRQ #38 */
  .word BT0_IRQHandler		/* IRQ #39 */
  .word BT1_IRQHandler		/* IRQ #40 */
  .word BT2_IRQHandler		/* IRQ #41 */
  .word BT3_IRQHandler		/* IRQ #42 */
  .word BT4_IRQHandler		/* IRQ #43 */
  .word BT5_IRQHandler		/* IRQ #44 */
  .word BT6_IRQHandler		/* IRQ #45 */
  .word BT7_IRQHandler		/* IRQ #46 */
  .word DT_IRQHandler		/* IRQ #47 */
  .word WC_IRQHandler		/* IRQ #48 */
  .word EXTBUS_ERR_IRQHandler		/* IRQ #49 */
  .word RTC_IRQHandler		/* IRQ #50 */
  .word EXINT8_IRQHandler		/* IRQ #51 */
  .word EXINT9_IRQHandler		/* IRQ #52 */
  .word EXINT10_IRQHandler		/* IRQ #53 */
  .word EXINT11_IRQHandler		/* IRQ #54 */
  .word EXINT12_IRQHandler		/* IRQ #55 */
  .word EXINT13_IRQHandler		/* IRQ #56 */
  .word EXINT14_IRQHandler		/* IRQ #57 */
  .word EXINT15_IRQHandler		/* IRQ #58 */
  .word TIM_IRQHandler		/* IRQ #59 */
  .word MFS0_RX_IRQHandler		/* IRQ #60 */
  .word MFS0_TX_IRQHandler		/* IRQ #61 */
  .word MFS1_RX_IRQHandler		/* IRQ #62 */
  .word MFS1_TX_IRQHandler		/* IRQ #63 */
  .word MFS2_RX_IRQHandler		/* IRQ #64 */
  .word MFS2_TX_IRQHandler		/* IRQ #65 */
  .word MFS3_RX_IRQHandler		/* IRQ #66 */
  .word MFS3_TX_IRQHandler		/* IRQ #67 */
  .word MFS4_RX_IRQHandler		/* IRQ #68 */
  .word MFS4_TX_IRQHandler		/* IRQ #69 */
  .word MFS5_RX_IRQHandler		/* IRQ #70 */
  .word MFS5_TX_IRQHandler		/* IRQ #71 */
  .word MFS6_RX_IRQHandler		/* IRQ #72 */
  .word MFS6_TX_IRQHandler		/* IRQ #73 */
  .word MFS7_RX_IRQHandler		/* IRQ #74 */
  .word MFS7_TX_IRQHandler		/* IRQ #75 */
  .word ADC0_IRQHandler		/* IRQ #76 */
  .word ADC1_IRQHandler		/* IRQ #77 */
  .word USB0_F_IRQHandler		/* IRQ #78 */
  .word USB0_H_F_IRQHandler		/* IRQ #79 */
  .word CAN0_IRQHandler		/* IRQ #80 */
  .word CAN1_CANFD0_IRQHandler		/* IRQ #81 */
  .word ETHER0_IRQHandler		/* IRQ #82 */
  .word DMAC0_IRQHandler		/* IRQ #83 */
  .word DMAC1_IRQHandler		/* IRQ #84 */
  .word DMAC2_IRQHandler		/* IRQ #85 */
  .word DMAC3_IRQHandler		/* IRQ #86 */
  .word DMAC4_IRQHandler		/* IRQ #87 */
  .word DMAC5_IRQHandler		/* IRQ #88 */
  .word DMAC6_IRQHandler		/* IRQ #89 */
  .word DMAC7_IRQHandler		/* IRQ #90 */
  .word DSTC_IRQHandler		/* IRQ #91 */
  .word EXINT16_19_IRQHandler		/* IRQ #92 */
  .word EXINT20_23_IRQHandler		/* IRQ #93 */
  .word EXINT24_27_IRQHandler		/* IRQ #94 */
  .word EXINT28_31_IRQHandler		/* IRQ #95 */
  .word QPRC2_IRQHandler		/* IRQ #96 */
  .word QPRC3_IRQHandler		/* IRQ #97 */
  .word BT8_IRQHandler		/* IRQ #98 */
  .word BT9_IRQHandler		/* IRQ #99 */
  .word BT10_IRQHandler		/* IRQ #100 */
  .word BT11_IRQHandler		/* IRQ #101 */
  .word BT12_15_IRQHandler		/* IRQ #102 */
  .word MFS8_RX_IRQHandler		/* IRQ #103 */
  .word MFS8_TX_IRQHandler		/* IRQ #104 */
  .word MFS9_RX_IRQHandler		/* IRQ #105 */
  .word MFS9_TX_IRQHandler		/* IRQ #106 */
  .word MFS10_RX_IRQHandler		/* IRQ #107 */
  .word MFS10_TX_IRQHandler		/* IRQ #108 */
  .word MFS11_RX_IRQHandler		/* IRQ #109 */
  .word MFS11_TX_IRQHandler		/* IRQ #110 */
  .word ADC2_IRQHandler		/* IRQ #111 */
  .word DSTC_HW_IRQHandler		/* IRQ #112 */
  .word USB1_F_IRQHandler		/* IRQ #113 */
  .word USB1_H_F_IRQHandler		/* IRQ #114 */
  .word HSSPI_IRQHandler		/* IRQ #115 */
  .word Default_Handler		/* IRQ #116 */
  .word PCRC_I2S0_1_IRQHandler		/* IRQ #117 */
  .word SD_IRQHandler		/* IRQ #118 */
  .word FLASHIF_IRQHandler		/* IRQ #119 */
  .word MFS12_RX_IRQHandler		/* IRQ #120 */
  .word MFS12_TX_IRQHandler		/* IRQ #121 */
  .word MFS13_RX_IRQHandler		/* IRQ #122 */
  .word MFS13_TX_IRQHandler		/* IRQ #123 */
  .word MFS14_RX_IRQHandler		/* IRQ #124 */
  .word MFS14_TX_IRQHandler		/* IRQ #125 */
  .word MFS15_RX_IRQHandler		/* IRQ #126 */
  .word MFS15_TX_IRQHandler		/* IRQ #127 */



/**
**===========================================================================
**  Weak interrupt handlers redirected to Default_Handler. These can be
**  overridden in user code.
**===========================================================================
*/
  .weak NMI_Handler
  .thumb_set NMI_Handler, Default_Handler

  .weak HardFault_Handler
  .thumb_set HardFault_Handler, Default_Handler

  .weak MemManage_Handler
  .thumb_set MemManage_Handler, Default_Handler

  .weak BusFault_Handler
  .thumb_set BusFault_Handler, Default_Handler

  .weak UsageFault_Handler
  .thumb_set UsageFault_Handler, Default_Handler

  .weak SVC_Handler
  .thumb_set SVC_Handler, Default_Handler

  .weak DebugMonitor_Handler
  .thumb_set DebugMonitor_Handler, Default_Handler

  .weak PendSV_Handler
  .thumb_set PendSV_Handler, Default_Handler

  .weak SysTick_Handler
  .thumb_set SysTick_Handler, Default_Handler
  
/* IRQ #0 */
  .weak CSV_IRQHandler
  .thumb_set CSV_IRQHandler, Default_Handler

/* IRQ #1 */
  .weak SWDT_IRQHandler
  .thumb_set SWDT_IRQHandler, Default_Handler

/* IRQ #2 */
  .weak LVD_IRQHandler
  .thumb_set LVD_IRQHandler, Default_Handler

/* IRQ #3 */
  .weak IRQ003SEL_IRQHandler
  .thumb_set IRQ003SEL_IRQHandler, Default_Handler

/* IRQ #4 */
  .weak IRQ004SEL_IRQHandler
  .thumb_set IRQ004SEL_IRQHandler, Default_Handler

/* IRQ #5 */
  .weak IRQ005SEL_IRQHandler
  .thumb_set IRQ005SEL_IRQHandler, Default_Handler

/* IRQ #6 */
  .weak IRQ006SEL_IRQHandler
  .thumb_set IRQ006SEL_IRQHandler, Default_Handler

/* IRQ #7 */
  .weak IRQ007SEL_IRQHandler
  .thumb_set IRQ007SEL_IRQHandler, Default_Handler

/* IRQ #8 */
  .weak IRQ008SEL_IRQHandler
  .thumb_set IRQ008SEL_IRQHandler, Default_Handler

/* IRQ #9 */
  .weak IRQ009SEL_IRQHandler
  .thumb_set IRQ009SEL_IRQHandler, Default_Handler

/* IRQ #10 */
  .weak IRQ010SEL_IRQHandler
  .thumb_set IRQ010SEL_IRQHandler, Default_Handler

/* IRQ #11 */
  .weak EXINT0_IRQHandler
  .thumb_set EXINT0_IRQHandler, Default_Handler

/* IRQ #12 */
  .weak EXINT1_IRQHandler
  .thumb_set EXINT1_IRQHandler, Default_Handler

/* IRQ #13 */
  .weak EXINT2_IRQHandler
  .thumb_set EXINT2_IRQHandler, Default_Handler

/* IRQ #14 */
  .weak EXINT3_IRQHandler
  .thumb_set EXINT3_IRQHandler, Default_Handler

/* IRQ #15 */
  .weak EXINT4_IRQHandler
  .thumb_set EXINT4_IRQHandler, Default_Handler

/* IRQ #16 */
  .weak EXINT5_IRQHandler
  .thumb_set EXINT5_IRQHandler, Default_Handler

/* IRQ #17 */
  .weak EXINT6_IRQHandler
  .thumb_set EXINT6_IRQHandler, Default_Handler

/* IRQ #18 */
  .weak EXINT7_IRQHandler
  .thumb_set EXINT7_IRQHandler, Default_Handler

/* IRQ #19 */
  .weak QPRC0_IRQHandler
  .thumb_set QPRC0_IRQHandler, Default_Handler

/* IRQ #20 */
  .weak QPRC1_IRQHandler
  .thumb_set QPRC1_IRQHandler, Default_Handler

/* IRQ #21 */
  .weak MFT0_WFG_DTIF_IRQHandler
  .thumb_set MFT0_WFG_DTIF_IRQHandler, Default_Handler

/* IRQ #22 */
  .weak MFT1_WFG_DTIF_IRQHandler
  .thumb_set MFT1_WFG_DTIF_IRQHandler, Default_Handler

/* IRQ #23 */
  .weak MFT2_WFG_DTIF_IRQHandler
  .thumb_set MFT2_WFG_DTIF_IRQHandler, Default_Handler

/* IRQ #24 */
  .weak MFT0_FRT_PEAK_IRQHandler
  .thumb_set MFT0_FRT_PEAK_IRQHandler, Default_Handler

/* IRQ #25 */
  .weak MFT0_FRT_ZERO_IRQHandler
  .thumb_set MFT0_FRT_ZERO_IRQHandler, Default_Handler

/* IRQ #26 */
  .weak MFT0_ICU_IRQHandler
  .thumb_set MFT0_ICU_IRQHandler, Default_Handler

/* IRQ #27 */
  .weak MFT0_OCU_IRQHandler
  .thumb_set MFT0_OCU_IRQHandler, Default_Handler

/* IRQ #28 */
  .weak MFT1_FRT_PEAK_IRQHandler
  .thumb_set MFT1_FRT_PEAK_IRQHandler, Default_Handler

/* IRQ #29 */
  .weak MFT1_FRT_ZERO_IRQHandler
  .thumb_set MFT1_FRT_ZERO_IRQHandler, Default_Handler

/* IRQ #30 */
  .weak MFT1_ICU_IRQHandler
  .thumb_set MFT1_ICU_IRQHandler, Default_Handler

/* IRQ #31 */
  .weak MFT1_OCU_IRQHandler
  .thumb_set MFT1_OCU_IRQHandler, Default_Handler

/* IRQ #32 */
  .weak MFT2_FRT_PEAK_IRQHandler
  .thumb_set MFT2_FRT_PEAK_IRQHandler, Default_Handler

/* IRQ #33 */
  .weak MFT2_FRT_ZERO_IRQHandler
  .thumb_set MFT2_FRT_ZERO_IRQHandler, Default_Handler

/* IRQ #34 */
  .weak MFT2_ICU_IRQHandler
  .thumb_set MFT2_ICU_IRQHandler, Default_Handler

/* IRQ #35 */
  .weak MFT2_OCU_IRQHandler
  .thumb_set MFT2_OCU_IRQHandler, Default_Handler

/* IRQ #36 */
  .weak PPG00_02_04_IRQHandler
  .thumb_set PPG00_02_04_IRQHandler, Default_Handler

/* IRQ #37 */
  .weak PPG08_10_12_IRQHandler
  .thumb_set PPG08_10_12_IRQHandler, Default_Handler

/* IRQ #38 */
  .weak PPG16_18_20_IRQHandler
  .thumb_set PPG16_18_20_IRQHandler, Default_Handler

/* IRQ #39 */
  .weak BT0_IRQHandler
  .thumb_set BT0_IRQHandler, Default_Handler

/* IRQ #40 */
  .weak BT1_IRQHandler
  .thumb_set BT1_IRQHandler, Default_Handler

/* IRQ #41 */
  .weak BT2_IRQHandler
  .thumb_set BT2_IRQHandler, Default_Handler

/* IRQ #42 */
  .weak BT3_IRQHandler
  .thumb_set BT3_IRQHandler, Default_Handler

/* IRQ #43 */
  .weak BT4_IRQHandler
  .thumb_set BT4_IRQHandler, Default_Handler

/* IRQ #44 */
  .weak BT5_IRQHandler
  .thumb_set BT5_IRQHandler, Default_Handler

/* IRQ #45 */
  .weak BT6_IRQHandler
  .thumb_set BT6_IRQHandler, Default_Handler

/* IRQ #46 */
  .weak BT7_IRQHandler
  .thumb_set BT7_IRQHandler, Default_Handler

/* IRQ #47 */
  .weak DT_IRQHandler
  .thumb_set DT_IRQHandler, Default_Handler

/* IRQ #48 */
  .weak WC_IRQHandler
  .thumb_set WC_IRQHandler, Default_Handler

/* IRQ #49 */
  .weak EXTBUS_ERR_IRQHandler
  .thumb_set EXTBUS_ERR_IRQHandler, Default_Handler

/* IRQ #50 */
  .weak RTC_IRQHandler
  .thumb_set RTC_IRQHandler, Default_Handler

/* IRQ #51 */
  .weak EXINT8_IRQHandler
  .thumb_set EXINT8_IRQHandler, Default_Handler

/* IRQ #52 */
  .weak EXINT9_IRQHandler
  .thumb_set EXINT9_IRQHandler, Default_Handler

/* IRQ #53 */
  .weak EXINT10_IRQHandler
  .thumb_set EXINT10_IRQHandler, Default_Handler

/* IRQ #54 */
  .weak EXINT11_IRQHandler
  .thumb_set EXINT11_IRQHandler, Default_Handler

/* IRQ #55 */
  .weak EXINT12_IRQHandler
  .thumb_set EXINT12_IRQHandler, Default_Handler

/* IRQ #56 */
  .weak EXINT13_IRQHandler
  .thumb_set EXINT13_IRQHandler, Default_Handler

/* IRQ #57 */
  .weak EXINT14_IRQHandler
  .thumb_set EXINT14_IRQHandler, Default_Handler

/* IRQ #58 */
  .weak EXINT15_IRQHandler
  .thumb_set EXINT15_IRQHandler, Default_Handler

/* IRQ #59 */
  .weak TIM_IRQHandler
  .thumb_set TIM_IRQHandler, Default_Handler

/* IRQ #60 */
  .weak MFS0_RX_IRQHandler
  .thumb_set MFS0_RX_IRQHandler, Default_Handler

/* IRQ #61 */
  .weak MFS0_TX_IRQHandler
  .thumb_set MFS0_TX_IRQHandler, Default_Handler

/* IRQ #62 */
  .weak MFS1_RX_IRQHandler
  .thumb_set MFS1_RX_IRQHandler, Default_Handler

/* IRQ #63 */
  .weak MFS1_TX_IRQHandler
  .thumb_set MFS1_TX_IRQHandler, Default_Handler

/* IRQ #64 */
  .weak MFS2_RX_IRQHandler
  .thumb_set MFS2_RX_IRQHandler, Default_Handler

/* IRQ #65 */
  .weak MFS2_TX_IRQHandler
  .thumb_set MFS2_TX_IRQHandler, Default_Handler

/* IRQ #66 */
  .weak MFS3_RX_IRQHandler
  .thumb_set MFS3_RX_IRQHandler, Default_Handler

/* IRQ #67 */
  .weak MFS3_TX_IRQHandler
  .thumb_set MFS3_TX_IRQHandler, Default_Handler

/* IRQ #68 */
  .weak MFS4_RX_IRQHandler
  .thumb_set MFS4_RX_IRQHandler, Default_Handler

/* IRQ #69 */
  .weak MFS4_TX_IRQHandler
  .thumb_set MFS4_TX_IRQHandler, Default_Handler

/* IRQ #70 */
  .weak MFS5_RX_IRQHandler
  .thumb_set MFS5_RX_IRQHandler, Default_Handler

/* IRQ #71 */
  .weak MFS5_TX_IRQHandler
  .thumb_set MFS5_TX_IRQHandler, Default_Handler

/* IRQ #72 */
  .weak MFS6_RX_IRQHandler
  .thumb_set MFS6_RX_IRQHandler, Default_Handler

/* IRQ #73 */
  .weak MFS6_TX_IRQHandler
  .thumb_set MFS6_TX_IRQHandler, Default_Handler

/* IRQ #74 */
  .weak MFS7_RX_IRQHandler
  .thumb_set MFS7_RX_IRQHandler, Default_Handler

/* IRQ #75 */
  .weak MFS7_TX_IRQHandler
  .thumb_set MFS7_TX_IRQHandler, Default_Handler

/* IRQ #76 */
  .weak ADC0_IRQHandler
  .thumb_set ADC0_IRQHandler, Default_Handler

/* IRQ #77 */
  .weak ADC1_IRQHandler
  .thumb_set ADC1_IRQHandler, Default_Handler

/* IRQ #78 */
  .weak USB0_F_IRQHandler
  .thumb_set USB0_F_IRQHandler, Default_Handler

/* IRQ #79 */
  .weak USB0_H_F_IRQHandler
  .thumb_set USB0_H_F_IRQHandler, Default_Handler

/* IRQ #80 */
  .weak CAN0_IRQHandler
  .thumb_set CAN0_IRQHandler, Default_Handler

/* IRQ #81 */
  .weak CAN1_CANFD0_IRQHandler
  .thumb_set CAN1_CANFD0_IRQHandler, Default_Handler

/* IRQ #82 */
  .weak ETHER0_IRQHandler
  .thumb_set ETHER0_IRQHandler, Default_Handler

/* IRQ #83 */
  .weak DMAC0_IRQHandler
  .thumb_set DMAC0_IRQHandler, Default_Handler

/* IRQ #84 */
  .weak DMAC1_IRQHandler
  .thumb_set DMAC1_IRQHandler, Default_Handler

/* IRQ #85 */
  .weak DMAC2_IRQHandler
  .thumb_set DMAC2_IRQHandler, Default_Handler

/* IRQ #86 */
  .weak DMAC3_IRQHandler
  .thumb_set DMAC3_IRQHandler, Default_Handler

/* IRQ #87 */
  .weak DMAC4_IRQHandler
  .thumb_set DMAC4_IRQHandler, Default_Handler

/* IRQ #88 */
  .weak DMAC5_IRQHandler
  .thumb_set DMAC5_IRQHandler, Default_Handler

/* IRQ #89 */
  .weak DMAC6_IRQHandler
  .thumb_set DMAC6_IRQHandler, Default_Handler

/* IRQ #90 */
  .weak DMAC7_IRQHandler
  .thumb_set DMAC7_IRQHandler, Default_Handler

/* IRQ #91 */
  .weak DSTC_IRQHandler
  .thumb_set DSTC_IRQHandler, Default_Handler

/* IRQ #92 */
  .weak EXINT16_19_IRQHandler
  .thumb_set EXINT16_19_IRQHandler, Default_Handler

/* IRQ #93 */
  .weak EXINT20_23_IRQHandler
  .thumb_set EXINT20_23_IRQHandler, Default_Handler

/* IRQ #94 */
  .weak EXINT24_27_IRQHandler
  .thumb_set EXINT24_27_IRQHandler, Default_Handler

/* IRQ #95 */
  .weak EXINT28_31_IRQHandler
  .thumb_set EXINT28_31_IRQHandler, Default_Handler

/* IRQ #96 */
  .weak QPRC2_IRQHandler
  .thumb_set QPRC2_IRQHandler, Default_Handler

/* IRQ #97 */
  .weak QPRC3_IRQHandler
  .thumb_set QPRC3_IRQHandler, Default_Handler

/* IRQ #98 */
  .weak BT8_IRQHandler
  .thumb_set BT8_IRQHandler, Default_Handler

/* IRQ #99 */
  .weak BT9_IRQHandler
  .thumb_set BT9_IRQHandler, Default_Handler

/* IRQ #100 */
  .weak BT10_IRQHandler
  .thumb_set BT10_IRQHandler, Default_Handler

/* IRQ #101 */
  .weak BT11_IRQHandler
  .thumb_set BT11_IRQHandler, Default_Handler

/* IRQ #102 */
  .weak BT12_15_IRQHandler
  .thumb_set BT12_15_IRQHandler, Default_Handler

/* IRQ #103 */
  .weak MFS8_RX_IRQHandler
  .thumb_set MFS8_RX_IRQHandler, Default_Handler

/* IRQ #104 */
  .weak MFS8_TX_IRQHandler
  .thumb_set MFS8_TX_IRQHandler, Default_Handler

/* IRQ #105 */
  .weak MFS9_RX_IRQHandler
  .thumb_set MFS9_RX_IRQHandler, Default_Handler

/* IRQ #106 */
  .weak MFS9_TX_IRQHandler
  .thumb_set MFS9_TX_IRQHandler, Default_Handler

/* IRQ #107 */
  .weak MFS10_RX_IRQHandler
  .thumb_set MFS10_RX_IRQHandler, Default_Handler

/* IRQ #108 */
  .weak MFS10_TX_IRQHandler
  .thumb_set MFS10_TX_IRQHandler, Default_Handler

/* IRQ #109 */
  .weak MFS11_RX_IRQHandler
  .thumb_set MFS11_RX_IRQHandler, Default_Handler

/* IRQ #110 */
  .weak MFS11_TX_IRQHandler
  .thumb_set MFS11_TX_IRQHandler, Default_Handler

/* IRQ #111 */
  .weak ADC2_IRQHandler
  .thumb_set ADC2_IRQHandler, Default_Handler

/* IRQ #112 */
  .weak DSTC_HW_IRQHandler
  .thumb_set DSTC_HW_IRQHandler, Default_Handler

/* IRQ #113 */
  .weak USB1_F_IRQHandler
  .thumb_set USB1_F_IRQHandler, Default_Handler

/* IRQ #114 */
  .weak USB1_H_F_IRQHandler
  .thumb_set USB1_H_F_IRQHandler, Default_Handler

/* IRQ #115 */
  .weak HSSPI_IRQHandler
  .thumb_set HSSPI_IRQHandler, Default_Handler

/* IRQ #117 */
  .weak PCRC_I2S0_1_IRQHandler
  .thumb_set PCRC_I2S0_1_IRQHandler, Default_Handler

/* IRQ #118 */
  .weak SD_IRQHandler
  .thumb_set SD_IRQHandler, Default_Handler

/* IRQ #119 */
  .weak FLASHIF_IRQHandler
  .thumb_set FLASHIF_IRQHandler, Default_Handler

/* IRQ #120 */
  .weak MFS12_RX_IRQHandler
  .thumb_set MFS12_RX_IRQHandler, Default_Handler

/* IRQ #121 */
  .weak MFS12_TX_IRQHandler
  .thumb_set MFS12_TX_IRQHandler, Default_Handler

/* IRQ #122 */
  .weak MFS13_RX_IRQHandler
  .thumb_set MFS13_RX_IRQHandler, Default_Handler

/* IRQ #123 */
  .weak MFS13_TX_IRQHandler
  .thumb_set MFS13_TX_IRQHandler, Default_Handler

/* IRQ #124 */
  .weak MFS14_RX_IRQHandler
  .thumb_set MFS14_RX_IRQHandler, Default_Handler

/* IRQ #125 */
  .weak MFS14_TX_IRQHandler
  .thumb_set MFS14_TX_IRQHandler, Default_Handler

/* IRQ #126 */
  .weak MFS15_RX_IRQHandler
  .thumb_set MFS15_RX_IRQHandler, Default_Handler

/* IRQ #127 */
  .weak MFS15_TX_IRQHandler
  .thumb_set MFS15_TX_IRQHandler, Default_Handler



  .end

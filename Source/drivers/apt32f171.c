/*
  ******************************************************************************
  * @file    apt32f171.c
  * @author  APT AE Team
  * @version V1.0.0
  * @date    2022/12/16
  ******************************************************************************
  *THIS SOFTWARE WHICH IS FOR ILLUSTRATIVE PURPOSES ONLY WHICH PROVIDES 
  *CUSTOMER WITH CODING INFORMATION REGARDING THEIR PRODUCTS.
  *APT CHIP SHALL NOT BE HELD RESPONSIBILITY ADN LIABILITY FOR ANY DIRECT, 
  *INDIRECT DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE CONTENT OF 
  *SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING INFORMATION 
  *CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.AND APT CHIP RESERVES 
  *THE RIGHT TO MAKE CHANGES IN THE SOFTWARE WITHOUT NOTIFICATION
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "apt32f171.h"

/**
  * @addtogroup Struct pointer assignment Functions
  * @{
  */
CSP_CK802_T  *CK802    = (CSP_CK802_T   *)CK802_BASEADDR ;

CSP_IFC_T    *IFC      = (CSP_IFC_T    *)APB_IFCBase ;
CSP_SYSCON_T *SYSCON   = (CSP_SYSCON_T *)APB_SYSCONBase ;
CSP_ETCB_T   *ETCB     = (CSP_ETCB_T *)APB_ETCBBase ;      
CSP_ADC12_T  *ADC0     = (CSP_ADC12_T  *)APB_ADC0Base ;

CSP_TC0_3C_T   *TC0      = (CSP_TC0_3C_T   *)APB_TC0Base ;
CSP_TC0_T   *TC0_0      = (CSP_TC0_T   *)APB_TC0_0Base ;
CSP_TC0_T   *TC0_1      = (CSP_TC0_T   *)APB_TC0_1Base ;
CSP_TC0_T   *TC0_2      = (CSP_TC0_T   *)APB_TC0_2Base ;
CSP_TC1_T   *TC1      = (CSP_TC1_T   *)APB_TC1Base ;
CSP_TC2_T   *TC2     = (CSP_TC2_T  *)APB_TC2Base ;

CSP_EPWM_T  *EPWM     = (CSP_EPWM_T  *)APB_EPWMBase ;


CSP_BT_T     *BT0      = (CSP_BT_T   *)APB_BT0Base ;    
CSP_BT_T     *BT1      = (CSP_BT_T   *)APB_BT1Base ;    
CSP_BT_T     *BT2      = (CSP_BT_T   *)APB_BT2Base ;    
CSP_BT_T     *BT3      = (CSP_BT_T   *)APB_BT3Base ;    
CSP_GPTA_T   *GPTA0     = (CSP_GPTA_T   *)APB_GPTABase ; 
CSP_EPT_T    *EPT0      = (CSP_EPT_T  *)APB_EPTBase ;      
CSP_WWDT_T   *WWDT     = (CSP_WWDT_T  *)APB_WWDTBase ; 
CSP_USART_T  *USART0   = (CSP_USART_T *)APB_USART0Base ;
CSP_UART_T   *UART0    = (CSP_UART_T  *)APB_UART0Base ;
CSP_CMP_T    *CMP      = (CSP_CMP_T   *)APB_CMPBase ;
CSP_OAMP_T   *OAMP0     = (CSP_OAMP_T  *)APB_OAMP0Base ;
CSP_OAMP_T   *OAMP1     = (CSP_OAMP_T  *)APB_OAMP1Base ;
CSP_CRC_T    *CRC      = (CSP_CRC_T  *)AHB_CRCBase ;
CSP_GPIO_T   *GPIOA0   = (CSP_GPIO_T  *)APB_GPIOA0Base ; // A0
CSP_GPIO_T   *GPIOA1   = (CSP_GPIO_T  *)APB_GPIOA1Base ; // A1
CSP_GPIO_T   *GPIOB0   = (CSP_GPIO_T  *)APB_GPIOB0Base ; // B0
CSP_GPIO_T   *GPIOC0   = (CSP_GPIO_T  *)APB_GPIOC0Base ; // C0
CSP_HWD_T    *HWD      = (CSP_HWD_T  *)APB_HWDBase ;
CSP_IGRP_T   *GPIOGRP   = (CSP_IGRP_T  *)APB_IGRPBase ;   // EXI GROUP CONTROL





/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/



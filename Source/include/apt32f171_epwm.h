/*
  ******************************************************************************
  * @file    apt32f171_epwm.h
  * @author  APT AE Team
  * @version V1.0.0
  * @date    2022/09/08
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

/* Define to prevent recursive inclusion -------------------------------------*/ 
#ifndef _apt32f171_epwm_H
#define _apt32f171_epwm_H

/* Includes ------------------------------------------------------------------*/
#include "apt32f171.h"

/******************************************************************************
************************** EPWM Registers Definition ****************************
******************************************************************************/

/******************************************************************************
* EPWM Regiser
******************************************************************************/
//CR
#define PWM2STOP       (0x01ul << 29)      	     /**< Stop counter                 */
#define PWM1STOP       (0x01ul << 28)      	     /**< Stop counter                 */
#define PWM0STOP       (0x01ul << 27)      	     /**< Stop counter                 */
#define PWM2START      (0x01ul << 26)      	     /**< Start counter                */
#define PWM1START      (0x01ul << 25)      	     /**< Start counter                */
#define PWM0START      (0x01ul << 24)      	     /**< Start counter                */
#define SINGLECNT      (0x01ul << 23)      	     /**< Counter selecte              */
#define CKEN           (0x01ul << 22)      	     /**< Clock enable                 */
#define OVFSTB         (0x01ul << 21)      	     /**< Stop counting after overflow */
#define BUSY           (0x01ul << 20)      	     /**< BUSY bit                     */
#define DIVM(val)      ((0xFFFul & val)  <<  8)      /**< DIVM value                   */
#define DIVN(val)      ((  0x7ul & val)  <<  5)      /**< DIVN value                   */
#define CMODE(val)     ((  0x3ul & val)  <<  3)      /**< CMODE value                  */
#define S_RST          (0x01ul <<  2)      	     /**< Software reset               */
#define PWMSTOP        (0x01ul <<  1)      	     /**< Stop counter                 */
#define PWMSTART       (0x01ul <<  0)      	     /**< Start counter                */

/******************************************************************************
************************** EPWM Registers Definition ****************************
******************************************************************************/
#define		 PWM_CR_RST     			((CSP_REGISTER_T)0x00800000)		/**< CR  reset value  	*/
#define		 PWM_LKCR_RST     			((CSP_REGISTER_T)0x00000000)		/**< LKCR  reset value 	*/
#define		 PWM_LKTRG_RST     			((CSP_REGISTER_T)0x00000000)		/**< LKTRG  reset value */
#define		 PWM_CNTR0_RST     			((CSP_REGISTER_T)0x00000000)		/**< CNTR0  reset value */
#define		 PWM_CNTBR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< CNTBR0  reset value */
#define		 PWM_PCNTR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< PCNTR0  reset value */
#define		 PWM_SLPCNTR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLPCNTR0  reset value */
#define		 PWM_CNTR1_RST     			((CSP_REGISTER_T)0x00000000)		/**< CNTR1  reset value */
#define		 PWM_CNTBR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< CNTBR1  reset value */
#define		 PWM_PCNTR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< PCNTR1  reset value */
#define		 PWM_SLPCNTR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLPCNTR1  reset value */
#define		 PWM_CNTR2_RST     			((CSP_REGISTER_T)0x00000000)		/**< CNTR2  reset value */
#define		 PWM_CNTBR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< CNTBR2  reset value */
#define		 PWM_PCNTR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< PCNTR2  reset value */
#define		 PWM_SLPCNTR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLPCNTR2  reset value */
#define		 PWM_CMPAR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMPAR0  reset value */
#define		 PWM_PCMPAR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< PCMPAR0  reset value */
#define		 PWM_SLPCMPAR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLPCMPAR0  reset value */
#define		 PWM_CMPBR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMPBR0  reset value */
#define		 PWM_PCMPBR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< PCMPBR0  reset value */
#define		 PWM_SLPCMPBR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLPCMPBR0  reset value */
#define		 PWM_CMPAR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMPAR1  reset value */
#define		 PWM_PCMPAR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< PCMPAR1  reset value */
#define		 PWM_SLPCMPAR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLPCMPAR1  reset value */
#define		 PWM_CMPBR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMPBR1  reset value */
#define		 PWM_PCMPBR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< PCMPBR1 reset value */
#define		 PWM_SLPCMPBR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLPCMPBR1  reset value */
#define		 PWM_CMPAR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMPAR2  reset value */
#define		 PWM_PCMPAR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< PCMPAR2  reset value */
#define		 PWM_SLPCMPAR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLPCMPAR2  reset value */
#define		 PWM_CMPBR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMPBR2  reset value */
#define		 PWM_PCMPBR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< PCMPBR2 reset value */
#define		 PWM_SLPCMPBR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLPCMPBR2  reset value */
#define		 PWM_WGCR0_RST     			((CSP_REGISTER_T)0x00000000)		/**< WGCR0  reset value */
#define		 PWM_WGCR1_RST     			((CSP_REGISTER_T)0x00000000)		/**< WGCR1  reset value */
#define		 PWM_WGCR2_RST     			((CSP_REGISTER_T)0x00000000)		/**< WGCR2  reset value */
#define		 PWM_OUTCR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< OUTCR0  reset value */
#define		 PWM_OUTCR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< OUTCR1  reset value */
#define		 PWM_OUTCR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< OUTCR2  reset value */
#define		 PWM_CFCR0_RST     			((CSP_REGISTER_T)0x00000000)		/**< CFCR0  reset value */
#define		 PWM_CFCR1_RST     			((CSP_REGISTER_T)0x00000000)		/**< CFCR1  reset value */
#define		 PWM_CFCR2_RST     			((CSP_REGISTER_T)0x00000000)		/**< CFCR2  reset value */
#define		 PWM_EMR_RST     			((CSP_REGISTER_T)0x00000000)		/**< EMR  reset value */
#define		 PWM_SLCON_RST     			((CSP_REGISTER_T)0x00000000)		/**< SLCON  reset value */
#define		 PWM_SLSTEP0_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLSTEP0  reset value */
#define		 PWM_SLSTEP1_RST     		((CSP_REGISTER_T)0x00000000)		/**< SLSTEP1 reset value */
#define		 PWM_IER_RST     			((CSP_REGISTER_T)0x00000000)		/**< IER reset value */
#define		 PWM_ICR_RST     			((CSP_REGISTER_T)0x00000000)		/**< ICR reset value */
#define		 PWM_RISR_RST     			((CSP_REGISTER_T)0x00000000)		/**< RISR reset value */
#define		 PWM_MISR_RST     			((CSP_REGISTER_T)0x00000000)		/**< MISR reset value */
#define		 PWM_EXTRG0_RST     		((CSP_REGISTER_T)0x00000000)		/**< EXTRG0 reset value */
#define		 PWM_EXTRG1_RST     		((CSP_REGISTER_T)0x00000000)		/**< EXTRG1 reset value */
/******************************************************************************
***************************** EPWM Registers mask ***************************
******************************************************************************/

/******************************************************************************
************************* EPWM Registers reset value ************************
******************************************************************************/
 /**
  * @brief  EPWM IO Mode
  */
typedef enum
{
		PWM_X0 	=  0,
		PWM_Y0  =  1,
		PWM_X1	=  2,
		PWM_Y1	=  3,
		PWM_X2	=  4,
		PWM_Y2	=  5,
		PWM_EP0	=  6,
		PWM_EP1	=  7,
		PWM_EP2	=  8,
		PWM_EP3	=  9,
		PWM_EP4	=  10
}
EPWM_IO_MODE_TypeDef;

 /**
  * @brief  EPWM CMODE
  */
typedef enum
{
		EPWM_ContMode_increase 				=  ((CSP_REGISTER_T)(0x00ul << 3)),
		EPWM_ContMode_decrease  			=  ((CSP_REGISTER_T)(0x01ul << 3)),
		EPWM_ContMode_increaseTOdecrease	=  ((CSP_REGISTER_T)(0x02ul << 3)),
		EPWM_ContMode_decreaseTOincrease	=  ((CSP_REGISTER_T)(0x03ul << 3))
}EPWM_CMODE_TypeDef;

 /**
  * @brief  EPWM Conter NUM
  */
typedef enum
{
		EPWM_Conter_three 		=  ((CSP_REGISTER_T)(0x00ul << 23)),	
		EPWM_Conter_one 		=  ((CSP_REGISTER_T)(0x01ul << 23))
}EPWM_Conter_NUM_TypeDef;

 /**
  * @brief  EPWM Conter over flow mode
  */
typedef enum
{
		EMP_Overflow_Mode_Continue 		=  ((CSP_REGISTER_T)(0x00ul << 21)),	
		EMP_Overflow_Mode_once			=  ((CSP_REGISTER_T)(0x01ul << 21))
}EPWM_Overflow_Mode_TypeDef;

 /**
  * @brief  EPWM PX OR PY selected
  */
typedef enum
{
		EPWM_P0X 			=  0,	
		EPWM_P0Y			=  1,
		EPWM_P1X 			=  2,	
		EPWM_P1Y			=  3,
		EPWM_P2X 			=  4,	
		EPWM_P2Y			=  5
}EPWM_PXxOrPYx_TypeDef;

 /**
  * @brief  EPWM StopEvent PX OR PY output
  */
typedef enum
{
		EPWM_StartStopEvent_NoChange 			=  ((CSP_REGISTER_T)(0x00ul)),	
		EPWM_StartStopEvent_OutLow				=  ((CSP_REGISTER_T)(0x01ul)),
		EPWM_StartStopEvent_OutHigh 			=  ((CSP_REGISTER_T)(0x02ul)),	
		EPWM_StartStopEvent_Negate				=  ((CSP_REGISTER_T)(0x03ul))
}EPWM_StartStopEvent_PxOUT_TypeDef; 

/**
  * @brief  EPWM StarEvent PX OR PY output
  */
typedef enum
{
		EPWM_PendEvent_NoChange 			=  ((CSP_REGISTER_T)(0x00ul)),	
		EPWM_PendEvent_OutLow				=  ((CSP_REGISTER_T)(0x01ul)),
		EPWM_PendEvent_OutHigh 				=  ((CSP_REGISTER_T)(0x02ul)),	
		EPWM_PendEvent_Negate				=  ((CSP_REGISTER_T)(0x03ul))
}EPWM_PendEvent_PxOUT_TypeDef; 

/**
  * @brief  EPWM CentralEvent PX OR PY output
  */
typedef enum
{
		EPWM_CentralEvent_NoChange 			=  ((CSP_REGISTER_T)(0x00ul)),	
		EPWM_CentralEvent_OutLow			=  ((CSP_REGISTER_T)(0x01ul)),
		EPWM_CentralEvent_OutHigh 			=  ((CSP_REGISTER_T)(0x02ul)),	
		EPWM_CentralEvent_Negate			=  ((CSP_REGISTER_T)(0x03ul)),
}EPWM_CentralEvent_PxOUT_TypeDef; 

/**
  * @brief  EPWM EqCMPBEvent PX OR PY output
  */
typedef enum
{
		EPWM_EqCMPBEvent_NoChange 			=  ((CSP_REGISTER_T)(0x00ul)),
		EPWM_EqCMPBEvent_OutLow				=  ((CSP_REGISTER_T)(0x01ul)),
		EPWM_EqCMPBEvent_OutHigh 			=  ((CSP_REGISTER_T)(0x02ul)),
		EPWM_EqCMPBEvent_Negate				=  ((CSP_REGISTER_T)(0x03ul))
}EPWM_EqCMPBEvent_PxOUT_TypeDef; 

/**
  * @brief  EPWM EqCMPAEvent PX OR PY output
  */
typedef enum
{
		EPWM_EqCMPAEvent_NoChange 			=  ((CSP_REGISTER_T)(0x00ul)),
		EPWM_EqCMPAEvent_OutLow				=  ((CSP_REGISTER_T)(0x01ul)),
		EPWM_EqCMPAEvent_OutHigh 			=  ((CSP_REGISTER_T)(0x02ul)),
		EPWM_EqCMPAEvent_Negate				=  ((CSP_REGISTER_T)(0x03ul))
}EPWM_EqCMPAEvent_PxOUT_TypeDef; 

 /**
  * @brief EPWM_PWM_Xx OR EPWM_PWM_Yx selected
  */
typedef enum
{
		EPWM_PWM_X0OrPWM_Y0 		=  0,	
		EPWM_PWM_X1OrPWM_Y1			=  1,
		EPWM_PWM_X2OrPWM_Y2 		=  2	
}EPWM_PWM_XxOrPWM_Yx_TypeDef;

 /**
  * @brief EPWM OUTSEL
  */
typedef enum
{
		EPWM_OUTSE_PXPYOutputDirect 		=  ((CSP_REGISTER_T)(0x00ul)),	
		EPWM_OUTSE_OutputComplementary		=  ((CSP_REGISTER_T)(0x01ul)),
		EPWM_OUTSE_OutputInterval 			=  ((CSP_REGISTER_T)(0x02ul))
		//EPWM_OUTSE_PXPYOutputDirect			=  ((CSP_REGISTER_T)(0x03ul))
}EPWM_OUTSEL_TypeDef;

 /**
  * @brief EPWM X POLARITY
  */
typedef enum
{
		EPWM_X_POLARITY_NoChange 	=  ((CSP_REGISTER_T)(0x00ul<<2)),	
		EPWM_X_POLARITY_Negate		=  ((CSP_REGISTER_T)(0x01ul<<2))
		
}EPWM_X_POLARITY_TypeDef;

 /**
  * @brief EPWM Y POLARITY
  */
typedef enum
{
		EPWM_Y_POLARITY_NoChange 	=  ((CSP_REGISTER_T)(0x00ul<<3)),	
		EPWM_Y_POLARITY_Negate		=  ((CSP_REGISTER_T)(0x01ul<<3))
		
}EPWM_Y_POLARITY_TypeDef;

 /**
  * @brief EPWM SRCSEL
  */
typedef enum
{
		EPWM_SRCSEL_PX 		=  ((CSP_REGISTER_T)(0x00ul<<4)),	
		EPWM_SRCSEL_PY		=  ((CSP_REGISTER_T)(0x01ul<<4))
}EPWM_SRCSEL_TypeDef;

 /**
  * @brief EPWM CNTR selected
  */
typedef enum
{
		EPWM_CNTR0 		=  0,	
		EPWM_CNTR1		=  1,
		EPWM_CNTR2 		=  2,
		EPWM_SLPCNTR0	=  3,
		EPWM_SLPCNTR1	=  4
}EPWM_CNTRX_Selected_TypeDef;

 /**
  * @brief EPWM INT set
  */
typedef enum
{
		EPWM_START0 		=  	((CSP_REGISTER_T)(0x01ul<<0)),
		EPWM_STOP0			=  	((CSP_REGISTER_T)(0x01ul<<1)),
		EPWM_PEND0 			= 	((CSP_REGISTER_T)(0x01ul<<2)),
		EPWM_CENTER0		= 	((CSP_REGISTER_T)(0x01ul<<3)),
		EPWM_START1 		=  	((CSP_REGISTER_T)(0x01ul<<4)),
		EPWM_STOP1			= 	((CSP_REGISTER_T)(0x01ul<<5)),
		EPWM_PEND1 			=  	((CSP_REGISTER_T)(0x01ul<<6)),
		EPWM_CENTER1		=	((CSP_REGISTER_T)(0x01ul<<7)),
		EPWM_START2 		= 	((CSP_REGISTER_T)(0x01ul<<8)),	
		EPWM_STOP2			=  	((CSP_REGISTER_T)(0x01ul<<9)),
		EPWM_PEND2 			=  	((CSP_REGISTER_T)(0x01ul<<10)),
		EPWM_CENTER2		=	((CSP_REGISTER_T)(0x01ul<<11)),
		EPWM0_CMPAUM		=	((CSP_REGISTER_T)(0x01ul<<12)),
		EPWM0_CMPADM		=	((CSP_REGISTER_T)(0x01ul<<13)),
		EPWM0_CMPBUM		=	((CSP_REGISTER_T)(0x01ul<<14)),
		EPWM0_CMPBDM		=	((CSP_REGISTER_T)(0x01ul<<15)),
		EPWM1_CMPAUM		=	((CSP_REGISTER_T)(0x01ul<<16)),
		EPWM1_CMPADM		=	((CSP_REGISTER_T)(0x01ul<<17)),
		EPWM1_CMPBUM		=	((CSP_REGISTER_T)(0x01ul<<18)),
		EPWM1_CMPBDM		=	((CSP_REGISTER_T)(0x01ul<<19)),
		EPWM2_CMPAUM		=	((CSP_REGISTER_T)(0x01ul<<20)),
		EPWM2_CMPADM		=	((CSP_REGISTER_T)(0x01ul<<21)),
		EPWM2_CMPBUM		=	((CSP_REGISTER_T)(0x01ul<<22)),
		EPWM2_CMPBDM		=	((CSP_REGISTER_T)(0x01ul<<23)),
		EPWM0_SLPA_OVF		=	((CSP_REGISTER_T)(0x01ul<<24)),	
		EPWM0_SLPB_OVF		=	((CSP_REGISTER_T)(0x01ul<<25)),	
		EPWM1_SLPA_OVF		=	((CSP_REGISTER_T)(0x01ul<<26)),	
		EPWM1_SLPB_OVF		=	((CSP_REGISTER_T)(0x01ul<<27)),	
}EPWM_INT_TypeDef;

 /**
  * @brief EPWM Carrier Wave Duty
  */
typedef enum
{
		EPWM_Carrier_Wave_Duty_1_8 		=  ((CSP_REGISTER_T)(0x01ul<<12)),
		EPWM_Carrier_Wave_Duty_2_8		=  ((CSP_REGISTER_T)(0x02ul<<12)),
		EPWM_Carrier_Wave_Duty_3_8 		=  ((CSP_REGISTER_T)(0x03ul<<12)),
		EPWM_Carrier_Wave_Duty_4_8 		=  ((CSP_REGISTER_T)(0x04ul<<12)),	
		EPWM_Carrier_Wave_Duty_5_8		=  ((CSP_REGISTER_T)(0x05ul<<12)),
		EPWM_Carrier_Wave_Duty_6_8 		=  ((CSP_REGISTER_T)(0x06ul<<12)),
		EPWM_Carrier_Wave_Duty_7_8 		=  ((CSP_REGISTER_T)(0x07ul<<12))
}EPWM_Carrier_Wave_Duty_TypeDef;

 /**
  * @brief EPWM Carrier CDIV
  */
typedef enum
{
		EPWM_CDIV_8 		=  ((CSP_REGISTER_T)(0x00ul<<8)),
		PWM_CDIV_16			=  ((CSP_REGISTER_T)(0x01ul<<8)),
		PWM_CDIV_24 		=  ((CSP_REGISTER_T)(0x02ul<<8)),
		PWM_CDIV_32 		=  ((CSP_REGISTER_T)(0x03ul<<8)),	
		PWM_CDIV_40			=  ((CSP_REGISTER_T)(0x04ul<<8)),
		PWM_CDIV_48 		=  ((CSP_REGISTER_T)(0x05ul<<8)),
		PWM_CDIV_56 		=  ((CSP_REGISTER_T)(0x06ul<<8)),
		PWM_CDIV_64 		=  ((CSP_REGISTER_T)(0x07ul<<8))
}EPWM_CDIV_TypeDef;

 /**
  * @brief EPWM Triggle Source 
  */
typedef enum
{
		CMP0LKM 		=  1,
		CMP1LKM			=  2,
		CMP2LKM 		=  3,
		CMP3LKM 		=  4,	
		CMP4LKM			=  5,
		EXI0LKM 		=  6,
		EXI1LKM 		=  7,
		EXI2LKM 		=  8,
		EXI3LKM 		=  9,
		EXI4LKM 		=  10,
		EXI5LKM 		=  11,
		EXI6LKM 		=  12,
		EXI7LKM 		=  13
}EPWM_Triggle_Source_TypeDef;

 /**
  * @brief EPMW LK mode selected
  */
typedef enum
{
		EPWM_LK_mode_disable_trig 			=  ((CSP_REGISTER_T)(0x00ul)),
		EPWM_LK_mode_enable_trig			=  ((CSP_REGISTER_T)(0x02ul)),
		EPWM_LK_mode_delay_trig 			=  ((CSP_REGISTER_T)(0x03ul)),
		EPWM_LK_mode_softLK_trig			=  ((CSP_REGISTER_T)(0x06ul)),	
		EPWM_LK_mode_HardLK_trig			=  ((CSP_REGISTER_T)(0x07ul))
}EPWM_LK_mode_selected_TypeDef;



 /**
  * @brief EPMW LK output selected 
  */
typedef enum
{
		EPWM_LK_output_HLP0XS 			=  1,
		EPWM_LK_output_HLP0YS			=  2,
		EPWM_LK_output_SLP0XS 			=  3,
		EPWM_LK_output_SLP0YS			=  4,	
		EPWM_LK_output_HLP1XS 			=  5,
		EPWM_LK_output_HLP1YS			=  6,
		EPWM_LK_output_SLP1XS 			=  7,
		EPWM_LK_output_SLP1YS			=  8,	
		EPWM_LK_output_HLP2XS 			=  9,
		EPWM_LK_output_HLP2YS			=  10,
		EPWM_LK_output_SLP2XS 			=  11,
		EPWM_LK_output_SLP2YS			=  12
}EPWM_LK_output_Select_TypeDef;

 /**
  * @brief EPMW LK output mode
  */
typedef enum
{
		EPWM_LK_output_LOW 		=  ((CSP_REGISTER_T)(0x00ul)),
		EPWM_LK_output_High		=  ((CSP_REGISTER_T)(0x01ul)),
		EPWM_LK_output_OP		=  ((CSP_REGISTER_T)(0x02ul)),
		EPWM_LK_output_keep		=  ((CSP_REGISTER_T)(0x03ul))
}EPWM_LK_output_TypeDef;

 /**
  * @brief EPMW SLCON Configure
  */
typedef enum
{
		EPWM_SL_DECA_EN0 		=  1,
		EPWM_SL_INCA_EN0		=  2,
		EPWM_SL_DECB_EN0		=  3,
		EPWM_SL_INCB_EN0		=  4,
		EPWM_SL_DECA_EN1 		=  5,
		EPWM_SL_INCA_EN1		=  6,
		EPWM_SL_DECB_EN1		=  7,
		EPWM_SL_INCB_EN1		=  8,
		EPWM_SL_CNTR_DEC_EN		=  9,
		EPWM_SL_CNTR_INC_EN		=  10
}EPWM_SLCON_TypeDef;

 /**
  * @brief EPMW EXTRG EVET Configure
  */
typedef enum
{
	EPWM0_EXTRG_START		=		0,
	EPWM0_EXTRG_STOP		=		1,
	EPWM0_EXTRG_PEND		=		2,
	EPWM0_EXTRG_CENTER		=		3,
	EPWM1_EXTRG_START		=		4,
	EPWM1_EXTRG_STOP		=		5,
	EPWM1_EXTRG_PEND		=		6,
	EPWM1_EXTRG_CENTER		=		7,
	EPWM2_EXTRG_START		=		8,
	EPWM2_EXTRG_STOP		=		9,
	EPWM2_EXTRG_PEND		=		10,
	EPWM2_EXTRG_CENTER		=		11,
	EPWM0_EXTRG_CMPAUM		=		12,
	EPWM0_EXTRG_CMPADM		=		13,
	EPWM0_EXTRG_CMPBUM		=		14,
	EPWM0_EXTRG_CMPBDM		=		15,
	EPWM1_EXTRG_CMPAUM		=		16,
	EPWM1_EXTRG_CMPADM		=		17,
	EPWM1_EXTRG_CMPBUM		=		18,
	EPWM1_EXTRG_CMPBDM		=		19,
	EPWM2_EXTRG_CMPAUM		=		20,
	EPWM2_EXTRG_CMPADM		=		21,
	EPWM2_EXTRG_CMPBUM		=		22,
	EPWM2_EXTRG_CMPBDM		=		23
}
EPWM_EXTRG_EVET_TypeDef;

 /**
  * @brief EPMW EXTRG Mode X
  */
typedef enum
{
	EPWM_EXTRG_Mode_NONE	=	0x00ul,
	EPWM_EXTRG_Mode_ADC		=	0x01ul,
	EPWM_EXTRG_Mode_STC16	=	0X02ul,
	EPWM_EXTRG_Mode_AdcStc16 =	0X03ul
}EPWM_EXTRG_Mode_TypeDef;
/******************************************************************************
********************* EPWM External Functions Declaration ********************
******************************************************************************/
extern void EPWM_RESET_VALUE(void);
extern void EPWM_software_reset(void);
extern void EPWM_CONFIG(void);
extern void EPWM_Software_Clr(void);
extern void EPWM_Hardware_Clr(void);
extern void EPWM_AllConter_START(void);
extern void EPWM_Conter0_START(void);
extern void EPWM_Conter1_START(void);
extern void EPWM_Conter2_START(void);
extern void EPWM_AllConter_stop(void);
extern void EPWM_Conter0_STOP(void);
extern void EPWM_Conter1_STOP(void);
extern void EPWM_Conter2_STOP(void);
extern void EPWM_Int_Enable(void);
extern void EPWM_Int_Disable(void);
extern void EPWM_Wakeup_Enable(void);
extern void EPWM_Wakeup_Disable(void);
extern void EPWM_CONFIG(void);
extern void EPWM_IO_Init(EPWM_IO_MODE_TypeDef  EPWM_IO_MODE_X , U8_T EPWM_IO_G );
extern void EPWM_CONTER_Configure(EPWM_CMODE_TypeDef EPWM_ContMode_X , EPWM_Conter_NUM_TypeDef EMP_Conter_X, EPWM_Overflow_Mode_TypeDef EMP_Overflow_Mode_X , U8_T  EPWM_DIVN , U16_T  EPWM_DINM );
extern void EPWM_PX_PY_Configure(EPWM_PXxOrPYx_TypeDef EPWM_PXxOrPYx , EPWM_StartStopEvent_PxOUT_TypeDef EPWM_StartStopEvent_X , EPWM_PendEvent_PxOUT_TypeDef EPWM_PendEvent_X , 
						EPWM_CentralEvent_PxOUT_TypeDef EPWM_CentralEvent_X , EPWM_EqCMPAEvent_PxOUT_TypeDef EPWM_EqCMPAEvent_X , EPWM_EqCMPBEvent_PxOUT_TypeDef EPWM_EqCMPBEvent_X  ,
						U16_T EPWM_CNTRX , U16_T EPWM_CMPARX , U16_T EPWM_CMPBRX);
extern void EPWM_OUTPUT_Configure(EPWM_PWM_XxOrPWM_Yx_TypeDef EPWM_PWM_XxOrPWM_Yx , EPWM_OUTSEL_TypeDef EPWM_OUTSEL_X , EPWM_X_POLARITY_TypeDef EPWM_X_POLARITY_X 
					, EPWM_Y_POLARITY_TypeDef EPWM_Y_POLARITY_X , EPWM_SRCSEL_TypeDef EPWM_SRCSEL_X , U16_T DTR , U16_T DTF);
extern void EPWM_Set_CNTRX_CMPARX_CMPBRX(EPWM_CNTRX_Selected_TypeDef EPWM_CNTRX_Selected , U16_T Load_PCNTRX , U16_T Load_PCMPARX , U16_T Load_PCMPBRX );
extern void EPWM_Set_SLPCNTRX_SLPCMPARX_SLPCMPBRX(EPWM_CNTRX_Selected_TypeDef EPWM_SLPCNTRX_Selected , U16_T Load_SLPCNTRX , U16_T Load_SLPCMPARX , U16_T Load_SLPCMPBRX );
extern void EPWM_ConfigInterrupt_CMD(EPWM_INT_TypeDef EPWM_INT_X , FunctionalStatus NewState);
extern void EPWM_Carrier_Wave_CMD(EPWM_PWM_XxOrPWM_Yx_TypeDef EPWM_PWM_XxOrPWM_Yx , EPWM_Carrier_Wave_Duty_TypeDef EPWM_Carrier_Wave_Duty_X ,
					EPWM_CDIV_TypeDef EPWM_CDIV_X , U8_T OSW_time , FunctionalStatus NewState);
extern void EPWM_LKCR_TRG_Configure(EPWM_Triggle_Source_TypeDef EPWM_Triggle_Source_X , U8_T EPWM_LK_mode_selected);
extern void EPWM_TrgivtAndTrgtdl_Set_Configure(U8_T EPWM_TRGTDL , U8_T EPWM_TRGIVT);
extern void EPWM_SoftHardWare_OUTPUT_Configure(EPWM_LK_output_Select_TypeDef EPWM_LK_output_Select_X , EPWM_LK_output_TypeDef EPWM_LK_output_X);
extern void EPMW_Soft_Lock_Auto_adjust_Configure(EPWM_SLCON_TypeDef EPWM_SLCON__X , FunctionalStatus NewState , U16_T INC_DEC_STEPX);
extern void EPMW_Soft_Lock_output_SLPXS_CMD(FunctionalStatus NewState);
extern void EPWM_EXTRG_Configure(EPWM_EXTRG_EVET_TypeDef EPWM_EXTRG_EVET_X , EPWM_EXTRG_Mode_TypeDef EPWM_EXTRG_Mode_X);
					
#endif   /**< apt32f172_epwm_H */

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/



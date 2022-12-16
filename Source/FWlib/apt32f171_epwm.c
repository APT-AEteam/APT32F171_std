/*
  ******************************************************************************
  * @file    apt32f171_epwm.c
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
#include "apt32f171_epwm.h"
/* defines -------------------------------------------------------------------*/
volatile U32_T R_EPWM_EMR_ST;
/* externs--------------------------------------------------------------------*/

 /*************************************************************/
//EPWM RESET VALUE
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_RESET_VALUE(void)
{
		EPWM->CR=PWM_CR_RST;     				/**< CR  reset value  	*/
		EPWM->LKCR=PWM_LKCR_RST;     			/**< LKCR  reset value 	*/
		EPWM->LKTRG=PWM_LKTRG_RST;     			/**< LKTRG  reset value */
		EPWM->CNTR0=PWM_CNTR0_RST;     			/**< CNTR0  reset value */
		EPWM->CNTBR0=PWM_CNTBR0_RST;     		/**< CNTBR0  reset value */
		EPWM->PCNTR0=PWM_PCNTR0_RST;     		/**< PCNTR0  reset value */
		EPWM->SLPCNTR0=PWM_SLPCNTR0_RST;     	/**< SLPCNTR0  reset value */
		EPWM->CNTR1=PWM_CNTR1_RST;     			/**< CNTR1  reset value */
		EPWM->CNTBR1=PWM_CNTBR1_RST;     		/**< CNTBR1  reset value */
		EPWM->PCNTR1=PWM_PCNTR1_RST;     		/**< PCNTR1  reset value */
		EPWM->SLPCNTR1=PWM_SLPCNTR1_RST;     	/**< SLPCNTR1  reset value */
		EPWM->CNTR2=PWM_CNTR2_RST;     			/**< CNTR2  reset value */
		EPWM->CNTBR2=PWM_CNTBR2_RST;     		/**< CNTBR2  reset value */
		EPWM->PCNTR2=PWM_PCNTR2_RST;     		/**< PCNTR2  reset value */
		EPWM->SLPCNTR2=PWM_SLPCNTR2_RST;     	/**< SLPCNTR2  reset value */
		EPWM->CMPAR0=PWM_CMPAR0_RST;     		/**< CMPAR0  reset value */
		EPWM->PCMPAR0=PWM_PCMPAR0_RST;     		/**< PCMPAR0  reset value */
		EPWM->SLPCMPAR0=PWM_SLPCMPAR0_RST;     	/**< SLPCMPAR0  reset value */
		EPWM->CMPBR0=PWM_CMPBR0_RST;     		/**< CMPBR0  reset value */
		EPWM->PCMPBR0=PWM_PCMPBR0_RST;     		/**< PCMPBR0  reset value */
		EPWM->SLPCMPBR0=PWM_SLPCMPBR0_RST;     	/**< SLPCMPBR0  reset value */
		EPWM->CMPAR1=PWM_CMPAR1_RST;     		/**< CMPAR1  reset value */
		EPWM->PCMPAR1=PWM_PCMPAR1_RST;     		/**< PCMPAR1  reset value */
		EPWM->SLPCMPAR1=PWM_SLPCMPAR1_RST;     	/**< SLPCMPAR1  reset value */
		EPWM->CMPBR1=PWM_CMPBR1_RST;     		/**< CMPBR1  reset value */
		EPWM->PCMPBR1=PWM_PCMPBR1_RST;     		/**< PCMPBR1 reset value */
		EPWM->SLPCMPBR1=PWM_SLPCMPBR1_RST;     	/**< SLPCMPBR1  reset value */
		EPWM->CMPAR2=PWM_CMPAR2_RST;     		/**< CMPAR2  reset value */
		EPWM->PCMPAR2=PWM_PCMPAR2_RST;    		/**< PCMPAR2  reset value */
		EPWM->SLPCMPAR2=PWM_SLPCMPAR2_RST;     	/**< SLPCMPAR2  reset value */
		EPWM->CMPBR2=PWM_CMPBR2_RST;     		/**< CMPBR2  reset value */
		EPWM->PCMPBR2=PWM_PCMPBR2_RST;     		/**< PCMPBR2 reset value */
		EPWM->SLPCMPBR2=PWM_SLPCMPBR2_RST;     	/**< SLPCMPBR2  reset value */
		EPWM->WGCR0=PWM_WGCR0_RST;     			/**< WGCR0  reset value */
		EPWM->WGCR1=PWM_WGCR1_RST;     			/**< WGCR1  reset value */
		EPWM->WGCR2=PWM_WGCR2_RST;     			/**< WGCR2  reset value */
		EPWM->OUTCR0=PWM_OUTCR0_RST;     		/**< OUTCR0  reset value */
		EPWM->OUTCR1=PWM_OUTCR1_RST;     		/**< OUTCR1  reset value */
		EPWM->OUTCR2=PWM_OUTCR2_RST;     		/**< OUTCR2  reset value */
		EPWM->CFCR0=PWM_CFCR0_RST;     			/**< CFCR0  reset value */
		EPWM->CFCR1=PWM_CFCR1_RST;     			/**< CFCR1  reset value */
		EPWM->CFCR2=PWM_CFCR2_RST;     			/**< CFCR2  reset value */
		EPWM->EMR=PWM_EMR_RST;     				/**< EMR  reset value */
		EPWM->SLCON=PWM_SLCON_RST;     			/**< SLCON  reset value */
		EPWM->SLSTEP0=PWM_SLSTEP0_RST;     		/**< SLSTEP0  reset value */
		EPWM->SLSTEP1=PWM_SLSTEP1_RST;     		/**< SLSTEP1 reset value */
		EPWM->IER=PWM_IER_RST;     				/**< IER reset value */
		EPWM->ICR=PWM_ICR_RST;     				/**< ICR reset value */
		EPWM->RISR=PWM_RISR_RST;     			/**< RISR reset value */
		EPWM->MISR=PWM_MISR_RST;     			/**< MISR reset value */
		EPWM->EXTRG0=PWM_EXTRG0_RST;     		/**< EXTRG0 reset value */
		EPWM->EXTRG1=PWM_EXTRG1_RST;     		/**< EXTRG1 reset value */
}

/*************************************************************/
//EPWM IO Init
//EntryParameter:EPWM_IO_MODE_X,EPWM_IO_G
//EPWM_IO_MODE_X:PWM_X0,PWM_Y0,PWM_X1,PWM_Y1,PWM_X2,PWM_Y2
//EPWM_IO_G;PWM_X0(0->PA0.0(AF4) ; 1->PB0.4(AF2) ; 2->PA1.4(AF4) ; 3->PA0.6(AF3) ; 4->PA0.9(AF1))
//PWM_Y0(0->PA0.1(AF4) ; 1->PB0.5(AF2) ; 2->PA0.5(AF3) ; 3->PA0.10(AF1))
//PWM_X1(0->PB0.0(AF4) ; 1->PA0.0(AF2) ; 2->PA1.5(AF4) ; 3->PA0.7(AF1))
//PWM_Y1(0->PB0.1(AF4) ; 1->PA0.1(AF2) ; 2->PA0.8(AF1))
//PWM_X2(0->PB0.0(AF2) ; 1->PC0.1(AF4) ; 2->PA0.5(AF1))
//PWM_Y2(0->PB0.1(AF2) ; 1->PA0.6(AF1))
//PWM_EP0(0->PB0.7)
//PWM_EP1(0->PC0.2)
//PWM_EP2(0->PC0.3)
//PWM_EP3(0->PB0.4)
//PWM_EP4(0->PA1.5)
//ReturnValue:NONE
/*************************************************************/
void EPWM_IO_Init(EPWM_IO_MODE_TypeDef  EPWM_IO_MODE_X , U8_T EPWM_IO_G )
{
	if(EPWM_IO_MODE_X==PWM_X0)
	{
		if(EPWM_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFFF0)|0x00000007;										//EPWM0_X(PA0.0->AF4)
		}
		else if(EPWM_IO_G==1)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFF0FFFF)|0x00050000;										//EPWM0_X(PB0.4->AF2)
		}
		else if(EPWM_IO_G==2)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x00070000;										//EPWM0_X(PA1.4->AF4)
		}
		else if(EPWM_IO_G==3)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XF0FFFFFF)|0x06000000;										//EPWM0_X(PA0.6->AF3)
		}
		else if(EPWM_IO_G==4)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFF0F)|0x00000040;										//EPWM0_X(PA0.9->AF1)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_Y0)
	{
		if(EPWM_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFF0F)|0x00000070;										//EPWM0_Y(PA0.1->AF4)
		}
		else if(EPWM_IO_G==1)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFF0FFFFF)|0x00500000;										//EPWM0_Y(PB0.5->AF2)
		}
		else if(EPWM_IO_G==2)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFF0FFFFF)|0x00600000;										//EPWM0_Y(PA0.5->AF3)
		}
		else if(EPWM_IO_G==3)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFF0FF)|0x00000400;										//EPWM0_Y(PA0.10->AF1)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_X1)
	{
		if(EPWM_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFFF0)|0x00000007;										//EPWM1_X(PB0.0->AF4)
		}
		else if(EPWM_IO_G==1)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFFF0)|0x00000005;										//EPWM1_X(PA0.0->AF2)
		}
		else if(EPWM_IO_G==2)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFF0FFFFF)|0x00700000;										//EPWM1_X(PA1.5->AF4)
		}
		else if(EPWM_IO_G==3)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0X0FFFFFFF)|0x40000000;										//EPWM1_X(PA0.7->AF1)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_Y1)
	{
		if(EPWM_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFF0F)|0x00000070;										//EPWM1_Y(PB0.1->AF4)
		}
		else if(EPWM_IO_G==1)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFF0F)|0x00000050;										//EPWM1_Y(PA0.1->AF2)
		}
		else if(EPWM_IO_G==2)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x00000004;										//EPWM1_Y(PA0.8->AF1)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_X2)
	{
		if(EPWM_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFFF0)|0x00000005;										//EPWM2_X(PB0.0->AF2)
		}
		else if(EPWM_IO_G==1)
		{
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFFF0F)|0x00000070;										//EPWM2_X(PC0.1->AF4)
		}
		else if(EPWM_IO_G==2)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFF0FFFFF)|0x00400000;										//EPWM2_X(PA0.5->AF1)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_Y2)
	{
		if(EPWM_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFF0F)|0x00000050;										//EPWM2_Y(PB0.1->AF2)
		}
		else if(EPWM_IO_G==1)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XF0FFFFFF)|0x04000000;										//EPWM2_Y(PA0.6->AF1)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_EP0)																	
	{
		if(EPWM_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0X0FFFFFFF)|0x50000000;										//EPWM2_Y(PB0.7->AF2)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_EP1)
	{
		if(EPWM_IO_G==0)
		{
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFF0FF)|0x00000600;										//EPWM_EP1(PC0.2->AF3)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_EP2)
	{
		if(EPWM_IO_G==0)
		{
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFF0FFF)|0x00004000;										//EPWM_EP2(PC0.3->AF1)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_EP3)
	{
		if(EPWM_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFF0FFFF)|0x00040000;										//EPWM_EP3(PB0.4->AF1)
		}
	}
	else if(EPWM_IO_MODE_X==PWM_EP4)
	{
		if(EPWM_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFF0FFFFF)|0x00600000;										//EPWM_EP4(PA1.5->AF3)
		}
	}
}

/*************************************************************/
//EPWM	CONTER Configure 
//EntryParameter:EPWM_ContMode_X,EMP_Conter_X,EMP_Overflow_X,GTC_DIVN,GTC_DINM
//EPWM_ContMode_X:EPWM_ContMode_increase,EPWM_ContMode_decrease,EPWM_ContMode_increaseTOdecrease,EPWM_ContMode_decreaseTOincrease
//EMP_Conter_X:EPWM_Conter_one,EPWM_Conter_three
//EMP_Overflow_Mode_X:EMP_Overflow_Mode_Continue,EMP_Overflow_Mode_once
//EPWM_DIVN:0~0X7
//EPWM_DINM;0~0XFFF
//ReturnValue:NONE
/*************************************************************/  
//EPWM_CLK=PCLK/(2^DIVN)/(DINM+1)
void EPWM_CONTER_Configure(EPWM_CMODE_TypeDef EPWM_ContMode_X , EPWM_Conter_NUM_TypeDef EMP_Conter_X, EPWM_Overflow_Mode_TypeDef EMP_Overflow_Mode_X , U8_T  EPWM_DIVN , U16_T  EPWM_DINM )
{
	EPWM->CR |= CKEN;
	EPWM->CR = EPWM_ContMode_X | EMP_Conter_X | EMP_Overflow_Mode_X | (EPWM_DIVN<<5) | (EPWM_DINM<<8) | CKEN ;
}
/*************************************************************/
//EPWM PX or PY Configure
//EntryParameter:EPWM_PXxOrPYx,EPWM_StartStopEvent_X,EPWM_PendEvent_X,EPWM_CentralStatue_X,EPWM_CentralEvent_X,EPWM_EqCMPAEvent_X,EPWM_EqCMPBEvent_X,EPWM_CNTRX,EPWM_CMPARX,EPWM_CMPBRX
//EPWM_PXxOrPYx:EPWM_P0X,EPWM_P0Y,EPWM_P1X,EPWM_P1Y,EPWM_P2X,EPWM_P2Y
//EPWM_StartStopEvent_X:EPWM_StartStopEvent_NoChange,EPWM_StartStopEvent_OutLow,EPWM_StartStopEvent_OutHigh,EPWM_StartStopEvent_Negate
//EPWM_PendEvent_X:EPWM_PendEvent_NoChange,EPWM_PendEvent_OutLow,EPWM_PendEvent_OutHigh,EPWM_PendEvent_Negate
//EPWM_CentralEvent_X:EPWM_CentralEvent_NoChange,EPWM_CentralEvent_OutLow,EPWM_CentralEvent_OutHigh,EPWM_CentralEvent_Negate
//EPWM_EqCMPAEvent_X:EPWM_EqCMPAEvent_NoChange,EPWM_EqCMPAEvent_OutLow,EPWM_EqCMPAEvent_OutHigh,EPWM_EqCMPAEvent_Negate
//EPWM_EqCMPBEvent_X:EPWM_EqCMPBEvent_NoChange,EPWM_EqCMPBEvent_OutLow,EPWM_EqCMPBEvent_OutHigh,EPWM_EqCMPBEvent_Negate
//EPWM_CNTRX:0~0xffff
//EPWM_CMPARX:0~0xffff
//EPWM_CMPBRX:0~0xffff
//ReturnValue:NONE
/*************************************************************/  
void EPWM_PX_PY_Configure(EPWM_PXxOrPYx_TypeDef EPWM_PXxOrPYx , EPWM_StartStopEvent_PxOUT_TypeDef EPWM_StartStopEvent_X , EPWM_PendEvent_PxOUT_TypeDef EPWM_PendEvent_X , 
						EPWM_CentralEvent_PxOUT_TypeDef EPWM_CentralEvent_X , EPWM_EqCMPAEvent_PxOUT_TypeDef EPWM_EqCMPAEvent_X , EPWM_EqCMPBEvent_PxOUT_TypeDef EPWM_EqCMPBEvent_X  ,
						U16_T EPWM_CNTRX , U16_T EPWM_CMPARX , U16_T EPWM_CMPBRX)
{
	if(EPWM_PXxOrPYx==EPWM_P0X)
	{
		EPWM->WGCR0&=0XFFFFFC00;
		EPWM->WGCR0|=(EPWM_StartStopEvent_X<<8)|(EPWM_PendEvent_X<<6)|(EPWM_CentralEvent_X<<4)|(EPWM_EqCMPBEvent_X<<2)|EPWM_EqCMPAEvent_X;
		EPWM->CNTR0=(0xA5<<24)|EPWM_CNTRX;
		EPWM->CMPAR0=(0xA5<<24)|EPWM_CMPARX;
		EPWM->CMPBR0=(0xA5<<24)|EPWM_CMPBRX;
	}
	else if(EPWM_PXxOrPYx==EPWM_P0Y)
	{
		EPWM->WGCR0&=0XFFF003FF;
		EPWM->WGCR0|=(EPWM_StartStopEvent_X<<18)|(EPWM_PendEvent_X<<16)|(EPWM_CentralEvent_X<<14)|(EPWM_EqCMPBEvent_X<<12)|(EPWM_EqCMPAEvent_X<<10);
		EPWM->CNTR0=(0xA5<<24)|EPWM_CNTRX;
		EPWM->CMPAR0=(0xA5<<24)|EPWM_CMPARX;
		EPWM->CMPBR0=(0xA5<<24)|EPWM_CMPBRX;
	}
	else if(EPWM_PXxOrPYx==EPWM_P1X)
	{
		EPWM->WGCR1&=0XFFFFFC00;
		EPWM->WGCR1|=(EPWM_StartStopEvent_X<<8)|(EPWM_PendEvent_X<<6)|(EPWM_CentralEvent_X<<4)|(EPWM_EqCMPBEvent_X<<2)|EPWM_EqCMPAEvent_X;
		EPWM->CNTR1=(0xA5<<24)|EPWM_CNTRX;
		EPWM->CMPAR1=(0xA5<<24)|EPWM_CMPARX;
		EPWM->CMPBR1=(0xA5<<24)|EPWM_CMPBRX;
	}
	else if(EPWM_PXxOrPYx==EPWM_P1Y)
	{
		EPWM->WGCR1&=0XFFF003FF;
		EPWM->WGCR1|=(EPWM_StartStopEvent_X<<18)|(EPWM_PendEvent_X<<16)|(EPWM_CentralEvent_X<<14)|(EPWM_EqCMPBEvent_X<<12)|(EPWM_EqCMPAEvent_X<<10);
		EPWM->CNTR1=(0xA5<<24)|EPWM_CNTRX;
		EPWM->CMPAR1=(0xA5<<24)|EPWM_CMPARX;
		EPWM->CMPBR1=(0xA5<<24)|EPWM_CMPBRX;
	}
	else if(EPWM_PXxOrPYx==EPWM_P2X)
	{
		EPWM->WGCR2&=0XFFFFFC00;
		EPWM->WGCR2|=(EPWM_StartStopEvent_X<<8)|(EPWM_PendEvent_X<<6)|(EPWM_CentralEvent_X<<4)|(EPWM_EqCMPBEvent_X<<2)|EPWM_EqCMPAEvent_X;
		EPWM->CNTR2=(0xA5<<24)|EPWM_CNTRX;
		EPWM->CMPAR2=(0xA5<<24)|EPWM_CMPARX;
		EPWM->CMPBR2=(0xA5<<24)|EPWM_CMPBRX;
	}
	else if(EPWM_PXxOrPYx==EPWM_P2Y)
	{
		EPWM->WGCR2&=0XFFF003FF;
		EPWM->WGCR2|=(EPWM_StartStopEvent_X<<18)|(EPWM_PendEvent_X<<16)|(EPWM_CentralEvent_X<<14)|(EPWM_EqCMPBEvent_X<<12)|(EPWM_EqCMPAEvent_X<<10);
		EPWM->CNTR2=(0xA5<<24)|EPWM_CNTRX;
		EPWM->CMPAR2=(0xA5<<24)|EPWM_CMPARX;
		EPWM->CMPBR2=(0xA5<<24)|EPWM_CMPBRX;
	}
}
 /*************************************************************/
//EPWM OUTPUT Configure
//EntryParameter:EPWM_PWM_XxOrPWM_Yx,EPWM_X_POLARITY_X,EPWM_Y_POLARITY_X,EPWM_OUTSEL_X,EPWM_SRCSEL_X,DTR,DTF
//EPWM_PWM_XxOrPWM_Yx:EPWM_PWM_X0OrPWM_Y0,EPWM_PWM_X1OrPWM_Y1,EPWM_PWM_X2OrPWM_Y2
//EPWM_OUTSEL_X:EPWM_OUTSE_PXPYOutputDirect,EPWM_OUTSE_OutputComplementary,EPWM_OUTSE_OutputInterval,
//EPWM_X_POLARITY_X:EPWM_X_POLARITY_NoChange,EPWM_X_POLARITY_Negate
//EPWM_Y_POLARITY_X:EPWM_Y_POLARITY_NoChange,EPWM_Y_POLARITY_Negate
//EPWM_SRCSEL_X:EPWM_SRCSEL_PX,EPWM_SRCSEL_PY
//DTR:0~0X1FF
//DTF:0~0X1FF
//ReturnValue:NONE
/*************************************************************/
//RED = DTR x (DIVM + 1) x 2DIVN x PCLK
//FED = DTF x (DIVM + 1) x 2DIVN x PCLK
void EPWM_OUTPUT_Configure(EPWM_PWM_XxOrPWM_Yx_TypeDef EPWM_PWM_XxOrPWM_Yx , EPWM_OUTSEL_TypeDef EPWM_OUTSEL_X , EPWM_X_POLARITY_TypeDef EPWM_X_POLARITY_X 
					, EPWM_Y_POLARITY_TypeDef EPWM_Y_POLARITY_X , EPWM_SRCSEL_TypeDef EPWM_SRCSEL_X , U16_T DTR , U16_T DTF)
{
	if(EPWM_PWM_XxOrPWM_Yx==EPWM_PWM_X0OrPWM_Y0)
	{
		EPWM->OUTCR0=EPWM_OUTSEL_X|EPWM_X_POLARITY_X|EPWM_Y_POLARITY_X|EPWM_SRCSEL_X|(DTR<<6)|(DTF<<15);
	}
	else if(EPWM_PWM_XxOrPWM_Yx==EPWM_PWM_X1OrPWM_Y1)
	{
		EPWM->OUTCR1=EPWM_OUTSEL_X|EPWM_X_POLARITY_X|EPWM_Y_POLARITY_X|EPWM_SRCSEL_X|(DTR<<6)|(DTF<<15);
	}
	else if(EPWM_PWM_XxOrPWM_Yx==EPWM_PWM_X2OrPWM_Y2)
	{
		EPWM->OUTCR2=EPWM_OUTSEL_X|EPWM_X_POLARITY_X|EPWM_Y_POLARITY_X|EPWM_SRCSEL_X|(DTR<<6)|(DTF<<15);
	}
}
/*************************************************************/
// EPWM CMPX CNTX Write
//EntryParameter:EPWM_CNTRX_Selected,Load_PCNTRX,Load_PCMPARX,Load_PCMPBRX,
//EPWM_CNTRX_Selected:EPWM_CNTR0,EPWM_CNTR1,EPWM_CNTR2
//Load_PCNTRX:0~0xffff
//Load_PCMPARX:0~0xffff
//Load_PCMPBRX:0~0xffff
//ReturnValue:NONE
/*************************************************************/ 
void EPWM_Set_CNTRX_CMPARX_CMPBRX(EPWM_CNTRX_Selected_TypeDef EPWM_CNTRX_Selected , U16_T Load_PCNTRX , U16_T Load_PCMPARX , U16_T Load_PCMPBRX )
{
	if(EPWM_CNTRX_Selected==EPWM_CNTR0)
	{
		EPWM->CNTR0=(0xA5<<24)|Load_PCNTRX;
		EPWM->CMPAR0=(0xA5<<24)|Load_PCMPARX;
		EPWM->CMPBR0=(0xA5<<24)|Load_PCMPBRX;
	}
	else if(EPWM_CNTRX_Selected==EPWM_CNTR1)
	{
		EPWM->CNTR1=(0xA5<<24)|Load_PCNTRX;
		EPWM->CMPAR1=(0xA5<<24)|Load_PCMPARX;
		EPWM->CMPBR1=(0xA5<<24)|Load_PCMPBRX;
	}
	else if(EPWM_CNTRX_Selected==EPWM_CNTR2)
	{
		EPWM->CNTR2=(0xA5<<24)|Load_PCNTRX;
		EPWM->CMPAR2=(0xA5<<24)|Load_PCMPARX;
		EPWM->CMPBR2=(0xA5<<24)|Load_PCMPBRX;
	}
}
/*************************************************************/
// EPWM SLPCNTX,SLPCMPAX,SLPCMPBX write
//EntryParameter:EPWM_SLPCNTRX_Selected,Load_SLPCNTRX,Load_SLPCMPARX,Load_SLPCMPBRX,
//EPWM_SLPCNTRX_Selected:EPWM_SLPCNTR0,EPWM_SLPCNTR1
//Load_SLPCNTRX:0~0xffff
//Load_SLPCMPARX:0~0xffff
//Load_SLPCMPBRX:0~0xffff
//ReturnValue:NOE
/*************************************************************/ 
void EPWM_Set_SLPCNTRX_SLPCMPARX_SLPCMPBRX(EPWM_CNTRX_Selected_TypeDef EPWM_SLPCNTRX_Selected , U16_T Load_SLPCNTRX , U16_T Load_SLPCMPARX , U16_T Load_SLPCMPBRX )
{
	if(EPWM_SLPCNTRX_Selected==EPWM_SLPCNTR0)
	{
		EPWM->SLPCNTR0=(0xA5<<24)|Load_SLPCNTRX;
		EPWM->SLPCMPAR0=(0xA5<<24)|Load_SLPCMPARX;
		EPWM->SLPCMPBR0=(0xA5<<24)|Load_SLPCMPBRX;
	}
	else if(EPWM_SLPCNTRX_Selected==EPWM_SLPCNTR1)
	{
		EPWM->SLPCNTR1=(0xA5<<24)|Load_SLPCNTRX;
		EPWM->SLPCMPAR1=(0xA5<<24)|Load_SLPCMPARX;
		EPWM->SLPCMPBR1=(0xA5<<24)|Load_SLPCMPBRX;
	}
}
/*************************************************************/
//EPWM software reset
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_software_reset(void)
{
	EPWM->CR = EPWM->CR | S_RST;									// Reset PWM
}
/*************************************************************/
//EPWM AllConter start
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_AllConter_START(void)
{
	EPWM->CR = EPWM->CR | PWMSTART;									// Start PWM
}
/*************************************************************/
//EPWM	Conter0 start
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_Conter0_START(void)
{
	EPWM->CR = EPWM->CR | PWM0START;									// Start PWM0
}
/*************************************************************/
//EPWM	Conter1 start
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_Conter1_START(void)
{
	EPWM->CR = EPWM->CR | PWM1START;									// Start PWM1
}
/*************************************************************/
//EPWM	Conter2 start
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_Conter2_START(void)
{
	EPWM->CR = EPWM->CR | PWM2START;									// Start PWM2
}
/*************************************************************/
//EPWM AllConter stop
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_AllConter_stop(void)
{
	EPWM->CR = EPWM->CR | PWMSTOP;									// stop PWM
	while( (EPWM->CR & BUSY) == BUSY );					// Check if the PWM is busy
}
/*************************************************************/
//EPWM	Conter0 stop
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_Conter0_STOP(void)
{
	EPWM->CR = EPWM->CR | PWM0STOP;									// Stop PWM0
	while( (EPWM->RISR & EPWM_STOP0)!=EPWM_STOP0 );					// Check if the PWM0 stop complete
}
/*************************************************************/
//EPWM	Conter1 stop
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_Conter1_STOP(void)
{
	EPWM->CR = EPWM->CR | PWM1STOP;									// Stop PWM1
	while( (EPWM->RISR & EPWM_STOP1)!=EPWM_STOP1 );					// Check if the PWM1 stop complete
}
/*************************************************************/
//EPWM	Conter2 stop
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void EPWM_Conter2_STOP(void)
{
	EPWM->CR = EPWM->CR | PWM2STOP;									// Stop PWM2
	while( (EPWM->RISR & EPWM_STOP2)!=EPWM_STOP2 );					// Check if the PWM2 stop complete
}
/*************************************************************/
// EPWM inturrpt Configure
//EntryParameter:EPWM_INT_X,NewState
//EPWM_INT_X:EPWM_START0,EPWM_STOP0,EPWM_PEND0,EPWM_CENTER0,EPWM_START1,EPWM_STOP1,EPWM_PEND1,EPWM_CENTER1,EPWM_START2,EPWM_STOP2,EPWM_PEND2,EPWM_CENTER2
//EPWM0_CMPAUM,EPWM0_CMPADM,EPWM0_CMPBUM,EPWM0_CMPBDM,EPWM1_CMPAUM,EPWM1_CMPADM,EPWM1_CMPBUM,EPWM1_CMPBDM,EPWM2_CMPAUM,EPWM2_CMPADM,EPWM2_CMPBUM,EPWM2_CMPBDM,
//EPWM0_SLPA_OVF,EPWM0_SLPB_OVF,EPWM1_SLPA_OVF,EPWM1_SLPB_OVF
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void EPWM_ConfigInterrupt_CMD(EPWM_INT_TypeDef EPWM_INT_X , FunctionalStatus NewState)
{
	if (NewState != DISABLE)
	{
		EPWM->IER  |= EPWM_INT_X;						//SET
	}
	else
	{
		EPWM->IER  &= ~EPWM_INT_X;						//CLR
	}
}
/*************************************************************/
//EPWM carrier wave Configure
//EntryParameter:EPWM_PWM_XxOrPWM_Yx,EPWM_Carrier_Wave_Duty_X,EPWM_CDIV_X,OSW_time,NewState
//EPWM_PWM_XxOrPWM_Yx:EPWM_PWM_X0OrPWM_Y0,EPWM_PWM_X1OrPWM_Y1,EPWM_PWM_X2OrPWM_Y2
//EPWM_Carrier_Wave_Duty_X:EPWM_Carrier_Wave_Duty_1_8,EPWM_Carrier_Wave_Duty_2_8,EPWM_Carrier_Wave_Duty_3_8,
//EPWM_Carrier_Wave_Duty_4_8,EPWM_Carrier_Wave_Duty_5_8,EPWM_Carrier_Wave_Duty_6_8,EPWM_Carrier_Wave_Duty_7_8
//EPWM_CDIV_X:EPWM_CDIV_8,PWM_CDIV_16,PWM_CDIV_24,PWM_CDIV_32,PWM_CDIV_40,PWM_CDIV_48,PWM_CDIV_56,PWM_CDIV_64
//OSW_time:0~16
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
//CarrierWave_Duty_time=OSW_time*(PCLK/CDIV)*8
void EPWM_Carrier_Wave_CMD(EPWM_PWM_XxOrPWM_Yx_TypeDef EPWM_PWM_XxOrPWM_Yx , EPWM_Carrier_Wave_Duty_TypeDef EPWM_Carrier_Wave_Duty_X ,
					EPWM_CDIV_TypeDef EPWM_CDIV_X , U8_T OSW_time , FunctionalStatus NewState)
{
	if(EPWM_PWM_XxOrPWM_Yx==EPWM_PWM_X0OrPWM_Y0)
	{
		EPWM->CFCR0=EPWM_Carrier_Wave_Duty_X|EPWM_CDIV_X|(OSW_time<<4);
		if (NewState != DISABLE)
		{
			EPWM->CFCR0  |= 0x01;						//SET
		}
		else
		{
			EPWM->CFCR0  &= 0xfffffffe;					//CLR
		}
	}
	else if(EPWM_PWM_XxOrPWM_Yx==EPWM_PWM_X1OrPWM_Y1)
	{
		EPWM->CFCR1=EPWM_Carrier_Wave_Duty_X|EPWM_CDIV_X|(OSW_time<<4);
		if (NewState != DISABLE)
		{
			EPWM->CFCR1  |= 0x01;						//SET
		}
		else
		{
			EPWM->CFCR1  &= 0xfffffffe;					//CLR
		}
	}
	else if(EPWM_PWM_XxOrPWM_Yx==EPWM_PWM_X2OrPWM_Y2)
	{
		EPWM->CFCR2|=EPWM_Carrier_Wave_Duty_X|EPWM_CDIV_X|(OSW_time<<4);
		if (NewState != DISABLE)
		{
			EPWM->CFCR2  |= 0x01;						//SET
		}
		else
		{
			EPWM->CFCR2  &= 0xfffffffe;					//CLR
		}
	}
}
/*************************************************************/
//EPWM LKCR TRG Configure
//EntryParameter:EPWM_Triggle_Source_X,EPWM_LK_mode_selected_X,EPWM_TRGIVT,EPWM_TRGTDL
//EPWM_Triggle_Source_X:CMP0LKM,CMP1LKM,CMP2LKM,CMP3LKM,CMP4LKM,EXI0LKM,EXI1LKM,EXI2LKM,EXI3LKM,EXI4LKM
//EPWM_LK_mode_selected:0~7
//ReturnValue:NONE
/*************************************************************/
//CMP0LKM CMP1LKM EXI0~3LKM option
//000： 禁止联动模式
//010： 正常启动触发
//011： 延时的启动触发
//110： 选择为软锁止的触发源
//111： 选择为硬锁止的触发源
//Other: 保留（禁止联动模式）

//CMP2LKM CMP3LKM EXI4LKM  option
//0?：禁止联动模式
//10：选择为软锁止的触发源
//11：选择为硬锁止的触发源

//CMP4LKM
//00：禁止联动模式
//01：选择为输出立即关断功能
//10：选择为软锁止的触发源
//11：选择为硬锁止的触发源
//IVT = TRGIVT x 4 x Tpwmclk  ; TDL = (TRGTDL+1) x 4 x Tpwmclk 
void EPWM_LKCR_TRG_Configure(EPWM_Triggle_Source_TypeDef EPWM_Triggle_Source_X , U8_T EPWM_LK_mode_selected)
{
	if(EPWM_Triggle_Source_X==CMP0LKM)
	{
		EPWM->LKCR&=0XFFFFFFF8;
		EPWM->LKCR|=EPWM_LK_mode_selected;
	}
	else if(EPWM_Triggle_Source_X==CMP1LKM)
	{
		EPWM->LKCR&=0XFFFFFFC7;
		EPWM->LKCR|=EPWM_LK_mode_selected<<3;
	}
	else if(EPWM_Triggle_Source_X==CMP2LKM)
	{
		EPWM->LKCR&=0XFFFFFF3F;
		EPWM->LKCR|=EPWM_LK_mode_selected<<6;
	}
	else if(EPWM_Triggle_Source_X==CMP3LKM)
	{
		EPWM->LKCR&=0XFFFFFCFF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<8;
	}
	else if(EPWM_Triggle_Source_X==CMP4LKM)
	{
		EPWM->LKCR&=0XFFFFF3FF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<10;
	}
	else if(EPWM_Triggle_Source_X==EXI0LKM)
	{
		EPWM->LKCR&=0XFFFF8FFF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<12;
	}
	else if(EPWM_Triggle_Source_X==EXI1LKM)
	{
		EPWM->LKCR&=0XFFFC7FFF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<15;
	}
	else if(EPWM_Triggle_Source_X==EXI2LKM)
	{
		EPWM->LKCR&=0XFFE3FFFF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<18;
	}
	else if(EPWM_Triggle_Source_X==EXI3LKM)
	{
		EPWM->LKCR&=0XFF1FFFFF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<21;
	}
	/*else if(EPWM_Triggle_Source_X==EXI4LKM)
	{
		EPWM->LKCR&=0XFCFFFFFF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<24;
	}
	else if(EPWM_Triggle_Source_X==EXI5LKM)
	{
		EPWM->LKCR&=0XF3FFFFFF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<26;
	}
	else if(EPWM_Triggle_Source_X==EXI6LKM)
	{
		EPWM->LKCR&=0XCFFFFFFF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<28;
	}
	else if(EPWM_Triggle_Source_X==EXI7LKM)
	{
		EPWM->LKCR&=0X3FFFFFFF;
		EPWM->LKCR|=EPWM_LK_mode_selected<<30;
	}*/
}
/*************************************************************/
//EPWM 延时触发时间和间隔时间设置
//EPWM_TRGTDL:0~14
//EPWM_TRGIVT:0~255
//ReturnValue:NONE
/*************************************************************/
void EPWM_TrgivtAndTrgtdl_Set_Configure(U8_T EPWM_TRGTDL , U8_T EPWM_TRGIVT)
{
	EPWM->LKTRG = (0XA5<<24) | (EPWM_TRGTDL<<8) | EPWM_TRGIVT;
}
/*************************************************************/
//EPWM Software clr
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPWM_Software_Clr(void)
{
	R_EPWM_EMR_ST=EPWM->EMR&0XFFFFFFFC;
	if(EPWM->EMR&0x02)
	{
		R_EPWM_EMR_ST|=0x02;
	}
	EPWM->EMR=R_EPWM_EMR_ST;
}
/*************************************************************/
//EPWM Hardware clr
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPWM_Hardware_Clr(void)
{
	R_EPWM_EMR_ST=EPWM->EMR&0XFFFFFFFC;
	if(EPWM->EMR&0x01)
	{
		R_EPWM_EMR_ST|=0x01;
	}
	EPWM->EMR=R_EPWM_EMR_ST;
	
	EPWM->EMR|=0x01;
}
/*************************************************************/
//EPWM software hardware output configure
//EntryParameter:EPWM_LK_output_Select_X,EPWM_LK_output_X
//EPWM_LK_output_Select_X:EPWM_LK_output_HLP0XS,EPWM_LK_output_HLP0YS,EPWM_LK_output_SLP0XS,EPWM_LK_outputSLP0YS,
//EPWM_LK_output_HLP1XS,EPWM_LK_output_HLP1YS,EPWM_LK_output_SLP1XS,EPWM_LK_output_SLP1YS
//,EPWM_LK_output_HLP2XS,EPWM_LK_output_HLP2YS,EPWM_LK_output_SLP2XS,EPWM_LK_output_SLP2YS
//EPWM_LK_output_X:EPWM_LK_output_LOW,EPWM_LK_output_High,EPWM_LK_output_OP,EPWM_LK_output_keep
//ReturnValue:NONE
/*************************************************************/
void EPWM_SoftHardWare_OUTPUT_Configure(EPWM_LK_output_Select_TypeDef EPWM_LK_output_Select_X , EPWM_LK_output_TypeDef EPWM_LK_output_X)
{
	if(EPWM_LK_output_Select_X==EPWM_LK_output_HLP0XS)
	{
		EPWM->EMR&=0XFFFFFFF3;
		EPWM->EMR|=EPWM_LK_output_X<<2;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_HLP0YS)
	{
		EPWM->EMR&=0XFFFFFFCF;
		EPWM->EMR|=EPWM_LK_output_X<<4;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_SLP0XS)
	{
		EPWM->EMR&=0XFFFFFF3F;
		EPWM->EMR|=EPWM_LK_output_X<<6;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_SLP0YS)
	{
		EPWM->EMR&=0XFFFFFCFF;
		EPWM->EMR|=EPWM_LK_output_X<<8;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_HLP1XS)
	{
		EPWM->EMR&=0XFFFFF3FF;
		EPWM->EMR|=EPWM_LK_output_X<<10;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_HLP1YS)
	{
		EPWM->EMR&=0XFFFFCFFF;
		EPWM->EMR|=EPWM_LK_output_X<<12;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_SLP1XS)
	{
		EPWM->EMR&=0XFFFF3FFF;
		EPWM->EMR|=EPWM_LK_output_X<<14;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_SLP1YS)
	{
		EPWM->EMR&=0XFFFCFFFF;
		EPWM->EMR|=EPWM_LK_output_X<<16;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_HLP2XS)
	{
		EPWM->EMR&=0XFFF3FFFF;
		EPWM->EMR|=EPWM_LK_output_X<<18;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_HLP2YS)
	{
		EPWM->EMR&=0XFFCFFFFF;
		EPWM->EMR|=EPWM_LK_output_X<<20;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_SLP2XS)
	{
		EPWM->EMR&=0XFF3FFFFF;
		EPWM->EMR|=EPWM_LK_output_X<<22;
	}
	else if(EPWM_LK_output_Select_X==EPWM_LK_output_SLP2YS)
	{
		EPWM->EMR&=0XFCFFFFFF;
		EPWM->EMR|=EPWM_LK_output_X<<24;
	}
}
/*************************************************************/
//EPMW Soft Lock Auto adjust Configure
//EntryParameter:EPWM_SLCON__X,NewStates
//EPWM_SLCON__X:EPWM_SL_DECA_EN0,EPWM_SL_INCA_EN0,EPWM_SL_DECB_EN0S,EPWM_SL_INCB_EN0
//EPWM_SL_DECA_EN1,EPWM_SL_INCA_EN1,EPWM_SL_DECB_EN1,EPWM_SL_INCB_EN1,EPWM_SL_CNTR_DEC_EN,
//EPWM_SL_CNTR_INC_EN,EPWM_S_ONE
//NewStates:ENABLE,DISABLE
//INC_DEC_STEPX:0~0xfff
//ReturnValue:NONE
/*************************************************************/
//每组CMPAX和CMPBX不能同时设置为增或者减
void EPMW_Soft_Lock_Auto_adjust_Configure(EPWM_SLCON_TypeDef EPWM_SLCON__X , FunctionalStatus NewState , U16_T INC_DEC_STEPX)
{
	if(EPWM_SLCON__X==EPWM_SL_DECA_EN0)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000001;
			EPWM->SLSTEP0=(EPWM->SLSTEP0&0XFFFFF000)|INC_DEC_STEPX;
		}
		else
		{
			EPWM->SLCON&=0XFFFFFFFE;
		}
	}
	else if(EPWM_SLCON__X==EPWM_SL_INCA_EN0)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000002;
			EPWM->SLSTEP0=(EPWM->SLSTEP0&0XFF000FFF)|(INC_DEC_STEPX<<12);
		}
		else
		{
			EPWM->SLCON&=0XFFFFFFFD;
		}
	}
	else if(EPWM_SLCON__X==EPWM_SL_DECB_EN0)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000004;
			EPWM->SLSTEP0=(EPWM->SLSTEP0&0XFFFFF000)|INC_DEC_STEPX;
		}
		else
		{
			EPWM->SLCON&=0XFFFFFFFB;
		}
	}
	else if(EPWM_SLCON__X==EPWM_SL_INCB_EN0)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000008;
			EPWM->SLSTEP0=(EPWM->SLSTEP0&0XFF000FFF)|(INC_DEC_STEPX<<12);
		}
		else
		{
			EPWM->SLCON&=0XFFFFFFF7;
		}
	}
	else if(EPWM_SLCON__X==EPWM_SL_DECA_EN1)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000010;
			EPWM->SLSTEP1=(EPWM->SLSTEP1&0XFFFFF000)|INC_DEC_STEPX;
		}
		else
		{
			EPWM->SLCON&=0XFFFFFFEF;
		}
	}
	else if(EPWM_SLCON__X==EPWM_SL_INCA_EN1)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000020;
			EPWM->SLSTEP1=(EPWM->SLSTEP1&0XFF000FFF)|(INC_DEC_STEPX<<12);
		}
		else
		{
			EPWM->SLCON&=0XFFFFFFDF;
		}
	}
	else if(EPWM_SLCON__X==EPWM_SL_DECB_EN1)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000040;
			EPWM->SLSTEP1=(EPWM->SLSTEP1&0XFFFFF000)|INC_DEC_STEPX;
		}
		else
		{
			EPWM->SLCON&=0XFFFFFFBF;
		}
	}
	else if(EPWM_SLCON__X==EPWM_SL_INCB_EN1)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000080;
			EPWM->SLSTEP1=(EPWM->SLSTEP1&0XFF000FFF)|(INC_DEC_STEPX<<12);
		}
		else
		{
			EPWM->SLCON&=0XFFFFFF7F;
		}
	}
	else if(EPWM_SLCON__X==EPWM_SL_CNTR_DEC_EN)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000100;
		}
		else
		{
			EPWM->SLCON&=0XFFFFFEFF;
		}
	}
	else if(EPWM_SLCON__X==EPWM_SL_CNTR_INC_EN)
	{
		if (NewState != DISABLE)
		{
			EPWM->SLCON|=0X00000200;
		}
		else
		{
			EPWM->SLCON&=0XFFFFFDFF;
		}
	}
}
/*************************************************************/
//EPMW Soft Lock output SLPXS CMD
//EntryParameter:NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void EPMW_Soft_Lock_output_SLPXS_CMD(FunctionalStatus NewState)		
{
	if (NewState != DISABLE)
	{
		EPWM->SLCON|=0X01000000;								//一直output SL_PXS设置状态  
	}
	else
	{
		EPWM->SLCON&=0XFEFFFFFF;								//只output一个周期 SL_PXS设置状态后输出PWM
	}
}
/*************************************************************/
//EPWM EXTRG enable
//EntryParameter:EPWM_EXTRG_EVET_X,EPWM_EXTRG_Mode_X
//EPWM_EXTRG_EVET_X:EPWM0_EXTRG_START,EPWM0_EXTRG_STOP,EPWM0_EXTRG_PEND,EPWM0_EXTRG_CENTER,
//EPWM1_EXTRG_START,EPWM1_EXTRG_STOP,EPWM1_EXTRG_PEND,EPWM1_EXTRG_CENTER,
//EPWM2_EXTRG_START,EPWM2_EXTRG_STOP,EPWM2_EXTRG_PEND,EPWM2_EXTRG_CENTER,
//EPWM0_EXTRG_CMPAUM,EPWM0_EXTRG_CMPADM,EPWM0_EXTRG_CMPBUM,EPWM0_EXTRG_CMPBDM,
//EPWM1_EXTRG_CMPAUM,EPWM1_EXTRG_CMPADM,EPWM1_EXTRG_CMPBUM,EPWM1_EXTRG_CMPBDM,
//EPWM2_EXTRG_CMPAUM,EPWM2_EXTRG_CMPADM,EPWM2_EXTRG_CMPBUM,EPWM2_EXTRG_CMPBDM,
//EPWM_EXTRG_Mode_X:EPWM_EXTRG_Mode_NONE,EPWM_EXTRG_Mode_ADC,EPWM_EXTRG_Mode_STC16,EPWM_EXTRG_Mode_AdcStc16
//ReturnValue:NONE
/*************************************************************/
void EPWM_EXTRG_Configure(EPWM_EXTRG_EVET_TypeDef EPWM_EXTRG_EVET_X , EPWM_EXTRG_Mode_TypeDef EPWM_EXTRG_Mode_X)	
{
	if(EPWM_EXTRG_EVET_X==EPWM0_EXTRG_START)
	{
		EPWM->EXTRG0&=0XFFFFFFFC;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X;
	}
	if(EPWM_EXTRG_EVET_X==EPWM0_EXTRG_STOP)
	{
		EPWM->EXTRG0&=0XFFFFFFF3;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<2;
	}
	if(EPWM_EXTRG_EVET_X==EPWM0_EXTRG_PEND)
	{
		EPWM->EXTRG0&=0XFFFFFFCF;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<4;
	}
	if(EPWM_EXTRG_EVET_X==EPWM0_EXTRG_CENTER)
	{
		EPWM->EXTRG0&=0XFFFFFF3F;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<6;
	}
	if(EPWM_EXTRG_EVET_X==EPWM1_EXTRG_START)
	{
		EPWM->EXTRG0&=0XFFFFFCFF;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<8;
	}
	if(EPWM_EXTRG_EVET_X==EPWM1_EXTRG_STOP)
	{
		EPWM->EXTRG0&=0XFFFFF3FF;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<10;
	}
	if(EPWM_EXTRG_EVET_X==EPWM1_EXTRG_PEND)
	{
		EPWM->EXTRG0&=0XFFFFCFFF;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<12;
	}
	if(EPWM_EXTRG_EVET_X==EPWM1_EXTRG_CENTER)
	{
		EPWM->EXTRG0&=0XFFFF3FFF;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<14;
	}
	if(EPWM_EXTRG_EVET_X==EPWM2_EXTRG_START)
	{
		EPWM->EXTRG0&=0XFFFCFFFF;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<16;
	}
	if(EPWM_EXTRG_EVET_X==EPWM2_EXTRG_STOP)
	{
		EPWM->EXTRG0&=0XFFF3FFFF;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<18;
	}
	if(EPWM_EXTRG_EVET_X==EPWM2_EXTRG_PEND)
	{
		EPWM->EXTRG0&=0XFFCFFFFF;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<20;
	}
	if(EPWM_EXTRG_EVET_X==EPWM2_EXTRG_CENTER)
	{
		EPWM->EXTRG0&=0XFF3FFFFF;
		EPWM->EXTRG0|=EPWM_EXTRG_Mode_X<<22;
	}
	if(EPWM_EXTRG_EVET_X==EPWM0_EXTRG_CMPAUM)
	{
		EPWM->EXTRG1&=0XFFFFFFFC;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X;
	}
	if(EPWM_EXTRG_EVET_X==EPWM0_EXTRG_CMPADM)
	{
		EPWM->EXTRG1&=0XFFFFFFF3;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<2;
	}
	if(EPWM_EXTRG_EVET_X==EPWM0_EXTRG_CMPBUM)
	{
		EPWM->EXTRG1&=0XFFFFFFCF;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<4;
	}
	if(EPWM_EXTRG_EVET_X==EPWM0_EXTRG_CMPBDM)
	{
		EPWM->EXTRG1&=0XFFFFFF3F;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<6;
	}
	if(EPWM_EXTRG_EVET_X==EPWM1_EXTRG_CMPAUM)
	{
		EPWM->EXTRG1&=0XFFFFFCFF;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<8;
	}
	if(EPWM_EXTRG_EVET_X==EPWM1_EXTRG_CMPADM)
	{
		EPWM->EXTRG1&=0XFFFFF3FF;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<10;
	}
	if(EPWM_EXTRG_EVET_X==EPWM1_EXTRG_CMPBUM)
	{
		EPWM->EXTRG1&=0XFFFFCFFF;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<12;
	}
	if(EPWM_EXTRG_EVET_X==EPWM1_EXTRG_CMPBDM)
	{
		EPWM->EXTRG1&=0XFFFF3FFF;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<14;
	}
	if(EPWM_EXTRG_EVET_X==EPWM2_EXTRG_CMPAUM)
	{
		EPWM->EXTRG1&=0XFFFCFFFF;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<16;
	}
	if(EPWM_EXTRG_EVET_X==EPWM2_EXTRG_CMPADM)
	{
		EPWM->EXTRG1&=0XFFF3FFFF;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<18;
	}
	if(EPWM_EXTRG_EVET_X==EPWM2_EXTRG_CMPBUM)
	{
		EPWM->EXTRG1&=0XFFCFFFFF;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<20;
	}
	if(EPWM_EXTRG_EVET_X==EPWM2_EXTRG_CMPBDM)
	{
		EPWM->EXTRG1&=0XFF3FFFFF;
		EPWM->EXTRG1|=EPWM_EXTRG_Mode_X<<22;
	}
}	
/*************************************************************/
//EPWM Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPWM_Int_Enable(void)
{
    INTC_ISER_WRITE(EPWM_INT);    
}
/*************************************************************/
//EPWM Interrupt disalbe
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPWM_Int_Disable(void)
{
    INTC_ICER_WRITE(EPWM_INT);    
}
/*************************************************************/
//EPWM Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPWM_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(EPWM_INT);    
}

/*************************************************************/
//EPWM Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPWM_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(EPWM_INT);    
}

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/
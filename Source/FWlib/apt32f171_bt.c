/*
  ******************************************************************************
  * @file    apt32f171_bt.c
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
#include "apt32f171_bt.h"

/* defines -------------------------------------------------------------------*/
/* externs--------------------------------------------------------------------*/


/*************************************************************/
//Deinitializes the registers to their default reset
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void BT_DeInit(CSP_BT_T *BTx)
{
	BTx->RSSR=BT_RESET_VALUE;
	BTx->CR=BT_RESET_VALUE;
	BTx->PSCR=BT_RESET_VALUE;
	BTx->PRDR=BT_RESET_VALUE;
	BTx->CMP=BT_RESET_VALUE;
	BTx->CNT=BT_RESET_VALUE;
	BTx->EVTRG=BT_RESET_VALUE;
	BTx->EVSWF=BT_RESET_VALUE;
	BTx->RISR=BT_RESET_VALUE;
	BTx->IMCR=BT_RESET_VALUE;
	BTx->MISR=BT_RESET_VALUE;
	BTx->ICR=BT_RESET_VALUE;
}
/*************************************************************/
//BT IO Init
//EntryParameter:LPT_OUT_PA09,LPT_OUT_PB01,LPT_IN_PA10,
//ReturnValue:NONE
/*************************************************************/
void BT_IO_Init(BT_Pin_TypeDef BT_IONAME)
{
	if(BT_IONAME==BT0_PA02)										
	{
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFF0FF)|0x00000500;  //BT0 PA0.2
	}
	if(BT_IONAME==BT0_PA08)										
	{
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x00000005;  //BT0 PA0.8
	}
	if(BT_IONAME==BT1_PA09)										
	{
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFF0F)|0x00000050;  //BT1 PA0.9
	}
	if(BT_IONAME==BT1_PC03)										
	{
		GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFF0FFF)|0x00006000;  //BT1 PC0.3
	}
	if(BT_IONAME==BT2_PB04)										
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFF0FFFF)|0x00070000;  //BT2 PB0.4
	}
	if(BT_IONAME==BT2_PC02)										
	{
		GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFF0FF)|0x00000700;  //BT2 PC0.2
	}
	if(BT_IONAME==BT3_PB07)										
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0X0FFFFFFF)|0x70000000;  //BT3 PB0.7
	}
	if(BT_IONAME==BT3_PC00)										
	{
		GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFFFF0)|0x00000005;  //BT3 PC0.0
	}
}
/*************************************************************/
// BT start
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Start(CSP_BT_T *BTx)
{
	BTx->RSSR |=0X01;
}
/*************************************************************/
// BT stop
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Stop(CSP_BT_T *BTx)
{
	BTx->RSSR &=0X0;
}
/*************************************************************/
// BT stop High
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Stop_High(CSP_BT_T *BTx)
{
	BTx->CR |=(0x01<<6);
	BTx->RSSR &=0X0;
}
/*************************************************************/
// BT stop Low
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Stop_Low(CSP_BT_T *BTx)
{
	BTx->CR =BTx->CR & ~(0x01<<6);
	BTx->RSSR &=0X0;
}
/*************************************************************/
// BT soft reset
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Soft_Reset(CSP_BT_T *BTx)
{
	BTx->RSSR |= (0X5<<12);
}
/*************************************************************/
//BT Configure
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Configure(CSP_BT_T *BTx,BT_CLK_TypeDef BTCLK,U16_T PSCR_DATA,BT_SHDWSTP_TypeDef BTSHDWSTP,BT_OPM_TypeDef BTOPM,BT_EXTCKM_TypeDef BTEXTCKM)
{
	BTx->CR |=BTCLK| BTSHDWSTP| BTOPM| BTEXTCKM;
	BTx->PSCR = PSCR_DATA;
}
/*************************************************************/
//BT ControlSet
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_ControlSet_Configure(CSP_BT_T *BTx,BT_STARTST_TypeDef BTSTART,BT_IDLEST_TypeDef BTIDLE,BT_SYNCEN0_TypeDef BTSYNC0,BT_SYNCEN1_TypeDef BTSYNC1,BT_SYNCEN2_TypeDef BTSYNC2,BT_SYNCMD_TypeDef BTSYNCMD,
							BT_OSTMDX_TypeDef BTOSTMD,BT_AREARM0_TypeDef BTAREARM0,BT_AREARM1_TypeDef BTAREARM1,BT_CNTRLD_TypeDef BTCNTRLD)
{
	BTx->CR |=BTSTART| BTIDLE| BTSYNC0| BTSYNC1| BTSYNC2| BTSYNCMD| BTOSTMD| BTAREARM0| BTAREARM1| BTCNTRLD;
}

/*************************************************************/
//BT_Read_REARM
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
uint8_t BT_Read_REARM(CSP_BT_T *BTx,BT_REARMX_TypeDef REARMX)       //cl
{
	uint8_t value = 0;
    uint32_t dat = 0;
	dat=((BTx)->CR)&(REARMX);
    if (dat == (REARMX))								
	{
	    value = 1;
	} 
    return value;
}
/*************************************************************/
//BT_Clear_REARM
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Clear_REARM(CSP_BT_T *BTx,BT_REARMX_TypeDef REARMX)       //cl
{
     BTx->CR |= REARMX;
}
/*************************************************************/
//BT Period / Compare set
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Period_CMP_Write(CSP_BT_T *BTx,U16_T BTPRDR_DATA,U16_T BTCMP_DATA)
{
	//BTx->CR|=0X01<<2;
	BTx->PRDR =BTPRDR_DATA;
	BTx->CMP =BTCMP_DATA;
}
/*************************************************************/
//BT COUNTER set
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_CNT_Write(CSP_BT_T *BTx,U16_T BTCNT_DATA)
{
	BTx->CNT =BTCNT_DATA;
}
/*************************************************************/
//BT read counters
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
U16_T BT_PRDR_Read(CSP_BT_T *BTx)
{
    return BTx->PRDR;
}
U16_T BT_CMP_Read(CSP_BT_T *BTx)
{
    return BTx->CMP;
}
U16_T BT_CNT_Read(CSP_BT_T *BTx)
{
    return BTx->CNT;
}
/*************************************************************/
//BT Trigger Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Trigger_Configure(CSP_BT_T *BTx,BT_TRGSRC_TypeDef BTTRG,BT_TRGOE_TypeDef BTTRGOE)
{
	BTx->EVTRG|=BTTRG| BTTRGOE;
}
/*************************************************************/
//BT SOFT Trigger
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Soft_Tigger(CSP_BT_T *BTx)
{
	BTx->EVSWF=0x01;
}
/*************************************************************/
//BT inturrpt Configure
//EntryParameter:BT_IMSCR_X,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void BT_ConfigInterrupt_CMD(CSP_BT_T *BTx,FunctionalStatus NewState,BT_IMSCR_TypeDef BT_IMSCR_X)
{
	if (NewState != DISABLE)
	{
		BTx->IMCR  |= BT_IMSCR_X;						
	}
	else
	{
		BTx->IMCR  &= ~BT_IMSCR_X;					
	}
}
/*************************************************************/
//BT0 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT0_INT);
}
/*************************************************************/
//BT0 Interrupt disable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0_INT_DISABLE(void)
{
	INTC_ICER_WRITE(BT0_INT);
}
/*************************************************************/
//BT1 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT1_INT);
}
/*************************************************************/
//BT1 Interrupt disable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1_INT_DISABLE(void)
{
	INTC_ICER_WRITE(BT1_INT);
}
/*************************************************************/
//BT2 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT2_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT2_INT);
}
/*************************************************************/
//BT2 Interrupt disable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT2_INT_DISABLE(void)
{
	INTC_ICER_WRITE(BT2_INT);
}
/*************************************************************/
//BT3 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT3_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT3_INT);
}
/*************************************************************/
//BT3 Interrupt disable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT3_INT_DISABLE(void)
{
	INTC_ICER_WRITE(BT3_INT);
}

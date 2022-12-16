/*
  ******************************************************************************
  * @file    apt32f171_et.c
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
#include "apt32f171_etcb.h"


/*************************************************************/
//ET RESET CLEAR ALL REGISTER
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void ET_DeInit(void)
{
	int i=0;
	ETCB->EN 			= ET_RESET_VALUE;
	ETCB->SWTRG 		= ET_RESET_VALUE;
	ETCB->CH0CON0 		= ET_RESET_VALUE;
	ETCB->CH0CON1	  	= ET_RESET_VALUE;
	ETCB->CH1CON0 		= ET_RESET_VALUE;
	ETCB->CH1CON1 		= ET_RESET_VALUE;
	ETCB->CH2CON0 		= ET_RESET_VALUE;
	ETCB->CH2CON1 		= ET_RESET_VALUE;
	for(i=0;i<29;i++)
	{
	    ETCB->CH3_31CON[i] = ET_RESET_VALUE;
	}
}
/*************************************************************/
//ET ENABLE
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void ET_ENABLE(void)
{
	ETCB->EN	=	0x01;
}
/*************************************************************/
//ET DISABLE
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void ET_DISABLE(void)
{
	ETCB->EN	=	0x00;
}
/*************************************************************/
//ET SWTRG Configure
//EntryParameter:ETSWTRG_X,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_SWTRG_CMD(CRC_ETSWTRG_TypeDef ETSWTRG_X,FunctionalStatus NewState)
{
	if (NewState != DISABLE)
	{
		ETCB->SWTRG  |= ETSWTRG_X;						
	}
	else
	{
		ETCB->SWTRG  &= ~ETSWTRG_X;					
	}
}
/*************************************************************/
//ET CHI0 source selection Configure
//EntryParameter:ETSWTRG_X,NewState,SRCSEL_X
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH0_DSTSEL(CRC_DSTSEL_TypeDef DST_X,FunctionalStatus NewState,U8_T DSTSEL_X)
{
	if (NewState != DISABLE)
	{
		if(DST_X==0)
		{
			ETCB->CH0CON0  |= 0X01| (DSTSEL_X<<1);
		}
		if(DST_X==1)
		{
			ETCB->CH0CON0  |= (0X01<<10)| (DSTSEL_X<<11);
		}
		if(DST_X==2)
		{
			ETCB->CH0CON0  |= (0X01<<20)| (DSTSEL_X<<21);
		}
	}
	else
	{
		if(DST_X==0)
		{
			ETCB->CH0CON0  &= 0X01| (DSTSEL_X<<1);
		}
		if(DST_X==1)
		{
			ETCB->CH0CON0  &= (0X00<<10)| (DSTSEL_X<<11);
		}
		if(DST_X==2)
		{
			ETCB->CH0CON0  &= (0X00<<20)| (DSTSEL_X<<21);
		}				
	}
}
/*************************************************************/
//ET CH0 CONTROL Configure
//EntryParameter:NewState,TRIGMODEX,SRCSEL_X
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH0_SRCSEL(FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X)
{
	if (NewState != DISABLE)
	{
		ETCB->CH0CON1  |= 0x01| (SRCSEL_X<<25)| TRIGMODEX;          //cl
	}
	else
	{
		ETCB->CH0CON1  &= 0x00| (SRCSEL_X<<25)| TRIGMODEX;
	}
	
}
/*************************************************************/
//ET CHI1 source selection Configure
//EntryParameter:ETSWTRG_X,NewState,SRCSEL_X
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH1_DSTSEL(CRC_DSTSEL_TypeDef DST_X,FunctionalStatus NewState,U8_T DSTSEL_X)
{
	if (NewState != DISABLE)
	{
		if(DST_X==0)
		{
			ETCB->CH1CON0  |= 0X01| (DSTSEL_X<<1);
		}
		if(DST_X==1)
		{
			ETCB->CH1CON0  |= (0X01<<10)| (DSTSEL_X<<11);
		}
		if(DST_X==2)
		{
			ETCB->CH1CON0  |= (0X01<<20)| (DSTSEL_X<<21);
		}
	}
	else
	{
		if(DST_X==0)
		{
			ETCB->CH1CON0  &= 0X01| (DSTSEL_X<<1);
		}
		if(DST_X==1)
		{
			ETCB->CH1CON0  &= (0X00<<10)| (DSTSEL_X<<11);
		}
		if(DST_X==2)
		{
			ETCB->CH1CON0  &= (0X00<<20)| (DSTSEL_X<<21);
		}				
	}
}
/*************************************************************/
//ET CH1 CONTROL Configure
//EntryParameter:NewState,TRIGMODEX,SRCSEL_X
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH1_SRCSEL(FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X)
{
	if (NewState != DISABLE)
	{
		ETCB->CH1CON1  |= 0x01| (SRCSEL_X<<25)| TRIGMODEX;          //cl
	}
	else
	{
		ETCB->CH1CON1  &= 0x00| (SRCSEL_X<<25)| TRIGMODEX;
	}
	
}
/*************************************************************/
//ET CHI2 source selection Configure
//EntryParameter:ETSWTRG_X,NewState,DSTSEL_X
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH2_DSTSEL(CRC_DSTSEL_TypeDef DST_X,FunctionalStatus NewState,U8_T DSTSEL_X)
{
	if (NewState != DISABLE)
	{
		if(DST_X==0)
		{
			ETCB->CH2CON0  |= 0X01| (DSTSEL_X<<1);
		}
		if(DST_X==1)
		{
			ETCB->CH2CON0  |= (0X01<<10)| (DSTSEL_X<<11);
		}
		if(DST_X==2)
		{
			ETCB->CH2CON0  |= (0X01<<20)| (DSTSEL_X<<21);
		}
	}
	else
	{
		if(DST_X==0)
		{
			ETCB->CH2CON0  &= 0X01| (DSTSEL_X<<1);
		}
		if(DST_X==1)
		{
			ETCB->CH2CON0  &= (0X00<<10)| (DSTSEL_X<<11);
		}
		if(DST_X==2)
		{
			ETCB->CH2CON0  &= (0X00<<20)| (DSTSEL_X<<21);
		}				
	}
}
/*************************************************************/
//ET CH2 CONTROL Configure
//EntryParameter:NewState,TRIGMODEX,SRCSEL_X
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH2_SRCSEL(FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X)
{
	if (NewState != DISABLE)
	{
		ETCB->CH2CON1  |= 0x01| (SRCSEL_X<<25)| TRIGMODEX;
	}
	else
	{
		ETCB->CH2CON1  &= 0x00| (SRCSEL_X<<25)| TRIGMODEX;
	}
	
}
/*************************************************************/
//ET CH3~31 source selection/CONTROL Configure
//EntryParameter:NewState,TRIGMODEX,SRCSEL_X
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CHx_CONTROL(CRC_ETCHX_TypeDef ETCHX,FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X,U8_T DSTSEL_X)
{
	if (NewState != DISABLE)
	{
		ETCB->CH3_31CON[ETCHX]  |= 0x01|(SRCSEL_X<<12)| (DSTSEL_X<<26)| TRIGMODEX;


	}
	else
	{
		ETCB->CH3_31CON[ETCHX]  &= 0x00|(SRCSEL_X<<12)| (DSTSEL_X<<26)| TRIGMODEX;

	}
}
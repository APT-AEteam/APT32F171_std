/*
  ******************************************************************************
  * @file    apt32f171_oamp.c
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

/* Define to prevent recursive inclusion -------------------------------------*/ 
#include "apt32f171_oamp.h"
/* defines -------------------------------------------------------------------*/

/* externs--------------------------------------------------------------------*/

/*************************************************************/
//OPA RESET VALUE
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void OPA0_RESET_VALUE(void)
{
		OAMP0->CR=OPA_CR_RST;     					/**< OPA0_CR  reset value   */
}
void OPA1_RESET_VALUE(void)
{
		OAMP1->CR=OPA_CR_RST;     					/**< OPA0_CR  reset value   */
}
/*************************************************************/
//OPA IO initial
//EntryParameter:OPA_IO_MODE_X,OPA_IO_G
//OPA_IO_MODE_X:OPA0P,OPA0N,OPA0X,OPA1P,OPA1N,OPA1X
//OPA_IO_G:OPA0P(0->PA1.4(AF7))),OPA0N(0->PA1.5(AF7))),OPA0X(0->PA1.3(AF7))),
//OPA1P(0->PA1.0(AF7))),OPA1N(0->PA1.2(AF7))),OPA1X(0->PA1.1(AF7)))
//ReturnValue:NONE
/*************************************************************/  
void OPA_IO_Init(OPA_IO_MODE_TypeDef  OPA_IO_MODE_X , U8_T OPA_IO_G )
{
	if(OPA_IO_MODE_X==OPA0P)
	{
		if(OPA_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x000A0000;										//OPA0P(PA1.4->AF7)
		}
	}
	else if(OPA_IO_MODE_X==OPA0N)
	{
		if(OPA_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFF0FFFFF)|0x00A00000;										//OPA0N(PA1.5->AF7)
		}
	}
	else if(OPA_IO_MODE_X==OPA0X)
	{
		if(OPA_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFF0FFF)|0x0000A000;										//OPA0X(PA1.3->AF7)
		}
	}
	else if(OPA_IO_MODE_X==OPA1P)
	{
		if(OPA_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFFF0)|0x0000000A;										//OPA1P(PA1.0->AF7)
		}
	}
	else if(OPA_IO_MODE_X==OPA1N)
	{
		if(OPA_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFF0FF)|0x00000A00;										//OPA1N(PA1.2->AF7)
		}
	}
	else if(OPA_IO_MODE_X==OPA1X)
	{
		if(OPA_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFF0F)|0x000000A0;										//OPA1X(PA1.1->AF7)
		}
	}
}
/*************************************************************/
//OPA Enable CMD
//EntryParameter:NewState,OPAx_NUM
//OPAx_NUM:OPA0_NUM,OPA1_NUM,
//
/*************************************************************/  
void OPA_EN_CMD(OPAx_selecte_TypeDef OPAx_NUM , FunctionalStatus NewState)
{
	if(OPAx_NUM==OPA0_NUM)
	{
		if (NewState != DISABLE)
		{
			OAMP0->CR|=0X01;								//Enable
		}
		else
		{
			OAMP0->CR&=0XFFFFFFFE;						//Disable
		}
	}
	else if(OPAx_NUM==OPA1_NUM)
	{
		if (NewState != DISABLE)
		{
			OAMP1->CR|=0X01;								//Enable
		}
		else
		{
			OAMP1->CR&=0XFFFFFFFE;						//Disablev
		}
	}
}
/*************************************************************/
//OPA Config Prg
//EntryParameter:OPAx_NUM,PGAEN_CMD_x,IPSEL_SET_x,PGAC_Set,GATRM_Set
//OPAx_NUM:OPA0_NUM,OPA1_NUM
//PGAEN_CMD_x:PGAEN_DISABLE,PGAEN_ENABLE
//Op_ExtPinConnect_X:Op_ExtPinConnect_EN,Op_ExtPinConnect_DIS
//BUFFER_EN:0:非buffer模式，1：内部增益使用buffer模式
//PGAC_Set:0~7 OPA0/1(0->x4,1->x5,2->x6,3->x7,4->x24,5->x30,6->x35,7->x40); 
//ReturnValue:NONE
/*************************************************************/  
void OPA_Config_Prg(OPAx_selecte_TypeDef OPAx_NUM , PGAEN_CMD_TypeDef PGAEN_CMD_x , Op_ExtPinConnect_TypeDef Op_ExtPinConnect_X  , BUFFEREN_CMD_TypeDef BUFFER_EN , U8_T PGAC_Set )
{
	if(OPAx_NUM==OPA0_NUM)
	{
		if(Op_ExtPinConnect_X==Op_ExtPinConnect_EN)
		{
			OAMP0->CR |= 0x00000100;
		}
		if(Op_ExtPinConnect_X==Op_ExtPinConnect_DIS)
		{
			OAMP0->CR &= (~0x00000100);
		}
		OAMP0->CR=(OAMP0->CR & 0XFFFFFDE1)|(PGAEN_CMD_x<<1)|(BUFFER_EN<<9)|(PGAC_Set<<2);
	}
	else if(OPAx_NUM==OPA1_NUM)
	{	
		if(Op_ExtPinConnect_X==Op_ExtPinConnect_EN)
		{
			OAMP1->CR |= 0x00000100;
		}
		if(Op_ExtPinConnect_X==Op_ExtPinConnect_DIS)
		{
			OAMP1->CR &= (~0x00000100);
		}
		OAMP1->CR=(OAMP0->CR & 0XFFFFFDE1)|(PGAEN_CMD_x<<1)|(BUFFER_EN<<9)|(PGAC_Set<<2);
	}
}

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/


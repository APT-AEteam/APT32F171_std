/*
  ******************************************************************************
  * @file    apt32f171_tc1.c
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
#include "apt32f171_tc1.h"
/* defines -------------------------------------------------------------------*/

/* externs--------------------------------------------------------------------*/


/*************************************************************/
//TC1 RESET VALUE
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void TC1_RESET_VALUE(void)									//reset value
{
	TC1->IDR 	= TC1_IDR_RST;											/**< IDR reset value         */    
	TC1->CSSR 	= TC1_CSSR_RST;	     								   	/**< CSSR reset value        */
	TC1->CEDR 	= TC1_CEDR_RST;  	 									/**< CEDR reset value        */
	TC1->SRR 	= TC1_SRR_RST;             								/**< SRR reset value         */
	TC1->CSR 	= TC1_CSR_RST;             	 							/**< CSR reset value         */
	TC1->CCR 	= TC1_CCR_RST;              							/**< CCR reset value         */
	TC1->SR 	= TC1_SR_RST;           								/**< SR reset value          */
	TC1->IMSCR 	= TC1_IMSCR_RST;        								/**< IMSCR reset value       */
	TC1->RISR	= TC1_RISR_RST;          								/**< RISR reset value        */
	TC1->MISR 	= TC1_MISR_RST;         								/**< MIS reset value        */
	TC1->ICR 	= TC1_ICR_RST;          								/**< ICR reset value         */
	TC1->CDR 	= TC1_CDR_RST;        									/**< SR reset value          */
	TC1->CSMR 	= TC1_CSMR_RST;           								/**< SR reset value          */
	TC1->PRDR 	= TC1_PRDR_RST;           								/**< DR reset value          */
	TC1->PULR	= TC1_PULR_RST;          								/**< SR reset value          */
	TC1->CUCR 	= TC1_CUCR_RST;         								/**< SR reset value          */
	TC1->CDCR 	= TC1_CDCR_RST;            								/**< SR reset value          */
	TC1->CVR	= TC1_CVR_RST;											/**< CVR reset value         */
}
/*************************************************************/
//TC1 Configure
//EntryParameter:TC1_FIN_X,TC1_DIVN,TC1_DINM,Counter_Size_X,loadCounter_PRDR,loadCounter_PULR
//TC1_FIN_X:TC1_FIN_PCK,TC1_FIN_TCLK0,TC1_FIN_TCLK2,TC1_FIN_CountA,TC1_FIN_IMOSC
//TC1_DIVN:VALUE=0~15
//TC1_DINM:0~255
//Counter_Size_X:Counter_Size_8BIT,Counter_Size_10BIT,Counter_Size_16BIT,Counter_Size_32BIT
//loadCounter_PRDR:Timer/Counter Period Data Register
//loadCounter_PULR:loadCounter_PULR<loadCounter_PRDR  (attention)
//ReturnValue:NONE
/*************************************************************/  
  //TCCLK=FIN/2^DIVN/(DINM+1)  TC1_FIN_TypeDef;
  //It is forbidden to set DIVM to zero when DIVN is not zero
void TC1_Configure(TC1_FIN_TypeDef  TC1_FIN_X, int  TC1_DIVN , int  TC1_DINM , Counter_Size_TypeDef  Counter_Size_X  , U32_T loadCounter_PRDR , U32_T loadCounter_PULR)
{
	TC1->CSSR = TC1_FIN_X;													//selected TC1 clk
	TC1->CEDR = TC1_CLKEN|TC1_DBGEN;										//ENABLE TC1 CLK
	TC1->CDR = TC1_DIVN|(TC1_DINM<<4);										//DIVN and DINM set
	TC1->CSMR = Counter_Size_X;												//selected TC1 conter size
	TC1->PRDR = loadCounter_PRDR;											//Period of TC1 date register
	TC1->PULR = loadCounter_PULR;											//Pulse of TC1 date register
}

/*************************************************************/
//TC1 Timer/Counter Control Set Register
//EntryParameter:TC1_ControlSet_x,NewState
//TC1_ControlSet_x:Reference library
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/  
void TC1_ControlSet_Configure (TC1_ControlSet_TypeDef TC1_ControlSet_x , FunctionalStatus NewState)
{
	if (NewState != DISABLE)
	{
		TC1->CSR |= TC1_ControlSet_x;
		if(TC1_ControlSet_x)
		{
			while(!(TC1->SR&TC1_ControlSet_x));
		}
	}
	else
	{
		TC1->CCR |= TC1_ControlSet_x;
		while(TC1->SR&TC1_ControlSet_x);
	}
}

/*************************************************************/
//TC1 inturrpt Configure
//EntryParameter:TC1_IMSCR_X,NewState
//TC1_IMSCR_X:TC1_STARTI,TC1_STOPI,TC1_PSTARTI,TC1_PENDI,TC1_MATI,TC1_OVFI,TC1_CAPTI
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void TC1_ConfigInterrupt_CMD(TC1_IMSCR_TypeDef TC1_IMSCR_X , FunctionalStatus NewState)
{
	if (NewState != DISABLE)
	{
		TC1->IMSCR  |= TC1_IMSCR_X;						//SET
	}
	else
	{
		TC1->IMSCR  &= ~TC1_IMSCR_X;					//CLR
	}
}

/*************************************************************/
//TC1 software reset
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void TC1_SoftwareReset(void)
{
	TC1->SRR = TC1_SWRST;							// Software reset
}
  
/*************************************************************/
//TC1 start stop
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void TC1_start_stop(void)
{
	TC1_ControlSet_Configure (TC1_ControlSet_start_stop , ENABLE); 
}
/*************************************************************/
//TC1 start
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void TC1_Start(void)
{
	TC1_ControlSet_Configure (TC1_ControlSet_start_stop , ENABLE); 
}
/*************************************************************/
//TC1 stop
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void TC1_Stop(void)
{
	TC1_ControlSet_Configure (TC1_ControlSet_start_stop , DISABLE); 
}
/*************************************************************/
// TC1 counter read
//EntryParameter:
//ReturnValue:Counter value
/*************************************************************/ 
/*U32_T TC1_Counter_Value(void)
{
	return (TC1->CVR);
}*/
/*************************************************************/
//TC1 counter period DATA read 
//EntryParameter:loadCounter_PRDR,loadCounter_PULR
//ReturnValue:Conter prdr register value
/*************************************************************/  
void TC1_Set_Period(U32_T loadCounter_PRDR , U32_T loadCounter_PULR)
{
	TC1->CSR = (TC1->CSR & 0xFFFFFFFD) | 0x02;
	while(!((TC1->SR & 0x02)==0X02));
	TC1->PRDR = loadCounter_PRDR;											//Period of TC1 date register
	TC1->PULR = loadCounter_PULR;											//Pulse of TC1 date register
}
/*************************************************************/
//TC1 counter period DATA read 
//EntryParameter:
//ReturnValue:Conter prdr register value
/*************************************************************/ 
/*U32_T TC1_Counter_PRDR_Value(void)
{
	return (TC1->PRDR);
}*/

/*************************************************************/
//TC1 CaptureUp Count Value read 
//EntryParameter:
//ReturnValue:CaptureUp Count Value
/*************************************************************/ 
/*U32_T TC1_CaptureUp_Count_Value(void)
{
	return (TC1->CUCR);
}*/

/*************************************************************/
//TC1 CaptureDown Count Value read 
//EntryParameter:
//ReturnValue:CaptureDown Count Value
/*************************************************************/ 
/*U32_T TC1_CaptureDown_Count_Value(void)
{
	return (TC1->CDCR);
}*/
/*************************************************************/
//TC1 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC1_Int_Enable(void)
{
    INTC_ISER_WRITE(TC1_INT);    
}

/*************************************************************/
//TC1 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC1_Int_Disable(void)
{
    INTC_ICER_WRITE(TC1_INT);    
}
/*************************************************************/
//TC1 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC1_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(TC1_INT);    
}

/*************************************************************/
//TC1 Interrupt wake up disalbe
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC1_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(TC1_INT);    
}
/*************************************************************/
//TC1 IO Init
//EntryParameter:TC1_IO_MODE_X,TC1_IO_G
//TC1_IO_MODE_X:TC1_IO_TXOUT,TC1_IO_TCLK,TC1_IO_TCAPX
//TC1_IO_G;TC1_IO_TXOUT(0->PB0.5 ;1->PA0.06;2->PC0.3;3->PA0.2),TC1_IO_TCLK(0->PB0.3),TC1_IO_TCAPX(0->PA1.0;1->PA1.1)
//ReturnValue:NONE
/*************************************************************/
void TC1_IO_Init(TC1_IO_MODE_TypeDef  TC1_IO_MODE_X , U8_T TC1_IO_G )
{
	if(TC1_IO_MODE_X==TC1_IO_TXOUT)
	{
		if(TC1_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFF0FFFFF)|0x00400000;										//T1OUT(PB0.5->AF1)
		}
		else if(TC1_IO_G==1)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XF0FFFFFF)|0x05000000;										//T1OUT(PA0.06->AF2)
		}
		else if(TC1_IO_G==2)
		{
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFF0FFF)|0x00005000;										//T1OUT(PC0.03->AF2)
		}
		else if(TC1_IO_G==3)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFF0FF)|0x00000600;										//T1OUT(PA0.2->AF3)
		}
	}
	else if(TC1_IO_MODE_X==TC1_IO_TCLK)
	{
		if(TC1_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFF0FFF)|0x00005000;										//TCLK(PB0.3->AF2)
		}
	}
	else if(TC1_IO_MODE_X==TC1_IO_TCAPX)
	{
		if(TC1_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFFF0)|0x00000006;										//TCAP1(PA1.0->AF3)
		}	
		else if(TC1_IO_G==1)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFF0F)|0x00000040;										//TCAP1(PA1.1->AF1)
		}
	}
}

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/
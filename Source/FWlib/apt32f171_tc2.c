/*
  ******************************************************************************
  * @file    apt32f171_tc2.c
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
#include "apt32f171_tc2.h"
/* defines -------------------------------------------------------------------*/

/* externs--------------------------------------------------------------------*/


/*************************************************************/
//TC2 RESET VALUE
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/  
void TC2_RESET_VALUE(void)									//reset value
{
  	TC2->IDR=TC2_IDR_RST;          			/**< IDR reset value      */
   	TC2->CEDR=TC2_CEDR_RST;		 			/**< CEDR reset value     */	
   	TC2->RSSR=TC2_RSSR_RST;					/**< RSSR reset value     */	
   	TC2->IMSCR=TC2_IMSCR_RST;					/**< IMSCR reset value    */	
   	TC2->RISR=TC2_RISR_RST;					/**< RISR reset value     */	
  	TC2->MISR=TC2_MISR_RST;					/**< MISR reset value     */	
   	TC2->ICR=TC2_ICR_RST;						/**< ICR reset value      */	
   	TC2->SR=TC2_SR_RST;						/**< SR reset value       */	
   	TC2->MR=TC2_MR_RST;						/**< MR reset value       */	
  	TC2->CNTBR=TC2_CNTBR_RST;					/**< CNTBR reset value    */
   	TC2->CNTR=TC2_CNTR_RST;					/**< CNTR reset value     */
   	TC2->CDR=TC2_CDR_RST;						/**< CDR reset value      */
   	TC2->PCNTR=TC2_PCNTR_RST;					/**< PCNTR reset value    */
   	TC2->CRR=TC2_CRR_RST;						/**< CRR reset value      */
   	TC2->CMR=TC2_CMR_RST;						/**< CMR reset value      */
  	TC2->CIMSCR=TC2_CIMSCR_RST;				/**< CIMSCR reset value   */	
   	TC2->CRISR=TC2_CRISR_RST;					/**< CRISR reset value    */	
   	TC2->CMISR=TC2_CMISR_RST;					/**< CMISR reset value    */
   	TC2->CICR=TC2_CICR_RST;					/**< CICR reset value     */	
   	TC2->CAPSR=TC2_CAPSR_RST;					/**< CAPSR reset value    */
   	TC2->CC0R=TC2_CC0R_RST;					/**< CC0R reset value     */
   	TC2->CC1R=TC2_CC1R_RST;					/**< CC1R reset value     */
}
/*************************************************************/
//TC2 IO Init
//EntryParameter:TC2_IO_MODE_X,TC2_IO_G
//TC2_IO_MODE_X:TC2_IO_CAP0,TC2_IO_CAP1
//TC2_IO_CAP0(0->PA0.7(AF2);1->PA1.0(AF1))
//TC2_IO_CAP1(0->PA1.2(AF1))
//ReturnValue:NONE
/*************************************************************/
void TC2_IO_Init(TC2_IO_MODE_TypeDef  TC2_IO_MODE_X , U8_T TC2_IO_G )
{
	if(TC2_IO_MODE_X==TC2_IO_CAP0)
	{
		if(TC2_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0X0FFFFFFF)|0x50000000;										//TC2_IO_CAP0(PA0.7->AF2)
		}
		else if(TC2_IO_G==1)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFFF0)|0x00000004;										//TC2_IO_CAP0(PA1.0->AF1)
		}
	}
	else if(TC2_IO_MODE_X==TC2_IO_CAP1)
	{
		if(TC2_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFF0FF)|0x00000400;										//TC2_IO_CAP0(PA1.2->AF1)
		}
	}
}
/*************************************************************/
//TC2 CLK CMD
//EntryParameter:NewState
//NewState:DISABLE,ENABLE
//ReturnValue:NONE
/*************************************************************/
void TC2_Clk_CMD(FunctionalStatus NewState)
{
	if(NewState != DISABLE)
	{
		TC2->CEDR |= 0x01;							//enable TC2 clk 
	}
	else
	{
		TC2->CEDR &= 0XFFFFFFFE;					//Disable TC2 clk 
	}
}
/*************************************************************/
//TC2 Softreset
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void TC2_Softreset(void)
{
	TC2->RSSR|=0x80000000;
}
/*************************************************************/
//TC2 start
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void TC2_Start(void)
{
	TC2->RSSR|=0X01;									//TC2 start
	while(!(TC2->SR&0X80000000));						//计数器正在工作
}
/*************************************************************/
//TC2 stop
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void TC2_stop(void)
{
	TC2->RSSR|=0X02;									//TC2 stop
	while(TC2->SR&0X80000000);							//计数器没有工作
}
/*************************************************************/
//TC2 Channel0 CMD
//EntryParameter:NewState
//NewState:DISABLE,ENABLE
//ReturnValue:NONE
/*************************************************************/ 
void TC2_Channel0_CMD(FunctionalStatus NewState)
{
	if(NewState != DISABLE)
	{
		TC2->CRR |= 0x01;							//enable TC2 Channel0 clk 
	}
	else
	{
		TC2->CRR &= 0XFFFFFFFE;						//Disable TC2 Channel0 clk 
	}
}
/*************************************************************/
//TC2 Channel1 CMD
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void TC2_Channel1_CMD(FunctionalStatus NewState)
{
	if(NewState != DISABLE)
	{
		TC2->CRR |= 0x02;							//enable TC2 Channel1 clk 
	}
	else
	{
		TC2->CRR &= 0XFFFFFFFD;						//Disable TC2 Channel1 clk 
	}
}
/*************************************************************/
//TC2 Match INT Configure
//EntryParameter:TC2_MINT_X,NewState
//TC2_MINT_X:TC2_STARTI,TC2_STOPI,TC2_PENDI,
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void TC2_MINT_CMD(TC2_MINT_TypeDef TC2_MINT_X , FunctionalStatus NewState)
{
	if (NewState != DISABLE)
	{
		TC2->IMSCR |= TC2_MINT_X;					//SET
	}
	else
	{
		TC2->IMSCR &= ~ TC2_MINT_X;				//CLR
	}
}
/*************************************************************/
//TC2 Capture INT Configure
//EntryParameter:TC2_CINT_X,NewState
//TC2_CINT_X:TC2_CC0RI,TC2_CC1RI,TC2_CC0FI,TC2_CC1FI,TC2_Match0,TC2_Match1
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void TC2_CINT_CMD(TC2_CINT_TypeDef TC2_CINT_X , FunctionalStatus NewState)
{
	if (NewState != DISABLE)
	{
		TC2->CIMSCR |=TC2_CINT_X;					//SET
	}
	else
	{
		TC2->CIMSCR &=(~TC2_CINT_X);				//CLR
	}
}
/*************************************************************/
//TC2 Configure 
//EntryParameter:TC2_Count_mode_X,TC2_Count_STOPTYPE,TC2_CM0_Mode_X,TC2_CM1_Mode_X,TC2_DIVM,TC2_DIVN
//TC2_Count_mode_X:TC2_Count_mode_Continue,TC2_Count_mode_Oneshot
//TC2_Count_STOPTYPE:TC2_Count_STOPTYPE_AutoLoad,TC2_Count_STOPTYPE_StopConmand
//TC2_CM0_Mode_X:TC2_CM0_Mode_Capture,TC2_CM0_Mode_Match
//TC2_CM1_Mode_X:TC2_CM1_Mode_Capture,TC2_CM1_Mode_Match
//TC2_DIVM:0~0x3ff
//TC2_DIVN:0~0x0f
//ReturnValue:NONE
/*************************************************************/
void TC2_Configure(TC2_Count_mode_TypeDef TC2_Count_mode_X , TC2_Count_STOPTYPE_TypeDef TC2_Count_STOPTYPE
					 , TC2_CM0_Mode_TypeDef TC2_CM0_Mode_X , TC2_CM1_Mode_TypeDef TC2_CM1_Mode_X , int TC2_DIVM , int TC2_DIVN)
{
    TC2->MR&=0xfefffdff;
	TC2->CDR&=0Xffff8000;
	TC2->CMR&=0XFFFFFFFA;
	TC2->MR|=TC2_Count_mode_X|TC2_Count_STOPTYPE;
	TC2->CDR|=(TC2_DIVM<<4)|TC2_DIVN;
	TC2->CMR|=TC2_CM0_Mode_X|TC2_CM1_Mode_X;
}
/*************************************************************/
//TC2 Channel0 Capture LoadMode set
//EntryParameter:TC2_C0SR_X
//TC2_C0SR_X:TC2_C0SR_CaptureRise,TC2_C0SR_CaptureFall,TC2_C0SR_CaptureRiseFall
//ReturnValue:Conter prdr register value
/*************************************************************/ 
void TC2_Channel0_Capture_LoadMode_set(TC2_C0SR_TypeDef TC2_C0SR_X)
{
	TC2->CRR &= 0XFFFFFFFE;						//Disable TC2 Channel0 clk 
	TC2->CMR&=0XFFFCFFFF;
	TC2->CMR|=TC2_C0SR_X;
	TC2->CRR |= 0x01;							//enable TC2 Channel0 clk
}
/*************************************************************/
//TC2 Channel1 Capture LoadMode set
//EntryParameter:TC2_C1SR_X
//TC2_C1SR_X:TC2_C1SR_CaptureRise,TC2_C1SR_CaptureFall,TC2_C1SR_CaptureRiseFall
//ReturnValue:Conter prdr register value
/*************************************************************/ 
void TC2_Channel1_Capture_LoadMode_set(TC2_C1SR_TypeDef TC2_C1SR_X)
{
	TC2->CRR &= 0XFFFFFFFD;						//Disable TC2 Channel0 clk 
	TC2->CMR&=0XFFF3FFFF;
	TC2->CMR|=TC2_C1SR_X;
	TC2->CRR |= 0x02;							//enable TC2 Channel0 clk
}
/*************************************************************/
//TC2 CNTR、CC0、CC1 load
//EntryParameter:loadCounter_PRDR,loadCounter_PULR
//ReturnValue:Conter prdr register value
/*************************************************************/ 
void TC2_CNR_CC0_CC1_Load(U16_T TC2_CNTR, U16_T TC2_CC0R , U16_T TC2_CC1R)
{
	TC2->CNTR=TC2_CNTR;
	TC2->CC0R=TC2_CC0R;
	TC2->CC1R=TC2_CC1R;
}
/*************************************************************/
//TC2 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC2_Int_Enable(void)
{
    INTC_ISER_WRITE(TC2_INT);    
}
/*************************************************************/
//TC2 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC2_Int_Disable(void)
{
    INTC_ICER_WRITE(TC2_INT);    
}
/*************************************************************/
//TC2 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC2_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(TC2_INT);    
}

/*************************************************************/
//TC2 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC2_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(TC2_INT);    
}

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/
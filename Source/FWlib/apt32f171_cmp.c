/*
  ******************************************************************************
  * @file    apt32f171_cmp.c
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
#include "apt32f171_cmp.h"
#include "apt32f171_gpio.h"
/* defines -------------------------------------------------------------------*/
volatile U32_T CMPOUTPUT_DATE;
/* externs--------------------------------------------------------------------*/
 /*************************************************************/
//CMP RESET VALUE
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void CMP_RESET_VALUE(void)
{
		CMP->CEDR=CMP_CEDR_RST;     			/**< CMP_CEDR  reset value  */
		CMP->CR0=CMP_CR0_RST;     				/**< CMP_CR0  reset value  	*/
		CMP->CR1=CMP_CR1_RST;					/**< CMP_CR1  reset value  	*/
		CMP->CR2=CMP_CR2_RST;     				/**< CMP_CR2  reset value  	*/
		CMP->CR3=CMP_CR3_RST;     				/**< CMP_CR3  reset value  	*/
		CMP->CR4=CMP_CR4_RST;     				/**< CMP_CR4  reset value  	*/
		CMP->CR5=CMP_CR5_RST;     				/**< CMP_CR5  reset value  	*/
		CMP->FLTCR0=CMP_FLTCR0_RST;     		/**< CMP_FLTCR0  reset value*/
		CMP->FLTCR1=CMP_FLTCR1_RST;     		/**< CMP_FLTCR1  reset value*/
		CMP->FLTCR2=CMP_FLTCR2_RST;     		/**< CMP_FLTCR2  reset value*/
		CMP->FLTCR3=CMP_FLTCR3_RST;     		/**< CMP_FLTCR3  reset value*/
		CMP->FLTCR4=CMP_FLTCR4_RST;     		/**< CMP_FLTCR4  reset value*/
		CMP->FLTCR5=CMP_FLTCR5_RST;     		/**< CMP_FLTCR5  reset value*/
		CMP->WCNT0=CMP_WCNT0_RST;				/**< CMP_WCNT0   reset value*/
		CMP->WCNT1=CMP_WCNT1_RST;				/**< CMP_WCNT1   reset value*/
		CMP->WCNT2=CMP_WCNT2_RST;				/**< CMP_WCNT2   reset value*/
		CMP->INPCR0=CMP_INPCR0_RST;				/**< CMP_INPCR0  reset value*/
		CMP->INPCR1=CMP_INPCR1_RST;				/**< CMP_INPCR1  reset value*/
		CMP->INPCR2=CMP_INPCR2_RST;				/**< CMP_INPCR2  reset value*/
		CMP->INPCR3=CMP_INPCR3_RST;				/**< CMP_INPCR3  reset value*/
		CMP->INPCR4=CMP_INPCR4_RST;				/**< CMP_INPCR4  reset value*/
		CMP->INPCR5=CMP_INPCR5_RST;				/**< CMP_INPCR5  reset value*/
		CMP->TRGCR=CMP_TRGCR_RST;				/**< CMP_TRGCR   reset value*/	
		CMP->IMCR=CMP_IMCR_RST;					/**< CMP_IMCR    reset value*/	
		CMP->RISR=CMP_RISR_RST;					/**< CMP_RISR    reset value*/	
		CMP->MISR=CMP_MISR_RST;					/**< CMP_MISR    reset value*/	
		CMP->ICR=CMP_ICR_RST;					/**< CMP_ICR     reset value*/	
		CMP->VOLSEL = CMP_VOLSEL_RST;           /**< CMP_VOLSEL  reset value*/	
}

/*************************************************************/
//CMP software reset
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void CMP_software_reset(void)
{
	CMP->CEDR|=(0X01<<7);
}
/*************************************************************/
//CMP CLK Enable
//EntryParameter:CMPx_NUM,NewState
//CMPx_NUM:CMP0_NUM,CMP1_NUM,CMP2_NUM,CMP3_NUM,CMP4_NUM,CMP5_NUM
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/  
void CMP_CLK_CMD(CMPx_selecte_TypeDef CMPx_NUM , FunctionalStatus NewState)
{
	if(CMPx_NUM==CMP0_NUM)
	{
		if(NewState != DISABLE)
		{
			CMP->CEDR|=0X01;
		}
		else
		{
			CMP->CEDR&=0XFFFFFFFE;
		}
	}
	else if(CMPx_NUM==CMP1_NUM)
	{
		if(NewState != DISABLE)
		{
			CMP->CEDR|=0X02;
		}
		else
		{
			CMP->CEDR&=0XFFFFFFFD;
		}
	}
	else if(CMPx_NUM==CMP2_NUM)
	{
		if(NewState != DISABLE)
		{
			CMP->CEDR|=0X04;
		}
		else
		{
			CMP->CEDR&=0XFFFFFFFB;
		}
	}
	else if(CMPx_NUM==CMP3_NUM)
	{
		if(NewState != DISABLE)
		{
			CMP->CEDR|=0X8;
		}
		else
		{
			CMP->CEDR&=0XFFFFFFF7;
		}
	}
	else if(CMPx_NUM==CMP4_NUM)
	{
		if(NewState != DISABLE)
		{
			CMP->CEDR|=0X10;
		}
		else
		{
			CMP->CEDR&=0XFFFFFFEF;
		}
	}
	else if(CMPx_NUM==CMP5_NUM)
	{
		if(NewState != DISABLE)
		{
			CMP->CEDR|=0X20;
		}
		else
		{
			CMP->CEDR&=0XFFFFFFDF;
		}
	}
}
/*************************************************************/
//CMP IO initial
//EntryParameter:CMP_IO_MODE_X,CMP_IO_G
//CMP_IO_MODE_X:CPINP0,CPINP1,CPINP2,CPINP3,CPINP4,CPINP5,CPINP6,CPINP7,CPINP8,
//	CPINP9,CPINN0,CPINN1,CPINN2,CPINN3,CPINN4,CP0_OUT,CP1_OUT,CP2_OUT,CP3_OUT,CP4_OUT
//CMP_IO_G:CPINP0(0->PA0.2(AF7)),CPINP1(0->PA0.5(AF7)),CPINP2(0->PA0.6(AF7)),CPINP3(0->PA0.7(AF7)),
//CPINP4(0->PA0.8(AF7)),CPINP5(0->PA0.9(AF7)),CPINP6(0->PB0.1(AF7)),CPINP7(0->PA0.1(AF7)),CPINP8(0->PA1.4(AF7)),
//CPINP9(0->PA1.5(AF7)),CPINN0(0->PB0.2(AF7)),CPINN1(0->PB0.3(AF7)),CPINN2(0->PA0.08(AF7)),CPINN3(0->PA0.10(AF7))
//,CPINN4(0->PA0.0(AF7)),CP0_OUT(0->PA1.0(AF5),1->PB0.3(AF4),2->PB0.6(AF3)),
//CP1_OUT(0->PA1.1(AF5),0->PB0.6(AF4)),CP2_OUT(0->PA1.2(AF5),1->PB0.5(AF4)),CP3_OUT(0->PA1.4(AF3)),
//CP4_OUT(0->PA0.7(AF4),1->PC0.0(AF4)),CP5_OUT(0->PA0.8(AF5))
//CMP_IO_MODE_X:0~1
//ReturnValue:NONE
/*************************************************************/  
void CMP_IO_Init(CMP_IO_MODE_TypeDef  CMP_IO_MODE_X , U8_T CMP_IO_G )
{
	if(CMP_IO_MODE_X==CPINP0)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFF0FF)|0x00000A00;										//CPINP0(PA0.2->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINP1)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFF0FFFFF)|0x00A00000;										//CPINP1(PA0.5->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINP2)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XF0FFFFFF)|0x0A000000;										//CPINP2(PA0.6->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINP3)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0X0FFFFFFF)|0xA0000000;										//CPINP3(PA0.7->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINP4)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x0000000A;										//CPINP4(PA0.08->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINP5)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFF0F)|0x000000A0;										//CPINP5(PA0.09->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINP6)
	{
		if(CMP_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFF0F)|0x000000A0;										//CPINP6(PB0.1->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINP7)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFF0F)|0x000000A0;										//CPINP7(PA0.1->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINP8)
	{
		if(CMP_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x000A0000;										//CPINP8(PA1.4->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINP9)
	{
		if(CMP_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFF0FFFFF)|0x00A00000;										//CPINP9(PA1.5->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINN0)
	{
		if(CMP_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFF0FF)|0x00000A00;										//CPINN0(PB0.2->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINN1)
	{
		if(CMP_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFF0FFF)|0x0000A000;										//CPINN1(PB0.3->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINN2)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x0000000A;										//CPINN2(PA0.8->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINN3)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFF0FF)|0x00000A00;										//CPINN3(PA0.10->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CPINN4)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFFF0)|0x0000000A;										//CPINN4(PA0.0->AF7)
		}
	}
	else if(CMP_IO_MODE_X==CP0_OUT)
	{
		if(CMP_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFFF0)|0x00000008;										//CP0_OUT(PA1.0->AF5)
		}
		else if(CMP_IO_G==1)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFF0FFF)|0x00007000;										//CP0_OUT(PB0.3->AF4)
		}
		else if(CMP_IO_G==2)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XF0FFFFFF)|0x06000000;										//CP0_OUT(PB0.6->AF3)
		}
	}
	else if(CMP_IO_MODE_X==CP1_OUT)
	{
		if(CMP_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFF0F)|0x00000080;										//CP1_OUT(PA1.1->AF5)
		}
		else if(CMP_IO_G==1)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XF0FFFFFF)|0x07000000;										//CP1_OUT(PB0.6->AF4)
		}
	}
	else if(CMP_IO_MODE_X==CP2_OUT)
	{
		if(CMP_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFF0FF)|0x00000800;										//CP2_OUT(PA1.2->AF5)
		}
		else if(CMP_IO_G==1)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFF0FFFFF)|0x00700000;										//CP2_OUT(PB0.5->AF4)
		}
	}
	else if(CMP_IO_MODE_X==CP3_OUT)
	{
		if(CMP_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x00060000;										//CP3_OUT(PA1.4->AF3)
		}
	}
	else if(CMP_IO_MODE_X==CP4_OUT)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0X0FFFFFFF)|0x70000000;										//CP4_OUT(PA0.7->AF4)
		}
		else if(CMP_IO_G==1)
		{
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFFFF0)|0x00000007;										//CP4_OUT(PC0.0->AF4)
		}
	}
	else if(CMP_IO_MODE_X==CP5_OUT)
	{
		if(CMP_IO_G==0)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x00000008;										//CP5_OUT(PA0.8->AF5)
		}
	}
}
/*************************************************************/
//CMP INPCR Config
//EntryParameter:CMPx_NUM,CMPX_NSEL,CMPX_PSEL
//CMPx_NUM:CMP0_NUM,CMP1_NUM,CMP2_NUM,CMP3_NUM,CMP4_NUM,CMP5_NUM
//CMP0_NUM：CMPX_NSEL:0~14
//CMP1_NUM、CMP2_NUM、CMP3_NUM、CMP4_NUM、CMP5_NUM：CMPX_NSEL:0~134，254
//CMPX_PSEL:0~14
//ReturnValue:NONE
//--------------NSEL0-------------------

//1:INT_REF=VDD/256*1
//2:INT_REF=VDD/256*2	
//....
//246:INT_REF=VDD/256*246

//0:CPINN0
//1:CPINN1
//2:CPINN2
//3:CPINN3
//4:CPINN4
//6:GND
//1:INT_REF=VOL_REF/126*1
//2:INT_REF=VOL_REF/126*2	
//....
//13:INT_REF=VOL_REF/126*7

//14:FVR
/*************************************************************/ 
//--------------NSEL1/2/3/4/5-------------------
//0:GND
//1:INT_REF=VOL_REF/126*1
//2:INT_REF=VOL_REF/126*2	
//....
//246:INT_REF=VOL_REF/126*246
//247:FVR
//248:CPINN0
//249:CPINN1
//250:CPINN2
//251:CPINN3
//252:CPINN4
//--------------PSEL-------------------
//0:CPINP0
//1:CPINP1
//...
//9:CPINP9
//13:OPA1X
//14:OPA0X
//-------------------------------------
void CMP_INPCRX_Config(CMPx_selecte_TypeDef CMPx_NUM , U8_T CMPX_NSEL , U8_T CMPX_PSEL )
{
	if(CMPx_NUM==CMP0_NUM)
	{
		CMP->INPCR0&=0xfffff000;
		CMP->INPCR0|=CMPX_NSEL|(CMPX_PSEL<<8);   //INPCR0 CMPX_NSEL Select
	}
	else if(CMPx_NUM==CMP1_NUM)
	{
		CMP->INPCR1&=0xfffff000;
		CMP->INPCR1|=CMPX_NSEL|(CMPX_PSEL<<8);
	}
	else if(CMPx_NUM==CMP2_NUM)
	{
		CMP->INPCR2&=0xfffff000;
		CMP->INPCR2|=CMPX_NSEL|(CMPX_PSEL<<8);
	}
	else if(CMPx_NUM==CMP3_NUM)
	{
		CMP->INPCR3&=0xfffff000;
		CMP->INPCR3|=CMPX_NSEL|(CMPX_PSEL<<8);
	}
	else if(CMPx_NUM==CMP4_NUM)
	{
		CMP->INPCR4&=0xfffff000;
		CMP->INPCR4|=CMPX_NSEL|(CMPX_PSEL<<8);
	}
	else if(CMPx_NUM==CMP5_NUM)
	{
		CMP->INPCR5&=0xfffff000;
		CMP->INPCR5|=CMPX_NSEL|(CMPX_PSEL<<8);
	}
}
/*************************************************************/
//CMP_VOL_REF_Select
//EntryParameter:VOL_REF_0_7V,VOL_REF_1V
//ReturnValue:NONE
/*************************************************************/ 
void CMP_VOL_REF_Select(CMP_VOL_REF_TypeDef VOL_REF)
{
	 if(VOL_REF==VOL_REF_0_7V)
	 {
		CMP->VOLSEL &= 0xfffffffe; 
	 }
	 else if(VOL_REF==VOL_REF_1V)
	 {
		CMP->VOLSEL |= 0x00000001; 		 
	 }
}

/*************************************************************/
//CMPOUT Read 
//EntryParameter:CMPx_NUM
//ReturnValue:NONE
/*************************************************************/ 
void CMPOutput_Read(void)
{
	CMPOUTPUT_DATE=CMP->CR0&0XFC000000;
	CMPOUTPUT_DATE=CMPOUTPUT_DATE>>26;
}
/*************************************************************/
//CMP CR Config
//EntryParameter:CMPx_NUM,NHYST_Xmv,PHYST_Xmv,POLARITY_X,EVE_SEL_X,X_FLTEN,CPOS_X
//CMPx_NUM:CMP0_NUM,CMP1_NUM,CMP2_NUM,CMP3_NUM,CMP4_NUM，CMP5_NUM
//NHYST_Xmv:NHYST_0mv,NHYST_10mv,NHYST_20mv,NHYST_35mv，NHYST_45mv，NHYST_60mv，NHYST_80mv，NHYST_100mv
//NHYST_Xmv:PHYST_0mv,PHYST_10mv,PHYST_20mv,PHYST_35mv，PHYST_45mv，PHYST_60mv，PHYST_80mv，PHYST_100mv
//POLARITY_X:POLARITY_0,POLARITY_1
//EVE_SEL_X:EVE_SEL_fall,EVE_SEL_rise,EVE_SEL_fall_rise
//X_FLTEN:DIS_FLTEN,EN_FLTEN
//CPOS_X:CPOS_0,CPOS_1
//ReturnValue:NONE
/*************************************************************/ 
void CMP_CR_Config(CMPx_selecte_TypeDef CMPx_NUM , CMPx_NHYST_TypeDef NHYST_Xmv , CMPx_PHYST_TypeDef PHYST_Xmv , 
						CMPx_POLARITY_TypeDef POLARITY_X , CMPx_EVE_SEL_TypeDef EVE_SEL_X , CMPx_FLTEN_TypeDef X_FLTEN , CMPx_CPOS_TypeDef CPOS_X)
{
	if(CMPx_NUM==CMP0_NUM)
	{
		CMP->CR0&=0xffff7801;
		CMP->CR0|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
	}
	else if(CMPx_NUM==CMP1_NUM)
	{
		CMP->CR1&=0xffff7801;
		CMP->CR1|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
	}
	else if(CMPx_NUM==CMP2_NUM)
	{
		CMP->CR2&=0xffff7801;
		CMP->CR2|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
	}
	else if(CMPx_NUM==CMP3_NUM)
	{
		CMP->CR3&=0xffff7801;
		CMP->CR3|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
	}
	else if(CMPx_NUM==CMP4_NUM)
	{
		CMP->CR4&=0xffff7801;
		CMP->CR4|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
	}
	else if(CMPx_NUM==CMP5_NUM)
	{
		CMP->CR5&=0xffff7801;
		CMP->CR5|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
	}
}
/*************************************************************/
//CMP Open
//EntryParameter:CMPx_selecte
//CMPx_selecte:CMP0_NUM,CMP1_NUM,CMP2_NUM,CMP3_NUM,CMP4_NUM,CMP5_NUM
//ReturnValue:NONE
/*************************************************************/ 
void CMP_Open(CMPx_selecte_TypeDef CMPx_selecte)
{
	if(CMPx_selecte==CMP0_NUM)
	{
		CMP->CR0|=0x01;									//比较器0打开
	}
	else if(CMPx_selecte==CMP1_NUM)
	{
		CMP->CR1|=0x01;									//比较器1打开
	}
	else if(CMPx_selecte==CMP2_NUM)
	{
		CMP->CR2|=0x01;									//比较器2打开
	}
	else if(CMPx_selecte==CMP3_NUM)
	{
		CMP->CR3|=0x01;									//比较器3打开
	}
	else if(CMPx_selecte==CMP4_NUM)
	{
		CMP->CR4|=0x01;									//比较器4打开
	}
	else if(CMPx_selecte==CMP5_NUM)
	{
		CMP->CR5|=0x01;									//比较器5打开
	}
}
/*************************************************************/
//CMP Close
//EntryParameter:CMPx_selecte
//CMPx_selecte:CMP0_NUM,CMP1_NUM,CMP2_NUM,CMP3_NUM,CMP4_NUM
//ReturnValue:NONE
/*************************************************************/ 
void CMP_Close(CMPx_selecte_TypeDef CMPx_selecte)
{
	if(CMPx_selecte==CMP0_NUM)
	{
		CMP->CR0&=0xfffffffe;									//比较器0关闭
	}
	else if(CMPx_selecte==CMP1_NUM)
	{
		CMP->CR1&=0xfffffffe;									//比较器1关闭
	}
	else if(CMPx_selecte==CMP2_NUM)
	{
		CMP->CR2&=0xfffffffe;									//比较器2关闭
	}
	else if(CMPx_selecte==CMP3_NUM)
	{
		CMP->CR3&=0xfffffffe;									//比较器3关闭
	}
	else if(CMPx_selecte==CMP4_NUM)
	{
		CMP->CR4&=0xfffffffe;									//比较器4关闭
	}
	else if(CMPx_selecte==CMP5_NUM)
	{
		CMP->CR5&=0xfffffffe;									//比较器5关闭
	}
}
/*************************************************************/
//CMP FLTR Config
//EntryParameter:CMPx_NUM,CMPX_CLK_Selecte_x,CMPX_DIVN,CMPX_DIVM
//CMPx_NUM:CMP0_NUM,CMP1_NUM,CMP2_NUM,CMP3_NUM,CMP4_NUM,CMP5_NUM
//CMPX_CLK_Selecte_x:CMPX_CLK_PCLK,CMPX_CLK_TC1_Pend,CMPX_CLK_TC2_Pend
//CMPX_DIVN:0~31
//CMPX_DIVM:0~255
//ReturnValue:NONE
/*************************************************************/ 
//FLT_CK = PCLK/(CMPX_DIVM+1)/2^CMPX_DIVN
void CMPX_FLTCR_Config(CMPx_selecte_TypeDef CMPx_NUM , CMPX_CLK_Selecte_TypeDef CMPX_CLK_Selecte_x , U8_T CMPX_DIVN , U8_T CMPX_DIVM)
{
	if(CMPx_NUM==CMP0_NUM)
	{
		CMP->FLTCR0&=0xffff0000;
		CMP->FLTCR0|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
	}
	else if(CMPx_NUM==CMP1_NUM)
	{
		CMP->FLTCR1&=0xffff0000;
		CMP->FLTCR1|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
	}
	else if(CMPx_NUM==CMP2_NUM)
	{
		CMP->FLTCR2&=0xffff0000;
		CMP->FLTCR2|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
	}
	else if(CMPx_NUM==CMP3_NUM)
	{
		CMP->FLTCR3&=0xffff0000;
		CMP->FLTCR3|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
	}
	else if(CMPx_NUM==CMP4_NUM)
	{
		CMP->FLTCR4&=0xffff0000;
		CMP->FLTCR4|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
	}
	else if(CMPx_NUM==CMP5_NUM)
	{
		CMP->FLTCR5&=0xffff0000;
		CMP->FLTCR5|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
	}
}
/*************************************************************/
//CMP WCNT Config
//EntryParameter:CMPx_NUM,HLS_X,CMPX_Trgsel_X,CMPX_MSKMOD_X,CMPX_CLKDIV_X,CMP_DCNT,WCNT
//CMPx_NUM:CMP2_NUM,CMP3_NUM,CMP4_NUM
//HLS_X:HLS_0,HLS_1
//CMPX_Trgsel_X:CMPX_PWM_START,CMPX_PWM_STOP,CMPX_PWM_PEND,CMPX_PWM_CENTER,CMPX_PWM0_CMPAUM,CMPX_PWM0_CMPADM
//CMPX_PWM0_CMPBUM,CMPX_PWM0_CMPBDM,CMPX_PWM1_CMPAUM,CMPX_PWM1_CMPADM,CMPX_PWM1_CMPBUM,CMPX_PWM1_CMPBDM,CMPX_ETCB_SYNCIN
//CMPX_MSKMOD_X:CMPX_MSKMOD_SkipFilter,CMPX_MSKMOD_IdleLow_DphsLow,CMPX_MSKMOD_IdleHigh_DphsLow,CMPX_MSKMOD_IdleHold_DphsLow,
//CMPX_MSKMOD_SkipFilter,CMPX_MSKMOD_IdleLowDphsHigh,CMPX_MSKMOD_IdleHighDphsHigh,CMPX_MSKMOD_IdleHoldDphsHigh
//CMPX_CLKDIV_X:CMPX_CLKDIV_1~CMPX_CLKDIV_2048
//CMP_DCNT:0~255
//WCNT:0~1023
//ReturnValue:NONE
/*************************************************************/  
//捕捉宽度时间:(CMP_WCNT+1)*PCLK/CLKDIV
//延时宽度时间:(CMP_DCNT+1)*PCLK/CLKDIV,如果CMP_DCNT=0，延时时间=0
void CMP_WCNT_Config(CMPx_selecte_TypeDef CMPx_NUM , CMPX_First_output_startue_TypeDef HLS_X , CMPX_Trgsel_selecte_TypeDef CMPX_Trgsel_X , 
				     CMPX_MSKMOD_Control_TypeDef CMPX_MSKMOD_X , CMPX_CLKDIV_TypeDef CMPX_CLKDIV_X , U8_T CMP_DCNT , U16_T CMP_WCNT)
{
	if(CMPx_NUM==CMP2_NUM)
	{
		CMP->WCNT0&=0x0;
		CMP->WCNT0|=HLS_X|CMPX_Trgsel_X|CMPX_MSKMOD_X|CMPX_CLKDIV_X|CMP_DCNT|CMP_WCNT;
	}
	else if(CMPx_NUM==CMP3_NUM)
	{
		CMP->WCNT1&=0x0;
		CMP->WCNT1|=HLS_X|CMPX_Trgsel_X|CMPX_MSKMOD_X|CMPX_CLKDIV_X|CMP_DCNT|CMP_WCNT;
	}
	else if(CMPx_NUM==CMP4_NUM)
	{
		CMP->WCNT2=0x0;
		CMP->WCNT2|=HLS_X|CMPX_Trgsel_X|CMPX_MSKMOD_X|CMPX_CLKDIV_X|CMP_DCNT|CMP_WCNT;
	}
}
/*************************************************************/
//CMP TRGCR Config
//EntryParameter:CMPx_NUM,CMP_TC_TRG_X,CMP_TC_CIN_X,CMP_AD_TRG_X
//CMPx_NUM:CMP0_NUM,CMP1_NUM,CMP2_NUM,CMP3_NUM,CMP4_NUM,CMP5_NUM
//CMP_TC_TRG_X:Disable_CMP_TC1_TRG,CMP0_TC1_TRG,CMP1_TC1_TRG,CMP2_TC1_TRG,CMP3_TC1_TRG,CMP4_TC1_TRG,CMP5_TC1_TRG
//CMP_TC_CIN_X:CMP_TC_CIN_Enable,CMP_TC_CIN_Disable
//CMP_AD_TRG_X:CMP_AD_TRG_Enable,CMP_AD_TRG2_Disable
//ReturnValue:NONE
/*************************************************************/  
void CMP_TRGCR_Config(CMPx_selecte_TypeDef CMPx_NUM , CMP_TC_TRG_TypeDef CMP_TC_TRG_X , CMP_TC_CIN_CMD_TypeDef CMP_TC_CIN_X , CMP_AD_TRG_CMD_TypeDef CMP_AD_TRG_X)
{
	CMP->TRGCR&=0xfffffff8;
	CMP->TRGCR|=CMP_TC_TRG_X;										//TC1启动触发
	if(CMPx_NUM==CMP0_NUM)
	{
		CMP->TRGCR&=0xfffffdf7;
		CMP->TRGCR|=CMP_TC_CIN_X<<3;								//CMP0输出作为TC1的Capture/CLK输入
		CMP->TRGCR|=CMP_AD_TRG_X<<9;								//CMP0启动ADC触发
	}
	else if(CMPx_NUM==CMP1_NUM)
	{
		CMP->TRGCR&=0xfffffbef;
		CMP->TRGCR|=CMP_TC_CIN_X<<4;								//CMP1输出作为TC1的Capture/CLK输入
		CMP->TRGCR|=CMP_AD_TRG_X<<10;								//CMP1启动ADC触发
	}
	else if(CMPx_NUM==CMP2_NUM)
	{
		CMP->TRGCR&=0xfffff7df;
		CMP->TRGCR|=CMP_TC_CIN_X<<5;								//CMP2输出作为TC1的Capture/CLK输入
		CMP->TRGCR|=CMP_AD_TRG_X<<11;								//CMP2启动ADC触发
	}
	else if(CMPx_NUM==CMP3_NUM)
	{
		CMP->TRGCR&=0xffffefbf;
		CMP->TRGCR|=CMP_TC_CIN_X<<6;								//CMP3输出作为TC1的Capture/CLK输入
		CMP->TRGCR|=CMP_AD_TRG_X<<12;								//CMP3启动ADC触发
	}
	else if(CMPx_NUM==CMP4_NUM)
	{
		CMP->TRGCR&=0xffffdf7f;
		CMP->TRGCR|=CMP_TC_CIN_X<<7;								//CMP4输出作为TC1的Capture/CLK输入
		CMP->TRGCR|=CMP_AD_TRG_X<<13;								//CMP4启动ADC触发
	}
	else if(CMPx_NUM==CMP5_NUM)
	{
		CMP->TRGCR&=0xffffbeff;
		CMP->TRGCR|=CMP_TC_CIN_X<<8;								//CMP5输出作为TC1的Capture/CLK输入
		CMP->TRGCR|=CMP_AD_TRG_X<<14;								//CMP5启动ADC触发
	}
}
/*************************************************************/
//CMP0 Interrupt enable
//EntryParameter:CMP_INT_X,NewState
//CMP_INT_X:EDGEDET0,EDGEDET1,EDGEDET2,EDGEDET3,EDGEDET4,EDGEDET5
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void CMP_ConfigInterrupt_CMD(CMP_INT_TypeDef CMP_INT_X , FunctionalStatus NewState)
{
	if (NewState != DISABLE)
	{
		CMP->IMCR  |= CMP_INT_X;						//SET
	}
	else
	{
		CMP->IMCR  &= ~CMP_INT_X;						//CLR
	}
}
/*************************************************************/
//CMP0 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP0_INT);    
}
/*************************************************************/
//CMP0 Interrupt disalbe
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP0_INT);    
}
/*************************************************************/
//CMP0 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP0_INT);    
}

/*************************************************************/
//CMP0 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP0_INT);    
}
/*************************************************************/
//CMP1 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP1_INT);    
}
/*************************************************************/
//CMP1 Interrupt disalbe
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP1_INT);    
}
/*************************************************************/
//CMP1 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP1_INT);    
}

/*************************************************************/
//CMP1 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP1_INT);    
}
/*************************************************************/
//CMP2 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP2_INT);    
}
/*************************************************************/
//CMP2 Interrupt disalbe
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP2_INT);    
}
/*************************************************************/
//CMP2 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP2_INT);    
}

/*************************************************************/
//CMP2 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP2_INT);    
}
/*************************************************************/
//CMP3 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP3_INT);    
}
/*************************************************************/
//CMP3 Interrupt disalbe
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP3_INT);    
}
/*************************************************************/
//CMP3 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP3_INT);    
}

/*************************************************************/
//CMP3 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP3_INT);    
}
/*************************************************************/
//CMP4 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP4_INT);    
}
/*************************************************************/
//CMP4 Interrupt disalbe
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP4_INT);    
}
/*************************************************************/
//CMP4 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP4_INT);    
}

/*************************************************************/
//CMP4 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP4_INT);    
}
/*************************************************************/
//CMP5 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP5_INT);    
}
/*************************************************************/
//CMP5 Interrupt disalbe
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP5_INT);    
}
/*************************************************************/
//CMP5 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP5_INT);    
}

/*************************************************************/
//CMP5 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP5_INT);    
}
/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/
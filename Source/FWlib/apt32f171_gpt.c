/*
  ******************************************************************************
  * @file    apt32f171_gpt.c
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
#include "apt32f171_gpt.h"


/*************************************************************/
//GPT REG PROT 
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPT_REG_PROT_UNLOCK()
{	
	 GPTA0->REGPROT=(0xa55a << 16 | 0xc73a);	
}

/*************************************************************/
//GPT RESET CLEAR ALL REGISTER
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void GPT_DeInit(void)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->CEDR 		= 0xBE980000;
	GPTA0->RSSR 		= GPT_RESET_VALUE;
	GPTA0->PSCR 		= GPT_RESET_VALUE;
	GPTA0->CR 		= 0X00010010;
	GPTA0->SYNCR 	= GPT_RESET_VALUE;
	GPTA0->GLDCR 	= GPT_RESET_VALUE;
	GPTA0->GLDCFG 	= GPT_RESET_VALUE;
	GPTA0->GLDCR2 	= GPT_RESET_VALUE;
	GPTA0->PRDR 		= GPT_RESET_VALUE;
	GPTA0->PHSR 		= GPT_RESET_VALUE;
	GPTA0->CMPA 		= GPT_RESET_VALUE;
	GPTA0->CMPB 		= GPT_RESET_VALUE;
	GPTA0->CMPLDR 	= 0X00002490;
	GPTA0->CNT 		= GPT_RESET_VALUE;
	GPTA0->AQLDR 	= 0X00000024;
	GPTA0->AQCRA 	= GPT_RESET_VALUE;
	GPTA0->AQCRB 	= GPT_RESET_VALUE;
	GPTA0->AQOSF	 	= 0X00000100;
	GPTA0->AQCSF 	= GPT_RESET_VALUE;
	GPTA0->TRGFTCR 	= GPT_RESET_VALUE;
	GPTA0->TRGFTWR	= GPT_RESET_VALUE;
	GPTA0->EVTRG 	= GPT_RESET_VALUE;
	GPTA0->EVPS 		= GPT_RESET_VALUE;
	GPTA0->EVCNTINIT = GPT_RESET_VALUE;
	GPTA0->EVSWF 	= GPT_RESET_VALUE;
	GPTA0->RISR		= GPT_RESET_VALUE;
	GPTA0->MISR 		= GPT_RESET_VALUE;
	GPTA0->IMCR 		= GPT_RESET_VALUE;
	GPTA0->ICR 		= GPT_RESET_VALUE;
	GPTA0->REGPROT 	= GPT_RESET_VALUE;
}
/*************************************************************/
//GPT IO Init
//EntryParameter:GPT_CHA_PB01,GPT_CHA_PA09,GPT_CHA_PA010,GPT_CHB_PA010,GPT_CHB_PA011,GPT_CHB_PB00,GPT_CHB_PB01
//ReturnValue:NONE
/*************************************************************/
void GPT_IO_Init(GPT_IOSET_TypeDef IONAME)
{
	if(IONAME==GPT_CHA_PA03)
	{
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFF0FFF)|0x00006000;
	}
	if(IONAME==GPT_CHA_PA13)
	{
		GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFF0FFF)|0x00004000;
	}
	if(IONAME==GPT_CHA_PB00)
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFFF0)|0x00000008;
	}
	if(IONAME==GPT_CHA_PB06)
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XF0FFFFFF)|0x04000000;
	}
	if(IONAME==GPT_CHB_PA04)
	{
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFF0FFFF)|0x00060000;
	}
	if(IONAME==GPT_CHB_PA14)
	{
		GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x00040000;
	}
	if(IONAME==GPT_CHB_PB01)
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFF0F)|0x00000080;
	}
	if(IONAME==GPT_CHB_PB07)
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0X0FFFFFFF)|0x40000000;
	}
}

/*************************************************************/
//GPT Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Configure(GPT_CLK_TypeDef GPTCLKX,GPT_CSS_TypeDef GCSSX,GPT_SHDWSTP_TypeDef GSHDWSTPX,U16_T GPSCX)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->CEDR = GPTCLKX| GCSSX|GSHDWSTPX;
	GPTA0->PSCR=GPSCX;
}
/*************************************************************/
//GPT Wave control Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
//GPT0->CR = (0X0<<0)|(0x00<<2)|(0x01<<3)|(0x00<<4)|(0X00<<6)|(0x01<<18)|(0x00<<9)|(0X00<<10)|(0x00<<11)|(0x00<<13) ;	
//GPT0->CMPLDR=(0X00<<0)|(0X00<<1)|(0X03<<4)|(0X03<<7);
void GPT_WaveCtrl_Configure(GPT_CNTMD_TypeDef GCNTMDX,GPT_SWSYN_TypeDef GSWSYNX,GPT_IDLEST_TypeDef GIDLEX,GPT_PRDLD0_TypeDef GPRDLD0,GPT_OPM_TypeDef GOPMX,
						GPT_BURST_TypeDef GBURSTX,GPT_CKS_TypeDef GCKS,GPT_CGSRC_TypeDef CGSRCX,GPT_CGFLT_TypeDef CGFLT,GPT_PSCLD_TypeDef PSCLDX)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->CR =GCNTMDX|GSWSYNX|GIDLEX|GPRDLD0|GOPMX|GBURSTX|GCKS|CGSRCX|CGFLT|PSCLDX|GPT_WAVE_MODE;
}

/*************************************************************/
//GPT Wave control Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_WaveLoad_Configure(GPT_SHDWAQA_TypeDef SHDWAQAX,GPT_SHDWAQB_TypeDef SHDWAQBX,GPT_AQLDA_TypeDef AQLDAX, GPT_AQLDB_TypeDef AQLDBX)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->AQLDR=SHDWAQAX|SHDWAQBX|AQLDAX|AQLDBX;
}

/*************************************************************/
//Deinitializes the EPT PHSEN Config
//EntryParameter:EPT_PHSEN_CMD,EPT_PHSDIR,PHSR
//EPT_PHSEN_CMD:EPT_PHSEN_EN,EPT_PHSEN_DIS
//EPT_PHSDIR:EPT_PHSDIR_increase,EPT_PHSEN_decrease
//PHSR:0~0xffff
//ReturnValue:NONE
/*************************************************************/  
void GPT_PHSEN_Config(GPTA_PHSEN_CMD_Type GPT_PHSEN_CMD ,GPTA_PHSDIR_Type GPTA_PHSDIR ,U16_T PHSR)   
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->CR=(GPTA0->CR&0xffffff7f)|GPT_PHSEN_CMD;                  
	GPTA0->PHSR=PHSR|GPTA_PHSDIR;                                               
}

/*************************************************************/
//GPT Wave A OUT Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_WaveOut_Configure(GPT_GPTCHX_TypeDef GPTCHX,GPT_CASEL_TypeDef CASELX,GPT_CBSEL_TypeDef CBSELX,U8_T ZROX,U8_T PRDX,U8_T CAUX,
						U8_T CADX,U8_T CBUX,U8_T CBDX,U8_T T1UX,U8_T T1DX,U8_T T2UX,U8_T T2DX)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	if(GPTCHX==GPT_CHA)
	{
	GPTA0->AQCRA=CASELX|CBSELX|(ZROX<<0)|(PRDX<<2)|(CAUX<<4)|(CADX<<6)|(CBUX<<8)|(CBDX<<10)|(T1UX<<12)|(T1DX<<14)|(T2UX<<16)|(T2DX<<18);
	}
	if(GPTCHX==GPT_CHB)
	{
	GPTA0->AQCRB=CASELX|CBSELX|(ZROX<<0)|(PRDX<<2)|(CAUX<<4)|(CADX<<6)|(CBUX<<8)|(CBDX<<10)|(T1UX<<12)|(T1DX<<14)|(T2UX<<16)|(T2DX<<18);
	}
}
/*************************************************************/
//Deinitializes the GPT Caputer Config
//EntryParameter:GPT_CNTMD_SELECTE_X,GPT_CAPMD_SELECTE_X,GPT_LOAD_CMPA_RST_CMD~GPT_LOAD_CMPB_RST_CMD,GPT_STOP_WRAP,GPT_PSCR
//GPT_CNTMD_SELECTE_X:GPT_CNTMD_increase,GPT_CNTMD_decrease,GPT_CNTMD_increaseTOdecrease
//GPT_CAPMD_SELECTE_X:GPT_CAPMD_Once,GPT_CAPMD_Continue
//GPT_LOAD_CMPA_RST_CMD:GPT_LDARST_EN,GPT_LDARST_DIS
//GPT_LOAD_CMPB_RST_CMD:GPT_LDBRST_EN,GPT_LDBRST_DIS
//GPT_STOP_WRAP:0~3
//GPT_PSCR:0~0XFFFF
//ReturnValue:NONE
/*************************************************************/  
void GPT_Capture_Config(GPT_CNTMD_SELECTE_Type GPT_CNTMD_SELECTE_X  , GPT_CAPMD_SELECTE_Type GPT_CAPMD_SELECTE_X , GPT_CAPLDEN_TypeDef CAP_CMD 
					, GPT_LDARST_TypeDef GPT_LOAD_CMPA_RST_CMD , GPT_LDBRST_TypeDef GPT_LOAD_CMPB_RST_CMD , 
					GPT_LOAD_CMPC_RST_CMD_Type GPT_LOAD_CMPC_RST_CMD , GPT_LOAD_CMPD_RST_CMD_Type GPT_LOAD_CMPD_RST_CMD, U8_T GPT_STOP_WRAP )
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->CR=(GPTA0->CR&0xf800fec0)|GPT_CNTMD_SELECTE_X|(0x0<<2)|(0x0<<3)|(0x0<<4)|CAP_CMD|GPT_CAPMD_SELECTE_X|(0X0<<16)|(0x0<<18)|(GPT_STOP_WRAP<<21)|
				GPT_LOAD_CMPA_RST_CMD|GPT_LOAD_CMPB_RST_CMD|GPT_LOAD_CMPC_RST_CMD|GPT_LOAD_CMPD_RST_CMD;
}
/*************************************************************/
//GPT SYNC Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_SyncSet_Configure(GPT_SYNCENX_TypeDef SYNCENx,GPT_OSTMDX_TypeDef OSTMDx,GPT_TXREARM0_TypeDef TXREARM0x,GPT_TRGO0SEL_TypeDef TRGO0SELx,
							GPT_TRGO1SEL_TypeDef TRGO1SELx,GPT_AREARM_TypeDef AREARMx)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->SYNCR |= SYNCENx| OSTMDx| TXREARM0x |TRGO0SELx|TRGO1SELx|AREARMx;
}
/*************************************************************/
//GPT Trigger Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Trigger_Configure(GPT_SRCSEL_TypeDef SRCSELx,GPT_BLKINV_TypeDef BLKINVx,GPT_ALIGNMD_TypeDef ALIGNMDx,GPT_CROSSMD_TypeDef CROSSMDx,
						U16_T G_OFFSET_DATA,U16_T G_WINDOW_DATA)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->TRGFTCR |= SRCSELx| BLKINVx|ALIGNMDx| CROSSMDx;
	GPTA0->TRGFTWR |= G_OFFSET_DATA |(G_WINDOW_DATA<<16);
	
}
/*************************************************************/
//GPT Trigger Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_EVTRG_Configure(GPT_TRGSRC0_TypeDef TRGSRC0x,GPT_TRGSRC1_TypeDef TRGSRC1x,GPT_ESYN0OE_TypeDef ESYN0OEx,GPT_ESYN1OE_TypeDef ESYN1OEx,
						GPT_CNT0INIT_TypeDef CNT0INITx,GPT_CNT1INIT_TypeDef CNT1INITx,U8_T TRGEV0prd,U8_T TRGEV1prd,U8_T TRGEV0cnt,U8_T TRGEV1cnt)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->EVTRG |= TRGSRC0x |TRGSRC1x|ESYN0OEx|ESYN1OEx|CNT0INITx|CNT1INITx;
	GPTA0->EVPS  |= TRGEV0prd|(TRGEV1prd<<4)|(TRGEV0cnt<<16)|(TRGEV1cnt<<20);
}
/*************************************************************/
//GPT OneceForce Out
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_OneceForce_Out(GPT_CHAFORCE_TypeDef CHAFORCEX,U8_T AFORCE_STATUS,GPT_CHBFORCE_TypeDef CHBFORCEX,U8_T BFORCE_STATUS,GPT_FORCELD_TypeDef FORCELDX)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->AQOSF =CHAFORCEX|CHBFORCEX|FORCELDX|(AFORCE_STATUS<<1)|(BFORCE_STATUS<<5);
}
/*************************************************************/
//GPT Continue Force Out
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Force_Out(GPT_FORCEA_TypeDef FORCEAX,GPT_FORCEB_TypeDef FORCEBX)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->AQCSF =FORCEAX|FORCEBX;
}
/*************************************************************/
//GPT Wave Compare Load Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_CmpLoad_Configure(GPT_SHDWCMPA_TypeDef SHDWCMPAX,GPT_SHDWCMPB_TypeDef SHDWCMPBX,GPT_LDAMD_TypeDef LDAMDX,GPT_LDBMD_TypeDef LDBMDX)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->CMPLDR=SHDWCMPAX|SHDWCMPBX|LDAMDX|LDBMDX;
}
/*************************************************************/
//GPT DEBUG MODE
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Debug_Mode(FunctionalStatus NewState)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	if (NewState != DISABLE)
	{
		GPTA0->CEDR  |= GPT_DEBUG_MODE;						
	}
	else
	{
		GPTA0->CEDR  &= ~GPT_DEBUG_MODE;					
	}
}
/*************************************************************/
// GPT start
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Start(void)
{
    GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->RSSR |= 0X01;
}
/*************************************************************/
// GPT stop
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Stop(void)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->RSSR &= 0XFFFFFFFE;
}
/*************************************************************/
// GPT soft reset
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Soft_Reset(void)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->RSSR |= (0X5<<12);
}
/*************************************************************/
// GPT Capture rearm
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Cap_Rearm(void)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->CR |= (0X01<<19);
}
/*************************************************************/
// GPT MODE
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Mode_CMD(GPT_WAVE_TypeDef WAVEX)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->CR |= WAVEX;
}
/*************************************************************/
// GPT soft reset at once sync mode
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_REARM_Write(void)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->SYNCR |= (0X1<<16);
}
/*************************************************************/
// GPT soft read at once sync mode
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
U8_T GPT_REARM_Read(void)
{
	uint8_t value = 0;
    uint32_t dat = 0;
    GPT_REG_PROT_UNLOCK();     //寄存器解锁
    dat=(GPTA0->SYNCR)&(1<<16);
    if (dat)								
	{
	    value = 1;
	} 
    return value;
}
/*************************************************************/
//GPT Period / Compare set
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Period_CMP_Write(U16_T PRDR_DATA,U16_T CMPA_DATA,U16_T CMPB_DATA)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->PRDR =PRDR_DATA;
	GPTA0->CMPA =CMPA_DATA;
	GPTA0->CMPB =CMPB_DATA;
}
/*************************************************************/
//GPT read counters
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
U16_T GPT_PRDR_Read(void)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    return GPTA0->PRDR;
}
U16_T GPT_CMPA_Read(void)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    return GPTA0->CMPA;
}
U16_T GPT_CMPB_Read(void)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    return GPTA0->CMPB;
}
U16_T GPT_CNT_Read(void)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    return GPTA0->CNT;
}
/*************************************************************/
//GPT inturrpt Configure
//EntryParameter:LPT_IMSCR_X,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_ConfigInterrupt_CMD(FunctionalStatus NewState,U32_T GPT_IMSCR_X)
{
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	if (NewState != DISABLE)
	{
		GPTA0->IMCR  |= GPT_IMSCR_X;						
	}
	else
	{
		GPTA0->IMCR  &= ~GPT_IMSCR_X;					
	}
}

/*************************************************************/
//GPT Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPT_INT_ENABLE(void)
{
	INTC_ISER_WRITE(GPT_INT);
}
/*************************************************************/
//LPT Interrupt disable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPT_INT_DISABLE(void)
{
	INTC_ICER_WRITE(GPT_INT);
}

	
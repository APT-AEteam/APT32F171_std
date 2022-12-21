/*
  ******************************************************************************
  * @file    apt32f171_interrupt.c
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
#include "apt32f171_types_local.h"
#include "apt32f171_coret.h"
#include "apt32f171_ifc.h"
#include "apt32f171_syscon.h"
#include "apt32f171_adc.h"
#include "apt32f171_cmp.h"
#include "apt32f171_oamp.h"
#include "apt32f171_gpio.h"
#include "apt32f171_usart.h"
#include "apt32f171_uart.h"
#include "apt32f171_wwdt.h"
#include "apt32f171_ept.h"
#include "apt32f171_gpt.h"
#include "apt32f171_bt.h"


/* externs--------------------------------------------------------------------*/
extern volatile U8_T SYSCON_ISOSCSTFlag;
extern volatile U8_T SYSCON_IMOSCSTFlag;
extern volatile U8_T SYSCON_EMOSCSTFlag;
extern volatile U8_T SYSCON_SYSCLKSTFlag;
extern volatile U8_T SYSCON_IWDTINTFlag;
extern volatile U8_T SYSCON_LVDINTFlag;
extern volatile U8_T SYSCON_EM_CMFAILFlag;
extern volatile U8_T SYSCON_EM_CMRCVFlag;
extern volatile U8_T SYSCON_CMD_ERRFlag;

extern volatile U8_T SPI_PORIMIFlag;
extern volatile U8_T SPI_RTIMIFlag;
extern volatile U8_T SPI_RXIMIFlag;
extern volatile U8_T SPI_TXIMIFlag;

extern volatile U8_T I2C_INTFlag ;					
extern volatile U8_T I2CMode;
extern volatile U8_T restart;

volatile unsigned int RA_Capture,RB_Capture,R_LowLevel_T,R_HighLevel_T,SPI_DATA[8];
volatile U32_T 	R_Uart_RDBUF;
volatile U32_T  R_Capture_buf1,R_Capture_buf2,R_Capture_buf3,f_TC1_CaptTrigg;
volatile U8_T r_usrat_cont,r_urat_cont;
volatile U8_T r_usart_buf[3];
volatile U8_T r_uart_buf[3];
volatile U8_T R_timer_4ms;

volatile int R_CMPA_BUF,R_CMPB_BUF;

/*************************************************************/
//CORET Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORETHandler(void) 
{
    // ISR content ...
	
	CK802->CORET_CVR = 0;							// Coret CVR 清除
}
/*************************************************************/
//SYSCON Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCONIntHandler(void) 
{
    // ISR content ...
	if((SYSCON->MISR&ISOSC_ST)==ISOSC_ST)				//ISOSC stable interrupt
	{
		SYSCON->ICR = ISOSC_ST;
	} 
	else if((SYSCON->MISR&IMOSC_ST)==IMOSC_ST)			//IMOSC stable interrupt
	{
		SYSCON->ICR = IMOSC_ST;
	} 
	else if((SYSCON->MISR&EMOSC_ST)==EMOSC_ST)			//EMOSC stable interrupt
	{
		SYSCON->ICR = EMOSC_ST;
	} 
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)			//HFOSC stable interrupt
	{
		SYSCON->ICR = HFOSC_ST;
	} 
	else if((SYSCON->MISR&SYSCLK_ST)==SYSCLK_ST)		//SYSCLK change end & stable interrupt
	{
		SYSCON->ICR = SYSCLK_ST;
	}
	else if((SYSCON->MISR&IWDT_INT_ST)==IWDT_INT_ST)	//IWDT alarm window interrupt
	{
		SYSCON->ICR = IWDT_INT_ST;
		//SYSCON->IWDCNT=0x5aul<<24;
		//SYSCON_IWDCNT_Reload();
		/*SYSCON->IWDCNT=0x5aul<<24;*/
	}
	else if((SYSCON->MISR&WKI_INT_ST)==WKI_INT_ST)
	{
		SYSCON->ICR = WKI_INT_ST;
	}
	else if((SYSCON->MISR&RAMERRINT_ST)==RAMERRINT_ST)	//SRAM check fail interrupt
	{
		SYSCON->ICR = RAMERRINT_ST;
	}
	else if((SYSCON->MISR&LVD_INT_ST)==LVD_INT_ST)		//LVD threshold interrupt
	{
		SYSCON->ICR = LVD_INT_ST;
	}
	else if((SYSCON->MISR&HWD_ERR_ST)==HWD_ERR_ST)		//Hardware Divider divisor = 0 interrupt
	{
		SYSCON->ICR = HWD_ERR_ST;
	}
	else if((SYSCON->MISR&EFL_ERR_ST)==EFL_ERR_ST)		//Flash check fail interrupt
	{
		SYSCON->ICR = EFL_ERR_ST;
	}
	else if((SYSCON->MISR&OPTERR_INT)==OPTERR_INT)		//Option load fail interrupt
	{
		SYSCON->ICR = OPTERR_INT;
	}
	else if((SYSCON->MISR&EM_CMLST_ST)==EM_CMLST_ST)	//EMOSC clock monitor fail interrupt
	{
		SYSCON->ICR = EM_CMLST_ST;
	}
	else if((SYSCON->MISR&EM_EVTRG0_ST)==EM_EVTRG0_ST)	//Event Trigger Channel 0 Interrupt
	{
		SYSCON->ICR = EM_EVTRG0_ST;
	}
	else if((SYSCON->MISR&EM_EVTRG1_ST)==EM_EVTRG1_ST)	//Event Trigger Channel 1 Interrupt
	{
		SYSCON->ICR = EM_EVTRG1_ST;
	}
	else if((SYSCON->MISR&EM_EVTRG2_ST)==EM_EVTRG2_ST)	//Event Trigger Channel 2 Interrupt
	{
		SYSCON->ICR = EM_EVTRG2_ST;
	}
	else if((SYSCON->MISR&EM_EVTRG3_ST)==EM_EVTRG3_ST)	//Event Trigger Channel 3 Interrupt
	{
		SYSCON->ICR = EM_EVTRG3_ST;
	}
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)		//Command error interrupt
	{
		SYSCON->ICR = CMD_ERR_ST;
	}
}
/*************************************************************/
//IFC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void IFCIntHandler(void) 
{
    // ISR content ...
	if(IFC->MISR&ERS_END_INT)			
	{
		IFC->ICR=ERS_END_INT;
	}
	else if(IFC->MISR&RGM_END_INT)		
	{
		IFC->ICR=RGM_END_INT;
	}
	else if(IFC->MISR&PEP_END_INT)		
	{
		IFC->ICR=PEP_END_INT;
	}
	else if(IFC->MISR&PROT_ERR_INT)		
	{
		IFC->ICR=PROT_ERR_INT;
	}
	else if(IFC->MISR&UDEF_ERR_INT)		
	{
		IFC->ICR=UDEF_ERR_INT;
	}
	else if(IFC->MISR&ADDR_ERR_INT)		
	{
		IFC->ICR=ADDR_ERR_INT;
	}
	else if(IFC->MISR&OVW_ERR_INT)		
	{
		IFC->ICR=OVW_ERR_INT;
	}
}

/*************************************************************/
//ADC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void ADCIntHandler(void) 
{
    // ISR content ...
	if((ADC0->SR&ADC12_EOC)==ADC12_EOC)
	{
		ADC0->CSR = ADC12_EOC;
	}
	else if((ADC0->SR&ADC12_READY)==ADC12_READY)
	{
		ADC0->CSR = ADC12_READY;
	}
	else if((ADC0->SR&ADC12_OVR)==ADC12_OVR)
	{
		ADC0->CSR = ADC12_OVR;
	}
	else if((ADC0->SR&ADC12_CMP0H)==ADC12_CMP0H)
	{
		ADC0->CSR = ADC12_CMP0H;
	}
	else if((ADC0->SR&ADC12_CMP0L)==ADC12_CMP0L)
	{
		ADC0->CSR = ADC12_CMP0L;
	}
	else if((ADC0->SR&ADC12_CMP1H)==ADC12_CMP1H)
	{
		ADC0->CSR = ADC12_CMP1H;
	}
	else if((ADC0->SR&ADC12_CMP1L)==ADC12_CMP1L)
	{
		ADC0->CSR = ADC12_CMP1L;
	}
}
/*************************************************************/
//EXI0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0IntHandler(void) 
{
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN0)==EXI_PIN0) 
    {
        SYSCON->EXICR = EXI_PIN0;
    }
	else if ((SYSCON->EXIRS&EXI_PIN16)==EXI_PIN16) 		//EXT16 Interrupt
	{
		SYSCON->EXICR = EXI_PIN16;
	}
}
/*************************************************************/
//EXI1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1IntHandler(void) 
{
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN1)==EXI_PIN1) 
    {
        SYSCON->EXICR = EXI_PIN1;
    }
	else if ((SYSCON->EXIRS&EXI_PIN17)==EXI_PIN17) 		//EXT17 Interrupt
	{
		SYSCON->EXICR = EXI_PIN17;
	}
}
/*************************************************************/
//EXI2~EXI3 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2to3IntHandler(void) 
{
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN2)==EXI_PIN2) 
    {
        SYSCON->EXICR = EXI_PIN2;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 
    {
        SYSCON->EXICR = EXI_PIN3;
    }
	else if ((SYSCON->EXIRS&EXI_PIN18)==EXI_PIN18) 		//EXT18 Interrupt
	{
		SYSCON->EXICR = EXI_PIN18;
	}
	else if ((SYSCON->EXIRS&EXI_PIN19)==EXI_PIN19) 		//EXT19 Interrupt
	{
		SYSCON->EXICR = EXI_PIN19;
	}
}
/*************************************************************/
//EXI4~EXI9 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI4to9IntHandler(void) 
{
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN4)==EXI_PIN4) 
    {
        SYSCON->EXICR = EXI_PIN4;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN5)==EXI_PIN5) 
    {
        SYSCON->EXICR = EXI_PIN5;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
    {
        SYSCON->EXICR = EXI_PIN6;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN7)==EXI_PIN7) 
    {
        SYSCON->EXICR = EXI_PIN7;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 
    {
        SYSCON->EXICR = EXI_PIN8;
    }
	else if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 
	{
        SYSCON->EXICR = EXI_PIN9;
	}
}
/*************************************************************/
//EXI10~EXI15 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI10to15IntHandler(void) 
{
    if ((SYSCON->EXIRS&EXI_PIN10)==EXI_PIN10) 
    {
        SYSCON->EXICR = EXI_PIN10;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN11)==EXI_PIN11) 
    {
        SYSCON->EXICR = EXI_PIN11;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN12)==EXI_PIN12) 
    {
        SYSCON->EXICR = EXI_PIN12;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN13)==EXI_PIN13) 
    {
        SYSCON->EXICR = EXI_PIN13;
    }
	else if ((SYSCON->EXIRS&EXI_PIN14)==EXI_PIN14) 
    {
        SYSCON->EXICR = EXI_PIN14;
    }
	else if ((SYSCON->EXIRS&EXI_PIN15)==EXI_PIN15) 
	{
        SYSCON->EXICR = EXI_PIN15;
    }
}

/*************************************************************/
//WWDT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void WWDTHandler(void)
{
	
	WWDT_CNT_Load(0xFF);
	if((WWDT->MISR&WWDT_EVI)==WWDT_EVI)					//WWDT EVI interrupt
	{
		WWDT->ICR = WWDT_EVI;
	} 
	WWDT->ICR=0X01;
}

/*************************************************************/
//USART0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART0IntHandler(void) 
{
    // ISR content ...
	unsigned int status;
	status = USART0->MISR & USART0->IMSCR ;
	if( status & USART_RXRDY ) 
	{
	   r_usrat_cont++;
		if(r_usrat_cont>=3)
		{
			r_usrat_cont=0;
		}
		r_usart_buf[r_usrat_cont]=CSP_USART_GET_RHR(USART0);
		CSP_USART_SET_ICR(USART0, USART_RXRDY);
	}
	if (status & USART_TXRDY) 
	{
		//CSP_USART_SET_ICR(USART0, USART_TXRDY);
	}
}

/*************************************************************/
//EPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPTIntHandler(void) 
{
    // ISR content ...
	if((EPT0->MISR&EPT_TRGEV0_INT)==EPT_TRGEV0_INT)			//TRGEV0 interrupt
	{
		EPT0->ICR=EPT_TRGEV0_INT;
	}
	else if((EPT0->MISR&EPT_TRGEV1_INT)==EPT_TRGEV1_INT)	//TRGEV1 interrupt
	{
		EPT0->ICR=EPT_TRGEV1_INT;
	}
	else if((EPT0->MISR&EPT_TRGEV2_INT)==EPT_TRGEV2_INT)	//TRGEV2 interrupt
	{
		EPT0->ICR=EPT_TRGEV2_INT;
	}
	else if((EPT0->MISR&EPT_TRGEV3_INT)==EPT_TRGEV3_INT)	//TRGEV3 interrupt
	{
		EPT0->ICR=EPT_TRGEV3_INT;
	}	
	else if((EPT0->MISR&EPT_CAP_LD0)==EPT_CAP_LD0)			//Capture Load to CMPA interrupt
	{
		EPT0->ICR=EPT_CAP_LD0;
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIRT);
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIFT);
		R_CMPA_BUF=EPT0->CMPA;			//Low voltage counter
	}
	else if((EPT0->MISR&EPT_CAP_LD1)==EPT_CAP_LD1)			//Capture Load to CMPB interrupt
	{
		EPT0->ICR=EPT_CAP_LD1;
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIFT);
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
	}
	else if((EPT0->MISR&EPT_CAP_LD2)==EPT_CAP_LD2)			//Capture Load to CMPC interrupt
	{
		EPT0->ICR=EPT_CAP_LD2;
	}
	else if((EPT0->MISR&EPT_CAP_LD3)==EPT_CAP_LD3)			//Capture Load to CMPD interrupt
	{
		EPT0->ICR=EPT_CAP_LD3;
	}
	else if((EPT0->MISR&EPT_CAU)==EPT_CAU)					//Up-Counting phase CNT = CMPA interrupt
	{
		EPT0->ICR=EPT_CAU;
	}
	else if((EPT0->MISR&EPT_CAD)==EPT_CAD)					//Down-Counting phase CNT = CMPA interrupt
	{
		EPT0->ICR=EPT_CAD;
	}
	else if((EPT0->MISR&EPT_CBU)==EPT_CBU)					//Up-Counting phase CNT = CMPB interrupt 
	{
		EPT0->ICR=EPT_CBU;
	}
	else if((EPT0->MISR&EPT_CBD)==EPT_CBD)					//Down-Counting phase CNT = CMPB interrupt
	{
		EPT0->ICR=EPT_CBD;
	}
	else if((EPT0->MISR&EPT_CCU)==EPT_CCU)					//Up-Counting phase CNT = CMPC interrupt 
	{
		EPT0->ICR=EPT_CCU;
	}
	else if((EPT0->MISR&EPT_CCD)==EPT_CCD)					//Down-Counting phase CNT = CMPC interrupt
	{
		EPT0->ICR=EPT_CCD;
	}
	else if((EPT0->MISR&EPT_CDU)==EPT_CDU)					//Up-Counting phase CNT = CMPD interrupt
	{
		EPT0->ICR=EPT_CDU;
	}
	else if((EPT0->MISR&EPT_CDD)==EPT_CDD)					//Down-Counting phase CNT = CMPD interrupt
	{
		EPT0->ICR=EPT_CDD;
	}
	else if((EPT0->MISR&EPT_PEND)==EPT_PEND)				//End of cycle interrupt
	{
		EPT0->ICR=EPT_PEND;
	}
	//Emergency interruption
	if((EPT0->EMMISR&EPT_EP0_EMINT)==EPT_EP0_EMINT)			//interrupt flag of EP0 event
	{
		EPT0->EMICR=EPT_EP0_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP1_EMINT)==EPT_EP1_EMINT)	//interrupt flag of EP1 event
	{
		EPT0->EMICR=EPT_EP1_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP2_EMINT)==EPT_EP2_EMINT)	//interrupt flag of EP2 event
	{
		EPT0->EMICR=EPT_EP2_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP3_EMINT)==EPT_EP3_EMINT)	//interrupt flag of EP3 event
	{
		EPT0->EMICR=EPT_EP3_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP4_EMINT)==EPT_EP4_EMINT)	//interrupt flag of EP4 event
	{
		EPT0->EMICR=EPT_EP4_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP5_EMINT)==EPT_EP5_EMINT)	//interrupt flag of EP5 event
	{
		EPT0->EMICR=EPT_EP5_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP6_EMINT)==EPT_EP6_EMINT)	//interrupt flag of EP6 event
	{
		EPT0->EMICR=EPT_EP6_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP7_EMINT)==EPT_EP7_EMINT)	//interrupt flag of EP7 event
	{
		EPT0->EMICR=EPT_EP7_EMINT;
	}
	else if((EPT0->EMMISR&EPT_CPU_FAULT_EMINT)==EPT_CPU_FAULT_EMINT)	//interrupt flag of CPU_FAULT event
	{
		EPT0->EMICR=EPT_CPU_FAULT_EMINT;
	}
	else if((EPT0->EMMISR&EPT_MEM_FAULT_EMINT)==EPT_MEM_FAULT_EMINT)	//interrupt flag of MEM_FAULT event
	{
		EPT0->EMICR=EPT_MEM_FAULT_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EOM_FAULT_EMINT)==EPT_EOM_FAULT_EMINT)	//interrupt flag of EOM_FAULT event
	{
		EPT0->EMICR=EPT_EOM_FAULT_EMINT;
	}
}

/*************************************************************/
//GPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPTAIntHandler(void) 
{
    // ISR content ...
	if((GPTA0->MISR&GPT_INT_TRGEV0)==GPT_INT_TRGEV0)			//TRGEV0 interrupt
	{
		GPTA0->ICR = GPT_INT_TRGEV0;
	} 
	else if((GPTA0->MISR&GPT_INT_TRGEV1)==GPT_INT_TRGEV1)	//TRGEV1 interrupt
	{
		GPTA0->ICR = GPT_INT_TRGEV1;
	}
	else if((GPTA0->MISR&GPT_INT_CAPLD0)==GPT_INT_CAPLD0)		//Capture Load to CMPA interrupt
	{
		GPTA0->ICR = GPT_INT_CAPLD0;
	}
	else if((GPTA0->MISR&GPT_INT_CAPLD1)==GPT_INT_CAPLD1)		//Capture Load to CMPB interrupt
	{
		GPTA0->ICR = GPT_INT_CAPLD1;
	}
	else if((GPTA0->MISR&GPT_INT_CAU)==GPT_INT_CAU)			//Up-Counting phase CNT = CMPA Interrupt
	{
		GPTA0->ICR = GPT_INT_CAU;
	}
	else if((GPTA0->MISR&GPT_INT_CAD)==GPT_INT_CAD)			//Down-Counting phase CNT = CMPA Interrupt
	{
		GPTA0->ICR = GPT_INT_CAD;
	}
	else if((GPTA0->MISR&GPT_INT_CBU)==GPT_INT_CBU)			//Up-Counting phase CNT = CMPB Interrupt
	{
		GPTA0->ICR = GPT_INT_CBU;
	}
	else if((GPTA0->MISR&GPT_INT_CBD)==GPT_INT_CBD)			//Down-Counting phase CNT = CMPB Interrupt
	{
		GPTA0->ICR = GPT_INT_CBD;
	}
	else if((GPTA0->MISR&GPT_INT_PEND)==GPT_INT_PEND)		//End of cycle interrupt 
	{
		GPTA0->ICR = GPT_INT_PEND;
	}
}

/*************************************************************/
//BT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0IntHandler(void) 
{
    // ISR content ...
	if((BT0->MISR&BT_PEND)==BT_PEND)
	{
		BT0->ICR = BT_PEND;
	} 
	else if((BT0->MISR&BT_CMP)==BT_CMP)
	{
		BT0->ICR = BT_CMP;
	}
	else if((BT0->MISR&BT_OVF)==BT_OVF)
	{
		BT0->ICR = BT_OVF;
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT0->ICR = BT_EVTRG;
	} 
}
/*************************************************************/
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1IntHandler(void) 
{
    // ISR content ...
	if((BT1->MISR&BT_PEND)==BT_PEND)
	{
		BT1->ICR = BT_PEND;
	} 
	else if((BT1->MISR&BT_CMP)==BT_CMP)
	{
		BT1->ICR = BT_CMP;
	}
	else if((BT1->MISR&BT_OVF)==BT_OVF)
	{
		BT1->ICR = BT_OVF;
	} 
	else if((BT1->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT1->ICR = BT_EVTRG;
	} 
}

/*************************************************************/
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT2IntHandler(void) 
{
    // ISR content ...
	if((BT2->MISR&BT_PEND)==BT_PEND)
	{
		BT2->ICR = BT_PEND;
	} 
	else if((BT2->MISR&BT_CMP)==BT_CMP)
	{
		BT2->ICR = BT_CMP;
	}
	else if((BT2->MISR&BT_OVF)==BT_OVF)
	{
		BT2->ICR = BT_OVF;
	} 
	else if((BT2->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT2->ICR = BT_EVTRG;
	} 
}

/*************************************************************/
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT3IntHandler(void) 
{
    // ISR content ...
	if((BT3->MISR&BT_PEND)==BT_PEND)
	{
		BT3->ICR = BT_PEND;
	} 
	else if((BT3->MISR&BT_CMP)==BT_CMP)
	{
		BT3->ICR = BT_CMP;
	}
	else if((BT3->MISR&BT_OVF)==BT_OVF)
	{
		BT3->ICR = BT_OVF;
	} 
	else if((BT3->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT3->ICR = BT_EVTRG;
	} 
}
/*************************************************************/
//UART0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0IntHandler(void) 
{
    // ISR content ...
	if ((UART0->ISR&UART_RX_INT_S)==UART_RX_INT_S)				//RX interrupt
	{
		UART0->ISR=UART_RX_INT_S;
		RxDataFlag = TRUE;
	}
	else if( (UART0->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 		//TX interrupt
    {
		UART0->ISR=UART_TX_INT_S;
		TxDataFlag = TRUE;
	}
	else if ((UART0->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)			//RX overrun interrupt
	{
		UART0->ISR=UART_RX_IOV_S;
	}
	else if ((UART0->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
	{
		UART0->ISR=UART_TX_IOV_S;
	}
}
/*************************************************************/
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0IntHandler(void) 
{
    // ISR content ...
	if ((CMP->MISR & EDGEDET0)==EDGEDET0) 
	{
		CMP->ICR =	EDGEDET0;
	}
}
/*************************************************************/
//CMP1,CMP3,CMP4 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1IntHandler(void) 
{
    // ISR content ...
	if((CMP->MISR & EDGEDET1)==EDGEDET1)
	{
		CMP->ICR =	EDGEDET1;
	}
}
/*************************************************************/
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2IntHandler(void) 
{
    // ISR content ...
	if ((CMP->MISR & EDGEDET2)==EDGEDET2) 
	{
		CMP->ICR =	EDGEDET2;
	}
}
/*************************************************************/
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3IntHandler(void) 
{
    // ISR content ...
	if((CMP->MISR & EDGEDET3)==EDGEDET3)
	{
		CMP->ICR =	EDGEDET3;				
	}
}
/*************************************************************/
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4IntHandler(void) 
{
    // ISR content ...
	if((CMP->MISR & EDGEDET4)==EDGEDET4)
	{
		CMP->ICR =	EDGEDET4;
	}
}
/*************************************************************/
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5IntHandler(void) 
{
    // ISR content ...
	if((CMP->MISR & EDGEDET5)==EDGEDET5)
	{
		CMP->ICR =	EDGEDET5;
	}
}
//-------------------------------------------------------
//-------------------------------------------------------
void MisalignedHandler(void) 
{
    // ISR content ...
	nop;
}

void IllegalInstrHandler(void) 
{
    // ISR content ...
	nop;
}

void AccessErrHandler(void) 
{
    // ISR content ...
	nop;
}

void BreakPointHandler(void) 
{
    // ISR content ...
	nop;
}

void UnrecExecpHandler(void) 
{
    // ISR content ...
	nop;
}

void PriviledgeVioHandler(void) 
{
    // ISR content ...
	nop;
}

void Trap0Handler(void) 
{
    // ISR content ...
	nop;
}

void Trap1Handler(void) 
{
    // ISR content ...
	nop;
}

void Trap2Handler(void) 
{
    // ISR content ...
	nop;
}

void Trap3Handler(void) 
{
    // ISR content ...
	nop;
}

void PendTrapHandler(void) 
{
    // ISR content ...
	nop;
}
/*
void TKEYIntHandler(void)
{
	// ISR content ...
	nop;
}
 * */
/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/
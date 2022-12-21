/*
  ******************************************************************************
  * @file    apt32f171_initial.c
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
#include "apt32f171.h"
#include "apt32f171_types_local.h"
#include "apt32f171_coret.h"
#include "apt32f171_ifc.h"
#include "apt32f171_syscon.h"
#include "apt32f171_adc.h"
#include "apt32f171_cmp.h"
#include "apt32f171_oamp.h"
#include "apt32f171_gpio.h"
#include "apt32f171_gpt.h"
#include "apt32f171_bt.h"
#include "apt32f171_etcb.h"
#include "apt32f171_usart.h"
#include "apt32f171_uart.h"
#include "apt32f171_wwdt.h"
#include "apt32f171_ept.h"
#include "apt32f171_uart.h"
#include "apt32f171_oamp.h"
/* define --------------------------------------------------------------------*/

/* externs--------------------------------------------------------------------*/
/*************************************************************/
//software delay
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void delay_nms(unsigned int t)
{
    volatile unsigned int i,j ,k=0;
    j = 50* t;
    for ( i = 0; i < j; i++ )
    {
        k++;
		SYSCON_IWDCNT_Reload(); 
    }
}
void delay_nus(unsigned int t)
{
    volatile unsigned int i,j ,k=0;
    j = 1* t;
    for ( i = 0; i < j; i++ )
    {
        k++;
    }
}

/*************************************************************/
//GPIO Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void GPIO_CONFIG(void)
{
	GPIO_DeInit();
	GPIO_Init(GPIOA0,0,0);
/*	GPIO_Init(GPIOA0,4,0);
	GPIO_Init(GPIOA0,2,0);
	GPIO_Init(GPIOA0,11,1);   //输入*/

	//GPIO_Write_High(GPIOA0,10);				
	//GPIO_Write_Low(GPIOA0,10);				
//------------  EXI FUNTION  --------------------------------/
//EXI0_INT= EXI0/EXI16,EXI1_INT= EXI1/EXI17, EXI2_INT=EXI2~EXI3/EXI18/EXI19, EXI3_INT=EXI4~EXI9, EXI4_INT=EXI10~EXI15    
	GPIO_IntGroup_Set(PA0,5,Selete_EXI_PIN5);					//PA0.0 set as EXI0  
	GPIOA0_EXI_Init(EXI5);                                   	//PA0.0 set as input
	EXTI_trigger_CMD(ENABLE,EXI_PIN5,_EXIFT);                   //ENABLE falling edge
	//EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);                 //ENABLE rising edge
    EXTI_interrupt_CMD(ENABLE,EXI_PIN5);                	   	//enable EXI
    GPIO_EXTI_interrupt(GPIOA0,0b0000000000100000);				//enable GPIOA0.0 as EXI
	
	/*GPIO_IntGroup_Set(PB0,0,Selete_EXI_PIN18);					//PB0.0 set as EXI18 
	GPIO_Init(GPIOB0,0,1);										//PB0.0 set as input                                	
	EXTI_trigger_CMD(ENABLE,EXI_PIN18,_EXIFT);                  //ENABLE falling edge
	//EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);                 //ENABLE rising edge
    EXTI_interrupt_CMD(ENABLE,EXI_PIN18);                	   	//enable EXI
    GPIO_EXTI_interrupt(GPIOB0,0b0000000000000001);				//enable GPIOB0.0 as EXI
	*/
	
	//GPIO_Init(GPIOA0,0,0);
	
	//EXI0_Int_Enable();                                         //EXI0 / EXI16 INT Vector
    //EXI1_Int_Enable();                                       //EXI1 / EXI17 INT Vector
    //EXI2_Int_Enable();                                         //EXI2~EXI3 / EXI18~19 INT Vector
    EXI3_Int_Enable();                                       //EXI4~EXI8 INT Vector
    //EXI4_Int_Enable();                                       //EXI9~EXI15 INT Vector
	
    //EXI0_WakeUp_Enable();										//EXI0 interrupt wake up enable
	//EXI1_WakeUp_Enable();										//EXI1 interrupt wake up enable
	//EXI2_WakeUp_Enable();										//EXI2~EXI3 interrupt wake up enable
	EXI3_WakeUp_Enable();										//EXI4~EXI8 interrupt wake up enable
	//EXI4_WakeUp_Enable();										//EXI9~EXI15 interrupt wake up enable
}

/*************************************************************/
//GPT0 Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_CONFIG(void)
{
	GPT_IO_Init(GPT_CHA_PA03);
	GPT_IO_Init(GPT_CHA_PA13);
	GPT_Configure(GPTCLK_EN,GPT_PCLK,GPT_IMMEDIATE,1);
	GPT_WaveCtrl_Configure(GPT_INCREASE,GPT_SWSYNDIS,GPT_IDLE_LOW,GPT_PRDLD_PEND,GPT_OPM_CONTINUOUS,GPT_BURST_DIS,GPT_CKS_PCLK,GPT_CG_CHAX,GPT_CGFLT_00,GPT_PRDLD_ZERO);
	GPT_Period_CMP_Write(2000,1500,50);
	GPT_WaveLoad_Configure(GPT_WAVEA_IMMEDIATE,GPT_WAVEB_SHADOW,GPT_AQLDA_ZERO,GPT_AQLDB_ZERO);
	GPT_WaveOut_Configure(GPT_CHA,GPT_CASEL_CMPA,GPT_CBSEL_CMPA,2,0,1,1,0,0,0,0,0,0);
	GPT_WaveOut_Configure(GPT_CHB,GPT_CASEL_CMPA,GPT_CBSEL_CMPB,2,0,0,0,1,1,0,0,0,0);
	//GPT_SyncSet_Configure(GPT_SYNCUSR0_EN,GPT_OSTMD5_ONCE,GPT_TXREARM_DIS,GPT_TRGO0SEL_SR0,GPT_TRG10SEL_SR0,GPT_AREARM_DIS);
	//GPT_Trigger_Configure(GPT_SRCSEL_TRGUSR0EN,GPT_BLKINV_DIS,GPT_ALIGNMD_PRD,GPT_CROSSMD_DIS,5,5);
	//GPT_EVTRG_Configure(GPT_TRGSRC0_PRD,GPT_TRGSRC1_PRD,GPT_ESYN0OE_EN,GPT_ESYN1OE_EN,GPT_CNT0INIT_EN,GPT_CNT1INIT_EN,3,3,3,3);
	GPT_Start();
	GPT_ConfigInterrupt_CMD(ENABLE,GPT_INT_PEND);
	GPT_INT_ENABLE();
	//INTC_ISER_WRITE(GPT_INT); 
	//INTC_IWER_WRITE(GPT_INT); 
}
/*************************************************************/
//ETP0 Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void EPT_CONFIG(void)
{
	EPT_Software_Prg();								//EPT software reset
//------------  EPT GPIO Setting  --------------------------------/
	EPT_IO_SET(EPT_IO_CHAX,IO_NUM_PA00);			//AX channel selection
	EPT_IO_SET(EPT_IO_CHAY,IO_NUM_PA01);			//AY channel selection
	EPT_IO_SET(EPT_IO_CHBX,IO_NUM_PA07);			//BX channel selection
	EPT_IO_SET(EPT_IO_CHBY,IO_NUM_PA08);			//BY channel selection
	EPT_IO_SET(EPT_IO_CHCX,IO_NUM_PA05);			//CX channel selection
	EPT_IO_SET(EPT_IO_CHCY,IO_NUM_PA06);			//CY channel selection
	EPT_IO_SET(EPT_IO_CHD,IO_NUM_PA13);			//D channel selection
//------------  EPT Control  --------------------------------/
	EPT_PWM_Config(EPT_Selecte_PCLK,EPT_CNTMD_increase,EPT_OPM_Continue,0);//PCLK as clock，increasing mode,continuous mode,TCLK=PCLK/(0+1) 
	//EPT_Tevent_Selecte(0x00,0x00);				//T1 source selection SYNCIN4,T2 source selectionSYNCIN5
	//EPT_SYNCR_Config(EPT_Triggle_Continue,EPT_SYNCUSR0_REARMTrig_DIS,EPT_TRGSRC0_ExtSync_SYNCUSR0,EPT_TRGSRC1_ExtSync_SYNCUSR4,0x30);//enable SYNCUSR4 SYNCUSR5 as trigger event,continuous mode
	EPT_PWMX_Output_Control(EPT_PWMA,EPT_CA_Selecte_CMPA,EPT_CB_Selecte_CMPA,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);
	EPT_PWMX_Output_Control(EPT_PWMB,EPT_CA_Selecte_CMPB,EPT_CB_Selecte_CMPB,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);						
	EPT_PWMX_Output_Control(EPT_PWMC,EPT_CA_Selecte_CMPC,EPT_CB_Selecte_CMPC,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);	
	EPT_PWMX_Output_Control(EPT_PWMD,EPT_CA_Selecte_CMPD,EPT_CB_Selecte_CMPD,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);		
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(4800,2400,1200,600,0);//PRDR=2400,CMPA=1200,CMPB=600,CMPC=2400,CMPD=0	
	EPT_DB_CLK_Config(0,24,24);//Fdbclk=Fhclk/(0+1)，DTR=24clk，DTF=24clk
	EPT_DBCR_Config(EPT_CHA_Selecte,EPT_CHAINSEL_PWMA_RISE_FALL,EPT_CHA_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMA Complementary,CHX rising edge,CHY falling edge		
	EPT_DBCR_Config(EPT_CHB_Selecte,EPT_CHBINSEL_PWMB_RISE_FALL,EPT_CHB_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMB Complementary,CHX rising edge,CHY falling edge		
	EPT_DBCR_Config(EPT_CHC_Selecte,EPT_CHCINSEL_PWMC_RISE_FALL,EPT_CHC_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMC Complementary,CHX rising edge,CHY falling edge
//------------  EPT interruption  --------------------------------/
	//EPT_Int_Enable(EPT_CAP_LD0);//CMPA load interrupt
	//EPT_Int_Enable(EPT_CAP_LD1);//CMPB load interrupt
	//EPT_Int_Enable(EPT_CAP_LD2);//CMPC load interrupt
	//EPT_Int_Enable(EPT_CAP_LD3);//CMPD load interrupt	
	//EPT_Int_Enable(EPT_CAU);//Up-Counting phase CNT = CMPA interrupt request raw status
	//EPT_Int_Enable(EPT_CAD);//Down-Counting phase CNT = CMPA interrupt request raw statu
	//EPT_Int_Enable(EPT_CBU);//Up-Counting phase CNT = CMPB interrupt request raw status
	//EPT_Int_Enable(EPT_CBD);//Down-Counting phase CNT = CMPB interrupt request raw status
	//EPT_Int_Enable(EPT_CCU);//Up-Counting phase CNT = CMPC interrupt request raw status
	//EPT_Int_Enable(EPT_CCD);//Down-Counting phase CNT = CMPC interrupt request raw status
	//EPT_Int_Enable(EPT_CDU);//Up-Counting phase CNT = CMPD interrupt request raw status
	//EPT_Int_Enable(EPT_CDD);//Down-Counting phase CNT = CMPD interrupt request raw status
	//EPT_Int_Enable(EPT_PEND);//End of cycle interrupt request raw status
	//EPT_Vector_Int_Enable();
//------------  EPT start  --------------------------------/	
	EPT_Start();
//------------  EPT capture config  --------------------------------/
	/*EPT_Software_Prg();
	EPT_Capture_Config(EPT_Selecte_PCLK,EPT_CNTMD_increase,EPT_CAPMD_Continue,EPT_CAP_EN,EPT_LDARST_EN,EPT_LDBRST_DIS,EPT_LDCRST_DIS,EPT_LDDRST_DIS,1,0);//TCLK=pclk/(1+0),CMPAload CMPBload
	EPT_SYNCR_Config(EPT_Triggle_Continue,EPT_SYNCUSR0_REARMTrig_DIS,EPT_TRGSRC0_ExtSync_SYNCUSR0,EPT_TRGSRC1_ExtSync_SYNCUSR4,0x04);//Enable SYNCUSR2 ,Continuous trigger
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(0XFFFF,0,0,0,0);
	EPT_Int_Enable(EPT_CAP_LD0);//Capture Load to CMPA interrupt request raw status
	EPT_Int_Enable(EPT_CAP_LD1);//Capture Load to CMPB interrupt request raw status
	EPT_Vector_Int_Enable();
	EPT_Start();*/
}
void BT_CONFIG(void)
{
	BT_DeInit(BT0);
	BT_IO_Init(BT0_PA02);
	BT_Configure(BT0,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
	BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC0_DIS,BT_SYNC1_DIS,BT_SYNC2_DIS,BT_SYNCMD_DIS,BT_OSTMD0_ONCE,BT_AREARM0_DIS,BT_AREARM1_DIS,BT_CNTRLD_EN);
	//BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_EN,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_Trigger_Configure(BT0,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT0,2000,500);
	BT_Start(BT0);
	BT_ConfigInterrupt_CMD(BT0,ENABLE,BT_PEND);
	BT0_INT_ENABLE();
	
	/*BT_DeInit(BT1);
	BT_IO_Init(BT1_PA09);
	BT_Configure(BT1,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);
	BT_ControlSet_Configure(BT1,BT_START_LOW,BT_IDLE_HIGH,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	BT_Trigger_Configure(BT1,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT1,1000,500);
	BT_Start(BT1);
	BT_ConfigInterrupt_CMD(BT1,ENABLE,BT_PEND);
	BT1_INT_ENABLE();*/
	/*BT_DeInit(BT2);
	BT_IO_Init(BT2_PB04);
	BT_Configure(BT2,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);
	BT_ControlSet_Configure(BT2,BT_START_LOW,BT_IDLE_HIGH,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	BT_Trigger_Configure(BT2,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT2,1000,500);
	BT_Start(BT2);
	BT_ConfigInterrupt_CMD(BT2,ENABLE,BT_PEND);
	BT2_INT_ENABLE();*/
	/*BT_DeInit(BT3);
	BT_IO_Init(BT3_PC00);
	BT_Configure(BT3,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);
	BT_ControlSet_Configure(BT3,BT_START_LOW,BT_IDLE_HIGH,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	BT_Trigger_Configure(BT3,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT3,1000,500);
	BT_Start(BT3);
	BT_ConfigInterrupt_CMD(BT3,ENABLE,BT_PEND);
	BT3_INT_ENABLE();*/
}

/*************************************************************/
//ET Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void ETCB_CONFIG(void)
{
	ET_DeInit();

	ET_CH0_SRCSEL(ENABLE,TRG_HW,ET_EPT0_TRGSRC0);
	ET_CH0_DSTSEL(ET_DST0,ENABLE,ET_ADC_SYNC0);
		
	ET_ENABLE();
}

/*************************************************************/
//adc config
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void ADC12_CONFIG(void)
{
	ADC12_Software_Reset();
	ADC12_CLK_CMD(ADC_CLK_CR , ENABLE);                                         //enable ADC CLK
	ADC12_Configure_Mode(ADC12_12BIT , Continuous_mode ,0, 6 ,2 , 1);           //12BIT ADC; Continuous mode; Conversion priority selection 0; Holding cycles=6 ;ADC_CLK=PCLK/2*2=0.2us; Number of Conversions=1
	ADC12_Configure_VREF_Selecte(ADC12_VREFP_FVR2048_VREFN_VSS);					    //ADC VREF Positive FVR4.096V,negative VSS
	ADC12_ConversionChannel_Config(ADC12_ADCIN0,ADC12_CV_RepeatNum1,ADC12_AVGDIS,0);    //SEQ0 chose ADCIN0, 6 Holding cycles, Average 1 time
	//ADC12_ConversionChannel_Config(ADC12_ADCIN1,ADC12_CV_RepeatNum1,ADC12_AVGDIS,1);  //SEQ1 chose ADCIN1, 6 Holding cycles , Average 1 time
	ADC12_CMD(ENABLE);                                                                  //enable ADC
	ADC12_ready_wait(); 																//wait ADC get ready
	ADC12_Control(ADC12_START);															//ADC convert start
}
/*************************************************************/
//CORET Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void CORET_CONFIG(void)
{
	CORET_DeInit();									//Coret 所有寄存器复位赋值			
	SYSCON_General_CMD(ENABLE,ENDIS_SYSTICK);		//使能 STCLK 时钟
	CK802->CORET_RVR=599999;						//100ms
	CORET_reload();									// Coret CVR 清除						
	CORET_CLKSOURCE_EX();							//使用时钟源为sysclk/8
	CORET_TICKINT_Enable();							//使能计数器清零中断
	
	CORET_start();									//Coret 计时开始				
	CORET_Int_Enable();								//使能计数器清零中断向量
	//CORET_WakeUp_Enable();							//使能计数器清零中断唤醒	
}


/*************************************************************/
//UART0  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART_CONFIG(void)
{
	UART0_DeInit();                                                //clear all UART Register
    UART_IO_Init(IO_UART0,0);                                     //use PA0.10->RXD0, PA0.9->TXD0
    //UARTInit(UART0,416,UART_PAR_NONE);							  //baudrate=sysclock/416=115200
	UARTInitRxTxIntEn(UART0,416,UART_PAR_NONE);	              //baudrate=sysclock/416=115200,RX TX int enable
	UART0_Int_Enable();
} 
/*************************************************************/
//USART Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void USART_CONFIG(void)
{
	USART_DeInit();                                                              	//USART 所有寄存器复位赋值
    USART_CLK_Enable();																//USART CLK	使能
	USART_CTRL_Config(RSTRX,ENABLE);												//复位接收模块
	USART_CTRL_Config(RSTTX,ENABLE);												//复位发射模块
	USART_IO_Init(IO_USART0,0);                                                  		//USART 使用PA0.2->RXD0, PB0.2->TXD0
	//USART_CLKIO_Init(CLK_PB07);													//同步模式下可以选择PB0.7作为UARTCLK
    USART_MODE_Config(SENDTIME0,PCLK,CHRL8,ASYNC,PAR_EVEN,NBSTOP1,CHMODE_NORMAL);	//重发次数为0, CLKs=PCLK, 字节长度8bit, 异步模式, 偶校验位, 1个停止位, 普通模式
	//USART_CLKO_Config(ENABLE);														//同步模式下需要输出UARTCLK时,需要使能
    USART_Baudrate_Cal(38400,48000000,PCLK,ASYNC);									//波特率=38400, 主频选择48M, PCLK不分频, 异步模式							
	USART_CTRL_Config(TXEN,ENABLE);													//USART 发送使能
	USART_CTRL_Config(RXEN,ENABLE);													//USART 接收使能
	USART_INT_Config(RXRDY_INT,ENABLE);												//USART 接收中断使能
	//USART_INT_Config(TXRDY_INT,ENABLE);												//USART 发射中断使能	
	USART_Int_Enable();																//USART 中断向量使能
	//USART_WakeUp_Enable();															//USART 中断唤醒使能
	
}

/*************************************************************/
//CMP Init
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void CMP_CONFIG(void)
{
	CMP_RESET_VALUE();								//CMP 所有寄存器复位赋值
	CMP_software_reset();							//CMP 软件复位	
	
	CMP_IO_Init(CPINP0,0);							//CPINP0 初始化
	//CMP_IO_Init(CPINP1,0);							//CPINP1 初始化
	//CMP_IO_Init(CPINP2,0);							//CPINP2 初始化	
	//CMP_IO_Init(CPINP3,0);							//CPINP3 初始化	
	//CMP_IO_Init(CPINP4,0);							//CPINP4 初始化
	//CMP_IO_Init(CPINP5,0);							//CPINP5 初始化
	//CMP_IO_Init(CPINP6,0);							//CPINP6 初始化
	//CMP_IO_Init(CPINP7,0);							//CPINP7 初始化
	//CMP_IO_Init(CPINP8,0);							//CPINP8 初始化
	//CMP_IO_Init(CPINP9,0);							//CPINP9 初始化
	
	CMP_IO_Init(CPINN0,0);							//CPINN0 初始化	
	//CMP_IO_Init(CPINN1,0);							//CPINN1 初始化		
	//CMP_IO_Init(CPINN2,0);							//CPINN2 初始化	
	//CMP_IO_Init(CPINN3,0);							//CPINN3 初始化	
	//CMP_IO_Init(CPINN4,0);							//CPINN4 初始化	
	
	CMP_IO_Init(CP0_OUT,0);							//CP0_OUT 初始化	
	//CMP_IO_Init(CP1_OUT,0);							//CP1_OUT 初始化	
	//CMP_IO_Init(CP2_OUT,0);							//CP2_OUT 初始化	
	//CMP_IO_Init(CP3_OUT,0);							//CP3_OUT 初始化	
	//CMP_IO_Init(CP4_OUT,0);							//CP4_OUT 初始化	
	
	CMP_INPCRX_Config(CMP0_NUM,0,0);						//比较器负向:CPINN0  比较器正向:CPINP0
	CMP_CLK_CMD(CMP0_NUM,ENABLE);							//比较器0时钟使能
	CMP_CR_Config(CMP0_NUM,NHYST_0mv,PHYST_0mv,POLARITY_0,EVE_SEL_fall_rise,EN_FLTEN,CPOS_1);
	//使能CMP0比较器，比较器正向和负向迟滞电压为0mV，比较器输出不反向，事件触发为上升沿和下降沿，滤波器使能，选择经过滤波器后输出
	CMPX_FLTCR_Config(CMP0_NUM,CMPX_CLK_PCLK,4,199);		//FLT_CK = 20M/(199+1)/2^4=160us; 滤波次数固定为3次 160us*3=480us
	CMP_Open(CMP0_NUM);										//比较器0打开
	CMP->ICR =	EDGEDET0;									//清除CMP0中断标志位
	CMP_ConfigInterrupt_CMD(EDGEDET0,ENABLE);				//CMP0 中断使能
	
	//CMP_INPCRX_Config(CMP1_NUM,2,1);						//比较器负向:CPINN2  比较器正向:CPINP1
	//CMP_CLK_CMD(CMP1_NUM,ENABLE);								//比较器1时钟使能
	//CMP_CR_Config(CMP1_NUM,NHYST_0mv,PHYST_0mv,POLARITY_0,EVE_SEL_fall_rise,EN_FLTEN,CPOS_1);
	//使能CMP1比较器，比较器正向和负向迟滞电压为0mV，比较器输出不反向，事件触发为上升沿和下降沿，滤波器使能，选择经过滤波器后输出
	//CMPX_FLTCR_Config(CMP1_NUM,CMPX_CLK_PCLK,4,199);			//FLT_CK = 20M/(199+1)/2^4=160us; 滤波次数固定为3次
	//CMP_Open(CMP1_NUM);										//比较器1打开
	//CMP->ICR = EDGEDET1;										//清除CMP1中断标志位
	//CMP_ConfigInterrupt_CMD(EDGEDET1,ENABLE);					//CMP1 中断使能
	
	//CMP_INPCRX_Config(CMP2_NUM,130,2);						//比较器负向:CPINN2  比较器正向:CPINP2
	//CMP_CLK_CMD(CMP2_NUM,ENABLE);								//比较器2时钟使能
	//CMP_CR_Config(CMP2_NUM,NHYST_0mv,PHYST_0mv,POLARITY_0,EVE_SEL_fall_rise,EN_FLTEN,CPOS_1);
	//使能CMP2比较器，比较器正向和负向迟滞电压为0mV，比较器输出不反向，事件触发为上升沿和下降沿，滤波器使能，选择经过滤波器后输出
	//CMPX_FLTCR_Config(CMP2_NUM,CMPX_CLK_PCLK,4,199);			//FLT_CK = 20M/(199+1)/2^4=160ms; 滤波次数固定为3次
	//CMP_Open(CMP2_NUM);										//比较器2打开
	//CMP->ICR = EDGEDET2;										//清除CMP2中断标志位
	//CMP_ConfigInterrupt_CMD(EDGEDET2,ENABLE);					//CMP2 中断使能
	
	//CMP_INPCRX_Config(CMP3_NUM,131,3);						//比较器负向:CPINN3  比较器正向:CPINP3
	//CMP_CLK_CMD(CMP3_NUM,ENABLE);								//比较器3时钟使能
	//CMP_CR_Config(CMP3_NUM,NHYST_0mv,PHYST_0mv,POLARITY_0,EVE_SEL_fall_rise,EN_FLTEN,CPOS_1);
	//使能CMP3比较器，比较器正向和负向迟滞电压为0mV，比较器输出不反向，事件触发为上升沿和下降沿，滤波器使能，选择经过滤波器后输出
	//CMPX_FLTCR_Config(CMP3_NUM,CMPX_CLK_PCLK,4,199);			//FLT_CK = 20M/(199+1)/2^4=160ms; 滤波次数固定为3次
	//CMP_Open(CMP3_NUM);										//比较器3打开
	//CMP->ICR = EDGEDET3;										//清除CMP3中断标志位
	//CMP_ConfigInterrupt_CMD(EDGEDET3,ENABLE);					//CMP3 中断使能
	
	//CMP_INPCRX_Config(CMP4_NUM,132,4);						//比较器负向:CPINN4  比较器正向:CPINP4
	//CMP_CLK_CMD(CMP4_NUM,ENABLE);								//比较器4时钟使能
	//CMP_CR_Config(CMP4_NUM,NHYST_0mv,PHYST_0mv,POLARITY_0,EVE_SEL_fall_rise,EN_FLTEN,CPOS_1);
	//使能CMP4比较器，比较器正向和负向迟滞电压为0mV，比较器输出不反向，事件触发为上升沿和下降沿，滤波器使能，选择经过滤波器后输出
	//CMPX_FLTCR_Config(CMP4_NUM,CMPX_CLK_PCLK,4,199);			//FLT_CK = 20M/(199+1)/2^4=160ms; 滤波次数固定为3次
	//CMP_Open(CMP4_NUM);										//比较器4打开
	//CMP->ICR = EDGEDET4;										//清除CMP4中断标志位
	//CMP_ConfigInterrupt_CMD(EDGEDET4,ENABLE);					//CMP4 中断使能
	
	//CMP_INPCRX_Config(CMP5_NUM,132,4);						//比较器负向:CPINN4  比较器正向:CPINP4
	//CMP_CLK_CMD(CMP5_NUM,ENABLE);								//比较器5时钟使能
	//CMP_CR_Config(CMP5_NUM,NHYST_0mv,PHYST_0mv,POLARITY_0,EVE_SEL_fall_rise,EN_FLTEN,CPOS_1);
	//使能CMP4比较器，比较器正向和负向迟滞电压为0mV，比较器输出不反向，事件触发为上升沿和下降沿，滤波器使能，选择经过滤波器后输出
	//CMPX_FLTCR_Config(CMP5_NUM,CMPX_CLK_PCLK,4,199);			//FLT_CK = 20M/(199+1)/2^4=160ms; 滤波次数固定为3次
	//CMP_Open(CMP5_NUM);										//比较器5打开
	//CMP->ICR = EDGEDET5;										//清除CMP4中断标志位
	//CMP_ConfigInterrupt_CMD(EDGEDET5,ENABLE);					//CMP5 中断使能
	
	CMP0_Int_Enable();										//CMP0~CMP1 中断向量使能
	//CMP1_Int_Enable();										//CMP2~CMP3 中断向量使能
	
}
/*************************************************************/
//OPAMP Init
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void OPAMP_CONFIG(void)
{
	OPA0_RESET_VALUE();										//OPAx 所有寄存器复位赋值
	OPA1_RESET_VALUE();	
	
	OPA_IO_Init(OPA0P,0);									//OPA0P 初始化				
	//OPA_IO_Init(OPA0N,0);									//OPA0N 初始化				
	OPA_IO_Init(OPA0X,0);									//OPA0X 初始化				
	
	OPA_IO_Init(OPA1P,0);									//OPA1P 初始化		
	//OPA_IO_Init(OPA1N,0);									//OPA1N 初始化		
	OPA_IO_Init(OPA1X,0);									//OPA1X 初始化		
	
	OPA_EN_CMD(OPA0_NUM,ENABLE);							//OPA0  ENABLE
	OPA_EN_CMD(OPA1_NUM,ENABLE);							//OPA1  ENABLE
	
	OPA_Config_Prg(OPA0_NUM,PGAEN_ENABLE,Op_ExtPinConnect_DIS,BUFFER_DISABLE,4);			//OPA0,使能内部增益控制,负向输入口与PIN脚连通禁止,正向输入口为OPA0P,增益x5,微调增益0
	OPA_Config_Prg(OPA1_NUM,PGAEN_ENABLE,Op_ExtPinConnect_DIS,BUFFER_DISABLE,1);			//OPA1,使能内部增益控制,负向输入口与PIN脚连通禁止,正向输入口为OPA1P,增益x10,微调增益0	
}
/*************************************************************/
//syscon Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CONFIG(void)
{
//------SYSTEM CLK AND PCLK FUNTION---------------------------/
	SYSCON_RST_VALUE();                                                         //SYSCON all register clr
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC);										//SYSCON enable/disable clock source
	//EMOSC_OSTR_Config(0XAD,0X1f,EM_LFSEL_EN,EM_FLEN_EN,EM_FLSEL_10ns);		//EM_CNT=0X3FF,0xAD(36K),EM_GM=0,Low F modedisable,EM filter disable,if enable,cont set 5ns
	//SYSCON_General_CMD(ENABLE,ENDIS_EMOSC);
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_48M);									//HFOSC selected 48MHz
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC,HCLK_DIV_1,PCLK_DIV_1,HFOSC_48M);//system clock set, Hclk div ,Pclk div  set system clock=SystemCLK/Hclk div/Pclk div
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_2S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
    SYSCON_WDT_CMD(DISABLE);                                                  	//enable/disable WDT		
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
	//IWDT_Int_Enable();
//------------  WWDT FUNTION  --------------------------------/
	WWDT_CNT_Load(0xFF);
	WWDT_CONFIG(PCLK_4096_DIV0,0xFF,WWDT_DBGDIS);
	WWDT_Int_Config(DISABLE);													
	//WWDT_CMD(ENABLE);															//enable wwdt
//------------  CLO Output --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA08);												//CLO output setting
	//SYSCON_CLO_SRC_SET(CLO_PCLK,CLO_DIV16);									//CLO output clock and div
//------------  LVD FUNTION  --------------------------------/ 
    SYSCON_LVD_Config(DISABLE_LVDEN,INTDET_LVL_3_3V,RSTDET_LVL_1_9V,DISABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
    //LVD_Int_Enable();	
//------------ EVTRG function --------------------------------/ 	
	//SYSCON->EVTRG=0X00|0x01<<20;											//SYSCON_trgsrc0
	//SYSCON->EVPS=0X00;
	//SYSCON->IMER =EM_EVTRG0_ST;
//------------  SYSCON Vector  --------------------------------/ 	
	//SYSCON_Int_Enable();    														//SYSCON VECTOR
	//SYSCON_WakeUp_Enable();  
}
/*********************************************************************************/  
//APT32F171_init                                                                  /
//EntryParameter:NONE                                                             /
//ReturnValue:NONE                                                                /
/*********************************************************************************/
void APT32F171_init(void) 
{
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable  0x00410071
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
//------------------------------------------------------------/
//ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON_CONFIG();                                                 //syscon  initial
	CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
//------------------------------------------------------------/
//Other IP config
//------------------------------------------------------------/
	//GPIO_CONFIG();                                                //GPIO initial 
    //GPT_CONFIG();												    //GPT initial    
	//EPT_CONFIG();                                                 //EPT initial 
	//BT_CONFIG();													//BT initial
	//ETCB_CONFIG();                                                //ETCB initial	
	//ADC12_CONFIG();                                               //ADC initial 
	//CORET_CONFIG();                                               //CORET initial
	//UART_CONFIG();                                               //UART initial
	//USART_CONFIG();                                               //USART initial
	//CMP_CONFIG();                                                 //CMP initial
	//OPAMP_CONFIG();                                               //OPA initial
	//SYSCON_INT_Priority();
}		

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/

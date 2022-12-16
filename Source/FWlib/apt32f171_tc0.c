/*
  ******************************************************************************
  * @file    apt32f171_tc0.c
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
#include "apt32f171_tc0.h"
/* defines -------------------------------------------------------------------*/

/* externs--------------------------------------------------------------------*/

/*************************************************************/
//TC0 RESET VALUE
//EntryParameter:*TC0CHX
//*TC0CHX:TC0_0,TC0_1,TC0_2
//ReturnValue:NONE
/*************************************************************/  
void TC0_RESET_VALUE(CSP_TC0_T *TC0CHX)									//reset value
{
	TC0CHX->ECR		=	TC0_ECR_RST;          		/**< ECR reset value       */
	TC0CHX->DCR		=	TC0_DCR_RST;	     	 	/**< DCR reset value       */
	TC0CHX->PMSR	=	TC0_PMSR_RST;	     		/**< PMSR reset value      */
	TC0CHX->CR		=	TC0_CR_RST;           		/**< CR reset value        */
	TC0CHX->MR		=	TC0_MR_RST;          		/**< MR reset value        */
	TC0CHX->CSR		= 	TC0_CSR_RST;         		/**< CSR reset value       */
	TC0CHX->SR 		=	TC0_SR_RST;           		/**< SR reset value        */
	TC0CHX->IER		=	TC0_IER_RST;          		/**< IER reset value       */
	TC0CHX->IDR		=	TC0_IDR_RST;          		/**< IDR reset value       */
	TC0CHX->IMR		=	TC0_IMR_RST;          		/**< IMR Rreset value      */
	TC0CHX->CV		=	TC0_CV_RST;           		/**< CV reset value        */
	TC0CHX->RA		= 	TC0_RA_RST;           	 	/**< RA reset value        */
	TC0CHX->RB		=	TC0_RB_RST;           	 	/**< RB reset value        */
	TC0CHX->RC		=	TC0_RC_RST;           		/**< RC reset value        */
	
	TC0->BCR	=	TC0_BCR_RST;          			/**< BCR reset value       */
	TC0->BMR	=	TC0_BMR_RST;          			/**< BMR reset value       */
}
/*************************************************************/
//GTC IO Init
//EntryParameter:TC0_IO_MODE_X,TC0_IO_G
//TC0_IO_MODE_X:TC0_IO_CLK0,TC0_IO_CLK1,TC0_IO_CLK2,TC0_IO_ETR,TC0_IO_IO0A,TC0_IO_IO0B,TC0_IO_IO1A,TC0_IO_IO1B,TC0_IO_IO2A,TC0_IO_IO2B
//TC0_IO_G;TC0_IO_CLK0(0->PB0.6(AF2) ;1->PA0.11(AF3)),TC0_IO_CLK1(0->PB0.5(AF3)),TC0_IO_CLK2(0->PC0.1(AF3))
//TC0_IO_ETR(0->PB0.2(AF2) ; 1->PC0.0(AF3))
//TC0_IO_IO0A(0->PB0.2(AF3) ; 1->PA0.3(AF4) ; 2->PC0.2(AF1) ; 3->PA1.0(AF2))
//TC0_IO_IO0B(0->PA0.11(AF1) ; 1->PA0.4(AF4) ; 2->PB0.3(AF3) ; 3->PA1.1(AF2))
//TC0_IO_IO1A(0->PB0.0(AF1) ; 1->PA1.2(AF2))
//TC0_IO_IO1B(0->PB0.1(AF1) ; 1->PA1.3(AF2))
//TC0_IO_IO2A(0->PA0.0(AF1) ; 1->PA1.4(AF2))
//TC0_IO_IO2B(0->PA0.1(AF1) ; 1->PA1.5(AF2))
//ReturnValue:NONE
/*************************************************************/
void TC0_IO_Init(TC0_IO_MODE_TypeDef  TC0_IO_MODE_X , U8_T TC0_IO_G )
{
	if(TC0_IO_MODE_X==TC0_IO_CLK0)
	{
		if(TC0_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XF0FFFFFF)|0x05000000;										//TC0_IO_CLK0(PB0.6->AF2)
		}
		else if(TC0_IO_G==1)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFF0FFF)|0x00006000;										//TC0_IO_CLK0(PA0.11->AF3)
		}
	}
	else if(TC0_IO_MODE_X==TC0_IO_CLK1)
	{
		if(TC0_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFF0FFFFF)|0x00600000;										//TC0_IO_CLK1(PB0.5->AF3)
		}
	}
	else if(TC0_IO_MODE_X==TC0_IO_CLK2)
	{
		if(TC0_IO_G==0)
		{
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFFF0F)|0x00000060;										//TC0_IO_CLK2(PC0.1->AF3)
		}
	}
	else if(TC0_IO_MODE_X==TC0_IO_ETR)
	{
		if(TC0_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFF0FF)|0x00000500;										//TC0_IO_ETR(PB0.2->AF2)
		}
		else if(TC0_IO_G==1)
		{
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFFFF0)|0x00000006;										//TC0_IO_ETR(PC0.0->AF3)
		}
	}
	else if(TC0_IO_MODE_X==TC0_IO_IO0A)
	{
		if(TC0_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFF0FF)|0x00000600;										//TC0_IO_IO0A(PB0.2->AF3)
		}
		else if(TC0_IO_G==1)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFF0FFF)|0x00007000;										//TC0_IO_IO0A(PA0.3->AF4)
		}
		else if(TC0_IO_G==2)
		{
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFF0FF)|0x00000400;										//TC0_IO_IO0A(PC0.2->AF1)
		}
		else if(TC0_IO_G==3)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFFF0)|0x00000005;										//TC0_IO_IO0A(PA1.0->AF2)
		}
	}
	else if(TC0_IO_MODE_X==TC0_IO_IO0B)
	{
		if(TC0_IO_G==0)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFF0FFF)|0x00004000;										//TC0_IO_IO0B(PA0.11->AF1)
		}
		else if(TC0_IO_G==1)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFF0FFFF)|0x00070000;										//TC0_IO_IO0B(PA0.4->AF4)
		}
		else if(TC0_IO_G==2)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFF0FFF)|0x00006000;										//TC0_IO_IO0B(PB0.3->AF3)
		}
		else if(TC0_IO_G==3)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFF0F)|0x00000050;										//TC0_IO_IO0B(PA1.1->AF2)
		}
	}
	else if(TC0_IO_MODE_X==TC0_IO_IO1A)
	{
		if(TC0_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFFF0)|0x00000004;										//TC0_IO_IO1A(PB0.0->AF1)
		}
		else if(TC0_IO_G==1)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFF0FF)|0x00000500;										//TC0_IO_IO1A(PA1.2->AF2)
		}
	}
	else if(TC0_IO_MODE_X==TC0_IO_IO1B)
	{
		if(TC0_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFF0F)|0x00000040;										//TC0_IO_IO1A(PB0.1->AF1)
		}
		else if(TC0_IO_G==1)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFF0FFF)|0x00005000;										//TC0_IO_IO1A(PA1.3->AF2)
		}
	}
	else if(TC0_IO_MODE_X==TC0_IO_IO2A)
	{
		if(TC0_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFFF0)|0x00000004;										//TC0_IO_IO2A(PA0.0->AF1)
		}
		else if(TC0_IO_G==1)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x00050000;										//TC0_IO_IO2A(PA1.4->AF2)
		}
	}
	else if(TC0_IO_MODE_X==TC0_IO_IO2B)
	{
		if(TC0_IO_G==0)
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFF0F)|0x00000040;										//TC0_IO_IO2B(PA0.1->AF1)
		}
		else if(TC0_IO_G==1)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFF0FFFFF)|0x00500000;										//TC0_IO_IO1A(PA1.5->AF2)
		}
	}
}

/*************************************************************/
//all TC0 software reset
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void All_TC0_SoftwareReset(void)
{
	TC0->BCR = 0x01;							// all TC0 Software reset
}
/*************************************************************/
//all TC0 SWTRG
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/ 
void All_TC0_SWTRG(void)
{
	TC0->BCR = 0x02;							// all TC0 SWTRG
}
/*************************************************************/
//TC0CHX SWTRG
//EntryParameter:*TC0CHX
//*TC0CHX:TC0_0,TC0_1,TC0_2
//ReturnValue:NONE
/*************************************************************/ 
void TC0CHX_SWTRG(CSP_TC0_T *TC0CHX)
{
	TC0CHX->CR = 0x08;							//TC0CHX SWTRG
}
/*************************************************************/
//TC0CHX software reset
//EntryParameter:*TC0CHX
//*TC0CHX:TC0_0,TC0_1,TC0_2
//ReturnValue:NONE
/*************************************************************/ 
void TC0CHX_SoftwareReset(CSP_TC0_T *TC0CHX)
{
	TC0CHX->CR = 0x01;							//TC0CHX Software reset
}
/*************************************************************/
//TC0CHX Count clk CMD
//EntryParameter:*TC0CHX,NewState
//*TC0CHX:TC0_0,TC0_1,TC0_2
//NewState:DISABLE,ENABLE
//ReturnValue:NONE
/*************************************************************/ 
void TC0CHX_CountClk_CMD(CSP_TC0_T *TC0CHX , FunctionalStatus NewState)
{
	if(NewState != DISABLE)
	{
		TC0CHX->CR = 0x02;							//enable counter clk 
	}
	else
	{
		TC0CHX->CR = 0x04;							//Disable counter clk 
	}
}
/*************************************************************/
//TC0CHX CLK CMD
//EntryParameter:*TC0CHX,NewState
//*TC0CHX:TC0_0,TC0_1,TC0_2
//NewState:DISABLE,ENABLE
//ReturnValue:NONE
/*************************************************************/
void TC0CHX_Clk_CMD(CSP_TC0_T *TC0CHX , FunctionalStatus NewState)
{
	if(NewState != DISABLE)
	{
		TC0CHX->ECR	=0X02;									//TC0 CLK enable
		while(!(TC0CHX->PMSR&0X02));
	}
	else 
	{
		TC0CHX->DCR	=0X02;									//TC0 CLK disable
		while(TC0CHX->PMSR&0X02);
	}
}
/*************************************************************/
//TC0CHX counter read
//EntryParameter:*TC0CHX
//*TC0CHX:TC0_0,TC0_1,TC0_2
//ReturnValue:Counter value
/*************************************************************/ 
/*U32_T TC0CHX_Counter_Value(CSP_TC0_T *TC0CHX)
{
	return (TC0CHX->CV);
}*/
/*************************************************************/
//TC0 RA,RB,RC SET
//EntryParameter:*TC0CHX,load_RA,load_RB,load_RC
//*TC0CHX:TC0_0,TC0_1,TC0_2
//load_RA:0~0xffff
//load_RB:0~0xffff
//load_RC:0~0xffff
//ReturnValue:NONE
/*************************************************************/ 
void TC0CHX_Set_RA_RB_RC(CSP_TC0_T *TC0CHX , U16_T load_RA , U16_T load_RB , U16_T load_RC)
{
	TC0CHX->RA = load_RA;											//Set TC0 RA
	TC0CHX->RB = load_RB;											//Set TC0 RB
	TC0CHX->RC = load_RC;											//Set TC0 RC
}
/*************************************************************/
//TC0 RA read
//EntryParameter:*TC0CHX
//ReturnValue:NONE
/*************************************************************/ 
/*U32_T TC0_RA_Value(CSP_TC0_T *TC0CHX)
{
	return (TC0CHX->RA);
}*/
/*************************************************************/
//TC0 RB read
//EntryParameter:*TC0CHX
//ReturnValue:NONE
/*************************************************************/ 
/*U32_T TC0_RB_Value(CSP_TC0_T *TC0CHX)
{
	return (TC0CHX->RB);
}*/
/*************************************************************/
//TC0 RC read
//EntryParameter:*TC0CHX
//ReturnValue:NONE
/*************************************************************/ 
/*U32_T TC0_RC_Value(CSP_TC0_T *TC0CHX)
{
	return (TC0CHX->RC);
}*/
/*************************************************************/
//TC0CHX CLK Configure
//EntryParameter:*TC0CHX,TC0_Mclk_Selecte_TypeDef,TC0Clks_Selecte_TypeDef,TC0CHX_CLKI_X,TC0CHX_BURST_SET_X
//*TC0CHX:TC0_0,TC0_1,TC0_2
//TC0_Mclk_Selecte_TypeDef:TC0_Mclk_Selecte_Pclk,TC0_Mclk_Selecte_HFOSC
//TC0Clks_Selecte_TypeDef:TC0Clks_MCLK_DIV1,TC0Clks_MCLK_DIV4,TC0Clks_MCLK_DIV32,TC0Clks_MCLK_DIV128,TC0Clks_MCLK_DIV1024,
//						  TC0Clks_XC0,TC0Clks_XC1,TC0Clks_XC2
//TC0CHX_CLKI_X:TC0CHX_CLKI_0,TC0CHX_CLKI_1
//TC0CHX_BURST_SET_X:TC0CHX_BURST_SET_None,TC0CHX_BURST_SET_XC0,TC0CHX_BURST_SET_XC1,TC0CHX_BURST_SET_XC2
//ReturnValue:NONE
/*************************************************************/
void TC0CHX_CLK_Configure(CSP_TC0_T *TC0CHX , TC0_Mclk_Selecte_TypeDef TC0_Mclk_Selecte_X , TC0Clks_Selecte_TypeDef TC0Clks_Selecte_X ,
						TC0CHX_CLKI_SET_TypeDef TC0CHX_CLKI_X , TC0CHX_BURST_SET_TypeDef TC0CHX_BURST_SET_X)
{
	TC0CHX->MR=TC0CHX->MR&0XFFFFFFC0;
	TC0CHX->MR|=TC0Clks_Selecte_X|TC0CHX_CLKI_X|TC0CHX_BURST_SET_X;
	TC0->BMR=TC0->BMR&0xFFFFFEFF;
	TC0->BMR|=TC0_Mclk_Selecte_X;								//MCLK选择PCLK或者96MHz		
	if(TC0_Mclk_Selecte_X==TC0_Mclk_Selecte_HFOSC)				//若选择96MHz需要增加配置
	{
		SYSCON->CLCR|=(0X01<<20);
		while(!(SYSCON->CLCR&(0x01<<21)));
	}
}
/*************************************************************/
//外部时钟XC0~XC2源选择
//EntryParameter:ETRG_XCn_Selected_X,ETRG_XCn_Selected_input
//XCn_Configure:XC0_Configure,XC1_Configure,XC2_Configure
//XCn_Selecte_x:XC0_Selecte_TCLK0,XC0_Selecte_TIOA1,XC0_Selecte_TIOA2,
//				XC1_Selecte_TCLK1,XC1_Selecte_TIOA0,XC1_Selecte_TIOA2,
//				XC2_Selecte_TCLK2,XC2_Selecte_TIOA0,XC2_Selecte_TIOA1,
//ReturnValue:NONE
/*************************************************************/ 
void TC0CHX_XCn_Configure(XCn_Configure_TypeDef XCn_Configure , XCn_Selecte_TypeDef XCn_Selecte_x)
{
	if(XCn_Configure==XC0_Configure)
	{
		TC0->BMR=TC0->BMR&0xFFFFFFFC;
		TC0->BMR|=XCn_Selecte_x;
	}	
	else if(XCn_Configure==XC1_Configure)
	{
		TC0->BMR=TC0->BMR&0xFFFFFFF3;
		TC0->BMR|=XCn_Selecte_x;
	}
	else if(XCn_Configure==XC2_Configure)
	{
		TC0->BMR=TC0->BMR&0xFFFFFFCF;
		TC0->BMR|=XCn_Selecte_x;
	}
}
/*************************************************************/
//TC0CHX Count Configure
//EntryParameter:*TC0CHX,
//CPC_Reload_CMD:CPC_Reload_DISABLE,CPC_Reload_ENABLE
//ReturnValue:NONE
/*************************************************************/ 
void TC0CHX_COUNT_Configure(CSP_TC0_T *TC0CHX , CPC_TRG_CMD_TypeDef CPC_Reload_CMD)
{
	TC0CHX->MR|=CPC_Reload_CMD;
}
/*************************************************************/
//TC0 PWM Configure
//EntryParameter:*TC0CHX,CPC_STOP_CMD,CPC_DisCountClk_CMD,EEVT_Reload_CMD,EEVT_Reload_CMD,EEVT_SET_X,TIOA_SWTRG_OutPutX,TIOA_EEVT_OutPutX,TIOA_CPA_OutPutX,TIOA_CPC_OutPutX
//*TC0CHX:TC0_0,TC0_1,TC0_2
//CPC_STOP_CMD:CPC_STOP_DISABLE,CPC_STOP_ENABLE
//CPC_DisCountClk_CMD:CPC_DisCountClk_DISABLE,CPC_DisCountClk_ENABLE
//CPC_Reload_CMD:CPC_Reload_DISABLE,CPC_Reload_ENABLE
//EEVT_Reload_CMD:EEVT_Reload_ENABLE,EEVT_Reload_DISABLE
//EEVT_SET_X:EEVT_TIOB_NONE,EEVT_TIOB_Rise,EEVT_TIOB_Fall,EEVT_TIOB_Rise_Fall
//           EEVT_XC0_NONE,EEVT_XC0_Rise,EEVT_XC0_Fall,EEVT_XC0_Rise_Fall
//           EEVT_XC1_NONE,EEVT_XC1_Rise,EEVT_XC1_Fall,EEVT_XC1_Rise_Fall
//           EEVT_XC2_NONE,EEVT_XC2_Rise,EEVT_XC2_Fall,EEVT_XC2_Rise_Fall
//TIOA_SWTRG_OutPutX:TIOA_SWTRG_OutPut_NoChange,TIOA_SWTRG_OutPut_High,TIOA_SWTRG_OutPut_Low,TIOA_SWTRG_OutPut_Negate
//TIOA_EEVT_OutPutX:TIOA_EEVT_OutPut_NoChange,TIOA_EEVT_OutPut_High,TIOA_EEVT_OutPut_Low,TIOA_EEVT_OutPut_Negate
//TIOA_CPA_OutPutX:TIOA_CPA_OutPut_NoChange,TIOA_CPA_OutPut_High,TIOA_CPA_OutPut_Low,TIOA_CPA_OutPut_Negate
//TIOA_CPC_OutPutX:TIOA_CPC_OutPut_NoChange,TIOA_CPC_OutPut_High,TIOA_CPC_OutPut_Low,TIOA_CPC_OutPut_Negate
//TIOB_SWTRG_OutPutX:TIOB_SWTRG_OutPut_NoChange,TIOB_SWTRG_OutPut_High,TIOB_SWTRG_OutPut_Low,TIOB_SWTRG_OutPut_Negate
//TIOB_EEVT_OutPutX:TIOB_EEVT_OutPut_NoChange,TIOB_EEVT_OutPut_High,TIOB_EEVT_OutPut_Low,TIOB_EEVT_OutPut_Negate
//TIOB_CPB_OutPutX:TIOB_CPB_OutPut_NoChange,TIOB_CPB_OutPut_High,TIOB_CPB_OutPut_Low,TIOB_CPB_OutPut_Negate
//TIOB_CPC_OutPutX:TIOB_CPC_OutPut_NoChange,TIOB_CPC_OutPut_High,TIOB_CPC_OutPut_Low,TIOB_CPC_OutPut_Negate
//ReturnValue:NONE
/*************************************************************/ 
void TC0CHX_PWM_Configure(CSP_TC0_T *TC0CHX , CPC_STOP_CMD_TypeDef CPC_STOP_CMD , CPC_DisCountClk_CMD_TypeDef CPC_DisCountClk_CMD , CPC_TRG_CMD_TypeDef CPC_Reload_CMD , ENETRG_CMD_TypeDef EEVT_Reload_CMD , EEVT_SET_TypeDef EEVT_SET_X ,
						 TIOA_SWTRG_OutPutX_TypeDef TIOA_SWTRG_OutPutX , TIOA_EEVT_OutPutX_TypeDef TIOA_EEVT_OutPutX , TIOA_CPA_OutPutX_TypeDef TIOA_CPA_OutPutX , TIOA_CPC_OutPutX_TypeDef TIOA_CPC_OutPutX ,
						 TIOB_SWTRG_OutPutX_TypeDef TIOB_SWTRG_OutPutX , TIOB_EEVT_OutPutX_TypeDef TIOB_EEVT_OutPutX , TIOB_CPB_OutPutX_TypeDef TIOB_CPB_OutPutX , TIOB_CPC_OutPutX_TypeDef TIOB_CPC_OutPutX)
{
	TC0CHX->MR=TC0CHX->MR&0X0000003F;
	TC0CHX->MR|=(0X01<<15)|CPC_STOP_CMD|CPC_DisCountClk_CMD|CPC_Reload_CMD|TIOA_SWTRG_OutPutX|TIOA_EEVT_OutPutX|TIOA_CPA_OutPutX|TIOA_CPC_OutPutX
					|TIOB_SWTRG_OutPutX|TIOB_EEVT_OutPutX|TIOB_CPB_OutPutX|TIOB_CPC_OutPutX;
	if(EEVT_Reload_CMD==EEVT_Reload_ENABLE)
	{
		TC0CHX->MR|=(0x00<<12);
	}
	else
	{
		TC0CHX->MR|=(0x01<<12);
	}
	if(EEVT_SET_X==EEVT_TIOB_NONE)
	{
		TC0CHX->MR|=(0x00<<10)|(0x00<<8);
	}
	else if(EEVT_SET_X==EEVT_TIOB_Rise)
	{
		TC0CHX->MR|=(0x00<<10)|(0x01<<8);
	}
	else if(EEVT_SET_X==EEVT_TIOB_Fall)
	{
		TC0CHX->MR|=(0x00<<10)|(0x02<<8);
	}
	else if(EEVT_SET_X==EEVT_TIOB_Rise_Fall)
	{
		TC0CHX->MR|=(0x00<<10)|(0x03<<8);
	}
	else if(EEVT_SET_X==EEVT_XC0_NONE)
	{
		TC0CHX->MR|=(0x01<<10)|(0x00<<8);
	}
	else if(EEVT_SET_X==EEVT_XC0_Rise)
	{
		TC0CHX->MR|=(0x01<<10)|(0x01<<8);
	}
	else if(EEVT_SET_X==EEVT_XC0_Fall)
	{
		TC0CHX->MR|=(0x01<<10)|(0x02<<8);
	}
	else if(EEVT_SET_X==EEVT_XC0_Rise_Fall)
	{
		TC0CHX->MR|=(0x01<<10)|(0x03<<8);
	}
	else if(EEVT_SET_X==EEVT_XC1_NONE)
	{
		TC0CHX->MR|=(0x02<<10)|(0x00<<8);
	}
	else if(EEVT_SET_X==EEVT_XC1_Rise)
	{
		TC0CHX->MR|=(0x02<<10)|(0x01<<8);
	}
	else if(EEVT_SET_X==EEVT_XC1_Fall)
	{
		TC0CHX->MR|=(0x02<<10)|(0x02<<8);
	}
	else if(EEVT_SET_X==EEVT_XC1_Rise_Fall)
	{
		TC0CHX->MR|=(0x02<<10)|(0x03<<8);
	}
	else if(EEVT_SET_X==EEVT_XC2_NONE)
	{
		TC0CHX->MR|=(0x03<<10)|(0x00<<8);
	}
	else if(EEVT_SET_X==EEVT_XC2_Rise)
	{
		TC0CHX->MR|=(0x03<<10)|(0x01<<8);
	}
	else if(EEVT_SET_X==EEVT_XC2_Fall)
	{
		TC0CHX->MR|=(0x03<<10)|(0x02<<8);
	}
	else if(EEVT_SET_X==EEVT_XC2_Rise_Fall)
	{
		TC0CHX->MR|=(0x03<<10)|(0x03<<8);
	}
}
/*************************************************************/
//TC0CHX Capture Configure
//EntryParameter:*TC0CHX,CPC_TRG_CMD,LDB_STOP_CMD_X,LDB_DIS_CMD_X,ABETRG_SET_X,LDRA_SET_X,LDRB_SET_X
//*TC0CHX:TC0_0,TC0_1,TC0_2
//CPC_Reload_CMD:CPC_Reload_DISABLE,CPC_Reload_ENABLE
//LDB_STOP_CMD_X:LDB_STOP_DISABLE,LDB_STOP_ENABLE
//LDB_DIS_CMD_X:LDB_DisCountClk_DISABLE,LDB_DisCountClk_ENABLE
//ABETRG_SET_X:ABETRG_TIOA_NONE,ABETRG_TIOA_Rise,ABETRG_TIOA_Fall,ABETRG_TIOA_Rise_Fall,ABETRG_TIOB_NONE,ABETRG_TIOB_Rise,ABETRG_TIOB_Fall,ABETRG_TIOB_Rise_Fall
//LDRA_TIOA_SET_X:LDRA_TIOA_NONE,LDRA_TIOA_Rise,LDRA_TIOA_Fall,LDRA_TIOA_Rise_Fall
//LDRB_TIOA_SET_X:LDRB_TIOA_NONE,LDRB_TIOA_Rise,LDRB_TIOA_Fall,LDRB_TIOA_Rise_Fall
//ReturnValue:NONE
/*************************************************************/ 
void TC0CHX_Capture_Configure(CSP_TC0_T *TC0CHX , LDB_STOP_CMD_TypeDef LDB_STOP_CMD_X , LDB_DISCountClk_CMD_TypeDef LDB_DIS_CMD_X , 
		ABETRG_SET_TypeDef ABETRG_SET_X , CPC_TRG_CMD_TypeDef CPC_Reload_CMD , LDRA_TIOA_SET_TypeDef LDRA_TIOA_SET_X , LDRB_TIOA_SET_TypeDef LDRB_TIOA_SET_X)
{
	TC0CHX->MR=TC0CHX->MR&0X0000003F;
	TC0CHX->MR|=CPC_Reload_CMD|LDB_STOP_CMD_X|LDB_DIS_CMD_X|LDRA_TIOA_SET_X|LDRB_TIOA_SET_X;
	if(ABETRG_SET_X==ABETRG_TIOA_NONE)
	{
		TC0CHX->MR|=(0x01<<10)|(0x00<<8);
	}
	else if(ABETRG_SET_X==ABETRG_TIOA_Rise)
	{
		TC0CHX->MR|=(0x01<<10)|(0x01<<8);
	}
	else if(ABETRG_SET_X==ABETRG_TIOA_Fall)
	{
		TC0CHX->MR|=(0x01<<10)|(0x02<<8);
	}
	else if(ABETRG_SET_X==ABETRG_TIOA_Rise_Fall)
	{
		TC0CHX->MR|=(0x01<<10)|(0x03<<8);
	}
	else if(ABETRG_SET_X==ABETRG_TIOB_NONE)
	{
		TC0CHX->MR|=(0x00<<10)|(0x00<<8);
	}
	else if(ABETRG_SET_X==ABETRG_TIOB_Rise)
	{
		TC0CHX->MR|=(0x00<<10)|(0x01<<8);
	}
	else if(ABETRG_SET_X==ABETRG_TIOB_Fall)
	{
		TC0CHX->MR|=(0x00<<10)|(0x02<<8);
	}
	else if(ABETRG_SET_X==ABETRG_TIOB_Rise_Fall)
	{
		TC0CHX->MR|=(0x00<<10)|(0x03<<8);
	}
}
/*************************************************************/
//TC0CHX inturrpt Configure
//EntryParameter:*TC0CHX,TC0CHX_INT_X,NewState
//*TC0CHX:TC0_0,TC0_1,TC0_2
//TC0CHX_INT_X:TC0CHX_INT_COVFS,TC0CHX_INT_LOVRS,TC0CHX_INT_CPAS,TC0CHX_INT_CPBS,
//TC0CHX_INT_CPCS,TC0CHX_INT_LDRAS,TC0CHX_INT_LDRBS,TC0CHX_INT_ETRGS
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void TC0CHX_ConfigInterrupt_CMD(CSP_TC0_T *TC0CHX , TC0CHX_INT_TypeDef TC0CHX_INT_X , FunctionalStatus NewState)
{
	if (NewState != DISABLE)
	{
		TC0CHX->IER  = TC0CHX_INT_X;					//SET
		while(!(TC0CHX->IMR&TC0CHX_INT_X));
	}
	else
	{
		TC0CHX->IDR  =	TC0CHX_INT_X;					//CLR
		while(TC0CHX->IMR&TC0CHX_INT_X);
	}
}
/*************************************************************/
//TC0CH0 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH0_Int_Enable(void)
{
    INTC_ISER_WRITE(TC0_0_INT);    
}
/*************************************************************/
//TC0CH1 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH1_Int_Enable(void)
{
    INTC_ISER_WRITE(TC0_1_INT);    
}

/*************************************************************/
//TC0CH2 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH2_Int_Enable(void)
{
    INTC_ISER_WRITE(TC0_2_INT);    
}
/*************************************************************/
//TC0CH0 Interrupt disable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH0_Int_Disable(void)
{
    INTC_ICER_WRITE(TC0_0_INT);    
}
/*************************************************************/
//TC0CH1 Interrupt disable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH1_Int_Disable(void)
{
    INTC_ICER_WRITE(TC0_1_INT);    
}
/*************************************************************/
//TC0CH2 Interrupt disable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH2_Int_Disable(void)
{
    INTC_ICER_WRITE(TC0_2_INT);    
}
/*************************************************************/
//TC0CH0 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH0_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(TC0_0_INT);    
}
/*************************************************************/
//TC0CH0 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH0_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(TC0_0_INT);    
}
/*************************************************************/
//TC0CH1 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH1_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(TC0_1_INT);    
}
/*************************************************************/
//TC0CH1 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH1_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(TC0_1_INT);    
}
/*************************************************************/
//TC0CH2 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH2_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(TC0_2_INT);    
}
/*************************************************************/
//TC0CH2 Interrupt wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void TC0CH2_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(TC0_2_INT);    
}

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/
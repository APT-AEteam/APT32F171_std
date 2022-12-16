/*
  ******************************************************************************
  * @file    apt32f171_tc0.h
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
#ifndef _apt32f171_tc0_H
#define _apt32f171_tc0_H

/* Includes ------------------------------------------------------------------*/
#include "apt32f171.h"

/******************************************************************************
************************** TC0 Registers Definition ****************************
******************************************************************************/
/** @addtogroup TC0 Registers RST  Value
  * @{
  */
#define TC0_ECR_RST          (0x00000000ul)    /**< ECR reset value       */
#define TC0_DCR_RST	     	 (0x00000000ul)    /**< DCR reset value       */
#define TC0_PMSR_RST	     (0x2AAAAAA0ul)    /**< PMSR reset value      */
#define TC0_CR_RST           (0x00000000ul)    /**< CR reset value        */
#define TC0_MR_RST           (0x00000000ul)    /**< MR reset value        */
#define TC0_CSR_RST          (0x00000000ul)    /**< CSR reset value       */
#define TC0_SR_RST           (0x00000000ul)    /**< SR reset value        */
#define TC0_IER_RST          (0x00000000ul)    /**< IER reset value       */
#define TC0_IDR_RST          (0x00000000ul)    /**< IDR reset value       */
#define TC0_IMR_RST          (0x00000000ul)    /**< IMR Rreset value      */
#define TC0_CV_RST           (0x00000000ul)    /**< CV reset value        */
#define TC0_RA_RST           (0x00000000ul)    /**< RA reset value        */
#define TC0_RB_RST           (0x00000000ul)    /**< RB reset value        */
#define TC0_RC_RST           (0x00000000ul)    /**< RC reset value        */
#define TC0_BCR_RST          (0x00000000ul)    /**< BCR reset value       */
#define TC0_BMR_RST          (0x00000000ul)    /**< BMR reset value       */

/******************************************************************************
* CSR, SR, IER, IDR, IMR : TC0 Status and Interrupt Registers
*                           (capture & Waveform mode)
******************************************************************************/
/* SR register Only                                                          */
#define TC0_CLKSTA          (0x01ul << 8)  /**< Clock Status                */
#define TC0_MTIOA           (0x01ul << 9)  /**< TIOA Mirror                 */
#define TC0_MTIOB           (0x01ul << 10) /**< TIOB Mirror                 */
#define TC0_TIOBS           (0x01ul << 16) /**< TIOB                        */
#define TC0_TIOAS           (0x01ul << 17) /**< TIOA                        */
#define TC0_TCLKS           (0x01ul << 18) /**< TCLK                        */
/**
  * @brief  TC0 IO MODE 
  */  
typedef enum
{
	TC0_IO_CLK0			=	1,
	TC0_IO_CLK1			=	2,
	TC0_IO_CLK2			=	3,
	TC0_IO_ETR			=	4,
	TC0_IO_IO0A			=	5,
	TC0_IO_IO0B			=	6,	
	TC0_IO_IO1A			=	7,
	TC0_IO_IO1B			=	8,
	TC0_IO_IO2A			=	9,
	TC0_IO_IO2B			=	10
}TC0_IO_MODE_TypeDef;

/**
  * @brief  TC0 INT  
  */  
typedef enum
{
	TC0CHX_INT_COVFS           =	(0x01ul << 0),  /**< Counter overflow            */
	TC0CHX_INT_LOVRS           =	(0x01ul << 1),  /**< Load overrun                */
	TC0CHX_INT_CPAS            =	(0x01ul << 2),  /**< Compare Register A          */
	TC0CHX_INT_CPBS            =	(0x01ul << 3),  /**< Compare Register B          */
	TC0CHX_INT_CPCS            =	(0x01ul << 4),  /**< Compare Register C          */
	TC0CHX_INT_LDRAS           =	(0x01ul << 5),  /**< Load Register A             */
	TC0CHX_INT_LDRBS           =	(0x01ul << 6),  /**< Load Register B             */
	TC0CHX_INT_ETRGS           =	(0x01ul << 7)  	/**< External Trigger            */
}TC0CHX_INT_TypeDef;

/**
  * @brief  XCn Selecte
  */  
typedef enum 
{
	XC0_Selecte_TCLK0	=	0X00ul,
	XC0_Selecte_TIOA1	=	0X02ul,
	XC0_Selecte_TIOA2	=	0X03ul,
	
	XC1_Selecte_TCLK1	=	(0X00ul<<2),
	XC1_Selecte_TIOA0	=	(0X02ul<<2),
	XC1_Selecte_TIOA2	=	(0X03ul<<2),
	
	XC2_Selecte_TCLK2	=	(0X00ul<<4),
	XC2_Selecte_TIOA0	=	(0X02ul<<4),
	XC2_Selecte_TIOA1	=	(0X03ul<<4)
}XCn_Selecte_TypeDef;

/**
  * @brief  XCn Configure
  */  
typedef enum
{
	XC0_Configure			=	0x00ul,
	XC1_Configure			=	0x02ul,
	XC2_Configure			=	0x03ul
}XCn_Configure_TypeDef;

/**
  * @brief  TC0 MCLK Selecte
  */  
typedef enum
{
	TC0_Mclk_Selecte_Pclk			=	(0x00ul<<8),
	TC0_Mclk_Selecte_HFOSC			=	(0X01ul<<8)
}TC0_Mclk_Selecte_TypeDef;
/**
  * @brief  TC0CHX CLK Selecte
  */  
typedef enum
{
	TC0Clks_MCLK_DIV1		=	0x00ul,
	TC0Clks_MCLK_DIV4		=	0x01ul,
	TC0Clks_MCLK_DIV32		=	0x02ul,
	TC0Clks_MCLK_DIV128		=	0x03ul,
	TC0Clks_MCLK_DIV1024	=	0x04ul,
	TC0Clks_XC0				=	0x05ul,
	TC0Clks_XC1				=	0x06ul,
	TC0Clks_XC2				=	0x07ul
}TC0Clks_Selecte_TypeDef;

/**
  * @brief  TC0CHX clki set selected 
  */  
typedef enum
{
	TC0CHX_CLKI_0	=	(0X00ul<<3),
	TC0CHX_CLKI_1	=	(0X01ul<<3)
}TC0CHX_CLKI_SET_TypeDef;

/**
  * @brief  TC0CHX BURST set selected 
  */  
typedef enum
{
	TC0CHX_BURST_SET_None	=	(0X00ul<<4),
	TC0CHX_BURST_SET_XC0	=	(0X01ul<<4),
	TC0CHX_BURST_SET_XC1	=	(0X02ul<<4),
	TC0CHX_BURST_SET_XC2	=	(0X03ul<<4)
}TC0CHX_BURST_SET_TypeDef;

/**
  * @brief  TC0CHX CPC stop cmd
  */  
typedef enum
{
	CPC_STOP_DISABLE		=		(0x00<<6),
	CPC_STOP_ENABLE			=		(0x01<<6)
}CPC_STOP_CMD_TypeDef;	
/**
  * @brief  TC0CHX LDB stop cmd
  */  
typedef enum
{
	LDB_STOP_DISABLE		=		(0x00<<6),
	LDB_STOP_ENABLE			=		(0x01<<6)
}LDB_STOP_CMD_TypeDef;
/**
  * @brief  TC0CHX CPC dis count clk cmd
  */  
typedef enum
{
	CPC_DisCountClk_DISABLE	=		(0x00<<7),
	CPC_DisCountClk_ENABLE	=		(0x01<<7)
}CPC_DisCountClk_CMD_TypeDef;	
/**
  * @brief  TC0CHX LDB dis count clk cmd
  */  
typedef enum
{
	LDB_DisCountClk_DISABLE	=		(0x00<<7),
	LDB_DisCountClk_ENABLE	=		(0x01<<7)
}LDB_DISCountClk_CMD_TypeDef;
/**
  * @brief  TC0CHX CPC trg cmd
  */  
typedef enum
{
	CPC_Reload_DISABLE			=		(0x00<<14),
	CPC_Reload_ENABLE			=		(0x01<<14)
}CPC_TRG_CMD_TypeDef;

/**
  * @brief  TC0CHX ENETRG CMD
  */  
typedef enum
{
	EEVT_Reload_ENABLE					=		1,
	EEVT_Reload_DISABLE					=		0
}ENETRG_CMD_TypeDef;
/**
  * @brief  TC0CHX EEVT SET
  */  
typedef enum
{
	EEVT_TIOB_NONE			=		10,
	EEVT_TIOB_Rise			=		11,
	EEVT_TIOB_Fall			=		12,
	EEVT_TIOB_Rise_Fall		=		13,
	EEVT_XC0_NONE			=		14,
	EEVT_XC0_Rise			=		15,
	EEVT_XC0_Fall			=		16,
	EEVT_XC0_Rise_Fall		=		17,
	EEVT_XC1_NONE			=		18,
	EEVT_XC1_Rise			=		19,
	EEVT_XC1_Fall			=		20,
	EEVT_XC1_Rise_Fall		=		21,
	EEVT_XC2_NONE			=		22,
	EEVT_XC2_Rise			=		23,
	EEVT_XC2_Fall			=		24,
	EEVT_XC2_Rise_Fall		=		25
}EEVT_SET_TypeDef;
/**
  * @brief  TC0CHX ABETRG SET
  */  
typedef enum
{
	ABETRG_TIOA_NONE			=		10,
	ABETRG_TIOA_Rise			=		11,
	ABETRG_TIOA_Fall			=		12,
	ABETRG_TIOA_Rise_Fall		=		13,
	ABETRG_TIOB_NONE			=		14,
	ABETRG_TIOB_Rise			=		15,
	ABETRG_TIOB_Fall			=		16,
	ABETRG_TIOB_Rise_Fall		=		17
}ABETRG_SET_TypeDef;
/**
  * @brief  TC0CHX LDRA EVT SET
  */  
typedef enum
{
	LDRA_TIOA_NONE			=		(0X00ul<<16),
	LDRA_TIOA_Rise			=		(0X01ul<<16),
	LDRA_TIOA_Fall			=		(0X02ul<<16),
	LDRA_TIOA_Rise_Fall		=		(0X03ul<<16)
}LDRA_TIOA_SET_TypeDef;
/**
  * @brief  TC0CHX LDRB EVT SET
  */  
typedef enum
{
	LDRB_TIOA_NONE			=		(0X00ul<<18),
	LDRB_TIOA_Rise			=		(0X01ul<<18),
	LDRB_TIOA_Fall			=		(0X02ul<<18),
	LDRB_TIOA_Rise_Fall		=		(0X03ul<<18)
}LDRB_TIOA_SET_TypeDef;
/**
  * @brief  TC0CHX TIOA SWTRG OutPutX
  */  
typedef enum
{
	TIOA_SWTRG_OutPut_NoChange	=	(0x00<<22),
	TIOA_SWTRG_OutPut_High		=	(0x01<<22),
	TIOA_SWTRG_OutPut_Low		=	(0x02<<22),
	TIOA_SWTRG_OutPut_Negate	=	(0x03<<22)
}TIOA_SWTRG_OutPutX_TypeDef;
/**
  * @brief  TC0CHX TIOA EEVT OutPutX
  */  
typedef enum
{
	TIOA_EEVT_OutPut_NoChange	=	(0x00<<20),
	TIOA_EEVT_OutPut_High		=	(0x01<<20),
	TIOA_EEVT_OutPut_Low		=	(0x02<<20),
	TIOA_EEVT_OutPut_Negate		=	(0x03<<20)
}TIOA_EEVT_OutPutX_TypeDef;
/**
  * @brief  TC0CHX TIOA CPA OutPutX
  */  
typedef enum
{
	TIOA_CPA_OutPut_NoChange	=	(0x00<<16),
	TIOA_CPA_OutPut_High		=	(0x01<<16),
	TIOA_CPA_OutPut_Low			=	(0x02<<16),
	TIOA_CPA_OutPut_Negate		=	(0x03<<16)
}TIOA_CPA_OutPutX_TypeDef;
/**
  * @brief  TC0CHX TIOA CPC OutPutX
  */  
typedef enum
{
	TIOA_CPC_OutPut_NoChange	=	(0x00<<18),
	TIOA_CPC_OutPut_High		=	(0x01<<18),
	TIOA_CPC_OutPut_Low			=	(0x02<<18),
	TIOA_CPC_OutPut_Negate		=	(0x03<<18)
}TIOA_CPC_OutPutX_TypeDef;
/**
  * @brief  TC0CHX TIOB SWTRG OutPutX
  */  
typedef enum
{
	TIOB_SWTRG_OutPut_NoChange	=	(0x00<<30),
	TIOB_SWTRG_OutPut_High		=	(0x01<<30),
	TIOB_SWTRG_OutPut_Low		=	(0x02<<30),
	TIOB_SWTRG_OutPut_Negate	=	(0x03<<30)
}TIOB_SWTRG_OutPutX_TypeDef;
/**
  * @brief  TC0CHX TIOB EEVT OutPutX
  */  
typedef enum
{
	TIOB_EEVT_OutPut_NoChange	=	(0x00<<28),
	TIOB_EEVT_OutPut_High		=	(0x01<<28),
	TIOB_EEVT_OutPut_Low		=	(0x02<<28),
	TIOB_EEVT_OutPut_Negate		=	(0x03<<28)
}TIOB_EEVT_OutPutX_TypeDef;
/**
  * @brief  TC0CHX TIOB CPB OutPutX
  */  
typedef enum
{
	TIOB_CPB_OutPut_NoChange	=	(0x00<<24),
	TIOB_CPB_OutPut_High		=	(0x01<<24),
	TIOB_CPB_OutPut_Low			=	(0x02<<24),
	TIOB_CPB_OutPut_Negate		=	(0x03<<24)
}TIOB_CPB_OutPutX_TypeDef;
/**
  * @brief  TC0CHX TIOB CPC OutPutX
  */  
typedef enum
{
	TIOB_CPC_OutPut_NoChange	=	(0x00<<26),
	TIOB_CPC_OutPut_High		=	(0x01<<26),
	TIOB_CPC_OutPut_Low			=	(0x02<<26),
	TIOB_CPC_OutPut_Negate		=	(0x03<<26)
}TIOB_CPC_OutPutX_TypeDef;

/******************************************************************************
********************* TC0 External Functions Declaration **********************
******************************************************************************/
extern void TC0_RESET_VALUE(CSP_TC0_T *TC0CHX);
extern void TC0_IO_Init(TC0_IO_MODE_TypeDef  TC0_IO_MODE_X , U8_T TC0_IO_G );
extern void All_TC0_SoftwareReset(void);
extern void All_TC0_SWTRG(void);
extern void TC0CHX_SWTRG(CSP_TC0_T *TC0CHX);
extern void TC0CHX_SoftwareReset(CSP_TC0_T *TC0CHX);
extern void TC0CHX_CountClk_CMD(CSP_TC0_T *TC0CHX , FunctionalStatus NewState);
extern void TC0CHX_Clk_CMD(CSP_TC0_T *TC0CHX , FunctionalStatus NewState);
extern void TC0CHX_Set_RA_RB_RC(CSP_TC0_T *TC0CHX , U16_T load_RA , U16_T load_RB , U16_T load_RC);
extern void TC0CHX_CLK_Configure(CSP_TC0_T *TC0CHX , TC0_Mclk_Selecte_TypeDef TC0_Mclk_Selecte_X , TC0Clks_Selecte_TypeDef TC0Clks_Selecte_X ,
						TC0CHX_CLKI_SET_TypeDef TC0CHX_CLKI_X , TC0CHX_BURST_SET_TypeDef TC0CHX_BURST_SET_X);
extern void TC0CHX_XCn_Configure(XCn_Configure_TypeDef XCn_Configure , XCn_Selecte_TypeDef XCn_Selecte_x);
extern void TC0CHX_COUNT_Configure(CSP_TC0_T *TC0CHX , CPC_TRG_CMD_TypeDef CPC_Reload_CMD);
extern void TC0CHX_PWM_Configure(CSP_TC0_T *TC0CHX , CPC_STOP_CMD_TypeDef CPC_STOP_CMD , CPC_DisCountClk_CMD_TypeDef CPC_DisCountClk_CMD , CPC_TRG_CMD_TypeDef CPC_Reload_CMD , ENETRG_CMD_TypeDef EEVT_Reload_CMD , EEVT_SET_TypeDef EEVT_SET_X ,
						 TIOA_SWTRG_OutPutX_TypeDef TIOA_SWTRG_OutPutX , TIOA_EEVT_OutPutX_TypeDef TIOA_EEVT_OutPutX , TIOA_CPA_OutPutX_TypeDef TIOA_CPA_OutPutX , TIOA_CPC_OutPutX_TypeDef TIOA_CPC_OutPutX ,
						 TIOB_SWTRG_OutPutX_TypeDef TIOB_SWTRG_OutPutX , TIOB_EEVT_OutPutX_TypeDef TIOB_EEVT_OutPutX , TIOB_CPB_OutPutX_TypeDef TIOB_CPB_OutPutX , TIOB_CPC_OutPutX_TypeDef TIOB_CPC_OutPutX);
extern void TC0CHX_Capture_Configure(CSP_TC0_T *TC0CHX , LDB_STOP_CMD_TypeDef LDB_STOP_CMD_X , LDB_DISCountClk_CMD_TypeDef LDB_DIS_CMD_X , 
		ABETRG_SET_TypeDef ABETRG_SET_X , CPC_TRG_CMD_TypeDef CPC_Reload_CMD , LDRA_TIOA_SET_TypeDef LDRA_TIOA_SET_X , LDRB_TIOA_SET_TypeDef LDRB_TIOA_SET_X);
extern void TC0CHX_ConfigInterrupt_CMD(CSP_TC0_T *TC0CHX , TC0CHX_INT_TypeDef TC0CHX_INT_X , FunctionalStatus NewState);
extern void TC0CH0_Int_Enable(void);
extern void TC0CH1_Int_Enable(void);
extern void TC0CH2_Int_Enable(void);
extern void TC0CH0_Int_Disable(void);
extern void TC0CH1_Int_Disable(void);
extern void TC0CH2_Int_Disable(void);
extern void TC0CH0_Wakeup_Enable(void);
extern void TC0CH0_Wakeup_Disable(void);
extern void TC0CH1_Wakeup_Enable(void);
extern void TC0CH1_Wakeup_Disable(void);
extern void TC0CH2_Wakeup_Enable(void);	
extern void TC0CH2_Wakeup_Disable(void);				

#endif   /**< apt32f172_tc0_TC0_H */

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/
/*
  ******************************************************************************
  * @file    apt32f171_tc1.h
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
#ifndef _apt32f171_tc1_H
#define _apt32f171_tc1_H

/* Includes ------------------------------------------------------------------*/
#include "apt32f171.h"


//--------------------------------------------------------------------------------
//-----------------------------TC1  value enum define----------------------------
//--------------------------------------------------------------------------------
/**
  * @brief  TC1 clock
  */
typedef enum
{
	TC1_FIN_PCLK	=		((CSP_REGISTER_T)0X00),
	TC1_FIN_TCLK	=		((CSP_REGISTER_T)0X01),
	TC1_FIN_EMOSC	=		((CSP_REGISTER_T)0X05),
	TC1_FIN_ISOSC	=		((CSP_REGISTER_T)0X06),
	TC1_FIN_IMOSC	=		((CSP_REGISTER_T)0X07),
	TC1_FIN_CMPOUT0 =		((CSP_REGISTER_T)0X08),
	TC1_FIN_CMPOUT1 =		((CSP_REGISTER_T)0X09),
	TC1_FIN_CMPOUT2 =		((CSP_REGISTER_T)0X0A),
	TC1_FIN_CMPOUT3 =		((CSP_REGISTER_T)0X0B),
	TC1_FIN_CMPOUT4 =		((CSP_REGISTER_T)0X0C),
}TC1_FIN_TypeDef;

/**
  * @brief  TC1 bit selection
  */
typedef enum
{
	Counter_Size_8BIT	=	((CSP_REGISTER_T)0X07),
	Counter_Size_10BIT	=	((CSP_REGISTER_T)0X09),
	Counter_Size_16BIT	=	((CSP_REGISTER_T)0X0F),
	Counter_Size_32BIT	=	((CSP_REGISTER_T)0X1F)
}Counter_Size_TypeDef;

/**
  * @brief  TC1 Control Set
  */
typedef enum
{
	TC1_ControlSet_start_stop		=	((CSP_REGISTER_T)0X01ul<<0),					//Start The Counter
	TC1_ControlSet_UPDATE			=	((CSP_REGISTER_T)0X01ul<<1),					//Update Register Request
	TC1_ControlSet_STOPHOLD			=	((CSP_REGISTER_T)0X01ul<<2),					//Stop Count Hold is Enabled
	TC1_ControlSet_STOPCLEAR		=	((CSP_REGISTER_T)0X01ul<<3),					//Stop Count Hold is Enabled
	TC1_ControlSet_IDLEST			=	((CSP_REGISTER_T)0X01ul<<8),					//IDLE Status Level will be HIGH
	TC1_ControlSet_OUTST			=	((CSP_REGISTER_T)0X01ul<<9),					//Output Status Level will be HIGH
	TC1_ControlSet_KEEP				=	((CSP_REGISTER_T)0X01ul<<10),					//Keep Stop Level is Enabled
	TC1_ControlSet_PWMIM			=	((CSP_REGISTER_T)0X01ul<<11),					//Toggle Operation is Enabled/PWM Operation is Disabled
	TC1_ControlSet_PWMEN			=	((CSP_REGISTER_T)0X01ul<<12),					//TPWM Output is Enabled
	TC1_ControlSet_REPEAT			=	((CSP_REGISTER_T)0X01ul<<13),					//Repeat Mode is Enabled
	TC1_ControlSet_CNTM				=	((CSP_REGISTER_T)0X01ul<<14),					//Continuous Counting Mode is Enabled
	TC1_ControlSet_HWTRIG_OUT		=	((CSP_REGISTER_T)0X01ul<<15),					//Hardware Auto-trigger other module Enabled
	TC1_ControlSet_HWTRIG_IN		=	((CSP_REGISTER_T)0X01ul<<16),					//other module Auto-trigger Hardware Enabled
	TC1_ControlSet_CAPT_F			=	((CSP_REGISTER_T)0X01ul<<17),					//When Falling Edge of External Input Signal is Detected,Current Counter Value is Stored into the Capture Down Register.
	TC1_ControlSet_CAPT_R			=	((CSP_REGISTER_T)0X01ul<<18),					//When Rising Edge of External Input Signal is Detected,Current Counter Value is Stored into the Capture Up Register.
	TC1_ControlSet_CAPT_TCAP		=	((CSP_REGISTER_T)0X00ul<<19),					//Capture input source is TCAP
	TC1_ControlSet_CAPT_CMPOUT0		=	((CSP_REGISTER_T)0X03ul<<19),					//Capture input source is CMPOUT0
	TC1_ControlSet_CAPT_CMPOUT1		=	((CSP_REGISTER_T)0X04ul<<19),					//Capture input source is CMPOUT1
	TC1_ControlSet_CAPT_CMPOUT2		=	((CSP_REGISTER_T)0X05ul<<19),					//Capture input source is CMPOUT2
	TC1_ControlSet_CAPT_CMPOUT3		=	((CSP_REGISTER_T)0X06ul<<19),					//Capture input source is CMPOUT3
	TC1_ControlSet_CAPT_CMPOUT4		=	((CSP_REGISTER_T)0X07ul<<19),					//Capture input source is CMPOUT4
	TC1_ControlSet_PWME0			=	((CSP_REGISTER_T)0X01ul<<24),			
	TC1_ControlSet_PWME1			=	((CSP_REGISTER_T)0X02ul<<24),
	TC1_ControlSet_PWME2			=	((CSP_REGISTER_T)0X04ul<<24),
	TC1_ControlSet_PWME3			=	((CSP_REGISTER_T)0X08ul<<24),	
	TC1_ControlSet_PWME4			=	((CSP_REGISTER_T)0X10ul<<24),	
	TC1_ControlSet_PWME5			=	((CSP_REGISTER_T)0X20ul<<24)
//	PWM Extension Bits			
//DUTY(%)=(PULSE/PERIOD+E/(PERIOD*64))*100%
//PWMEX	“Stretched” Cycle Number
//PWMEX0	32		(E=1)		
//PWMEX1	16, 48
//PWMEX2	8, 24, 40, 56
//PWMEX3	4, 12, 20, 28, 36 , 44, 52, 60
//PWMEX4	2, 6, 10, 14, 18, 22, 26, 30, 34, 38, 42, 46, 50, 54, 58, 62
//PWMEX5	1, 3, 5, 7, 9,11,13,15,17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63
}TC1_ControlSet_TypeDef;
  
/**
  * @brief  TC1 INT MASK SET/CLR  Set
  */
typedef enum
{
	TC1_STARTI     	=	((CSP_REGISTER_T)(0x01ul << 0)),      /**< Overflow Interrupt     */
	TC1_STOPI    	=	((CSP_REGISTER_T)(0x01ul << 1)),      /**< Match Interrupt        */
	TC1_PSTARTI    	=	((CSP_REGISTER_T)(0x01ul << 2)),      /**< Overflow Interrupt     */
	TC1_PENDI    	=	((CSP_REGISTER_T)(0x01ul << 3)),      /**< Match Interrupt        */
	TC1_MATI   		=	((CSP_REGISTER_T)(0x01ul << 4)),      /**< Overflow Interrupt     */
	TC1_OVFI 	   	=	((CSP_REGISTER_T)(0x01ul << 5)),      /**< Match Interrupt        */
	TC1_CAPTI    	=	((CSP_REGISTER_T)(0x01ul << 6))       /**< Overflow Interrupt     */
}TC1_IMSCR_TypeDef;  
  
/**
  * @brief  TC1 IO INIT MODE
  */  
typedef enum
{  
	TC1_IO_TXOUT	=		1,
	TC1_IO_TCLK		=		2,
	TC1_IO_TCAPX	=		3
}TC1_IO_MODE_TypeDef;  
  
/******************************************************************************
************************** TC1 Registers Definition ****************************
******************************************************************************/
/** @addtogroup TC1 Registers RST  Value
  * @{
  */
#define TC1_IDR_RST          (0x0011000Aul)    /**< IDR reset value         */
#define TC1_CSSR_RST	     (0x00000000ul)    /**< CSSR reset value        */
#define TC1_CEDR_RST	     (0x00000000ul)    /**< CEDR reset value        */
#define TC1_SRR_RST          (0x00000000ul)    /**< SRR reset value         */
#define TC1_CSR_RST          (0x00000000ul)    /**< CSR reset value         */
#define TC1_CCR_RST          (0x00000000ul)    /**< CCR reset value         */
#define TC1_SR_RST           (0x00000002ul)    /**< SR reset value          */
#define TC1_IMSCR_RST        (0x00000000ul)    /**< IMSCR reset value       */
#define TC1_RISR_RST         (0x00000000ul)    /**< RISR reset value        */
#define TC1_MISR_RST         (0x00000000ul)    /**< MIS Rreset value        */
#define TC1_ICR_RST          (0x00000000ul)    /**< ICR reset value         */
#define TC1_CDR_RST          (0x00000000ul)    /**< SR reset value          */
#define TC1_CSMR_RST         (0x0000001Ful)    /**< SR reset value          */
#define TC1_PRDR_RST         (0x00000000ul)    /**< DR reset value          */
#define TC1_PULR_RST         (0x00000000ul)    /**< SR reset value          */
#define TC1_CUCR_RST         (0x00000000ul)    /**< SR reset value          */
#define TC1_CDCR_RST         (0x00000000ul)    /**< SR reset value          */
#define TC1_CVR_RST          (0x00000000ul)    /**< CVR reset value         */

// CEDR : Clock Enable/Disable Register
#define TC1_CLKEN          	(0x01ul << 0)         		/**< IP Clock           */
#define TC1_DBGEN          	(0x01ul << 31)        		/**< Debug Mode Enable  */

//SRR : Software Reset Register
#define TC1_SWRST          	(0x01ul << 0)        	 	/**< Software Reset     */

// SR : Status Register
#define TC1_CLKENS     		(0x01ul << 30)	 			/**< tc16 Clock Enable   */
#define TC1_CLKSRCS			(0x01ul << 31)	 			/**< tc16 DBGEN          */

/******************************************************************************
********************** TC1 External Functions Declaration **********************
******************************************************************************/
extern void TC1_Init(void);
extern void TC1_RESET_VALUE(void);
extern void TC1_Configure(TC1_FIN_TypeDef  TC1_FIN_X, int  TC1_DIVN , int  TC1_DINM , Counter_Size_TypeDef  Counter_Size_X  , U32_T loadCounter_PRDR , U32_T loadCounter_PULR);
extern void TC1_ControlSet_Configure (TC1_ControlSet_TypeDef TC1_ControlSet_x , FunctionalStatus NewState);
extern void TC1_ConfigInterrupt_CMD(TC1_IMSCR_TypeDef TC1_IMSCR_X , FunctionalStatus newState);
extern void TC1_CMD(FunctionalStatus newState);
extern void TC1_SoftwareReset(void);
extern void TC1_start_stop(void);
//extern U32_T TC1_Counter_Value(void);
//extern U32_T TC1_Counter_PRDR_Value(void);
//extern U32_T TC1_CaptureUp_Count_Value(void);
//extern U32_T TC1_CaptureDown_Count_Value(void);
extern void TC1_Int_Enable(void);
extern void TC1_Int_Disable(void);
extern void TC1_IO_Init(TC1_IO_MODE_TypeDef  TC1_IO_MODE_X , U8_T TC1_IO_G );
extern void TC1_Start(void);
extern void TC1_Stop(void);
extern void TC1_Set_Period(U32_T loadCounter_PRDR , U32_T loadCounter_PULR);

#endif   /**< apt32f172_tc1_TC1_H */

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/

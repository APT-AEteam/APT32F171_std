/*
  ******************************************************************************
  * @file    apt32f171_tc2.h
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
#ifndef _apt32f171_tc2_H
#define _apt32f171_tc2_H

/* Includes ------------------------------------------------------------------*/
#include "apt32f171.h"
 
/******************************************************************************
************************** TC2 Registers Definition ****************************
******************************************************************************/
 /** @addtogroup TC2 Registers RST  Value
  * @{
  */
  #define 	TC2_IDR_RST          	(0x0041000Aul)      /**< IDR reset value      */
  #define 	TC2_CEDR_RST		 	(0x00000000ul)		/**< CEDR reset value     */	
  #define 	TC2_RSSR_RST			(0x00000000ul)		/**< RSSR reset value     */	
  #define 	TC2_IMSCR_RST			(0x00000000ul)		/**< IMSCR reset value    */	
  #define 	TC2_RISR_RST			(0x00000000ul)		/**< RISR reset value     */	
  #define 	TC2_MISR_RST			(0x00000000ul)		/**< MISR reset value     */	
  #define 	TC2_ICR_RST				(0x00000000ul)		/**< ICR reset value      */	
  #define 	TC2_SR_RST				(0x00000000ul)		/**< SR reset value       */	
  #define 	TC2_MR_RST				(0x00000000ul)		/**< MR reset value       */	
  #define	TC2_CNTBR_RST			(0x00000000ul)		/**< CNTBR reset value    */
  #define 	TC2_CNTR_RST			(0x00000000ul)		/**< CNTR reset value     */
  #define 	TC2_CDR_RST				(0x00000000ul)		/**< CDR reset value      */
  #define 	TC2_PCNTR_RST			(0x00000000ul)		/**< PCNTR reset value    */
  #define 	TC2_CRR_RST				(0x00000000ul)		/**< CRR reset value      */
  #define 	TC2_CMR_RST				(0x00000000ul)		/**< CMR reset value      */
  #define 	TC2_CIMSCR_RST			(0x00000000ul)		/**< CIMSCR reset value   */	
  #define 	TC2_CRISR_RST			(0x00000000ul)		/**< CRISR reset value    */	
  #define 	TC2_CMISR_RST			(0x00000000ul)		/**< CMISR reset value    */
  #define 	TC2_CICR_RST			(0x00000000ul)		/**< CICR reset value     */	
  #define 	TC2_CAPSR_RST			(0x00000000ul)		/**< CAPSR reset value    */
  #define 	TC2_CC0R_RST			(0x00000000ul)		/**< CC0R reset value     */
  #define 	TC2_CC1R_RST			(0x00000000ul)		/**< CC1R reset value     */
/**
  * @brief  TC2 MINT  
  */  
typedef enum
{
	TC2_IO_CAP0	=	0,
	TC2_IO_CAP1	=	1
}TC2_IO_MODE_TypeDef;  

/**
  * @brief  TC2 MINT  
  */  
typedef enum
{
	TC2_STARTI   =     (0x01ul << 0),      /**< ST Start Interrupt       */
	TC2_STOPI    =     (0x01ul << 1),      /**< ST Stop Interrupt        */
	TC2_PENDI    =     (0x01ul << 2)      	/**< ST PEND Interrupt        */
}TC2_MINT_TypeDef;

/**
  * @brief  TC2 CINT  
  */  
typedef enum
{
	TC2_CC0RI   =      (0x01ul << 0),      /**< ST channel 0 R interrupt */
	TC2_CC1RI   =      (0x01ul << 1),      /**< ST channel 1 R interrupt */
	TC2_Match0  =      (0x01ul << 0),      /**< ST channel Match0 R interrupt */
	TC2_Match1  =      (0x01ul << 1),      /**< ST channel Match1 R interrupt */
	TC2_CC0FI   =      (0x01ul << 8),      /**< ST channel 0 F interrupt */
	TC2_CC1FI   =      (0x01ul << 9)       /**< ST channel 1 F interrupt */
}TC2_CINT_TypeDef;
 
/**
  * @brief  TC2 Count mode  
  */  
typedef enum
{
	TC2_Count_mode_Continue	=	(0x00ul << 24),
	TC2_Count_mode_Oneshot	=	(0x01ul << 24)
}TC2_Count_mode_TypeDef; 

/**
  * @brief  TC2 Count mode  
  */  
typedef enum
{
	TC2_Count_STOPTYPE_AutoLoad		=	(0x00ul << 9),
	TC2_Count_STOPTYPE_StopConmand	=	(0x01ul << 9)
}TC2_Count_STOPTYPE_TypeDef; 

/**
  * @brief  TC2 COSR Capture Triggle SET
  */  
typedef enum
{
	TC2_C0SR_CaptureRise		=	(0x01ul<<16) ,
	TC2_C0SR_CaptureFall		=	(0x02ul<<16) ,
	TC2_C0SR_CaptureRiseFall	=	(0x03ul<<16) 
}TC2_C0SR_TypeDef;

/**
  * @brief  TC2 C1SR Capture Triggle SET
  */  
typedef enum
{
	TC2_C1SR_CaptureRise		=	(0x01ul << 18),
	TC2_C1SR_CaptureFall		=	(0x02ul << 18),
	TC2_C1SR_CaptureRiseFall	=	(0x03ul << 18)
}TC2_C1SR_TypeDef;

/**
  * @brief  TC2 CM0 mode set
  */  
typedef enum
{
	TC2_CM0_Mode_Capture	=	0x01ul,
	TC2_CM0_Mode_Match	=	0x00ul
}TC2_CM0_Mode_TypeDef;

/**
  * @brief  TC2 CM1 mode set
  */  
typedef enum
{
	TC2_CM1_Mode_Capture	=	(0x01ul<<2),
	TC2_CM1_Mode_Match	=	(0x00ul<<2)
}TC2_CM1_Mode_TypeDef;
/******************************************************************************
******************** TC2 External Functions Declaration *********************
******************************************************************************/  
extern void TC2_RESET_VALUE(void);
extern void TC2_IO_Init(TC2_IO_MODE_TypeDef  TC2_IO_MODE_X , U8_T TC2_IO_G );
extern void TC2_Clk_CMD(FunctionalStatus NewState);
extern void TC2_Softreset(void);
extern void TC2_Start(void);
extern void TC2_stop(void);
extern void TC2_Channel0_CMD(FunctionalStatus NewState);
extern void TC2_Channel1_CMD(FunctionalStatus NewState);
extern void TC2_MINT_CMD(TC2_MINT_TypeDef TC2_MINT_X , FunctionalStatus NewState);
extern void TC2_CINT_CMD(TC2_CINT_TypeDef TC2_CINT_X , FunctionalStatus NewState);
extern void TC2_Configure(TC2_Count_mode_TypeDef TC2_Count_mode_X , TC2_Count_STOPTYPE_TypeDef TC2_Count_STOPTYPE
					 , TC2_CM0_Mode_TypeDef TC2_CM0_Mode_X , TC2_CM1_Mode_TypeDef TC2_CM1_Mode_X , int TC2_DIVM , int TC2_DIVN);
extern void TC2_Channel0_Capture_LoadMode_set(TC2_C0SR_TypeDef TC2_C0SR_X);
extern void TC2_Channel1_Capture_LoadMode_set(TC2_C1SR_TypeDef TC2_C1SR_X);
extern void TC2_CNR_CC0_CC1_Load(U16_T TC2_CNTR, U16_T TC2_CC0R , U16_T TC2_CC1R);
extern void TC2_Int_Enable(void);
extern void TC2_Int_Disable(void);
extern void TC2_Wakeup_Enable(void);
extern void TC2_Wakeup_Disable(void);					 

#endif   /**< apt32f172_tc2_TC2_H */

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/

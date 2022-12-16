/*
  ******************************************************************************
  * @file    apt32f171_cmp.h
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
#ifndef _apt32f171_cmp_H
#define _apt32f171_cmp_H

/* Includes ------------------------------------------------------------------*/
#include "apt32f171.h"


/******************************************************************************
************************** CMP Registers Definition ****************************
******************************************************************************/
#define		 CMP_CEDR_RST     			((CSP_REGISTER_T)0x00000000)		/**< CMP_CEDR  reset value  */  //cl
#define		 CMP_CR0_RST     			((CSP_REGISTER_T)0x00000000)		/**< CMP_CR0  reset value  	*/
#define		 CMP_CR1_RST     			((CSP_REGISTER_T)0x00000000)		/**< CMP_CR1  reset value  	*/
#define		 CMP_CR2_RST     			((CSP_REGISTER_T)0x00000000)		/**< CMP_CR2  reset value  	*/
#define		 CMP_CR3_RST     			((CSP_REGISTER_T)0x00000000)		/**< CMP_CR3  reset value  	*/
#define		 CMP_CR4_RST     			((CSP_REGISTER_T)0x00000000)		/**< CMP_CR4  reset value  	*/
#define		 CMP_CR5_RST     			((CSP_REGISTER_T)0x00000000)		/**< CMP_CR5  reset value  	*/
#define		 CMP_FLTCR0_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMP_FLTCR0  reset value*/
#define		 CMP_FLTCR1_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMP_FLTCR1  reset value*/
#define		 CMP_FLTCR2_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMP_FLTCR2  reset value*/
#define		 CMP_FLTCR3_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMP_FLTCR3  reset value*/
#define		 CMP_FLTCR4_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMP_FLTCR4  reset value*/
#define		 CMP_FLTCR5_RST     		((CSP_REGISTER_T)0x00000000)		/**< CMP_FLTCR5  reset value*/
#define		 CMP_WCNT0_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_WCNT0   reset value*/
#define		 CMP_WCNT1_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_WCNT1   reset value*/
#define		 CMP_WCNT2_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_WCNT2   reset value*/
#define		 CMP_INPCR0_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_INPCR0  reset value*/
#define		 CMP_INPCR1_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_INPCR1  reset value*/
#define		 CMP_INPCR2_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_INPCR2  reset value*/
#define		 CMP_INPCR3_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_INPCR3  reset value*/
#define		 CMP_INPCR4_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_INPCR4  reset value*/
#define		 CMP_INPCR5_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_INPCR5  reset value*/
#define		 CMP_TRGCR_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_TRGCR   reset value*/	
#define		 CMP_IMCR_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_IMCR    reset value*/	
#define		 CMP_RISR_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_RISR    reset value*/	
#define		 CMP_MISR_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_MISR    reset value*/	
#define		 CMP_ICR_RST				((CSP_REGISTER_T)0x00000000)		/**< CMP_ICR     reset value*/	
#define      CMP_VOLSEL_RST             ((CSP_REGISTER_T)0x00000000)        /**< CMP_VOLSEL  reset value*/
/******************************************************************************
***************************** CMP Registers mask ***************************
******************************************************************************/

/******************************************************************************
************************* CMP Registers reset value ************************
******************************************************************************/
 /**
  * @brief CMP IO mode 
  */
typedef enum
{  
	CPINP0	=	0,
	CPINP1	=	1,
	CPINP2	=	2,
	CPINP3	=	3,
	CPINP4	=	4,
	CPINP5	=	5,
	CPINP6	=	6,
	CPINP7	=	7,
	CPINP8	=	8,
	CPINP9	=	9,
	CPINN0	=	10,
	CPINN1	=	11,
	CPINN2	=	12,
	CPINN3	=	13,
	CPINN4	=	14,
	CP0_OUT	=	15,
	CP1_OUT	=	16,
	CP2_OUT	=	17,
	CP3_OUT	=	18,
	CP4_OUT	=	19,
	CP5_OUT	=	20
}CMP_IO_MODE_TypeDef;
 /**
  * @brief CMP INT set
  */
typedef enum
{
	EDGEDET0	=		((CSP_REGISTER_T)0x00000001),
	EDGEDET1	=		((CSP_REGISTER_T)0x00000002),
	EDGEDET2	=		((CSP_REGISTER_T)0x00000004),
	EDGEDET3	=		((CSP_REGISTER_T)0x00000008),
	EDGEDET4	=		((CSP_REGISTER_T)0x00000010),
	EDGEDET5	=		((CSP_REGISTER_T)0x00000020)
}CMP_INT_TypeDef;

 /**
  * @brief CMPX selecte
  */
typedef enum
{
	CMP0_NUM	=		0,
	CMP1_NUM	=		1,
	CMP2_NUM	=		2,
	CMP3_NUM	=		3,
	CMP4_NUM	=		4,
	CMP5_NUM	=		5
}CMPx_selecte_TypeDef;



typedef enum
{
	VOL_REF_0_7V = 0,
	VOL_REF_1V = 1
}CMP_VOL_REF_TypeDef;
 /**
  * @brief CMPX CR config
  */
typedef enum
{
	DISCMPEN			=	((CSP_REGISTER_T)0X00),
	ENCMPEN				=	((CSP_REGISTER_T)0X01)
}CMPx_CMPEN_TypeDef;	
typedef enum
{	
	NHYST_0mv			=	((CSP_REGISTER_T)0X00<<1),
	NHYST_10mv			=	((CSP_REGISTER_T)0X01<<1),
	NHYST_20mv			=	((CSP_REGISTER_T)0X02<<1),
	NHYST_35mv			=	((CSP_REGISTER_T)0X03<<1),
	NHYST_45mv			=	((CSP_REGISTER_T)0X04<<1),
	NHYST_60mv			=	((CSP_REGISTER_T)0X05<<1),
	NHYST_80mv			=	((CSP_REGISTER_T)0X06<<1),
	NHYST_100mv			=	((CSP_REGISTER_T)0X07<<1)
	
}CMPx_NHYST_TypeDef;
typedef enum
{
	PHYST_0mv			=	((CSP_REGISTER_T)0X00<<4),
	PHYST_10mv			=	((CSP_REGISTER_T)0X01<<4),
	PHYST_20mv			=	((CSP_REGISTER_T)0X02<<4),
	PHYST_35mv			=	((CSP_REGISTER_T)0X03<<4),
	PHYST_45mv			=	((CSP_REGISTER_T)0X04<<4),
	PHYST_60mv			=	((CSP_REGISTER_T)0X05<<4),
	PHYST_80mv			=	((CSP_REGISTER_T)0X06<<4),
	PHYST_100mv			=	((CSP_REGISTER_T)0X07<<4)
}CMPx_PHYST_TypeDef;
typedef enum
{
	POLARITY_0			=	((CSP_REGISTER_T)0X00<<7),
	POLARITY_1			=	((CSP_REGISTER_T)0X01<<7),
}CMPx_POLARITY_TypeDef;
typedef enum
{
	EVE_SEL_fall		=	((CSP_REGISTER_T)0X00<<8),
	EVE_SEL_rise		=	((CSP_REGISTER_T)0X01<<8),
	EVE_SEL_fall_rise	=	((CSP_REGISTER_T)0X02<<8),
}CMPx_EVE_SEL_TypeDef;
typedef enum
{
	DIS_FLTEN			=	((CSP_REGISTER_T)0X00<<10),
	EN_FLTEN			=	((CSP_REGISTER_T)0X01<<10),
}CMPx_FLTEN_TypeDef;
typedef enum
{
	CPOS_0				=	((CSP_REGISTER_T)0X00<<15),
	CPOS_1				=	((CSP_REGISTER_T)0X01<<15)
}CMPx_CPOS_TypeDef;

 /**
  * @brief CMPX FLTCRX Config
  */
typedef enum
{
	CMPX_CLK_PCLK		=	((CSP_REGISTER_T)0X00),
	CMPX_CLK_TC1_Pend	=	((CSP_REGISTER_T)0X01),
	CMPX_CLK_TC2_Pend	=	((CSP_REGISTER_T)0X02)
}CMPX_CLK_Selecte_TypeDef;

 /**
  * @brief CMPX WCNTX Config
  */
 typedef enum
{ 
	HLS_0		=	((CSP_REGISTER_T)0X00<<24),
	HLS_1		=	((CSP_REGISTER_T)0X01<<24)
}CMPX_First_output_startue_TypeDef;
 typedef enum
{
	CMPX_PWM_START		=	((CSP_REGISTER_T)0X00<<28),
	CMPX_PWM_STOP		=	((CSP_REGISTER_T)0X01<<28),
	CMPX_PWM_PEND		=	((CSP_REGISTER_T)0X02<<28),
	CMPX_PWM_CENTER		=	((CSP_REGISTER_T)0X03<<28),
	CMPX_PWM0_CMPAUM	=	((CSP_REGISTER_T)0X04<<28),
	CMPX_PWM0_CMPADM	=	((CSP_REGISTER_T)0X05<<28),
	CMPX_PWM0_CMPBUM	=	((CSP_REGISTER_T)0X06<<28),
	CMPX_PWM0_CMPBDM	=	((CSP_REGISTER_T)0X07<<28),
	CMPX_PWM1_CMPAUM	=	((CSP_REGISTER_T)0X08<<28),
	CMPX_PWM1_CMPADM	=	((CSP_REGISTER_T)0X09<<28),
	CMPX_PWM1_CMPBUM	=	((CSP_REGISTER_T)0X0A<<28),
	CMPX_PWM1_CMPBDM	=	((CSP_REGISTER_T)0X0B<<28),
	CMPX_ETCB_SYNCIN    =   ((CSP_REGISTER_T)0X0F<<28)
}CMPX_Trgsel_selecte_TypeDef;
 typedef enum
{
	CMPX_MSKMOD_SkipFilter			=	((CSP_REGISTER_T)0X00<<25),	
	CMPX_MSKMOD_IdleLow_DphsLow		=	((CSP_REGISTER_T)0X01<<25),	
	CMPX_MSKMOD_IdleHigh_DphsLow	=	((CSP_REGISTER_T)0X02<<25),	
	CMPX_MSKMOD_IdleHold_DphsLow	=	((CSP_REGISTER_T)0X03<<25),	
	//CMPX_MSKMOD_SkipFilter			=	((CSP_REGISTER_T)0X04<<25),	
	CMPX_MSKMOD_IdleLowDphsHigh		=	((CSP_REGISTER_T)0X05<<25),	
	CMPX_MSKMOD_IdleHighDphsHigh	=	((CSP_REGISTER_T)0X06<<25),	
	CMPX_MSKMOD_IdleHoldDphsHigh	=	((CSP_REGISTER_T)0X07<<25)
}CMPX_MSKMOD_Control_TypeDef;
 typedef enum
{
	CMPX_CLKDIV_1			=		((CSP_REGISTER_T)0X00<<10),
	CMPX_CLKDIV_2			=		((CSP_REGISTER_T)0X01<<10),
	CMPX_CLKDIV_3			=		((CSP_REGISTER_T)0X02<<10),
	CMPX_CLKDIV_4			=		((CSP_REGISTER_T)0X03<<10),
	CMPX_CLKDIV_5			=		((CSP_REGISTER_T)0X04<<10),
	CMPX_CLKDIV_6			=		((CSP_REGISTER_T)0X05<<10),
	CMPX_CLKDIV_7			=		((CSP_REGISTER_T)0X06<<10),
	CMPX_CLKDIV_8			=		((CSP_REGISTER_T)0X07<<10),
	CMPX_CLKDIV_9			=		((CSP_REGISTER_T)0X08<<10),
	CMPX_CLKDIV_10			=		((CSP_REGISTER_T)0X09<<10),
	CMPX_CLKDIV_11			=		((CSP_REGISTER_T)0X0A<<10),
	CMPX_CLKDIV_12			=		((CSP_REGISTER_T)0X0B<<10),
	CMPX_CLKDIV_13			=		((CSP_REGISTER_T)0X0C<<10),
	CMPX_CLKDIV_14			=		((CSP_REGISTER_T)0X0D<<10),
	CMPX_CLKDIV_15			=		((CSP_REGISTER_T)0X0E<<10),
	CMPX_CLKDIV_16			=		((CSP_REGISTER_T)0X0F<<10),
	CMPX_CLKDIV_24			=		((CSP_REGISTER_T)0X10<<10),
	CMPX_CLKDIV_32			=		((CSP_REGISTER_T)0X11<<10),
	CMPX_CLKDIV_40			=		((CSP_REGISTER_T)0X12<<10),
	CMPX_CLKDIV_48			=		((CSP_REGISTER_T)0X13<<10),
	CMPX_CLKDIV_56			=		((CSP_REGISTER_T)0X14<<10),
	CMPX_CLKDIV_64			=		((CSP_REGISTER_T)0X15<<10),
	CMPX_CLKDIV_72			=		((CSP_REGISTER_T)0X16<<10),
	CMPX_CLKDIV_128			=		((CSP_REGISTER_T)0X17<<10),
	CMPX_CLKDIV_144			=		((CSP_REGISTER_T)0X18<<10),
	CMPX_CLKDIV_160			=		((CSP_REGISTER_T)0X19<<10),
	CMPX_CLKDIV_176			=		((CSP_REGISTER_T)0X1A<<10),
	CMPX_CLKDIV_192			=		((CSP_REGISTER_T)0X1B<<10),
	CMPX_CLKDIV_208			=		((CSP_REGISTER_T)0X1C<<10),
	CMPX_CLKDIV_224			=		((CSP_REGISTER_T)0X1D<<10),
	CMPX_CLKDIV_240			=		((CSP_REGISTER_T)0X1E<<10),
	CMPX_CLKDIV_256			=		((CSP_REGISTER_T)0X1F<<10),
	CMPX_CLKDIV_288			=		((CSP_REGISTER_T)0X20<<10),
	CMPX_CLKDIV_320			=		((CSP_REGISTER_T)0X21<<10),
	CMPX_CLKDIV_352			=		((CSP_REGISTER_T)0X22<<10),
	CMPX_CLKDIV_384			=		((CSP_REGISTER_T)0X23<<10),
	CMPX_CLKDIV_416			=		((CSP_REGISTER_T)0X24<<10),
	CMPX_CLKDIV_448			=		((CSP_REGISTER_T)0X25<<10),
	CMPX_CLKDIV_480			=		((CSP_REGISTER_T)0X26<<10),
	CMPX_CLKDIV_512			=		((CSP_REGISTER_T)0X27<<10),
	CMPX_CLKDIV_640			=		((CSP_REGISTER_T)0X28<<10),
	CMPX_CLKDIV_720			=		((CSP_REGISTER_T)0X29<<10),
	CMPX_CLKDIV_1024		=		((CSP_REGISTER_T)0X2A<<10),
	CMPX_CLKDIV_2048		=		((CSP_REGISTER_T)0X2B<<10)
}CMPX_CLKDIV_TypeDef;

 /**
  * @brief CMPX TRGCR Config
  */
 typedef enum
{
	Disable_CMP_TC1_TRG		=	((CSP_REGISTER_T)0X00),
	CMP0_TC1_TRG			=	((CSP_REGISTER_T)0X01),
	CMP1_TC1_TRG			=	((CSP_REGISTER_T)0X02),
	CMP2_TC1_TRG			=	((CSP_REGISTER_T)0X03),
	CMP3_TC1_TRG			=	((CSP_REGISTER_T)0X04),
	CMP4_TC1_TRG			=	((CSP_REGISTER_T)0X05),
	CMP5_TC1_TRG			=	((CSP_REGISTER_T)0X06)
}CMP_TC_TRG_TypeDef;
 typedef enum
{
	CMP_TC_CIN_Enable		=	((CSP_REGISTER_T)0X01),
	CMP_TC_CIN_Disable		=	((CSP_REGISTER_T)0X00)
}CMP_TC_CIN_CMD_TypeDef;
 typedef enum
{
	CMP_AD_TRG_Enable		=	((CSP_REGISTER_T)0X01),
	CMP_AD_TRG_Disable		=	((CSP_REGISTER_T)0X00)				
}CMP_AD_TRG_CMD_TypeDef;

/******************************************************************************
********************* CMP External Functions Declaration ********************
******************************************************************************/
extern void CMP_RESET_VALUE(void);
extern void CMP_software_reset(void);
extern void CMP_CLK_CMD(CMPx_selecte_TypeDef CMPx_NUM , FunctionalStatus NewState);
extern void CMP_IO_Init(CMP_IO_MODE_TypeDef  CMP_IO_MODE_X , U8_T CMP_IO_G );
extern void CMP_INPCRX_Config(CMPx_selecte_TypeDef CMPx_NUM , U8_T CMPX_NSEL , U8_T CMPX_PSEL );
extern void CMPOutput_Read(void);
extern void CMP_CR_Config(CMPx_selecte_TypeDef CMPx_NUM , CMPx_NHYST_TypeDef NHYST_Xmv , CMPx_PHYST_TypeDef PHYST_Xmv , 
						CMPx_POLARITY_TypeDef POLARITY_X , CMPx_EVE_SEL_TypeDef EVE_SEL_X , CMPx_FLTEN_TypeDef X_FLTEN , CMPx_CPOS_TypeDef CPOS_X);
extern void CMP_Open(CMPx_selecte_TypeDef CMPx_selecte);
extern void CMP_Close(CMPx_selecte_TypeDef CMPx_selecte);
extern void CMPX_FLTCR_Config(CMPx_selecte_TypeDef CMPx_NUM , CMPX_CLK_Selecte_TypeDef CMPX_CLK_Selecte_x , U8_T CMPX_DIVN , U8_T CMPX_DIVM);
extern void CMP_WCNT_Config(CMPx_selecte_TypeDef CMPx_NUM , CMPX_First_output_startue_TypeDef HLS_X , CMPX_Trgsel_selecte_TypeDef CMPX_Trgsel_X , 
				     CMPX_MSKMOD_Control_TypeDef CMPX_MSKMOD_X , CMPX_CLKDIV_TypeDef CMPX_CLKDIV_X , U8_T CMP_DCNT , U16_T CMP_WCNT);
extern void CMP_TRGCR_Config(CMPx_selecte_TypeDef CMPx_NUM , CMP_TC_TRG_TypeDef CMP_TC_TRG_X , CMP_TC_CIN_CMD_TypeDef CMP_TC_CIN_X , CMP_AD_TRG_CMD_TypeDef CMP_AD_TRG_X);
extern void CMP_ConfigInterrupt_CMD(CMP_INT_TypeDef CMP_INT_X , FunctionalStatus NewState);
extern void CMP0_Int_Enable(void);
extern void CMP0_Int_Disable(void);
extern void CMP0_Wakeup_Enable(void);	
extern void CMP0_Wakeup_Disable(void);
extern void CMP1_Int_Enable(void);
extern void CMP1_Int_Disable(void);
extern void CMP1_Wakeup_Enable(void);
extern void CMP1_Wakeup_Disable(void);					
extern void CMP_VOL_REF_Select(CMP_VOL_REF_TypeDef VOL_REF);
#endif   /**< apt32f172_cmp_H */

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/


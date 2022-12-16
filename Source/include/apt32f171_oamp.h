/*
  ******************************************************************************
  * @file    apt32f171_oamp.h
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
#ifndef _apt32f171_oamp_H
#define _apt32f171_oamp_H

/* Includes ------------------------------------------------------------------*/
#include "apt32f171.h"

/** Control bit function define */

 /******************************************************************************
************************** OPA Registers Definition ****************************
******************************************************************************/
#define		 OPA_CR_RST     			((CSP_REGISTER_T)0x00000000)		/**< OPA0_CR  reset value   */

/******************************************************************************
***************************** CMP Registers mask ***************************
******************************************************************************/


/******************************************************************************
************************* CMP Registers reset value ************************
******************************************************************************/
 /**
  * @brief OPA IO mode 
  */
typedef enum
{
	OPA0P		=		1,
	OPA0N		=		2,
	OPA0X		=		3,
	OPA1P		=		4,
	OPA1N		=		5,
	OPA1X		=		6
}OPA_IO_MODE_TypeDef;

 /**
  * @brief OPAX Selected Num
  */
typedef enum
{
	OPA0_NUM	=	0,
	OPA1_NUM	=	1
}OPAx_selecte_TypeDef;

 /**
  * @brief PGAEN CMD
  */
typedef enum
{
	PGAEN_DISABLE	=	0,
	PGAEN_ENABLE	=	1
}PGAEN_CMD_TypeDef;

typedef enum
{
	BUFFER_DISABLE	=	0,
	BUFFER_ENABLE	=	1
}BUFFEREN_CMD_TypeDef;

typedef enum
{
	Op_ExtPinConnect_EN 	= 1,
	Op_ExtPinConnect_DIS	=  0
}Op_ExtPinConnect_TypeDef;
/******************************************************************************
********************* CMP External Functions Declaration ********************
******************************************************************************/
extern void OPA_IO_Init(OPA_IO_MODE_TypeDef  OPA_IO_MODE_X , U8_T OPA_IO_G );
extern void OPA_EN_CMD(OPAx_selecte_TypeDef OPAx_NUM , FunctionalStatus NewState);
extern void OPA_Config_Prg(OPAx_selecte_TypeDef OPAx_NUM , PGAEN_CMD_TypeDef PGAEN_CMD_x , Op_ExtPinConnect_TypeDef Op_ExtPinConnect_X  , BUFFEREN_CMD_TypeDef BUFFER_EN , U8_T PGAC_Set );
extern void OPA0_RESET_VALUE(void);
extern void OPA1_RESET_VALUE(void);
#endif   /**< apt32f172_oamp_H */

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/

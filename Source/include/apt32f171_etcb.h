/*
  ******************************************************************************
  * @file    apt32f171_et.h
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
#ifndef _apt32f171_et_H
#define _apt32f171_et_H

/* Includes ------------------------------------------------------------------*/
#include "apt32f171.h"


#define ET_RESET_VALUE  (0x00000000)
//--------------------------------------------------------------------------------
//-----------------------------ET  value enum define--------------------------
//--------------------------------------------------------------------------------
/**
  * @brief  ET SWTRG register
  */
typedef enum
{
    ET_SWTRG_CH0 = 0,
	ET_SWTRG_CH1 = (1<<1),
	ET_SWTRG_CH2 = (1<<2),
	ET_SWTRG_CH3 = (1<<3),
	ET_SWTRG_CH4 = (1<<4),
	ET_SWTRG_CH5 = (1<<5),
	ET_SWTRG_CH6 = (1<<6),
	ET_SWTRG_CH7 = (1<<7),
	ET_SWTRG_CH8 = (1<<8),
	ET_SWTRG_CH9 = (1<<9),
	ET_SWTRG_CH10 = (1<<10),
	ET_SWTRG_CH11 = (1<<11),
	ET_SWTRG_CH12 = (1<<12),
	ET_SWTRG_CH13 = (1<<13),
	ET_SWTRG_CH14 = (1<<14),
	ET_SWTRG_CH15 = (1<<15),
	ET_SWTRG_CH16 = (1<<16),
	ET_SWTRG_CH17 = (1<<17),
	ET_SWTRG_CH18 = (1<<18),
	ET_SWTRG_CH19 = (1<<19),
	ET_SWTRG_CH20 = (1<<20),
	ET_SWTRG_CH21 = (1<<21),
	ET_SWTRG_CH22 = (1<<22),
	ET_SWTRG_CH23 = (1<<23),
	ET_SWTRG_CH24 = (1<<24),
	ET_SWTRG_CH25 = (1<<25),
	ET_SWTRG_CH26 = (1<<26),
	ET_SWTRG_CH27 = (1<<27),
	ET_SWTRG_CH28 = (1<<28),
	ET_SWTRG_CH29 = (1<<29),
	ET_SWTRG_CH30 = (1<<30),
	ET_SWTRG_CH31 = (1<<31),
}CRC_ETSWTRG_TypeDef;
/**
  * @brief  SRCSEL register
  */
typedef enum
{
    ET_SRC0 = 0,
	ET_SRC1 = 1,
	ET_SRC2 = 2,
}CRC_ESRCSEL_TypeDef;
/**
  * @brief  SRCSEL register
  */
typedef enum
{
    ET_DST0 = 0,
	ET_DST1 = 1,
	ET_DST2 = 2,
}CRC_DSTSEL_TypeDef;
/**
  * @brief  SRCSEL register
  */
typedef enum
{
    ET_CH3 = 0,
	ET_CH4 = 1,
	ET_CH5 = 2,
	ET_CH6 = 3,
	ET_CH7 = 4,
	ET_CH8 = 5,
	ET_CH9 = 6,
	ET_CH10 = 7,
	ET_CH11 = 8,
	ET_CH12 = 9,
	ET_CH13 = 10,
	ET_CH14 = 11,
	ET_CH15 = 12,
	ET_CH16 = 13,
	ET_CH17 = 14,
	ET_CH18 = 15,
	ET_CH19 = 16,
	ET_CH20 = 17,
	ET_CH21 = 18,
	ET_CH22 = 19,
	ET_CH23 = 20,
	ET_CH24 = 21,
	ET_CH25 = 22,
	ET_CH26 = 23,
	ET_CH27 = 24,
	ET_CH28 = 25,
	ET_CH29 = 26,
	ET_CH30 = 27,
	ET_CH31 = 28,
}CRC_ETCHX_TypeDef;
/**
  * @brief  TRIG MODE register
  */
typedef enum
{
    TRG_HW = (0X00<<1),
	TRG_SW = (0X01<<1),
}CRC_TRIGMODE_TypeDef;

//Source IP Event
#define ET_EXI_TRGSRC0 (0X4)
#define ET_EXI_TRGSRC1 (0X5)
#define ET_EXI_TRGSRC2 (0X6)
#define ET_EXI_TRGSRC3 (0X7)
#define ET_EXI_TRGSRC4 (0X8)
#define ET_EXI_TRGSRC5 (0X9)

#define ET_BTO_TRGSRC (0XA)
#define ET_BT1_TRGSRC (0XB)
#define ET_BT2_TRGSRC (0XC)
#define ET_BT3_TRGSRC (0XD)

#define ET_EPT0_TRGSRC0 (0X12)
#define ET_EPT0_TRGSRC1 (0X13)
#define ET_EPT0_TRGSRC2 (0X14)
#define ET_EPT0_TRGSRC3 (0X15)

#define ET_GPTA_TRGSRC0 (0X20)
#define ET_GPTA_TRGSRC1 (0X21)

#define ET_CMP0_ADC_TRGSRC (0X22)
#define ET_CMP1_ADC_TRGSRC (0X23)
#define ET_CMP2_ADC_TRGSRC (0X24)
#define ET_CMP3_ADC_TRGSRC (0X25)
#define ET_CMP4_ADC_TRGSRC (0X26)
#define ET_CMP5_ADC_TRGSRC (0X27)

#define ET_CMP0_TC1_TRGSRC (0X28)
#define ET_CMP1_TC1_TRGSRC (0X29)
#define ET_CMP2_TC1_TRGSRC (0X2A)
#define ET_CMP3_TC1_TRGSRC (0X2B)
#define ET_CMP4_TC1_TRGSRC (0X2C)
#define ET_CMP5_TC1_TRGSRC (0X2D)

#define ET_CMP_TC1_START_TRGSRC (0X2E)

#define ET_CMP_ADC_TRGSRC (0X2F)

#define ET_ADC_TRGSRC0 (0X30)
#define ET_ADC_TRGSRC1 (0X31)

#define ET_TC1_PEND_TRGSRC (0X34)
#define ET_TC1_MATCH_TRGSRC (0X35)
#define ET_TC2_PEND_TRGSRC (0X36)
#define ET_EPWM_ADC_TRGSRC (0X37)
#define ET_EPWM_ST_TRGSRC (0X38)

//Destination IP Event
#define ET_BT0_SYNC0  (0X2)
#define ET_BT0_SYNC1  (0X3)
#define ET_BT0_SYNC2  (0X4)

#define ET_BT1_SYNC0  (0X5)
#define ET_BT1_SYNC1  (0X6)
#define ET_BT1_SYNC2  (0X7)

#define ET_BT2_SYNC0  (0X8)
#define ET_BT2_SYNC1  (0X9)
#define ET_BT2_SYNC2  (0XA)

#define ET_BT3_SYNC0  (0XB)
#define ET_BT3_SYNC1  (0XC)
#define ET_BT3_SYNC2  (0XD)

#define ET_ADC_SYNC0  (0X12)
#define ET_ADC_SYNC1  (0X13)
#define ET_ADC_SYNC2  (0X14)
#define ET_ADC_SYNC3  (0X15)
#define ET_ADC_SYNC4  (0X16)
#define ET_ADC_SYNC5  (0X17)

#define ET_EPT0_SYNC0  (0X1E)
#define ET_EPT0_SYNC1  (0X1F)
#define ET_EPT0_SYNC2  (0X20)
#define ET_EPT0_SYNC3  (0X21)
#define ET_EPT0_SYNC4  (0X22)
#define ET_EPT0_SYNC5  (0X23)

#define ET_GPTA_SYNC0  (0X24)
#define ET_GPTA_SYNC1  (0X25)
#define ET_GPTA_SYNC2  (0X26)
#define ET_GPTA_SYNC3  (0X27)
#define ET_GPTA_SYNC4  (0X28)
#define ET_GPTA_SYNC5  (0X29)

#define ET_GMP1_SYNC  (0X30)
#define ET_GMP2_SYNC  (0X31)
#define ET_GMP3_SYNC  (0X32)
#define ET_GMP4_SYNC  (0X33)

#define ET_EPWM_SYNC0  (0X37)
#define ET_EPWM_SYNC1  (0X38)
#define ET_EPWM_SYNC2  (0X39)
#define ET_EPWM_SYNC3  (0X3A)

extern void ET_DeInit(void);
extern void ET_ENABLE(void);
extern void ET_DISABLE(void);
extern void ET_SWTRG_CMD(CRC_ETSWTRG_TypeDef ETSWTRG_X,FunctionalStatus NewState);
extern void ET_CH0_DSTSEL(CRC_DSTSEL_TypeDef DST_X,FunctionalStatus NewState,U8_T DSTSEL_X);
extern void ET_CH0_SRCSEL(FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X);
extern void ET_CH1_DSTSEL(CRC_DSTSEL_TypeDef DST_X,FunctionalStatus NewState,U8_T DSTSEL_X);
extern void ET_CH1_SRCSEL(FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X);
extern void ET_CH2_DSTSEL(CRC_DSTSEL_TypeDef DST_X,FunctionalStatus NewState,U8_T DSTSEL_X);
extern void ET_CH2_SRCSEL(FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X);
extern void ET_CHx_CONTROL(CRC_ETCHX_TypeDef ETCHX,FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X,U8_T DSTSEL_X);



#endif   /**< apt32f102_crc_H */
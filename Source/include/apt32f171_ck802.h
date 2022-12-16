/*
  ******************************************************************************
  * @file    apt32f171_ck802.h
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
#ifndef _apt32f171_ck802_H
#define _apt32f171_ck802_H

/* Includes ------------------------------------------------------------------*/


#define CK802_BASEADDR        	0xE000E000

#define INTC_ISER_WRITE(val)     CK802 -> ISER  = val
#define INTC_IWER_WRITE(val)     CK802 -> IWER  = val
#define INTC_ICER_WRITE(val)     CK802 -> ICER  = val
#define INTC_IWDR_WRITE(val)     CK802 -> IWDR  = val
#define INTC_ISPR_WRITE(val)     CK802 -> ISPR  = val
#define INTC_ICPR_WRITE(val)     CK802 -> ICPR  = val
#define INTC_IABR_WRITE(val)     CK802 -> IABR  = val
#define INTC_IPR0_WRITE(val)   	 CK802 -> IPR[0]  = val
#define INTC_IPR1_WRITE(val)     CK802 -> IPR[1]  = val
#define INTC_IPR2_WRITE(val)     CK802 -> IPR[2]  = val
#define INTC_IPR3_WRITE(val)     CK802 -> IPR[3]  = val
#define INTC_IPR4_WRITE(val)     CK802 -> IPR[4]  = val
#define INTC_IPR5_WRITE(val)     CK802 -> IPR[5]  = val
#define INTC_IPR6_WRITE(val)     CK802 -> IPR[6]  = val
#define INTC_IPR7_WRITE(val)     CK802 -> IPR[7]  = val
#define INTC_ISR_WRITE(val)      CK802 -> ISR   = val
#define INTC_IPTR_WRITE(val)     CK802 -> IPTR  = val


#define INTC_ISER_READ(intc)   (intc->ISER  )
#define INTC_IWER_READ(intc)   (intc->IWER  )
#define INTC_ICER_READ(intc)   (intc->ICER  )
#define INTC_IWDR_READ(intc)   (intc->IWDR  )
#define INTC_ISPR_READ(intc)   (intc->ISPR  )
#define INTC_ICPR_READ(intc)   (intc->ICPR  )
#define INTC_IABR_READ(intc)   (intc->IABR  )
#define INTC_IPR0_READ(intc)   (intc->IPR[0]  )
#define INTC_IPR1_READ(intc)   (intc->IPR[1]  )
#define INTC_IPR2_READ(intc)   (intc->IPR[2]  )
#define INTC_IPR3_READ(intc)   (intc->IPR[3]  )
#define INTC_IPR4_READ(intc)   (intc->IPR[4]  )
#define INTC_IPR5_READ(intc)   (intc->IPR[5]  )
#define INTC_IPR6_READ(intc)   (intc->IPR[6]  )
#define INTC_IPR7_READ(intc)   (intc->IPR[7]  )
#define INTC_ISR_READ(intc)    (intc->ISR   )
#define INTC_IPTR_READ(intc)   (intc->IPTR  )

typedef enum IRQn
{
/******  CK801 Processor Exceptions Numbers ***************************************************/
        ISR_Restart                     = -32,
        ISR_Misaligned_Access           = -31,
        ISR_Access_Error                = -30,
        ISR_Divided_By_Zero             = -29,
        ISR_Illegal                     = -28,
        ISR_Privlege_Violation          = -27,
        ISR_Trace_Exection              = -26,
        ISR_Breakpoint_Exception        = -25,
        ISR_Unrecoverable_Error         = -24,
        ISR_Idly4_Error                 = -23,
        ISR_Auto_INT                    = -22,
        ISR_Auto_FINT                   = -21,
        ISR_Reserved_HAI                = -20,
        ISR_Reserved_FP                 = -19,
        ISR_TLB_Ins_Empty               = -18,
        ISR_TLB_Data_Empty              = -17,
  
/******  CK801 specific Interrupt Numbers *********************************************************/
        INTC_CORETIM_IRQn               = 0,      
        INTC_TIME1_IRQn                	= 1,      
        INTC_USART0_IRQn                = 2,
        INTC_GPIOA2_IRQn                = 8,
} IRQn_Type;


void INTC_Init(void);
void force_interrupt(IRQn_Type IRQn);

void CK_CPU_EnAllNormalIrq(void);
void CK_CPU_DisAllNormalIrq(void);

#ifndef __INLINE
#define __INLINE inline
#endif
#ifndef uint32_t
#define uint32_t unsigned int
#endif

#ifndef uint8_t
#define uint8_t unsigned char
#endif


#endif   /**< apt32f172_ck801_H */

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/


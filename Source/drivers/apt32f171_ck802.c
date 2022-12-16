/*
  ******************************************************************************
  * @file    apt32f172_ck801.c
  * @author  APT AE Team
  * @version V1.12
  * @date    2019/03/08
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
#include "apt32f171_ck802.h"


void CK801_int_Init(void)
{
        /* Initial the Interrupt source priority level registers */
        CK802->IPR[0] = 0xC0804000;
        CK802->IPR[1] = 0xC0804000;
        CK802->IPR[2] = 0xC0804000;
        CK802->IPR[3] = 0xC0804000;
        CK802->IPR[4] = 0xC0804000;
        CK802->IPR[5] = 0xC0804000;
        CK802->IPR[6] = 0xC0804000;
        CK802->IPR[7] = 0xC0804000;

        CK802->IPTR 	 = 0x00000000;//disable threshold
}

void force_interrupt(IRQn_Type IRQn)
{
	CK802->ISPR = (1 << (uint32_t)(IRQn));
}


void CK_CPU_EnAllNormalIrq(void)
{
  asm  ("psrset ee,ie");
}

void CK_CPU_DisAllNormalIrq(void)
{
 asm  ("psrclr ie");
}







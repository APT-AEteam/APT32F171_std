/*
  ******************************************************************************
  * @file    main.c
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
#include "apt32f171_adc.h"
#include "apt32f171_bt.h"
#include "apt32f171_cmp.h"
#include "apt32f171_coret.h"
#include "apt32f171_crc.h"
#include "apt32f171_ept.h"
#include "apt32f171_etcb.h"
#include "apt32f171_gpio.h"
#include "apt32f171_gpt.h"
#include "apt32f171_hwdiv.h"
#include "apt32f171_ifc.h"
#include "apt32f171_gpt.h"
#include "apt32f171_oamp.h"
#include "apt32f171_syscon.h"
#include "apt32f171_types_local.h"
#include "apt32f171_usart.h"
#include "apt32f171_uart.h"
#include "apt32f171_wwdt.h"
#include "apt32f171_iostring.h"
#include "math.h" 
/* defines -------------------------------------------------------------------*/
/* externs Register-------------------------------------------------------------------*/
/* externs function-------------------------------------------------------------------*/
extern void delay_nms(unsigned int t);
extern void APT32F171_init(void);	

/*************************************************************/
//main
/*************************************************************/
int main(void) 
{
	delay_nms(2000);
	APT32F171_init();		
    while(1)
	{
		SYSCON_IWDCNT_Reload();                 	//清狗
		//...
		//my_printf("hello apt32f171!\r\n");
    }
}
/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/

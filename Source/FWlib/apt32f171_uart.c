/*
  ******************************************************************************
  * @file    apt32f171_uart.c
  * @author  APT AE Team
  * @version V1.0.0
  * @date    2022/8/18
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
#include "apt32f171_uart.h"


/* define --------------------------------------------------------------------*/
volatile U8_T RxDataFlag=0;
volatile U8_T TxDataFlag=0;
volatile U8_T f_Uart_send_Complete;
volatile U16_T Uart_send_Length_temp;
volatile U8_T Uart_send_Length;
volatile U8_T Uart_buffer[UART_BUFSIZE];
/* externs--------------------------------------------------------------------*/


/*************************************************************/
//UART RESET,CLEAR ALL REGISTER
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_DeInit(void)
{
    UART0->DATA = UART_RESET_VALUE;
    UART0->SR   = UART_RESET_VALUE;
    UART0->CTRL = UART_RESET_VALUE;
    UART0->ISR  = UART_RESET_VALUE;
    UART0->BRDIV = UART_RESET_VALUE;
	UART0->RTOR = 0x0000FFFF;
	UART0->TTGR = UART_RESET_VALUE;
	UART0->SRR  = UART_RESET_VALUE;
}

/*************************************************************/
//UART0 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_Int_Enable(void)
{
    UART0->ISR=0x0F;									//clear UART0 INT status
	INTC_ISER_WRITE(UART0_INT);							//INT Vector Enable UART0/1 Interrupt in CK802
}

/*************************************************************/
//UART0 Interrupt enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_Int_Disable(void)
{
	INTC_ICER_WRITE(UART0_INT);							//INT Vector Enable UART0/1 Interrupt in CK802
}

/*************************************************************/
//UART0 Wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(UART0_INT);    
}

/*************************************************************/
//UART0 Wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(UART0_INT);    
}

/*************************************************************/
//UART IO Init
//EntryParameter:IO_UART_NUM,IO_UART0
//UART_IO_G:0 1
//ReturnValue:NONE
/*************************************************************/
void UART_IO_Init(UART_NUM_TypeDef IO_UART_NUM , U8_T UART_IO_G)
{
    if (IO_UART_NUM==IO_UART0)
    {
		if(UART_IO_G==0)
		{
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF00F)  | 0x00000770;      //PA0.10->RXD0, PA0.9->TXD0 
		}
		else if(UART_IO_G==1)
		{
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFF00F)  | 0x00000660;      //PA1.2->RXD0, PA1.1->TXD0      
		}
		else if(UART_IO_G==2)
		{
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00005000;      //PA0.11->RXD0, PC0.2->TXD0   
            GPIOC0->CONLR = (GPIOC0->CONLR&0XFFFFF0FF)  | 0x00000500;   
		}
		else if(UART_IO_G==3)
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF)  | 0x00088000;       //PA0.3->RXD0, PA0.4->TXD0  //SWD口，需解锁，谨慎使用
		}
    }
}
/*************************************************************/
//UART Init
//EntryParameter:UART0,baudrate_u16 
//e.g:
//sys_clk@24MHz, 24/4(div)=6MHz, 6000000/115200bps=52,baudrate_u16=52
//sys_clk@24MHz, 24/2(div)=12MHz, 12000000/115200bps=104,baudrate_u16=104
//ReturnValue:NONE
/*************************************************************/
void UARTInit(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   uart->CTRL|=PAR_DAT;
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX);
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
}
/*************************************************************/
//UART init and enable RX,TX interrupt
//EntryParameter:UART0,baudrate_u16 
//ReturnValue:NONE
/*************************************************************/
void UARTInitRxTxIntEn(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   uart->CTRL|=PAR_DAT;
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT | UART_TX_INT);
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
}
/*************************************************************/
//UART init and enable RX interrupt
//EntryParameter:UART0,baudrate_u16 
//ReturnValue:NONE
/*************************************************************/
void UARTInitRxIntEn(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   uart->CTRL|=PAR_DAT;
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT);
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
   
}
/*************************************************************/
//UART_Timeout_Rx_CMD
//EntryParameter:NewState: DISABLE , ENABLE
//ReturnValue:NONE
/*************************************************************/
void UART_Timeout_Rx_CMD(CSP_UART_T *uart,FunctionalStatus NewState,U16_T TIMEOUT)    //cl
{
	 if (NewState != DISABLE)
	 {
	     uart->CTRL |= (1<<20);
		 uart->RTOR = TIMEOUT;
	 }
	 else
	 {
		 uart->CTRL &= (~(1<<20));
		 uart->RTOR = 0x0000FFFF;
	 }
}
/*************************************************************/
//UART_FIFO_CMD
//EntryParameter:FIFO1_X, ENABLE/DISABLE
//ReturnValue:NONE
/*************************************************************/
void UART_FIFO_CMD(UART_FIFO_TypeDef FIFO1_X,FunctionalStatus newState)
{
	if (newState!=DISABLE)
	{
		UART0->CTRL |= FIFO1_X<<14;
		
		UART0->CTRL  |= 1<<11;
	}
	else
	{
		UART0->CTRL  |= FIFO1_X<<14;
		
		UART0->CTRL  &= (~(1<<11));
	}
}
/*************************************************************/
//UART_Tx_Break_CMD
//EntryParameter:NewState: DISABLE , ENABLE
//ReturnValue:NONE
/*************************************************************/
void UART_Tx_Break_CMD(CSP_UART_T *uart,FunctionalStatus NewState)
{
	if (NewState != DISABLE)
	{
	     uart->CTRL |= (1<<23);
	}
	else
	{
		 
		 uart->CTRL |= (1<<24);
	}
}
/*************************************************************/
//UART_Tx_Break_CMD
//EntryParameter:TIME_GUARD
//ReturnValue:NONE
/*************************************************************/
void UART_Tx_TTGR_TIME(CSP_UART_T *uart,U8_T TIME_GUARD)
{
     uart->TTGR = TIME_GUARD; 
}
/*************************************************************/
//UART_SWRST
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void UART_Software_Reset(CSP_UART_T *uart)
{
     uart->SRR = 0X01; 
}
/*************************************************************/
//UART Close
//EntryParameter:UART0,UART1,UART2
//ReturnValue:NONE
/*************************************************************/
void UARTClose(CSP_UART_T *uart)
{
	// Set Transmitter Disable
	CSP_UART_SET_CTRL(uart, 0x00);
}
/*************************************************************/
//UART TX Byte loop send
//EntryParameter:UART0,txdata_u8
//ReturnValue:NONE
/*************************************************************/
void UARTTxByte(CSP_UART_T *uart,U8_T txdata_u8)
{
	unsigned int  DataI;
	// Write the transmit buffer
	CSP_UART_SET_DATA(uart,txdata_u8);
	do
	{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_TX_FULL;
	}
	while(DataI == UART_TX_FULL);    //Loop  when tx is full
}
/*************************************************************/
//UART Transmit 
//EntryParameter:UART0,sourceAddress_u16,length_u16
//ReturnValue:NONE
/*************************************************************/
void UARTTransmit(CSP_UART_T *uart,U8_T *sourceAddress_u16,U16_T length_u16)
{
	unsigned int  DataI,DataJ;
	for(DataJ = 0;DataJ < length_u16 ;DataJ ++)
	{
		CSP_UART_SET_DATA(uart,*sourceAddress_u16++);
		do{
			DataI = CSP_UART_GET_SR(uart);
			DataI = DataI & UART_TX_FULL;
		}while(DataI == UART_TX_FULL);    //Loop  when tx is full
	}
}
/*************************************************************/
//UART  INT Transmit 
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void UARTTTransmit_data_set(CSP_UART_T *uart )
{
	if(!f_Uart_send_Complete)
	{
		f_Uart_send_Complete=1;
		Uart_send_Length_temp++;
		CSP_UART_SET_DATA(uart,Uart_buffer[0]);
	}
}
void UARTTransmit_INT_Send(CSP_UART_T *uart )
{
	if(f_Uart_send_Complete)
	{
		if(Uart_send_Length_temp>=Uart_send_Length)
		{
			f_Uart_send_Complete=0;
			Uart_send_Length_temp=0;
		}
		else
		{
			CSP_UART_SET_DATA(uart,Uart_buffer[Uart_send_Length_temp++]);
		}
	}	
}
/*************************************************************/
//UART RX Byte 
//EntryParameter:UART0,UART1,UART2,Rxdata_u16
//ReturnValue:NONE
/*************************************************************/
U16_T UARTRxByte(CSP_UART_T *uart,U8_T *Rxdata_u16)
{
	unsigned int  DataI;

	DataI = CSP_UART_GET_SR(uart);
	DataI = DataI & UART_RX_FULL;
	if(DataI != UART_RX_FULL)    //Loop  when rx is not full
		return FALSE;
	else
	{
		*Rxdata_u16 = CSP_UART_GET_DATA(uart);
	    return TRUE;
	}
}

/*************************************************************/
//UART RX Return Byte 
//EntryParameter:UART0,UART1,UART2
//ReturnValue:(uart)->DATA
/*************************************************************/
U8_T UART_ReturnRxByte(CSP_UART_T *uart)
{
	RxDataFlag = FALSE;
	while(RxDataFlag != TRUE);
	return CSP_UART_GET_DATA(uart);
}

/*************************************************************/
//UART Receive
//EntryParameter:UART0,UART1,UART2，destAddress_u16，length_u16
//ReturnValue:FALSE/TRUE
/*************************************************************/
U16_T UARTReceive(CSP_UART_T *uart,U8_T *destAddress_u16,U16_T length_u16)
{
	unsigned int  DataI,DataJ,LoopTime;

	DataJ = 0;
	LoopTime = 0;
	do{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_RX_FULL;
		if(DataI == UART_RX_FULL)    //Loop  when rx is full
		{
			*destAddress_u16++ = CSP_UART_GET_DATA(uart);
			DataJ++;
			LoopTime = 0;
		}
		if(LoopTime ++ >= 0xfff0)
			return FALSE;
	}while(DataJ < length_u16);
	return TRUE;
}

/*
  ******************************************************************************
  * @file    apt32f171_usart.h
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
#ifndef _apt32f171_usart_H
#define _apt32f171_usart_H
/* Includes ------------------------------------------------------------------*/
#include "apt32f171.h"
/******************************************************************************
************************* USART Registers Definition **************************
******************************************************************************/
/******************************************************************************
* Reset value definition
******************************************************************************/
#define    USART_IDR_RST       	(0x00003898ul)
#define	   USART_CEDR_RST		(0x00000000ul)
#define	   USART_SRR_RST		(0x00000000ul)
#define	   USART_CR_RST			(0x00000000ul)
#define    USART_MR_RST        	(0x00000000ul)
#define    USART_IMSCR_RST     	(0x00000000ul)
#define    USART_RISR_RST     	(0x00000000ul)
#define    USART_MISR_RST     	(0x00000000ul)
#define    USART_ICR_RST  		(0x00000000ul)
#define    USART_SR_RST        	(0x00064A02ul)
#define    USART_RHR_RST       	(0x00000000ul)
#define    USART_THR_RST	   	(0x00000000ul)
#define    USART_BRGR_RST      	(0x00000000ul)
#define    USART_RTOR_RST      	(0x00000000ul)
#define    USART_TTGR_RST      	(0x00000000ul)


/******************************************************************************
* IDR : USART ID Registers
******************************************************************************/
 #define USART_IPIDCODE_MASK   (0x3FFFFFFul << 4) /**< USART IPIDCODE MASK   */

/******************************************************************************
* CEDR : Clock Enable/Disable Registers
******************************************************************************/
 #define USART_CLKEN           (0x01ul << 0)     /**< USART Clock            */
 #define USART_DBGEN           (0x01ul << 31)    /**< Debug Mode Enable      */

/******************************************************************************
* SRR : USART Software Reset Register
******************************************************************************/
 #define USART_SWRST           (0x01ul << 0)     /**< Software Reset         */

/******************************************************************************
* CR : USART Control Register
******************************************************************************/
 #define USART_RSTRX           (0x01ul << 2)     /**< Reset Receiver         */
 #define USART_RSTTX           (0x01ul << 3)     /**< Reset Transmitter      */
 #define USART_RXEN            (0x01ul << 4)     /**< Receiver Enable        */
 #define USART_RXDIS           (0x01ul << 5)     /**< Receiver Disable       */
 #define USART_TXEN            (0x01ul << 6)     /**< Transmitter Enable     */
 #define USART_TXDIS           (0x01ul << 7)     /**< Transmitter Disable    */
 #define USART_STTBRK          (0x01ul << 9)     /**< Start Break            */
 #define USART_STPBRK          (0x01ul << 10)    /**< Stop Break             */
 #define USART_STTTO           (0x01ul << 11)    /**< Start Time-out         */
 #define USART_SENDA           (0x01ul << 12)    /**< Send Address           */
 #define USART_FIFO_EN          (0x01ul << 13)    /**< Send Address           */
// #define USART_STHEADER        (0x01ul << 16)    /**< Start Header           */
// #define USART_STRESP          (0x01ul << 17)    /**< Start Response         */
// #define USART_STMESSAGE        (0x01ul << 18)    /**< Send Response after Header */
// #define USART_RSTLIN          (0x01ul << 19)    /**< Reset LIN APB register */

/******************************************************************************
* MR : USART Mode Register
******************************************************************************/
 #define USART_LIN     			(0x01ul << 0)     /**< Local Interconnect Network mode*/

/** SENDTIME : Send Time                                                     */
 #define USART_SENDTIME_MASK   (0x07ul << 1)         /**< SENDTIME Mask      */
 #define USART_SENDTIME(val)   (((val) & 0x07ul) << 1) /**< Writing Macro    */
 #define USART_SENDTIME_0      (0x00ul << 1)         /**< Number of Time = 0 */
 #define USART_SENDTIME_1      (0x01ul << 1)         /**< Number of Time = 1 */
 #define USART_SENDTIME_2      (0x02ul << 1)         /**< Number of Time = 2 */
 #define USART_SENDTIME_3      (0x03ul << 1)         /**< Number of Time = 3 */
 #define USART_SENDTIME_4      (0x04ul << 1)         /**< Number of Time = 4 */
 #define USART_SENDTIME_5      (0x05ul << 1)         /**< Number of Time = 5 */
 #define USART_SENDTIME_6      (0x06ul << 1)         /**< Number of Time = 6 */
 #define USART_SENDTIME_7      (0x07ul << 1)         /**< Number of Time = 7 */

/** USCLKS : Clock Selection                                                 */
 #define USART_CLKS_MASK       (0x03ul << 4)         /**< CLKS Mask          */
 #define USART_CLKS(val)       (((val) & 0x03ul) << 4) /**< Writing Macro    */
 #define USART_CLKS_MCKI       (0x00ul << 4)         /**< (MCKI)             */
 #define USART_CLKS_MCKI_8     (0x01ul << 4)         /**< (MCKI/8)           */
 #define USART_CLKS_SCK        (0x01ul << 5)         /**< Ext Clock (SCK)    */

/** CHRL : Character Length                                                  */
 #define USART_CHRL_MASK       (0x03ul << 6)         /**< CHRL Mask          */
 #define USART_CHRL(val)       (((val) & 0x03ul) << 6) /**< Writing Macro    */
 #define USART_CHRL_5          (0x00ul << 6)         /**< Five bits length   */
 #define USART_CHRL_6          (0x01ul << 6)         /**< Six bits length    */
 #define USART_CHRL_7          (0x02ul << 6)         /**< Seven bits length  */
 #define USART_CHRL_8          (0x03ul << 6)         /**< Height bits length */

/** SYNC : Synchronous Mode Select                                           */
 #define USART_SYNC            (0x01ul << 8)     /**< Synchronous mode       */
 #define USART_ASYNC           (0x00ul << 8)     /**< Asynchronous mode      */

/** PAR : Parity Type                                                        */
 #define USART_PAR_MASK        (0x07ul << 9)         /**< PAR Mask           */
 #define USART_PAR(val)        (((val) & 0x07ul) << 9) /**< Writing Macro    */
 #define USART_PAR_EVEN        (0x00ul << 9)         /**< Even parity        */
 #define USART_PAR_ODD         (0x01ul << 9)         /**< Odd parity         */
 #define USART_PAR_SPACE       (0x02ul << 9)         /**< Space parity
                                                          (forced to 0)      */
 #define USART_PAR_MARK        (0x03ul << 9)         /**< Mark parity
                                                          (forced to 1)      */
 #define USART_PAR_NO          (0x04ul << 9)         /**< No parity          */
 #define USART_PAR_MULTIDROP   (0x06ul << 9)         /**< Multi Drop parity  */

/** NBSTOP : Number of Stop Bits                                             */
 #define USART_NBSTOP_MASK     (0x03ul << 12)        /**< NBSTOP Mask        */
 #define USART_NBSTOP(val)     (((val) & 0x03ul) << 12) /**< Writing Macro   */
 #define USART_NBSTOP_1        (0x00ul << 12)        /**< 1 Stop bit         */
 #define USART_NBSTOP_15       (0x01ul << 12)        /**< 1.5 Stop bit       */
 #define USART_NBSTOP_2        (0x02ul << 12)        /**< 2 Stop bit         */

/** CHMODE : Channel Mode                                                    */
 #define USART_CHMODE_MASK     (0x03ul << 14)   /**< CHMODE Mask             */
 #define USART_CHMODE(val)     (((val) & 0x03ul) << 14) /**< Writing Macro   */
 #define USART_CHMODE_NORMAL   (0x00ul << 14)   /**< Normal channel          */
 #define USART_CHMODE_AUTO     (0x01ul << 14)   /**< Automatic echo channel  */
 #define USART_CHMODE_LOCAL    (0x02ul << 14)   /**< Local loop back channel */
 #define USART_CHMODE_REMOTE   (0x03ul << 14)   /**< Remote loop back channel*/

 #define USART_SMCARDPT        (0x01ul << 16)   /**< Smart Card Protocol     */

/** MODE9 : 9-Bit Character Length                                           */
 #define USART_MODE8           (0x00ul << 17)    /**< 8-Bits Mode            */
 #define USART_MODE9           (0x01ul << 17)    /**< 9-Bits Mode            */

/** CLKO : Clock Output Select                                               */
 #define USART_CLKO            (0x01ul << 18)    /**< Clock Output           */
 #define USART_CLKI            (0x00ul << 18)    /**< Clock Input            */

 #define USART_LIN1_2          (0x00ul << 19) /**<Local Interconnect Network
                                                  1.2 mode*/
 #define USART_LIN2_0          (0x01ul << 19) /**<Local Interconnect Network
                                                  2.0 mode*/
 #define USART_DFSB            (0x01ul << 20) /**< DataFrame Start Bit       */

/******************************************************************************
* IMSCR, RISR, MISR, ICR: USART Interrupt Registers
******************************************************************************/
 #define USART_RXBRK           (0x01ul << 2)     /**< Receiver break         */
 #define USART_OVRE            (0x01ul << 5)     /**< Overrun Error          */
 #define USART_FRAME           (0x01ul << 6)     /**< Framing Error          */
 #define USART_PARE            (0x01ul << 7)     /**< Parity Error           */
 #define USART_IDLE            (0x01ul << 10)    /**< IDLE (J1708 Protocol)  */
 #define USART_RXRIS           (0x01ul << 12)    /**< RX FIFO INT  */
 #define USART_RORRIS          (0x01ul << 13)    /**< RX FIFO OVER INT  */
 #define USART_TXRIS           (0x01ul << 14)    /**< TX FIFO INT  */
 #define USART_ENDHEADER       (0x01ul << 24)    /**< End of Header occurred
                                                      on a LIN Frame         */
 #define USART_ENDMESS         (0x01ul << 25)    /**< End of Message occurred
                                                      on a LIN Frame         */
 #define USART_NOTRESP         (0x01ul << 26)    /**< Not Responding detected
                                                      on a LIN Frame         */
 #define USART_BITERROR        (0x01ul << 27)    /**< Bit Error detectedon a
                                                     LIN Frame               */
 #define USART_IPERROR         (0x01ul << 28)    /**< Identity Parity Error
                                                     detectedon a LIN Frame  */
 #define USART_CHECKSUM        (0x01ul << 29)    /**< Checksum error detected
                                                     on a LIN Frame          */
 #define USART_WAKEUP          (0x01ul << 30)    /**< Wake up detected       */

/** SR, IER, IDR, IMR Registers Only                                         */
 #define USART_RXRDY           (0x01ul << 0)     /**< Receiver ready         */
 #define USART_TXRDY           (0x01ul << 1)     /**< Transmitter ready      */
 #define USART_TIMEOUT         (0x01ul << 8)     /**< Receiver time out      */
 #define USART_TXEMPTY         (0x01ul << 9)     /**< Transmitter empty      */


/** SR Register Only                                                         */
 #define USART_IDLEFLAG        (0x01ul << 11)    /**< IDLE Flag
                                                      (J1708 Protocol)       */

/******************************************************************************
* RHR : USART Receiver Holding Register
******************************************************************************/
 #define USART_RXCHR_MASK     (0x1FFul << 0)     /**< Received Character Mask*/

/******************************************************************************
* THR : USART Transmit Holding Register
******************************************************************************/
 #define USART_TXCHR_MASK (0x1FFul << 0)         /**< Character to be
                                                      transmitted Mask       */

/******************************************************************************
* BRGR : USART Baud Rate Generator Register
******************************************************************************/
/** CD : Clock Divisor                                                       */
 #define USART_CD_MASK       (0xFFFFul << 0)     /**< CD Mask                */
 #define USART_CD(val)       ((0xFFFFul & val) << 0) /**< Writing macro      */

 #define USART_CD_DISABLE    (0x00000ul)         /**< Disable Clock          */
 #define USART_CD_BYPASS     (0x00001ul)         /**< Clock Divisor Bypass   */

/******************************************************************************
* RTOR : Receiver Time-out Register
******************************************************************************/
 #define USART_TO_MASK      (0xFFFFul << 0)    /**< Time-out value Mask      */
 #define USART_TO(val)      ((0xFFFFul & val) << 0)  /**< Writing macro      */
 #define USART_TO_DISABLE   (0x0000ul)         /**< Disable Receiver Time-out*/

/******************************************************************************
* TTGR : Transmit Time-guard Register
******************************************************************************/
 #define USART_TG_MASK        (0xFFul << 0)   /**< Time-guard value Mask     */
 #define USART_TG(val)        ((0xFFul & val) << 0) /**< Writing macro       */
 #define USART_TG_DISABLE     (0x00ul << 0)   /**< Disable Transmit
                                                   Time-guard                */
/******************************************************************************
* LIR : LIN Identifier Register
******************************************************************************/
 #define USART_IDENTIFIER_MASK (0x3Ful << 0)  /**< LIN's IDENTIFER Mask      */
 #define USART_IDENTIFIER(val) ((0x3F & val) << 0) /**< Writing macro        */

 #define USART_NDATA_MASK (0x07ul << 6)       /**< LIN's IDENTIFER Mask      */
 #define USART_NDATA(val) ((0x07ul & val) << 6) /**< Writing macro           */
 #define USART_NDATA_1    (0x00ul << 6)       /**< 1 Data Field selection    */
 #define USART_NDATA_2    (0x01ul << 6)       /**< 2 Data Fields selection   */
 #define USART_NDATA_3    (0x02ul << 6)       /**< 3 Data Fields selection   */
 #define USART_NDATA_4    (0x03ul << 6)       /**< 4 Data Fields selection   */
 #define USART_NDATA_5    (0x04ul << 6)       /**< 5 Data Fields selection   */
 #define USART_NDATA_6    (0x05ul << 6)       /**< 6 Data Fields selection   */
 #define USART_NDATA_7    (0x06ul << 6)       /**< 7 Data Fields selection   */
 #define USART_NDATA_8    (0x07ul << 6)       /**< 8 Data Fields selection   */

 #define USART_CHK_SEL    (0x01ul << 9)       /**< LIN's 2.0 Checksum
                                                   selection                 */
 #define USART_WAKE_UP_TIME_MASK (0x3FFFul << 16) /**< LIN's 2.0 Wake
                                                       Up time Mask          */
 #define USART_WAKE_UP_TIME(val) ((0x3FFFul & val) << 16) /**< Writing macro */

/******************************************************************************
* DFWR0, DFWR1, DFRR0, DFRR1 : Data Field Register
******************************************************************************/
 #define USART_DATA0_MASK     (0xFFul << 0)  /**< LIN byte field transmitted */
 #define USART_DATA0(val)     (((val) & 0xFFul) << 0)  /**< Writing Macro    */
 #define USART_DATA1_MASK     (0xFFul << 8)  /**< LIN byte field transmitted */
 #define USART_DATA1(val)     (((val) & 0xFFul) << 8)  /**< Writing Macro    */
 #define USART_DATA2_MASK     (0xFFul << 16) /**< LIN byte field transmitted */
 #define USART_DATA2(val)     (((val) & 0xFFul) << 16) /**< Writing Macro    */
 #define USART_DATA3_MASK     (0xFFul << 24) /**< LIN byte field transmitted */
 #define USART_DATA3(val)     (((val) & 0xFFul) << 24) /**< Writing Macro    */
 #define USART_DATA4_MASK     (0xFFul << 0)  /**< LIN byte field transmitted */
 #define USART_DATA4(val)     (((val) & 0xFFul) << 0)  /**< Writing Macro    */
 #define USART_DATA5_MASK     (0xFFul << 8)  /**< LIN byte field transmitted */
 #define USART_DATA5(val)     (((val) & 0xFFul) << 8)  /**< Writing Macro    */
 #define USART_DATA6_MASK     (0xFFul << 16) /**< LIN byte field transmitted */
 #define USART_DATA6(val)     (((val) & 0xFFul) << 16) /**< Writing Macro    */
 #define USART_DATA7_MASK     (0xFFul << 24) /**< LIN byte field transmitted */
 #define USART_DATA7(val)     (((val) & 0xFFul) << 24) /**< Writing Macro    */

/******************************************************************************
* SBLR : Sync Break Length Register
******************************************************************************/
 #define USART_SYNC_BRK_MASK   (0x1Ful << 0)     /**< Sync Break Length Mask */
 #define USART_SYNC_BRK(val)   ((0x1Ful & val) << 0) /**< Writing macro      */

/******************************************************************************
* LCPx : Sync Break Length Register
******************************************************************************/
 #define USART_LCP00_MASK       (0xFFul << 0)     /**< LCP0 Mask              */
 #define USART_LCP00(val)       ((0xFFul & val) << 0) /**< Writing macro      */
 #define USART_LCP01_MASK       (0xFFul << 8)     /**< LCP0 Mask              */
 #define USART_LCP01(val)       ((0xFFul & val) << 8) /**< Writing macro      */
 #define USART_LCP02_MASK       (0xFFul << 16)    /**< LCP0 Mask              */
 #define USART_LCP02(val)       ((0xFFul & val) << 16)/**< Writing macro      */
 #define USART_LCP03_MASK       (0xFFul << 24)    /**< LCP0 Mask              */
 #define USART_LCP03(val)       ((0xFFul & val) << 24)/**< Writing macro      */
 #define USART_LCP04_MASK       (0xFFul << 0)     /**< LCP0 Mask              */
 #define USART_LCP04(val)       ((0xFFul & val) << 0) /**< Writing macro      */
 #define USART_LCP05_MASK       (0xFFul << 8)     /**< LCP0 Mask              */
 #define USART_LCP05(val)       ((0xFFul & val) << 8) /**< Writing macro      */
 #define USART_LCP06_MASK       (0xFFul << 16)    /**< LCP0 Mask              */
 #define USART_LCP06(val)       ((0xFFul & val) << 16)/**< Writing macro      */
 #define USART_LCP07_MASK       (0xFFul << 24)    /**< LCP0 Mask              */
 #define USART_LCP07(val)       ((0xFFul & val) << 24)/**< Writing macro      */


/******************************************************************************
************************** USART Macros Definition ****************************
******************************************************************************/
/* PER, PDR, PSR : USART PIO Registers                                       */
/** Set PER register (Enable)                                                */
 #define CSP_USART_SET_PER(usart, val)  ((usart)->PER = (val))
/** Set PDR register (Disable)                                               */
 #define CSP_USART_SET_PDR(usart, val)  ((usart)->PDR = (val))
/** Get PSR register (Disable)                                               */
 #define CSP_USART_GET_PSR(usart)       ((usart)->PSR)

/* OER, ODR, OSR : USART Output Registers                                    */
/** Set OER register (Enable)                                                */
 #define CSP_USART_SET_OER(usart, val)  ((usart)->OER = (val))
/** Set ODR register (Disable)                                               */
 #define CSP_USART_SET_ODR(usart, val)  ((usart)->ODR = (val))
/** Get OSR register (Status)                                                */
 #define CSP_USART_GET_OSR(usart)       ((usart)->OSR)

/* SODR, CODR, ODSR, PDSR : USART Output Data Registers                      */
/** Set SODR register (Set)                                                  */
 #define CSP_USART_SET_SODR(usart, val) ((usart)->SODR = (val))
/** Set CODR register (Clear)                                                */
 #define CSP_USART_SET_CODR(usart, val) ((usart)->CODR = (val))
/** Get ODSR register (Status)                                               */
 #define CSP_USART_GET_ODSR(usart)      ((usart)->ODSR)
/** Get PDSR register (Pin Status)                                           */
 #define CSP_USART_GET_PDSR(usart)      ((usart)->PDSR)

/* MDER, MDDR, MDSR : USART Multi-Driver Registers                           */
/** Set MDER register (Enable)                                               */
 #define CSP_USART_SET_MDER(usart, val) ((usart)->MDER = (val))
/** Set MDDR register (Disable)                                              */
 #define CSP_USART_SET_MDDR(usart, val) ((usart)->MDDR = (val))
/** Set MDSR register (Status)                                               */
 #define CSP_USART_GET_MDSR(usart)      ((usart)->MDSR)

///////////////////////////////////////////////////////////////////////////////
/* IDR : USART ID register                               */
/** Get IDR register (Status)                                               */
 #define CSP_USART_GET_IDR(usart)      ((usart)->IDR)

/* CEDR : USART Clock Enable/Disable Registers                               */
/** Set CEDR register                                                        */
 #define CSP_USART_SET_CEDR(usart, val)  ((usart)->CEDR = (val))
/** Get CEDR register (Status)                                               */
 #define CSP_USART_GET_CEDR(usart)      ((usart)->CEDR)

/* SRR : USART Software Register	                                     */
/** Set SRR register                                                        */
 #define CSP_USART_SET_SRR(usart, val)  ((usart)->SRR = (val))

/* CR : USART Control Register                                               */
/** Set CR register (Control Register)                                       */
 #define CSP_USART_SET_CR(usart, val)   ((usart)->CR = (val))

/** MR : USART Mode Register                                                 */
/** Set MR register (Mode Register)                                          */
 #define CSP_USART_SET_MR(usart, mode)  ((usart)->MR = (mode))
/** Get MR register (Mode Register)                                          */
 #define CSP_USART_GET_MR(usart)        ((usart)->MR)


/* IMSCR, RISR, MISR, ICR: USART Interrupt Registers                          */
/** Set IMSCR register 			                                      */
 #define CSP_USART_SET_IMSCR(usart, val)  ((usart)->IMSCR = (val))
/** Get IMSCR register (Status Interrupt)                                      */
 #define CSP_USART_GET_IMSCR(usart)       ((usart)->IMSCR)

/** Get RISR register (Status Interrupt)                                      */
 #define CSP_USART_GET_RISR(usart)       ((usart)->RISR)

/** Get MISR register (Status Interrupt)                                      */
 #define CSP_USART_GET_MISR(usart)       ((usart)->MISR)

/** Set ICR register 			                                      */
 #define CSP_USART_SET_ICR(usart, val)  ((usart)->ICR = (val))

/* SR : USART Status Register                                           */
/** Get SR register (Status Register)                                        */
 #define CSP_USART_GET_SR(usart)        ((usart)->SR)

/* RHR : USART Receive Holding Register                                      */
/** Get RHR register (Receiver Holding)                                      */
 #define CSP_USART_GET_RHR(usart)       ((usart)->RHR)

/* THR : USART Transmit Holding Register                                     */
/** Set THR register (Transmit Holding)                                      */
 #define CSP_USART_SET_THR(usart, val)  ((usart)->THR = (val))

/* BRGR : USART Baud Rate Generator Register                                 */
/** Get BRGR register (Baud Rate Generator)                                  */
 #define CSP_USART_GET_BRGR(usart)      ((usart)->BRGR)
/** Set THR register (Baud Rate Generator)                                   */
 #define CSP_USART_SET_BRGR(usart, val) ((usart)->BRGR = (val))

/* RTOR : USART Receiver Time-out Register                                   */
/** Get RTOR register (Receiver Time-out)                                    */
 #define CSP_USART_GET_RTOR(usart)      ((usart)->RTOR)
/** Set RTOR register (Receiver Time-out)                                    */
 #define CSP_USART_SET_RTOR(usart, val) ((usart)->RTOR = (val))

/* TTGR : USART Transmitter Time-guard Register                              */
/** Get TTGR register (Transmitter Time-out)                                 */
 #define CSP_USART_GET_TTGR(usart)      ((usart)->TTGR)
/** Set TTGR register (Transmitter Time-out)                                 */
 #define CSP_USART_SET_TTGR(usart, val) ((usart)->TTGR = (val))

/* LIR : USART LIN Identifier Register                                       */
/** Set LIR register (LIN Identifier)                                        */
 #define CSP_USART_GET_LIR(usart)       ((usart)->LIR)
/** Get LIR register (LIN Identifier)                                        */
 #define CSP_USART_SET_LIR(usart, val)  ((usart)->LIR = (val))

/* DFWR0 : USART Data Field Write 0 Register                                 */
/** Get DFWR0 register (USART Data Field Write 0)                            */
 #define CSP_USART_GET_DFWR0(usart)        ((usart)->DFWR0)
/** Set DFWR0 register (USART Data Field Write 0)                            */
 #define CSP_USART_SET_DFWR0(usart, val)   ((usart)->DFWR0 = (val))

/* DFWR1 : USART Data Field Write 1 Register                                 */
/** Get DFWR1 register (USART Data Field Write 1)                            */
 #define CSP_USART_GET_DFWR1(usart)        ((usart)->DFWR1)
/** Set DFWR1 register (USART Data Field Write 1)                            */
 #define CSP_USART_SET_DFWR1(usart, val)   ((usart)->DFWR1 = (val))

/* DFRR0 : USART Data Field Read 0 Register                                  */
/** Get DFRR0 register (USART Data Field Read 0)                             */
 #define CSP_USART_GET_DFRR0(usart)        ((usart)->DFRR0)

/* DFRR1 : USART Data Field Read 1 Register                                  */
/** Get DFRR1 register (USART Data Field Read 1)                             */
 #define CSP_USART_GET_DFRR1(usart)        ((usart)->DFRR1)

/* SBLR : USART Sync Break Length Register                                   */
/** Get SBLR register (USART Sync Break Length)                              */
 #define CSP_USART_GET_SBLR(usart)         ((usart)->SBLR)
/** Set SBLR register (USART Sync Break Length)                              */
 #define CSP_USART_SET_SBLR(usart, val)    ((usart)->SBLR = (val))

/* LCPx : USART Limit Counter Protocol Register                              */
/** Get LCP1 register                                                        */
 #define CSP_USART_GET_LCP1(usart)         ((usart)->LCP1)
/** Set LCP1 register                                                        */
 #define CSP_USART_SET_LCP1(usart, val)    ((usart)->LCP1 = (val))
/** Get LCP1 register                                                        */
 #define CSP_USART_GET_LCP2(usart)         ((usart)->LCP2)
/** Set LCP1 register                                                        */
 #define CSP_USART_SET_LCP2(usart, val)    ((usart)->LCP2 = (val))
 
/******************************************************************************
******************** USART External Variables              *********************
******************************************************************************/
typedef enum
{
	IO_USART0 = 0,
}USART_NUM_TypeDef;
typedef enum
{
	CLK_PB07 = 0,
    CLK_PA05 = 1,
}USART_CLKNUM_TypeDef;
typedef enum
{
    RSTRX = 2,
    RSTTX = 3,
	RXEN = 4,
	RXDIS = 5,
	TXEN = 6,
	TXDIS = 7,
	STTBRK = 9,
	STPBRK = 10,
	STTTO =11,
	SENDA = 12,
	FIFO_EN = 13,
	
}USART_CTRL_TypeDef;

typedef enum
{
    FIFO1_8 = 1,
	FIFO1_4 = 2,
	FIFO1_2 = 4,
	
}USART_FIFO_TypeDef;

typedef enum
{
    RXRDY_INT = 0,
    TXRDY_INT = 1,
	RXBRK_INT = 2,
	OVER_INT = 5,
	FRAME_INT = 6,
	PARE_INT = 7,
	TIMEOUT_INT = 8,
	TXEMPTY_INT = 9,
	IDLE_INT = 10,
	RXRIS_INT = 12,
	RORRIS_INT = 13,
	TXRIS_INT = 14,
}USART_INT_TypeDef;

typedef enum
{
    SENDTIME0 = 0<<1,       //cl
    SENDTIME1 = 1<<1,
	SENDTIME2 = 2<<1,
	SENDTIME3 = 3<<1,
	SENDTIME4 = 4<<1,
	SENDTIME5 = 5<<1,
	SENDTIME6 = 6<<1,
	SENDTIME7 = 7<<1,
}USART_SENDTIME_TypeDef;

typedef enum
{
	PCLK	=0<<4,
	PCLK_DIV8	=1<<4,
}USART_CLKS_TypeDef;

typedef enum
{
	CHRL5	=0<<6,
	CHRL6	=1<<6,
	CHRL7	=2<<6,
	CHRL8	=3<<6,
	CHRL9	=1<<17,
}USART_CHRL_TypeDef;

typedef enum
{
	ASYNC	=0<<8,		//异步
	SYNC	=1<<8,		//同步
}USART_SYNC_TypeDef;


typedef enum
{
	PAR_EVEN	=0<<9,			//偶校验位
	PAR_ODD		=1<<9,			//奇校验位
	PAR_SPACE	=2<<9,			//0校验位
	PAR_MARK	=3<<9,			//1校验位
	PAR_NONE	=4<<9,			//无校验位
	PAR_MULTIDROP	=6<<9,		//multi-drop模式
}USART_PAR_TypeDef;


typedef enum
{
	NBSTOP1	 =0<<12,
	NBSTOP1_5 =1<<12,
	NBSTOP2	 =2<<12,
	NBSTOP_Reserve =3<<12,
}USART_NBSTOP_TypeDef;

typedef enum
{
	CHMODE_NORMAL	 =0<<14,
	CHMODE_AUTO		 =1<<14,
	CHMODE_LOCAL	 =2<<14,
	CHMODE_ROMOTE	=3<<14,
}USART_CHMODE_TypeDef;

typedef enum
{
	LSBtoMSB	 =0<<20,
	MSBtoLSB	 =1<<20,
}USART_DSB_TypeDef;

/******************************************************************************
******************** USART External Functions Declaration *********************
******************************************************************************/
extern void USART_DeInit(void);
extern void USART_Int_Enable(void);
extern void USART_Int_Disable(void);
extern void USART_WakeUp_Enable(void);
extern void USART_WakeUp_Disable(void);
extern void USART_IO_Init(USART_NUM_TypeDef IO_USART_NUM , U8_T USART_IO_G);
extern void USART_CLKIO_Init(USART_CLKNUM_TypeDef USART_CLKIO_G);
extern void USART_Software_Reset(void);
extern void USART_CLK_Disable(void);
extern void USART_CLK_Enable(void);
extern void USART_INT_Config(USART_INT_TypeDef int_type,FunctionalStatus newState);
extern void USART_INT_RegConfig(U32_T INT_RegVal);
extern void USART_MODE_Config(USART_SENDTIME_TypeDef SENDTIME_DATA,USART_CLKS_TypeDef CLKS_DATA, USART_CHRL_TypeDef CHRL_DATA,
						USART_SYNC_TypeDef SYNC_DATA,USART_PAR_TypeDef PAR_DAT,USART_NBSTOP_TypeDef NBSTOP_DATA,USART_CHMODE_TypeDef CHMODE_DATA);
extern void USART_CTRL_Config(USART_CTRL_TypeDef CTRL_DATA,FunctionalStatus newState);
extern void USART_DSB_Config(USART_DSB_TypeDef DSB_DATA);
extern void USART_SAMRTCARD_Config(FunctionalStatus newState);
extern void USART_CLKO_Config(FunctionalStatus newState);
extern void USART_Baudrate_Cal(unsigned int rate,unsigned int PCLK_Val,USART_CLKS_TypeDef CLKS_DATA,USART_SYNC_TypeDef SYNC_DATA);
extern void USART_TGTO_Config(U8_T timeOut_u8,U8_T timeGuard_u8);
extern void USART_TxByte(U16_T TXdata_u8);
extern void USARTTransmit(U16_T *sourceAddress_u16,U16_T length_u16);
extern U16_T USARTRxByte(CSP_UART_T *uart,U16_T *Rxdata_u16);
extern U16_T USART_ReturnRxByte(void);
extern U16_T USARTReceive(U16_T *destAddress_u16,U16_T length_u16);						
extern void USART_FIFO_CMD(USART_FIFO_TypeDef FIFO1_X,FunctionalStatus newState);
#endif   /**< apt32f172_usart_H */
/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/
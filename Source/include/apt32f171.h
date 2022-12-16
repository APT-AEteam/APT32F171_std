/*
  ******************************************************************************
  * @file    apt32f171.h
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
#ifndef _apt32f171_H
#define _apt32f171_H

/* Includes ------------------------------------------------------------------*/
#include "apt32f171_types_local.h"
#include "apt32f171_ck802.h"

/******************************************************************************/
/*                          IP registers structures                           */
/******************************************************************************/
/**
  * @brief  CPU Internal Structure
  */
typedef struct {
	volatile unsigned int ReservedA[4];		//0xE000E000
	volatile unsigned int CORET_CSR;			//0xE000E010
	volatile unsigned int CORET_RVR;			//0xE000E014
	volatile unsigned int CORET_CVR;			//0xE000E018
	volatile unsigned int ReservedB[57];		//0xE000E020
	volatile unsigned int ISER;				//0xE000E100
	volatile unsigned int ReservedC[15];		//
	volatile unsigned int IWER;				//0xE000E140
	volatile unsigned int ReservedD[15];		//
	volatile unsigned int ICER;				//0xE000E180
	volatile unsigned int ReservedE[15];		//
	volatile unsigned int IWDR;				//0xE000E1C0
	volatile unsigned int ReservedF[15];		//
	volatile unsigned int ISPR;				//0xE000E200
	volatile unsigned int ReservedG[31];		//
	volatile unsigned int ICPR;				//0xE000E280
	volatile unsigned int ReservedH[31];		//
	volatile unsigned int IABR;				//0xE000E300
	volatile unsigned int ReservedI[63];		//
	volatile unsigned int IPR[8];			//0xE000E400 ~ 0xE000E41C
	volatile unsigned int ReservedJ[504];	//
	volatile unsigned int ISR; 				//0xE000EC00
	volatile unsigned int IPTR; 				//0xE000EC04
}CSP_CK802_T;

/**
@brief IFC bits Structure
*/
typedef volatile struct {
	volatile unsigned int IDR ;
	volatile unsigned int CEDR ;
	volatile unsigned int SRR ;
	volatile unsigned int CMR ;
	volatile unsigned int CR ;
	volatile unsigned int MR ;
	volatile unsigned int FM_ADDR ;
	volatile unsigned int Reserved ;
	volatile unsigned int KR ;
	volatile unsigned int IMCR ;
	volatile unsigned int RISR ;
	volatile unsigned int MISR ;
	volatile unsigned int ICR ;
} CSP_IFC_T ;



/**
  * @brief  ETCB Structure
  */
typedef volatile struct                          //cl
{
    volatile unsigned int  EN;            /* ETCB Enable                            */
    volatile unsigned int  SWTRG;         /* ETCB Software Trigger Generator         */
    volatile unsigned int  CH0CON0;       /* ETCB Channel 0 Control Register 0       */
    volatile unsigned int  CH0CON1;       /* ETCB Channel 0 Control Register 1       */
    volatile unsigned int  CH1CON0;       /* ETCB Channel 1 Control Register 0       */
    volatile unsigned int  CH1CON1;       /* ETCB Channel 1 Control Register 1       */
    volatile unsigned int  CH2CON0;       /* ETCB Channel 2 Control Register 0       */
    volatile unsigned int  CH2CON1;       /* ETCB Channel 2 Control Register 1       */
	volatile unsigned int  _RSVD0;
	volatile unsigned int  _RSVD1;
	volatile unsigned int  _RSVD2;
	volatile unsigned int  _RSVD3;
    volatile unsigned int  CH3_31CON[29];       /*  ETCB Channel 3 Control Register        */

	
} CSP_ETCB_T, *CSP_ETCB_PTR;



/**
  * @brief  BT Structure
  */
typedef struct                                 //cl
{
   volatile unsigned int	RSSR;  		//0x0000	Reset/Start Control
   volatile unsigned int	CR;		    //0x0004	General Control
   volatile unsigned int	PSCR;		//0x0008	Prescaler
   volatile unsigned int	PRDR; 		//0x000C	Period
   volatile unsigned int	CMP;		//0X0010
   volatile unsigned int	CNT;		//0x0014	Counter
   volatile unsigned int	EVTRG;		//0x0018	Event Trigger
   volatile unsigned int	EVPS;   	//0x001C	Event Prescaler
   volatile unsigned int	EVCNTINTI;  //0x0020	Event Counter
   volatile unsigned int   EVSWF;      //0x0024    Software force Event Trigger
   volatile unsigned int	RISR;   	//0x0028    
   volatile unsigned int	IMCR;     	//0x002C
   volatile unsigned int	MISR;  		//0x0030
   volatile unsigned int	ICR;    	//0x0034
} CSP_BT_T, *CSP_BT_PTR; 



/**
@brief EPT0    bits Structure
*/   
 typedef struct
 {
   volatile unsigned int	CEDR;  		//0x0000	Clock control & ID
   volatile unsigned int	RSSR;		//0x0004	Start & Stop Ctrl
   volatile unsigned int	PSCR;		//0x0008	Clock prescaler
   volatile unsigned int	CR;  		//0x000C	Control register
   volatile unsigned int	SYNCR;		//0x0010	Synchronization control reg
   volatile unsigned int	GLDCR;		//0x0014	Global load control reg
   volatile unsigned int	GLDCFG; 	//0x0018	Global load config
   volatile unsigned int	GLDCR2;		//0x001C	Global load control reg2
   volatile unsigned int    HRCFG;      //0x0020
   volatile unsigned int	PRDR;   	//0x0024	Period reg
   volatile unsigned int	PHSR;     	//0x0028	Phase control reg
   volatile unsigned int	CMPA;  		//0x002C	Compare Value A
   volatile unsigned int	CMPB;   	//0x0030	Compare Value B
   volatile unsigned int	CMPC;     	//0x0034	Compare Value C 
   volatile unsigned int	CMPD;  		//0x0038	Compare Value D
   volatile unsigned int	CMPLDR;	    //0x003C	Cmp reg load control
   volatile unsigned int	CNT;      	//0x0040	Counter reg
   volatile unsigned int	AQLDR; 		//0x0044	AQ reg load control
   volatile unsigned int	AQCRA;      //0x0048	Action qualify of ch-A
   volatile unsigned int	AQCRB;    	//0x004C	Action qualify of ch-B
   volatile unsigned int	AQCRC; 		//0x0050	Action qualify of ch-C
   volatile unsigned int	AQCRD;  	//0x0054	Action qualify of ch-D
   volatile unsigned int	AQTSCR;   	//0x0058	T event selection
   volatile unsigned int	AQOSF; 		//0x005C	AQ output one-shot software forcing
   volatile unsigned int	AQCSF;      //0x0060	AQ output conti-software forcing
   volatile unsigned int	DBLDR;    	//0x0064	Deadband control reg load control
   volatile unsigned int	DBCR;       //0x0068	Deadband control reg
   volatile unsigned int	DPSCR;		//0x006C	Deadband clock prescaler
   volatile unsigned int	DBDTR;		//0x0070	Deadband rising delay control
   volatile unsigned int	DBDTF; 		//0x0074	Deadband falling delay control
   volatile unsigned int	CPCR;  		//0x0078	Chop control
   volatile unsigned int	EMSRC; 		//0x007C	EM source setting
   volatile unsigned int	EMSRC2;		//0x0080	EM source setting
   volatile unsigned int	EMPOL; 		//0x0084	EM polarity setting
   volatile unsigned int	EMECR; 		//0x0088	EM enable control
   volatile unsigned int	EMOSR;     	//0x008C	EM trip out status setting
   volatile unsigned int	Reserved;	//0x0090	Reserved
   volatile unsigned int	EMSLSR;     //0x0094	Softlock status
   volatile unsigned int	EMSLCLR;    //0x0098	Softlock clear
   volatile unsigned int   EMHLSR;     //0x009C    Hardlock status
   volatile unsigned int   EMHLCLR;    //0x00A0    Hardlock clear
   volatile unsigned int   EMFRCR;     //0x00A4    Software forcing EM
   volatile unsigned int   EMRISR;     //0x00A8    EM RISR
   volatile unsigned int   EMMISR;     //0x00AC    EM MISR
   volatile unsigned int   EMIMCR;     //0x00B0    EM masking enable
   volatile unsigned int   EMICR;      //0x00B4    EM pending clear
   volatile unsigned int   TRGFTCR;    //0x00B8    Trigger Filter control reg
   volatile unsigned int   TRGFTWR;    //0x00BC    Trigger filter window
   volatile unsigned int   EVTRG;      //0x00C0    Event trigger setting
   volatile unsigned int   EVPS;       //0x00C4    Event presaler
   volatile unsigned int   EVCNTINIT;     //0x00C8    
   volatile unsigned int   EVSWF;      //0x00CC    Event software forcing
   volatile unsigned int   RISR;       //0x00D0    Interrupt RISR
   volatile unsigned int   MISR;       //0x00D4    Interrupt MISR
   volatile unsigned int   IMCR;       //0x00D8    Interrupt IMCR
   volatile unsigned int   ICR;        //0x00DC    Interrupt clear
   volatile unsigned int   REGLINK;    //0x00E0    Register link
   volatile unsigned int   REGLINK2;   //0x00E4    Register link2
   volatile unsigned int   REGPROT;    //0x00E8    Register protection
} CSP_EPT_T, *CSP_EPT_PTR; 


/**
@brief WWDT     bits Structure
*/ 	
 typedef struct
 {
	 volatile unsigned int	CR;
	 volatile unsigned int	CFGR;
	 volatile unsigned int	RISR;
	 volatile unsigned int MISR;
	 volatile unsigned int	IMCR;
	 volatile unsigned int	ICR;
 }CSP_WWDT_T,*CSP_WWDT_PTR;
 
/**
  * @brief  CMP Structure
  */
 typedef struct
 {
    CSP_REGISTER_T      CEDR;           /**< ID and Clock Control Register    */
    CSP_REGISTER_T      CR0;            /**< Control Register0                */
    CSP_REGISTER_T      CR1;            /**< Control Register1                */
    CSP_REGISTER_T      CR2;            /**< Control Register2                */
    CSP_REGISTER_T      CR3;            /**< Control Register3                */
    CSP_REGISTER_T      CR4;            /**< Control Register4                */
	CSP_REGISTER_T      CR5;            /**< Control Register5                */
    CSP_REGISTER_T      FLTCR0;         /**< Filter Control Register0         */
    CSP_REGISTER_T      FLTCR1;         /**< Filter Control Register1         */
    CSP_REGISTER_T      FLTCR2;         /**< Filter Control Register2         */
    CSP_REGISTER_T      FLTCR3;         /**< Filter Control Register3         */
    CSP_REGISTER_T      FLTCR4;         /**< Filter Control Register4         */
	CSP_REGISTER_T      FLTCR5;         /**< Filter Control Register5         */
    CSP_REGISTER_T      WCNT0;          /**< Capture Window Control Register0 */
    CSP_REGISTER_T      WCNT1;          /**< Capture Window Control Register1 */
    CSP_REGISTER_T      WCNT2;          /**< Capture Window Control Register2 */
    CSP_REGISTER_T      INPCR0;         /**< Input Config Register            */
    CSP_REGISTER_T      INPCR1;         /**< Input Config Register            */
    CSP_REGISTER_T      INPCR2;         /**< Input Config Register            */
    CSP_REGISTER_T      INPCR3;         /**< Input Config Register            */
    CSP_REGISTER_T      INPCR4;         /**< Input Config Register            */
	CSP_REGISTER_T      INPCR5;         /**< Input Config Register            */
    CSP_REGISTER_T      TRGCR;          /**< Trigger Config Register          */
    CSP_REGISTER_T      IMCR;           /**< Interrupt Masking Control Reg.   */
    CSP_REGISTER_T      RISR;           /**< Raw Interrupt Status Reg.        */
    CSP_REGISTER_T      MISR;           /**< Masked Interrupt Status Reg.     */
    CSP_REGISTER_T      ICR;            /**< Interrupt Clear Register         */
	CSP_REGISTER_T      VOLSEL;         /**< Ref Vol Select            */
 } CSP_CMP_T, *CSP_CMP_PTR;

/**
@brief CRC     bits Structure
*/ 
typedef struct
{
   volatile unsigned int  IDR;             /**< ID Register	                     */
   volatile unsigned int  CEDR;            /**< Clock Enable/Disable Register	     */
   volatile unsigned int  SRR;             /**< Software Reset Register	     */
   volatile unsigned int  CR;              /**< Control Register	             */
   volatile unsigned int  SEED;            /**< Seed Value Register	             */
   volatile unsigned int  DATAIN;          /**< Data in Value Register	             */
   volatile unsigned int  DATAOUT;         /**< Data out Value Register	     */
  //  TBD... //
} CSP_CRC_T, *CSP_CRC_PTR;

/**
@brief HWD     bits Structure
*/ 	
 typedef struct
 {
	 volatile S32_T	DIVIDENT;
	 volatile S32_T	DIVISOR;
	 volatile S32_T	QUOTIENT;
	 volatile S32_T	REMAIN;
	 volatile unsigned int	CR;
 }CSP_HWD_T,*CSP_HWD_PTR; 

/**
  * @brief  OAMP Structure
  */
 typedef struct
 {
    CSP_REGISTER_T      CR;            /**< OAMP0 Control Register                */
 } CSP_OAMP_T, *CSP_OAMP_PTR;

/**
@brief SYSCON bits Structure
*/
typedef volatile struct {                   			/*!< SYSCON Structure                         */
	volatile unsigned int IDCCR;                        /*!< 0x000: Identification & System Controller Clock Control Register */
	volatile unsigned int GCER;                         /*!< 0x004: System Controller General Control Enable Register */
	volatile unsigned int GCDR;                         /*!< 0x008: System Controller General Control Disable Register */
	volatile unsigned int GCSR;                         /*!< 0x00C: System Controller General Control Status Register */
	volatile unsigned int CKST;                         /*!< 0x010*/
	volatile unsigned int RAMCHK;                       /*!< 0x014*/
	volatile unsigned int EFLCHK;                       	/*!< 0x018*/
	volatile unsigned int SCLKCR;                       /*!< 0x01C: System Controller System Clock Selection & Division Register */
	volatile unsigned int PCLKCR;                       /*!< 0x020: System Controller Peripheral Clock Selection & Division Register */
	volatile unsigned int _RSVD0;                       /*!< 0x024*/
	volatile unsigned int PCER0;                        /*!< 0x028: System Controller Peripheral Clock Enable Register */
	volatile unsigned int PCDR0;                        /*!< 0x02C: System Controller Peripheral Clock Disable Register */
	volatile unsigned int PCSR0;                        /*!< 0x030: System Controller Peripheral Clock Status Register */
	volatile unsigned int PCER1;                        /*!< 0x034: System Controller Peripheral Clock Enable Register */
	volatile unsigned int PCDR1;                        /*!< 0x038: System Controller Peripheral Clock Disable Register */
	volatile unsigned int PCSR1;                        /*!< 0x03C: System Controller Peripheral Clock Status Register */
	volatile unsigned int OSTR;                         /*!< 0x040: System Controller External OSC Stable Time Control Register */
	volatile unsigned int _RSVD1;                       /*!< 0x044: System Controller PLL Stable Time Control Register */
	volatile unsigned int _RSVD2;                       /*!< 0x048: System Controller PLL PMS Value Control Register */
	volatile unsigned int LVDCR;                        /*!< 0x04C: System Controller LVD Control Register */
	volatile unsigned int CLCR;                         /*!< 0x050: System Controller IMOSC Fine Adjustment Register*/
	volatile unsigned int PWRCR;                        /*!< 0x054: System Controller Power Control Register */
	volatile unsigned int PWRKEY;                       /*!< 0x058: System Controller Power Control Register */
	volatile unsigned int _RSVD3;                       /*!< 0x05C: */
	volatile unsigned int _RSVD4;                       /*!< 0x060: */
	volatile unsigned int OPT1;                         /*!< 0x064: System Controller OSC Trim Control Register */
	volatile unsigned int OPT0;                         /*!< 0x068: System Controller Protection Control Register */
	volatile unsigned int WKCR;                         /*!< 0x06C: System Controller Clock Quality Check Control Register */
	volatile unsigned int _RSVD5;                       /*!< 0x070: System Controller Clock Quality Check Control Register */
	volatile unsigned int IMER;                         /*!< 0x074: System Controller Interrupt Enable Register */
	volatile unsigned int IMDR;                         /*!< 0x078: System Controller Interrupt Disable Register */
	volatile unsigned int IMCR;                         /*!< 0x07C: System Controller Interrupt Mask Register */
	volatile unsigned int IAR;                          /*!< 0x080: System Controller Interrupt Active Register */
	volatile unsigned int ICR;                          /*!< 0x084: System Controller Clear Status Register */
	volatile unsigned int RISR;                         /*!< 0x088: System Controller Raw Interrupt Status Register */
	volatile unsigned int MISR;                          /*!< 0x08C: System Controller Raw Interrupt Status Register */
	volatile unsigned int RSR;                          /*!< 0x090: System Controller Raw Interrupt Status Register */
	volatile unsigned int EXIRT;                        /*!< 0x094: System Controller Reset Status Register */
	volatile unsigned int EXIFT;                        /*!< 0x098: System Controller External Interrupt Mode 1 (Positive Edge) Register */
	volatile unsigned int EXIER;                        /*!< 0x09C: System Controller External Interrupt Mode 2 (Negative Edge) Register */
	volatile unsigned int EXIDR;                        /*!< 0x0A0: System Controller External Interrupt Enable Register */
	volatile unsigned int EXIMR;                        /*!< 0x0A4: System Controller External Interrupt Disable Register */
	volatile unsigned int EXIAR;                        /*!< 0x0A8: System Controller External Interrupt Mask Register */
	volatile unsigned int EXICR;                        /*!< 0x0AC: System Controller External Interrupt Active Register */
	volatile unsigned int EXIRS;                        /*!< 0x0B0: System Controller External Interrupt Clear Status Register */
	volatile unsigned int IWDCR;                        /*!< 0x0B4: System Controller Independent Watchdog Control Register */
	volatile unsigned int IWDCNT;                       /*!< 0x0B8: SystCem Controller Independent Watchdog Counter Value Register */
	volatile unsigned int IWDEDR;                       /*!< 0x0BC: System Controller Independent Watchdog Enable/disable Register*/
	volatile unsigned int IOMAP0;                        /*!< 0x0C0: Customer Information Content mirror of 1st byte*/
	volatile unsigned int IOMAP1;                        /*!< 0x0C4: Customer Information Content mirror of 1st byte*/
	volatile unsigned int CINF0;                        /*!< 0x0C8: Customer Information Content mirror of 1st byte*/
	volatile unsigned int CINF1;                        /*!< 0x0CC: Customer Information Content mirror of 1st byte*/
	volatile unsigned int FINF0;                        /*!< 0x0D0: Customer Information Content mirror of 1st byte*/
	volatile unsigned int FINF1;                        /*!< 0x0D4: Customer Information Content mirror of 1st byte*/
	volatile unsigned int FINF2;                        /*!< 0x0D8: Customer Information Content mirror of 1st byte*/
	volatile unsigned int _RSVD6;                        /*!< 0x0DC: Customer Information Content mirror of 1st byte*/
	volatile unsigned int ERRINF;                       /*!< 0x0E0:*/
	volatile unsigned int UID0 ;                        /*!< 0x0E4: Customer Information Content mirror of 1st byte*/
	volatile unsigned int UID1 ;                        /*!< 0x0E8: Customer Information Content mirror of 1st byte*/
	volatile unsigned int UID2 ;                        /*!< 0x0EC: Customer Information Content mirror of 1st byte*/
	volatile unsigned int PWROPT;                       /*!< 0x0F0: Power recovery timmming control */
	volatile unsigned int EVTRG;                       /*!< 0x0F4: Trigger gen                                    */
	volatile unsigned int EVPS;                       /*!< 0x0F8: Trigger prs                                    */
	volatile unsigned int EVSWF;                       /*!< 0x0FC: Trigger software force                         */
	volatile unsigned int UREG0;                       /*!< 0x100: User defined reg0                              */
	volatile unsigned int UREG1;                       /*!< 0x104: User defined reg1                              */
	volatile unsigned int UREG2;                       /*!< 0x108: User defined reg0                              */
	volatile unsigned int _RSVD7;                       /*!< 0x10C: User defined reg1                              */
	volatile unsigned int _RSVD8;  
	volatile unsigned int _RSVD9;  
	volatile unsigned int _RSVD10; 
    volatile unsigned int _RSVD11;   
	volatile unsigned int _RSVD12;  
	volatile unsigned int _RSVD13;  
	volatile unsigned int DBGCR;                       /*!< 0x128: DB control reg                              */
} CSP_SYSCON_T;


/**
@brief	GPTX   bits Structure
*/   
 typedef struct
 {
	volatile unsigned int	CEDR;  		//0x0000	Clock control & ID
	volatile unsigned int	RSSR;		//0x0004	Start & Stop Ctrl
	volatile unsigned int	PSCR;		//0x0008	Clock prescaler
	volatile unsigned int	CR;  		//0x000C	Control register
	volatile unsigned int	SYNCR;		//0x0010	Synchronization control reg
	volatile unsigned int	GLDCR;		//0x0014	Global load control reg
	volatile unsigned int	GLDCFG; 	//0x0018	Global load config
	volatile unsigned int	GLDCR2;		//0x001C	Global load control reg2
	volatile unsigned int	Reserved0;		//0x0020
	volatile unsigned int	PRDR;   	//0x0024	Period reg
	volatile unsigned int	PHSR;		//0x0028                          //cl
	volatile unsigned int	CMPA;  		//0x002C	Compare Value A
	volatile unsigned int	CMPB;   	//0x0030	Compare Value B
	volatile unsigned int	Reserved2;		//0x0034
	volatile unsigned int	Reserved3;		//0x0038
	volatile unsigned int	CMPLDR;	    //0x003C	Cmp reg load control
	volatile unsigned int	CNT;      	//0x0040	Counter reg
	volatile unsigned int	AQLDR; 		//0x0044	AQ reg load control
	volatile unsigned int	AQCRA;      //0x0048	Action qualify of ch-A
	volatile unsigned int	AQCRB;    	//0x004C	Action qualify of ch-B
	volatile unsigned int	Reserved4;		//0x0050
	volatile unsigned int	Reserved5;		//0x0054
	volatile unsigned int	Reserved6;		//0x0058
	volatile unsigned int	AQOSF; 		//0x005C	AQ output one-shot software forcing
	volatile unsigned int	AQCSF;      //0x0060	AQ output conti-software forcing
	volatile unsigned int	Reserved7;		//0x0064
	volatile unsigned int	Reserved8;		//0x0068
	volatile unsigned int	Reserved9;		//0x006c
	volatile unsigned int	Reserved10;		//0x0070
	volatile unsigned int	Reserved11;		//0x0074
	volatile unsigned int	Reserved12;		//0x0078
	volatile unsigned int	Reserved13;		//0x007c
	volatile unsigned int	Reserved14;		//0x0080
	volatile unsigned int	Reserved15;		//0x0084
	volatile unsigned int	Reserved16;		//0x0088
	volatile unsigned int	Reserved17;		//0x008c
	volatile unsigned int	Reserved18;		//0x0090
	volatile unsigned int	Reserved19;		//0x0094
	volatile unsigned int	Reserved20;		//0x0098
	volatile unsigned int	Reserved21;		//0x009c
	volatile unsigned int	Reserved22;		//0x00a0
	volatile unsigned int	Reserved23;		//0x00a4
	volatile unsigned int	Reserved24;		//0x00a8
	volatile unsigned int	Reserved25;		//0x00ac
	volatile unsigned int	Reserved26;		//0x00b0
	volatile unsigned int	Reserved27;		//0x00b4
	volatile unsigned int  TRGFTCR;    //0x00B8    Trigger Filter control reg
	volatile unsigned int  TRGFTWR;    //0x00BC    Trigger filter window
	volatile unsigned int  EVTRG;      //0x00C0    Event trigger setting
	volatile unsigned int  EVPS;       //0x00C4    Event presaler
	volatile unsigned int  EVCNTINIT;	//0x00C8
	volatile unsigned int  EVSWF;      //0x00CC    Event software forcing
	volatile unsigned int  RISR;       //0x00D0    Interrupt RISR
	volatile unsigned int  MISR;       //0x00D4    Interrupt MISR
	volatile unsigned int  IMCR;       //0x00D8    Interrupt IMCR
	volatile unsigned int  ICR;        //0x00DC    Interrupt clear
	volatile unsigned int  REGLINK;    //0x00E0    Register link
	volatile unsigned int  Reserved28; //0x00E4
	volatile unsigned int  REGPROT;    //0x00E8    Register PROTECT
 }CSP_GPTA_T,*CSP_GPTA_PTR;

/**
@brief ADC0  bits Structure
*/    
 typedef volatile struct
 {
    volatile unsigned int  ECR;              /**< Clock Enable Register             */
    volatile unsigned int  DCR;              /**< Clock Disable Register            */
    volatile unsigned int  PMSR;             /**< Power Management Status Register  */
    volatile unsigned int  Reserved0;
    volatile unsigned int  CR;               /**< Control Register                  */
    volatile unsigned int  MR;               /**< Mode Register                     */
    volatile unsigned int  SHR;
    volatile unsigned int  CSR;              /**< Clear Status Register             */
    volatile unsigned int  SR;               /**< Status Register                   */
    volatile unsigned int  IER;              /**< Interrupt Enable Register         */
    volatile unsigned int  IDR;              /**< Interrupt Disable Register        */
    volatile unsigned int  IMR;              /**< Interrupt Mask Register           */
    volatile unsigned int  SEQ[16];          /**< Conversion Mode Register 0~11     */
    volatile unsigned int  PRI;              /**< Conversion Priority Register      */
    volatile unsigned int  TDL0;             /**< Trigger Delay control Register    */
    volatile unsigned int  TDL1;             /**< Trigger Delay control Register    */
    volatile unsigned int  SYNCR;            /**< Sync Control Register             */
    volatile unsigned int  Reserved1;           /**< Trigger Filter Control Register   */
    volatile unsigned int  Reserved2;           /**< Trigger Filter Window  Register   */
    volatile unsigned int  EVTRG;            /**< Event Trigger Control  Register   */
    volatile unsigned int  EVPS;             /**< Event Prescale Register           */
    volatile unsigned int  EVSWF;            /**< Event Softtrig Register           */
    volatile unsigned int  ReservedD[27];
    volatile unsigned int  DR[16];           /**< Convert Data Register             */         
    volatile unsigned int  CMP0;             /**< Comparison Data Register             */
    volatile unsigned int  CMP1;             /**< Comparison Data Register             */
	volatile unsigned int  DRMASK; 
 } CSP_ADC12_T, *CSP_ADC12_PTR;


/**
  * @brief  TC0_GPT Structure
  */
/* Physical Timer Definition                                                 */
/** GPT one channel                                                          */
 #define GPT_ONE_CHANNEL    1u
/** GPT three channel                                                        */
 #define GPT_THREE_CHANNEL  3u

/**
*******************************************************************************
@brief TC0 Channel Structure
*******************************************************************************
*/
 typedef volatile struct
 {
    volatile unsigned int  ReservedA[20];
    volatile unsigned int  ECR;               /**< Enable Clock Register            */
    volatile unsigned int  DCR;               /**< Disable Clock Register           */
    volatile unsigned int  PMSR;              /**< Power Management Status Register */
    volatile unsigned int  ReservedD;
    volatile unsigned int  CR;                /**< Control Register                 */
    volatile unsigned int  MR;                /**< Mode Register                    */
    volatile unsigned int  ReservedE;
    volatile unsigned int  CSR;               /**< Clear Status Register            */
    volatile unsigned int  SR;                /**< Status Register                  */
    volatile unsigned int  IER;               /**< Interrupt Enable Register        */
    volatile unsigned int  IDR;               /**< Interrupt Disable Register       */
    volatile unsigned int  IMR;               /**< Interrupt Mask Register          */
    volatile unsigned int  CV;                /**< Counter value Register           */
    volatile unsigned int  RA;                /**< Register A                       */
    volatile unsigned int  RB;                /**< Register B                       */
    volatile unsigned int  RC;                /**< Register C                       */
    volatile unsigned int  ReservedF[28];
 } CSP_TC0_T, *CSP_TC0_PTR;
 /**
*******************************************************************************
@brief GPT 1 Channel Structure
*******************************************************************************
*/
// typedef volatile struct
// {
//    CSP_TC0_T      CHANNEL[GPT_ONE_CHANNEL];     /**< GPT Channel             */
// } CSP_GPT1C_T, *CSP_GPT1C_PTR;

/**
*******************************************************************************
@brief GPT 3 Channel Structure
*******************************************************************************
*/
 typedef volatile struct
 {
    CSP_TC0_T    CHANNEL[GPT_THREE_CHANNEL];   /**< GPT Channel             */
    volatile unsigned int BCR;                          /**< Block Control Register  */
    volatile unsigned int BMR;                          /**< Block Clock Mode Register */
 } CSP_TC0_3C_T, *CSP_TC0_3C_PTR;

/**
  * @brief  TC1_GTC Structure
  */
 typedef struct
 {
    CSP_REGISTER_T     	IDR;		/**< ID Register	              */
    CSP_REGISTER_T     	CSSR;        	/**< Clock Source Selection Register  */
    CSP_REGISTER_T     	CEDR;        	/**< Clock Enable/Disable Register    */
    CSP_REGISTER_T     	SRR;         	/**< Software Reset Register          */
    CSP_REGISTER_T     	CSR;        	/**< Control Set Register             */
    CSP_REGISTER_T     	CCR;        	/**< Control Clear Register           */
    CSP_REGISTER_T      SR;             /**< Status Register                  */
    CSP_REGISTER_T     	IMSCR;       	/**< Interrupt Mask Set/Clear Register*/
    CSP_REGISTER_T     	RISR;        	/**< Raw Interrupt Status Register    */
    CSP_REGISTER_T     	MISR;        	/**< Masked Interrupt Status Register */
    CSP_REGISTER_T    	ICR;        	/**< Interrupt Clear Register         */
    CSP_REGISTER_T     	CDR;        	/**< Clock Divider Register           */
    CSP_REGISTER_T     	CSMR;        	/**< Count Size Mask Register         */
    CSP_REGISTER_T      PRDR;           /**< Period Register                  */
    CSP_REGISTER_T      PULR;           /**< Pulse Register                   */
    CSP_REGISTER_T      RESVD[4];
    CSP_REGISTER_T      CUCR;           /**< Capture Up Count Register        */
    CSP_REGISTER_T      CDCR;           /**< Capture Down Count Register      */
    CSP_REGISTER_T      CVR;            /**< Counter Value Register           */
 } CSP_TC1_T, *CSP_TC1_PTR;

/**
  * @brief  TC2_ST16 Structure
  */
 typedef volatile struct 
 { 
    volatile unsigned int     IDR;            /**< IP ID-CODE Register              */
    volatile unsigned int     CEDR;           /**< Clock enable/disable register    */
    volatile unsigned int     RSSR;           /**< Software reset start stop        */
    volatile unsigned int     IMSCR;          /**< Interrupt mask set clear         */
    volatile unsigned int     RISR;           /**< Raw interrupt status             */
    volatile unsigned int     MISR;           /**< Masked interrupt status          */
    volatile unsigned int     ICR;            /**< Interrupt clear                  */
    volatile unsigned int     SR;             /**< Counter status                   */
    volatile unsigned int     ReservedA;       
    volatile unsigned int     MR;             /**< Mode                             */
    volatile unsigned int     ReservedB[2];  
    volatile unsigned int     CNTBR;          /**< Counter size base                */
    volatile unsigned int     CNTR;           /**< Counter value                    */
    volatile unsigned int     CDR;            /**< Clock divider                    */
    volatile unsigned int     ReservedC[5];  
    volatile unsigned int     PCNTR;          /**< Pending counter value            */
    volatile unsigned int     ReservedD[11];  
    volatile unsigned int     CRR;            /**< Channel enable/disable           */
    volatile unsigned int     CMR;            /**< Channel mode                     */
    volatile unsigned int     CIMSCR;         /**< Capture/compare interrupt en/dis */
    volatile unsigned int     CRISR;          /**< Capture/compare interrupt RISR   */
    volatile unsigned int     CMISR;          /**< Capture/compare interrupt MISR   */
    volatile unsigned int     CICR;           /**< Capture/compare interrupt clear  */
    volatile unsigned int     ReservedE;       
    volatile unsigned int     CAPSR;          /**< Latest capture status            */
    volatile unsigned int     ReservedF[8];  
    volatile unsigned int     CC0R;;          /**< Capture/compare register base    */
    volatile unsigned int     CC1R;;          /**< Capture/compare register base    */
 } CSP_TC2_T, *CSP_TC2_PTR;

/**
  * @brief  EPWM Structure
  */

 typedef struct
 {
    CSP_REGISTER_T	CR;  		// 0x0000	Control
    CSP_REGISTER_T	LKCR;		// 0x0004	Link Mode Control
    CSP_REGISTER_T	LKTRG;		// 0x0008	Link Mode Trigger Control
    CSP_REGISTER_T	CNTR0;		// 0x000C	Counter Value
    CSP_REGISTER_T	CNTBR0;		// 0x0010	Counter Base Value
    CSP_REGISTER_T	PCNTR0;		// 0x0014	Pending Counter Value
    CSP_REGISTER_T	SLPCNTR0;	// 0x0018	Soft-lock Pending Counter Value
    CSP_REGISTER_T	CNTR1;		// 0x001C	Counter Value
    CSP_REGISTER_T	CNTBR1;		// 0x0020	Counter Base Value
    CSP_REGISTER_T	PCNTR1;		// 0x0024	Pending Counter Value
    CSP_REGISTER_T	SLPCNTR1;	// 0x0028	Soft-lock Pending Counter Value
    CSP_REGISTER_T	CNTR2;		// 0x002C	Counter Value
    CSP_REGISTER_T	CNTBR2;		// 0x0030	Counter Base Value
    CSP_REGISTER_T	PCNTR2;		// 0x0034	Pending Counter Value
    CSP_REGISTER_T	SLPCNTR2;	// 0x0038	Soft-lock Pending Counter Value
    CSP_REGISTER_T	CMPAR0;		// 0x003C	Compare Value A
    CSP_REGISTER_T	PCMPAR0;	// 0x0040	Pending Compare Value A
    CSP_REGISTER_T	SLPCMPAR0;	// 0x0044	Soft-lock Pending Compare Value A
    CSP_REGISTER_T	CMPBR0;		// 0x0048	Compare Value B
    CSP_REGISTER_T	PCMPBR0;	// 0x004C	Pending Compare Value B
    CSP_REGISTER_T	SLPCMPBR0;	// 0x0050	Soft-lock Pending Compare Value B
    CSP_REGISTER_T	CMPAR1;		// 0x0054	Compare Value A
    CSP_REGISTER_T	PCMPAR1;	// 0x0058	Pending Compare Value A
    CSP_REGISTER_T	SLPCMPAR1;	// 0x005C	Soft-lock Pending Compare Value A
    CSP_REGISTER_T	CMPBR1;		// 0x0060	Compare Value B
    CSP_REGISTER_T	PCMPBR1;	// 0x0064	Pending Compare Value B
    CSP_REGISTER_T	SLPCMPBR1;	// 0x0068	Soft-lock Pending Compare Value B
    CSP_REGISTER_T	CMPAR2;		// 0x006C	Compare Value A
    CSP_REGISTER_T	PCMPAR2;	// 0x0070	Pending Compare Value A
    CSP_REGISTER_T	SLPCMPAR2;	// 0x0074	Soft-lock Pending Compare Value A
    CSP_REGISTER_T	CMPBR2;		// 0x0078	Compare Value B
    CSP_REGISTER_T	PCMPBR2;	// 0x007C	Pending Compare Value B
    CSP_REGISTER_T	SLPCMPBR2;	// 0x0080	Soft-lock Pending Compare Value B
    CSP_REGISTER_T	WGCR0;		// 0x0084	Waveform Generator Engine Control
    CSP_REGISTER_T	WGCR1;		// 0x0088	Waveform Generator Engine Control
    CSP_REGISTER_T	WGCR2;		// 0x008C	Waveform Generator Engine Control
    CSP_REGISTER_T	OUTCR0;		// 0x0090	Output Control
    CSP_REGISTER_T	OUTCR1;		// 0x0094	Output Control
    CSP_REGISTER_T	OUTCR2;		// 0x0098	Output Control
    CSP_REGISTER_T	CFCR0; 		// 0x009C	Carrier Frequency Output Control
    CSP_REGISTER_T	CFCR1; 		// 0x00A0	Carrier Frequency Output Control
    CSP_REGISTER_T	CFCR2; 		// 0x00A4	Carrier Frequency Output Control
    CSP_REGISTER_T	EMR;  		// 0x00A8	Emergency Control
    CSP_REGISTER_T	SLCON; 		// 0x00AC	Emergency Control
    CSP_REGISTER_T	SLSTEP0;	// 0x00B0	Soft lock auto-dec/inc step Control
    CSP_REGISTER_T	SLSTEP1;	// 0x00B4	Soft lock auto-dec/inc step Control
    CSP_REGISTER_T  IER;        // 0x00B8       INT Enable/Disable Register
    CSP_REGISTER_T  ICR;        // 0x00BC       INT Pending Clear Register
    CSP_REGISTER_T  RISR;       // 0x00C0       INT Raw Status Register
    CSP_REGISTER_T  MISR;       // 0x00C4       INT Masked Status Register
    CSP_REGISTER_T  EXTRG0;     // 0x00C8       External Trigger Register
    CSP_REGISTER_T  EXTRG1;     // 0x00CC       External Trigger Register
 } CSP_EPWM_T, *CSP_EPWM_PTR;

/**
  * @brief  GPIO Structure
  */
 typedef volatile struct
 {
    volatile unsigned int  CONLR;                /**< Control Low  Register                */
    volatile unsigned int  CONHR;                /**< Control High Register                */
    volatile unsigned int  WODR;                 /**< Write Output Data Register           */              
    volatile unsigned int  SODR;                 /**< Set Output Data (bit-wise) Register  */
    volatile unsigned int  CODR;                 /**< Clear Output Data (bit-wise) Register*/
    volatile unsigned int  ODSR;                 /**< Output Data Status Register          */
    volatile unsigned int  PSDR;                 /**< Pin Data Status Register             */
    volatile unsigned int  FLTEN;                /**< Input signal filtering               */
    volatile unsigned int  PUDR;                 /**< IO Pullup_Pulldown Register          */
    volatile unsigned int  DSCR;                 /**< Output Driving Strength Register     */
    volatile unsigned int  OMCR;                 /**< Slew-rate, Open-Drain Control        */
	volatile unsigned int  IECR;                	/**< EXI enable control                   */
    volatile unsigned int  IEER;	                /**< EXI bit enable control               */
	volatile unsigned int  IEDR;	                /**< EXI bit disable control              */
 } CSP_GPIO_T, *CSP_GPIO_PTR; 
 
  typedef volatile struct
 {
	volatile unsigned int  IGRPL;                	/**< EXI group control                   */
    volatile unsigned int  IGRPH;	                /**< EXI group control               */
	volatile unsigned int  IGREX;	                /**< EXI group control               */
	volatile unsigned int  CLKEN;	                /**< EXI group control               */
 } CSP_IGRP_T, *CSP_IGRP_PTR; 
 

/**
  * @brief  UART Structure
  */
 typedef volatile struct
 {
    volatile unsigned int  DATA;               /**< Write and Read Data Register    */
    volatile unsigned int  SR;                 /**< Status Register                 */
    volatile unsigned int  CTRL;                /**< Control Register                */
    volatile unsigned int  ISR;                /**< Interrupt Status Register       */
    volatile unsigned int  BRDIV;               /**< Baud Rate Generator Register    */
    volatile unsigned int  Reserved0;
	volatile unsigned int  RTOR;
	volatile unsigned int  TTGR;
	volatile unsigned int  SRR;
 } CSP_UART_T, *CSP_UART_PTR;

/**
  * @brief  USART Structure
  */
 typedef struct
 {
    CSP_REGISTER_T  IDR;				/**< ID Register	            */
    CSP_REGISTER_T  CEDR;               /**< Clock Enable/Disable Register  */
    CSP_REGISTER_T  SRR;                /**< Software Reset Register        */
    CSP_REGISTER_T  CR;                 /**< Control Register                */
    CSP_REGISTER_T  MR;                 /**< Mode Register                   */
    CSP_REGISTER_T  IMSCR;              /**< Interrupt Set/Clear Register       */
    CSP_REGISTER_T  RISR;               /**< Raw Interrupt Status Register      */
    CSP_REGISTER_T  MISR;               /**< Masked Interrupt Status Register   */
    CSP_REGISTER_T  ICR;                /**< Clear Status Register              */
    CSP_REGISTER_T  SR;                 /**< Status Register                 */
    CSP_REGISTER_T  RHR;                /**< Receiver Holding Register       */
    CSP_REGISTER_T  THR;                /**< Transmit Holding Register       */
    CSP_REGISTER_T  BRGR;               /**< Baud Rate Generator Register    */
    CSP_REGISTER_T  RTOR;               /**< Receiver Time-out Register      */
    CSP_REGISTER_T  TTGR;               /**< Transmitter Time-guard Register */
    CSP_REGISTER_T  LIR;                /**< LIN Identifier Register         */
    CSP_REGISTER_T  DFWR0;              /**< Data Field Write 0 Register     */
    CSP_REGISTER_T  DFWR1;              /**< Data Field Write 1 Register     */
    CSP_REGISTER_T  DFRR0;              /**< Data Field Read 0 Register      */
    CSP_REGISTER_T  DFRR1;              /**< Data Field Read 1 Register      */
    CSP_REGISTER_T  SBLR;               /**< Sync Break Length Register      */
    CSP_REGISTER_T  LCP1;               /**< Limit counter protocol 1        */
    CSP_REGISTER_T  LCP2;               /**< Limit counter protocol 2        */
 } CSP_USART_T, *CSP_USART_PTR;
 
 

 #define FLASHBase 0x00000000
 #define FLASHSize 0x00010000
 #define FLASHLimit (FLASHBase + FLASHSize) 
 #define DFLASHBase 0x10000000
 #define DFLASHSize 0x10001000
 #define DFLASHLimit (FLASHBase + FLASHSize) 

#ifdef REMAP
  #define SRAMBase 0x00000000
  #define SRAMSize 0x00000800
  #define SRAMLimit (SRAMBase + SRAMSize) 
  #define MEMVectorBase 0x00000700
  #define MEMVectorSize (0x50<<2)
#else
  #define SRAMBase 0x20000000
  #define SRAMSize 0x00001000
  #define SRAMLimit (SRAMBase + SRAMSize) 
  #define MEMVectorBase 0x20000F00
  #define MEMVectorSize (0x50<<2)
#endif

//--Peripheral Address Setting
#define APBPeriBase     0x40000000 

//--Each Peripheral Address Setting
#define APB_SFMBase     (APBPeriBase + 0x10000)
#define APB_IFCBase    	(APBPeriBase + 0x10000)
#define APB_SYSCONBase  (APBPeriBase + 0x11000)
#define APB_ETCBBase    (APBPeriBase + 0x12000)  

#define APB_ADC0Base    (APBPeriBase + 0x30000)

#define APB_TC0Base    (APBPeriBase + 0x50000)
#define APB_TC0_0Base    (APBPeriBase + 0x50000)
#define APB_TC0_1Base    (APBPeriBase + 0x50100)
#define APB_TC0_2Base    (APBPeriBase + 0x50200)
#define APB_TC1Base    (APBPeriBase + 0x51000)
#define APB_TC2Base   (APBPeriBase + 0x52000)
#define APB_EPWMBase   (APBPeriBase + 0x54000)

#define APB_GPIOA0Base  0x60000000 //A0  
#define APB_GPIOA1Base  0x60001000 //A1 
#define APB_GPIOB0Base  0x60002000 //B0 
#define APB_GPIOC0Base  0x60004000 //C0 
 
#define APB_IGRPBase  	(0x6000F000) //EXI GROUP CONTROL

#define APB_BT0Base      (APBPeriBase + 0x61000)     
#define APB_BT1Base      (APBPeriBase + 0x62000)     
#define APB_BT2Base      (APBPeriBase + 0x63000)     
#define APB_BT3Base      (APBPeriBase + 0x64000)     

#define APB_GPTABase    (APBPeriBase + 0x65000)       

#define APB_EPTBase    (APBPeriBase + 0x69000)       

#define APB_WWDTBase	(APBPeriBase + 0x72000)      

#define APB_USART0Base   (APBPeriBase + 0x80000)
#define APB_UART0Base   (APBPeriBase + 0x81000)

#define AHB_CRCBase     0x50000000
#define APB_HWDBase		0x70000000	

#define APB_CMPBase     (APBPeriBase + 0xB0000)
#define APB_OAMP0Base     (APBPeriBase + 0xC0000)
#define APB_OAMP1Base     (APBPeriBase + 0xC0004)


//--Interrupt Bit Position
#define CORET_INT   (0x01ul<<0)       //IRQ0
#define SYSCON_INT  (0x01ul<<1)       //IRQ1
#define IFC_INT     (0x01ul<<2)       //IRQ2
#define ADC_INT     (0x01ul<<3)       //IRQ3
#define TC0_0_INT   (0x01ul<<4)
#define TC0_1_INT   (0x01ul<<5)
#define TC0_2_INT   (0x01ul<<6)
#define EXI0_INT    (0x01ul<<7)       //IRQ7
#define EXI1_INT    (0x01ul<<8)       //IRQ8
#define EPWM_INT   (0x01ul<<9)
#define TC1_INT   (0x01ul<<10)
#define TC2_INT   (0x01ul<<11)
#define WWDT_INT   (0x01ul<<12)      //IRQ12
#define USART0_INT   (0x01ul<<13)      //IRQ13
#define EPT_INT   (0x01ul<<14)      //IRQ14
#define GPT_INT    (0x01ul<<15)       //IRQ15 
#define BT0_INT      (0x01ul<<16)      //IRQ16
#define BT1_INT      (0x01ul<<17)      //IRQ17
#define BT2_INT      (0x01ul<<18)      //IRQ18
#define BT3_INT      (0x01ul<<19)      //IRQ19
#define CMP5_INT    (0x01ul<<20)      //IRQ20
#define EXI2_INT    (0x01ul<<21)       //IRQ21
#define EXI3_INT    (0x01ul<<22)       //IRQ22
#define EXI4_INT    (0x01ul<<23)       //IRQ23
#define UART0_INT   (0x01ul<<24)      //IRQ24
//DUMMY              25
//DUMMY              26
#define CMP4_INT    (0x01ul<<27)      //IRQ27
#define CMP0_INT    (0x01ul<<28)      //IRQ28
#define CMP1_INT    (0x01ul<<29)      //IRQ29
#define CMP2_INT    (0x01ul<<30)      //IRQ30
#define CMP3_INT    (0x01ul<<31)      //IRQ31




extern CSP_CK802_T  *CK802     ;
extern CSP_IFC_T 	*IFC     ;
extern CSP_SYSCON_T *SYSCON   ;
extern CSP_ETCB_T   *ETCB;
extern CSP_ADC12_T 	*ADC0     ;
extern CSP_TC0_3C_T   *TC0  ;
extern CSP_TC0_T   *TC0_0   ;
extern CSP_TC0_T   *TC0_1   ;
extern CSP_TC0_T   *TC0_2   ;
extern CSP_TC1_T   *TC1     ;
extern CSP_TC2_T   *TC2     ;
extern CSP_EPWM_T  *EPWM    ;
extern CSP_BT_T     *BT0 ;
extern CSP_BT_T     *BT1 ;
extern CSP_BT_T     *BT2 ;
extern CSP_BT_T     *BT3 ;
extern CSP_GPTA_T 	*GPTA0	  ;
extern CSP_EPT_T    *EPT0;
extern CSP_WWDT_T   *WWDT;
extern CSP_USART_T 	*USART0    ;
extern CSP_UART_T 	*UART0    ;
extern CSP_CMP_T  	*CMP      ;
extern CSP_OAMP_T  	*OAMP0     ;
extern CSP_OAMP_T  	*OAMP1     ;
extern CSP_CRC_T    *CRC;
extern CSP_GPIO_T 	*GPIOA0   ;
extern CSP_GPIO_T 	*GPIOA1   ;
extern CSP_GPIO_T 	*GPIOB0   ;
extern CSP_GPIO_T 	*GPIOC0   ;
extern CSP_HWD_T    *HWD;
extern CSP_IGRP_T  	*GPIOGRP   ;

//ISR Define for generating special interrupt related ASM (CK802), with compile option -mistack
void MisalignedHandler(void) __attribute__((isr));
void IllegalInstrHandler(void) __attribute__((isr));
void AccessErrHandler(void) __attribute__((isr));
void BreakPointHandler(void) __attribute__((isr));
void UnrecExecpHandler(void) __attribute__((isr));
void PriviledgeVioHandler(void) __attribute__((isr));
void Trap0Handler(void) __attribute__((isr));
void Trap1Handler(void) __attribute__((isr));
void Trap2Handler(void) __attribute__((isr));
void Trap3Handler(void) __attribute__((isr));
void CORETHandler(void) __attribute__((isr));
void PendTrapHandler(void) __attribute__((isr));
void SYSCONIntHandler(void) __attribute__((isr));
void IFCIntHandler(void) __attribute__((isr));
void EXI0IntHandler(void) __attribute__((isr));
void EXI1IntHandler(void) __attribute__((isr));
void EXI2to3IntHandler(void) __attribute__((isr));
void EXI4to9IntHandler(void) __attribute__((isr));
void EXI10to15IntHandler(void) __attribute__((isr));
void USART0IntHandler(void) __attribute__((isr));
void UART0IntHandler(void) __attribute__((isr));
void GPTAIntHandler(void) __attribute__((isr));
void EPTIntHandler(void) __attribute__((isr));
void ADCIntHandler(void) __attribute__((isr));
void WWDTHandler(void) __attribute__((isr));
void BT0IntHandler(void) __attribute__((isr));
void BT1IntHandler(void) __attribute__((isr));
void BT2IntHandler(void) __attribute__((isr));
void BT3IntHandler(void) __attribute__((isr));
void CMP0IntHandler(void) __attribute__((isr));
void CMP1IntHandler(void) __attribute__((isr));
void CMP2IntHandler(void) __attribute__((isr));
void CMP3IntHandler(void) __attribute__((isr));
void CMP4IntHandler(void) __attribute__((isr));
void CMP5IntHandler(void) __attribute__((isr));
void EPWMIntHandler(void) __attribute__((isr));
void TC0_0IntHandler(void) __attribute__((isr));
void TC0_1IntHandler(void) __attribute__((isr));
void TC0_2IntHandler(void) __attribute__((isr));
void TC1IntHandler(void) __attribute__((isr));
void TC2IntHandler(void) __attribute__((isr));
/*****************************************************************************
************************** Timer delay ***************************************
******************************************************************************/

extern	void delay_nms(unsigned int t);

/* ##########################   NVIC functions  #################################### */


/**
 * @brief  Enable Interrupt in NVIC Interrupt Controller
 *
 * @param  IRQn   The positive number of the external interrupt to enable
 *
 * Enable a device specific interupt in the NVIC interrupt controller.
 * The interrupt number cannot be a negative value.
 */


/**
 * @brief  Disable the interrupt line for external interrupt specified
 * 
 * @param  IRQn   The positive number of the external interrupt to disable
 * 
 * Disable a device specific interupt in the NVIC interrupt controller.
 * The interrupt number cannot be a negative value.
 */
__INLINE void NVIC_DisableIRQ(IRQn_Type IRQn)
{
        CK802->ICER = 1 << (uint32_t)(IRQn);
}

/**
 * @brief  Read the interrupt pending bit for a device specific interrupt source
 * 
 * @param  IRQn    The number of the device specifc interrupt
 * @return         always 0
 */
__INLINE uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
        return (uint32_t)(CK802->ISPR);
}

/**
 * @brief  Set the pending bit for an external interrupt
 * 
 * @param  IRQn    The number of the interrupt for set pending
 *
 * No effect.
 */
__INLINE void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
	CK802->ISPR = (1 << (uint32_t)(IRQn));
}
/**
 * @brief  Clear the pending bit for an external interrupt
 *
 * @param  IRQn    The number of the interrupt for clear pending
 *
 * No effect.
 */
__INLINE void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
	CK802->ICPR = (1 << (uint32_t)(IRQn));
}

/**
 * @brief  Read the active bit for an external interrupt
 *
 * @return         always 0
 *
 */
__INLINE uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
    return (CK802->IABR & (1 << IRQn));
}

__INLINE uint32_t NVIC_GetActiveVector(void)
{
	unsigned int vectactive = 0;
	//isr low 8bits gives the active vector
	vectactive = (CK802 ->ISR & 0xff);
    return vectactive;
}

/**
 * @brief  Set the priority for an interrupt
 *
 * @param  IRQn      The number of the interrupt for set priority
 * @param  priority  The priority to set ,the number rang: [0-3]
 *
 * Set the priority for the specified interrupt. The interrupt 
 * number must be positive to specify an external (device specific) 
 * interrupt.
 */
__INLINE void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{

	uint32_t tmp = ((IRQn & 0x03) << 3);
	uint8_t index = IRQn>>2;
    if(IRQn >= 0) {
    	CK802->IPR[index] &= ~(0xff << tmp);
    	CK802->IPR[index] |= priority << (tmp+6);
    }

}
/**
 * @brief  Read the priority for an interrupt
 *
 * @param  IRQn      The number of the interrupt for get priority
 * @return           The priority for the interrupt
 *
 * Read the priority for the specified interrupt. The interrupt 
 * number must be positive to specify an external (device specific) 
 * interrupt.
 */
__INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{
	uint32_t tmp = ((IRQn & 0x03) << 3);
	uint8_t index = IRQn>>2;
	return (uint32_t)(CK802->IPR[index])>>(tmp + 6);
}


/*###################################################################*/
/*#############    Threshold Enable & Set Threshold   ###############*/
/*###################################################################*/

/************************************************************
 * @brief	enable NVIC threshold
 * @name: NVIC_EnableThreshold
 * @no param
 *
 */

__INLINE void NVIC_EnableThreshold(void)
{
	CK802 ->IPTR |= 0x80000000;
}

/************************************************************
 * @brief	disnable NVIC threshold
 * @name: NVIC_DisableThreshold
 * @no param
 *
 */

__INLINE void NVIC_DisableThreshold(void)
{
	CK802 ->IPTR &= ~0x80000000;
}


/************************************************************
 * @brief	set NVIC Priothreshold
 * @name: NVIC_SetPrioThreshold
 * @param prioshreshold		the priority of threshold[0,3]
 *
 */

__INLINE void NVIC_SetPrioThreshold(uint8_t prioshreshold)
{
	CK802 -> IPTR &= 0xffffff00;
	CK802 -> IPTR |= (prioshreshold << 6);
}

/************************************************************
 * @brief	set NVIC Vectthreshold
 * @name: NVIC_SetVectThreshold
 * @param vectthreshold		the vector of threshold[0,31]
 *
 */

__INLINE void NVIC_SetVectThreshold(uint8_t vectthreshold)
{
	CK802 -> IPTR &= 0xffff00ff;
	CK802 -> IPTR |= ((vectthreshold + 32) << 8);
}


/*###################################################################*/
/*################    Low Power Wakeup Enable     ###################*/
/*###################################################################*/

/*************************************************************
 * @name:	NVIC_PowerWakeUp_Enable
 * @brief:	enable the bit for Power wake up
 * @param:	irqn	the irqnumber,eg:CK802_CORETIM_IRQn
 */
__INLINE void NVIC_PowerWakeUp_Enable(IRQn_Type irqn)
{
	CK802->IWER |= (1 << irqn);
}

/*************************************************************
 * @name:	NVIC_PowerWakeUp_Disable
 * @func:	disable the bit for Power wake up
 * @param:	irqn	the irqnumber,eg:CK802_CORETIM_IRQn
 */
__INLINE void NVIC_PowerWakeUp_Disable(IRQn_Type irqn)
{
	CK802->IWDR |= (1 << irqn);
}

/*************************************************************
 * @name:	NVIC_PowerWakeUp_EnableAll
 * @func:	enable all bits for Power wake up
 * @param:	none
 */
__INLINE void NVIC_PowerWakeUp_EnableAll(void)
{
	CK802->IWER = 0xffffffff;
}

/*************************************************************
 * @name:	NVIC_PowerWakeUp_EnableAll
 * @func:	disable all bits for Power wake up
 * @param:	none
 */
__INLINE void NVIC_PowerWakeUp_DisableAll(void)
{
	CK802->IWDR = 0xffffffff;
}

/* ##########################   NVIC functions  #################################### */

#endif   /**< apt32f172_H */

/******************* (C) COPYRIGHT 2018 APT Chip *****END OF FILE****/
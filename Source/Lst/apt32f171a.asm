
.//Obj/apt32f171a.elf:     file format elf32-csky-little


Disassembly of section .text:

00000000 <vector_table>:
       0:	00000104 	.long	0x00000104
       4:	00004326 	.long	0x00004326
       8:	000042fe 	.long	0x000042fe
       c:	0000017c 	.long	0x0000017c
      10:	00004312 	.long	0x00004312
      14:	000042c2 	.long	0x000042c2
      18:	0000017c 	.long	0x0000017c
      1c:	000042ea 	.long	0x000042ea
      20:	000042d6 	.long	0x000042d6
      24:	0000017c 	.long	0x0000017c
      28:	0000017c 	.long	0x0000017c
      2c:	0000017c 	.long	0x0000017c
      30:	0000017c 	.long	0x0000017c
      34:	0000017c 	.long	0x0000017c
      38:	0000017c 	.long	0x0000017c
      3c:	0000017c 	.long	0x0000017c
      40:	000042ae 	.long	0x000042ae
      44:	0000429a 	.long	0x0000429a
      48:	00004286 	.long	0x00004286
      4c:	00004242 	.long	0x00004242
      50:	0000017c 	.long	0x0000017c
      54:	0000017c 	.long	0x0000017c
      58:	0000017c 	.long	0x0000017c
      5c:	0000017c 	.long	0x0000017c
      60:	0000017c 	.long	0x0000017c
      64:	0000017c 	.long	0x0000017c
      68:	0000017c 	.long	0x0000017c
      6c:	0000017c 	.long	0x0000017c
      70:	0000017c 	.long	0x0000017c
      74:	0000017c 	.long	0x0000017c
      78:	0000017c 	.long	0x0000017c
      7c:	00004238 	.long	0x00004238
      80:	00003aec 	.long	0x00003aec
      84:	00003b00 	.long	0x00003b00
      88:	00003be4 	.long	0x00003be4
      8c:	00003c46 	.long	0x00003c46
      90:	0000017c 	.long	0x0000017c
      94:	0000017c 	.long	0x0000017c
      98:	0000017c 	.long	0x0000017c
      9c:	00003c9c 	.long	0x00003c9c
      a0:	00003cc6 	.long	0x00003cc6
      a4:	0000017c 	.long	0x0000017c
      a8:	0000017c 	.long	0x0000017c
      ac:	0000017c 	.long	0x0000017c
      b0:	00003de2 	.long	0x00003de2
      b4:	00003e0c 	.long	0x00003e0c
      b8:	00003e4c 	.long	0x00003e4c
      bc:	00004006 	.long	0x00004006
      c0:	00004080 	.long	0x00004080
      c4:	000040b8 	.long	0x000040b8
      c8:	000040f0 	.long	0x000040f0
      cc:	00004128 	.long	0x00004128
      d0:	00004220 	.long	0x00004220
      d4:	00003cf0 	.long	0x00003cf0
      d8:	00003d32 	.long	0x00003d32
      dc:	00003d88 	.long	0x00003d88
      e0:	00004160 	.long	0x00004160
      e4:	0000017c 	.long	0x0000017c
      e8:	0000017c 	.long	0x0000017c
      ec:	00004208 	.long	0x00004208
      f0:	000041a8 	.long	0x000041a8
      f4:	000041c0 	.long	0x000041c0
      f8:	000041d8 	.long	0x000041d8
      fc:	000041f0 	.long	0x000041f0
     100:	00000006 	.long	0x00000006

00000104 <__start>:
.text
.export __start
//  .long __start
__start:
  //initialize all registers
  movi r0, 0
     104:	3000      	movi      	r0, 0
  movi r1, 0
     106:	3100      	movi      	r1, 0
  movi r2, 0
     108:	3200      	movi      	r2, 0
  movi r3, 0
     10a:	3300      	movi      	r3, 0
  movi r4, 0
     10c:	3400      	movi      	r4, 0
  movi r5, 0
     10e:	3500      	movi      	r5, 0
  movi r6, 0
     110:	3600      	movi      	r6, 0
  movi r7, 0
     112:	3700      	movi      	r7, 0
  //movi r13, 0
  //movi r14, 0
  //movi r15, 0

//set VBR
  lrw r2, vector_table
     114:	105b      	lrw      	r2, 0x0	// 180 <DummyHandler+0x4>
  mtcr r2, cr<1,0>
     116:	c0026421 	mtcr      	r2, cr<1, 0>

//enable EE bit of psr
  mfcr r2, cr<0,0>
     11a:	c0006022 	mfcr      	r2, cr<0, 0>
  bseti r2, r2, 8
     11e:	3aa8      	bseti      	r2, 8
  mtcr r2, cr<0,0>
     120:	c0026420 	mtcr      	r2, cr<0, 0>
//  st.w    r2, (r1,0x4)
//  movi    r2, 0x1
//  st.w    r2, (r1,0x0)

//disable power peak 
  lrw     r1, 0xe000ef90
     124:	1038      	lrw      	r1, 0xe000ef90	// 184 <DummyHandler+0x8>
  movi    r2, 0x0
     126:	3200      	movi      	r2, 0
  st.w    r2, (r1, 0x0)
     128:	b140      	st.w      	r2, (r1, 0x0)

//initialize kernel stack
  lrw  r7, __kernel_stack
     12a:	10f8      	lrw      	r7, 0x200017f8	// 188 <DummyHandler+0xc>
  mov r14,r7
     12c:	6f9f      	mov      	r14, r7
  subi r6,r7,0x4
     12e:	5fcf      	subi      	r6, r7, 4
  lrw  r3, 0x40
     130:	3340      	movi      	r3, 64
  subu r4, r7, r3
     132:	5f8d      	subu      	r4, r7, r3
  lrw  r5, 0x0
     134:	3500      	movi      	r5, 0

00000136 <INIT_KERLE_STACK>:
INIT_KERLE_STACK:
  addi r4, 0x4
     136:	2403      	addi      	r4, 4
  st.w r5, (r4)
     138:	b4a0      	st.w      	r5, (r4, 0x0)
  //cmphs r7, r4
  cmphs r6, r4
     13a:	6518      	cmphs      	r6, r4
  bt  INIT_KERLE_STACK
     13c:	0bfd      	bt      	0x136	// 136 <INIT_KERLE_STACK>

0000013e <__to_main>:
        
__to_main:
  lrw r0,__main
     13e:	1014      	lrw      	r0, 0x1ac	// 18c <DummyHandler+0x10>
  jsr r0
     140:	7bc1      	jsr      	r0
  mov r0, r0
     142:	6c03      	mov      	r0, r0
  mov r0, r0
     144:	6c03      	mov      	r0, r0

  lrw r15, __exit
     146:	ea8f0013 	lrw      	r15, 0x158	// 190 <DummyHandler+0x14>
  lrw r0,main
     14a:	1013      	lrw      	r0, 0x4a14	// 194 <DummyHandler+0x18>
  jmp r0
     14c:	7800      	jmp      	r0
  mov r0, r0
     14e:	6c03      	mov      	r0, r0
  mov r0, r0
     150:	6c03      	mov      	r0, r0
  mov r0, r0
     152:	6c03      	mov      	r0, r0
  mov r0, r0
     154:	6c03      	mov      	r0, r0
  mov r0, r0
     156:	6c03      	mov      	r0, r0

00000158 <__exit>:

.export __exit
__exit:

  lrw r4, 0x20003000
     158:	1090      	lrw      	r4, 0x20003000	// 198 <DummyHandler+0x1c>
  //lrw r5, 0x0
  mov r5, r0
     15a:	6d43      	mov      	r5, r0
  st.w r5, (r4)
     15c:	b4a0      	st.w      	r5, (r4, 0x0)

  mfcr r1, cr<0,0>
     15e:	c0006021 	mfcr      	r1, cr<0, 0>
  lrw  r1, 0xFFFF
     162:	102f      	lrw      	r1, 0xffff	// 19c <DummyHandler+0x20>
  mtcr r1, cr<11,0>
     164:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xFFF
     168:	102e      	lrw      	r1, 0xfff	// 1a0 <DummyHandler+0x24>
  movi    r0, 0x0
     16a:	3000      	movi      	r0, 0
  st      r1, (r0)
     16c:	b020      	st.w      	r1, (r0, 0x0)

0000016e <__fail>:

.export __fail
__fail:
  lrw  r1, 0xEEEE
     16e:	102e      	lrw      	r1, 0xeeee	// 1a4 <DummyHandler+0x28>
  mtcr r1, cr<11,0>
     170:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xEEE
     174:	102d      	lrw      	r1, 0xeee	// 1a8 <DummyHandler+0x2c>
  movi    r0, 0x0
     176:	3000      	movi      	r0, 0
  st      r1, (r0)
     178:	b020      	st.w      	r1, (r0, 0x0)

0000017a <__dummy>:

__dummy:
  br      __fail
     17a:	07fa      	br      	0x16e	// 16e <__fail>

0000017c <DummyHandler>:

.export DummyHandler
DummyHandler:
  br      __fail
     17c:	07f9      	br      	0x16e	// 16e <__fail>
     17e:	0000      	.short	0x0000
     180:	00000000 	.long	0x00000000
     184:	e000ef90 	.long	0xe000ef90
     188:	200017f8 	.long	0x200017f8
     18c:	000001ac 	.long	0x000001ac
     190:	00000158 	.long	0x00000158
     194:	00004a14 	.long	0x00004a14
     198:	20003000 	.long	0x20003000
     19c:	0000ffff 	.long	0x0000ffff
     1a0:	00000fff 	.long	0x00000fff
     1a4:	0000eeee 	.long	0x0000eeee
     1a8:	00000eee 	.long	0x00000eee

000001ac <__main>:
extern char _bss_start[];
extern char _ebss[];


void __main( void ) 
{
     1ac:	14d0      	push      	r15

  /* if the start of data (dst)
     is not equal to end of text (src) then
     copy it, else it's already in the right place
     */
  if( _start_data != _end_rodata ) {
     1ae:	1009      	lrw      	r0, 0x20000000	// 1d0 <__main+0x24>
     1b0:	1029      	lrw      	r1, 0x4a58	// 1d4 <__main+0x28>
     1b2:	6442      	cmpne      	r0, r1
     1b4:	0c05      	bf      	0x1be	// 1be <__main+0x12>
//    __memcpy_fast( dst, src, (_end_data - _start_data));
    memcpy( dst, src, (_end_data - _start_data));
     1b6:	1049      	lrw      	r2, 0x2000007c	// 1d8 <__main+0x2c>
     1b8:	6082      	subu      	r2, r0
     1ba:	e00023fb 	bsr      	0x49b0	// 49b0 <__memcpy_fast>
  }

  /* zero the bss 
   */
  if( _ebss - _bss_start ) {
     1be:	1048      	lrw      	r2, 0x20000104	// 1dc <__main+0x30>
     1c0:	1008      	lrw      	r0, 0x2000007c	// 1e0 <__main+0x34>
     1c2:	640a      	cmpne      	r2, r0
     1c4:	0c05      	bf      	0x1ce	// 1ce <__main+0x22>
//    __memset_fast( _bss_start, 0x00, ( _ebss - _bss_start ));
    memset( _bss_start, 0x00, ( _ebss - _bss_start ));
     1c6:	6082      	subu      	r2, r0
     1c8:	3100      	movi      	r1, 0
     1ca:	e00023af 	bsr      	0x4928	// 4928 <__memset_fast>
  }
}
     1ce:	1490      	pop      	r15
     1d0:	20000000 	.long	0x20000000
     1d4:	00004a58 	.long	0x00004a58
     1d8:	2000007c 	.long	0x2000007c
     1dc:	20000104 	.long	0x20000104
     1e0:	2000007c 	.long	0x2000007c

000001e4 <CK801_int_Init>:


void CK801_int_Init(void)
{
        /* Initial the Interrupt source priority level registers */
        CK802->IPR[0] = 0xC0804000;
     1e4:	1072      	lrw      	r3, 0x20000078	// 22c <CK801_int_Init+0x48>
     1e6:	3180      	movi      	r1, 128
     1e8:	9360      	ld.w      	r3, (r3, 0x0)
     1ea:	4123      	lsli      	r1, r1, 3
     1ec:	1051      	lrw      	r2, 0xc0804000	// 230 <CK801_int_Init+0x4c>
     1ee:	604c      	addu      	r1, r3
     1f0:	b140      	st.w      	r2, (r1, 0x0)
        CK802->IPR[1] = 0xC0804000;
     1f2:	1031      	lrw      	r1, 0x404	// 234 <CK801_int_Init+0x50>
     1f4:	604c      	addu      	r1, r3
     1f6:	b140      	st.w      	r2, (r1, 0x0)
        CK802->IPR[2] = 0xC0804000;
     1f8:	3181      	movi      	r1, 129
     1fa:	4123      	lsli      	r1, r1, 3
     1fc:	604c      	addu      	r1, r3
     1fe:	b140      	st.w      	r2, (r1, 0x0)
        CK802->IPR[3] = 0xC0804000;
     200:	102e      	lrw      	r1, 0x40c	// 238 <CK801_int_Init+0x54>
     202:	604c      	addu      	r1, r3
     204:	b140      	st.w      	r2, (r1, 0x0)
        CK802->IPR[4] = 0xC0804000;
     206:	3182      	movi      	r1, 130
     208:	4123      	lsli      	r1, r1, 3
     20a:	604c      	addu      	r1, r3
     20c:	b140      	st.w      	r2, (r1, 0x0)
        CK802->IPR[5] = 0xC0804000;
     20e:	102c      	lrw      	r1, 0x414	// 23c <CK801_int_Init+0x58>
     210:	604c      	addu      	r1, r3
     212:	b140      	st.w      	r2, (r1, 0x0)
        CK802->IPR[6] = 0xC0804000;
     214:	3183      	movi      	r1, 131
     216:	4123      	lsli      	r1, r1, 3
     218:	604c      	addu      	r1, r3
     21a:	b140      	st.w      	r2, (r1, 0x0)
        CK802->IPR[7] = 0xC0804000;
     21c:	1029      	lrw      	r1, 0x41c	// 240 <CK801_int_Init+0x5c>
     21e:	604c      	addu      	r1, r3
     220:	b140      	st.w      	r2, (r1, 0x0)

        CK802->IPTR 	 = 0x00000000;//disable threshold
     222:	1049      	lrw      	r2, 0xc04	// 244 <CK801_int_Init+0x60>
     224:	60c8      	addu      	r3, r2
     226:	3200      	movi      	r2, 0
     228:	b340      	st.w      	r2, (r3, 0x0)
}
     22a:	783c      	jmp      	r15
     22c:	20000078 	.long	0x20000078
     230:	c0804000 	.long	0xc0804000
     234:	00000404 	.long	0x00000404
     238:	0000040c 	.long	0x0000040c
     23c:	00000414 	.long	0x00000414
     240:	0000041c 	.long	0x0000041c
     244:	00000c04 	.long	0x00000c04

00000248 <force_interrupt>:

void force_interrupt(IRQn_Type IRQn)
{
	CK802->ISPR = (1 << (uint32_t)(IRQn));
     248:	1068      	lrw      	r3, 0x20000078	// 268 <CK_CPU_DisAllNormalIrq+0x8>
     24a:	3180      	movi      	r1, 128
     24c:	9360      	ld.w      	r3, (r3, 0x0)
     24e:	4122      	lsli      	r1, r1, 2
     250:	3201      	movi      	r2, 1
     252:	7080      	lsl      	r2, r0
     254:	60c4      	addu      	r3, r1
     256:	b340      	st.w      	r2, (r3, 0x0)
}
     258:	783c      	jmp      	r15

0000025a <CK_CPU_EnAllNormalIrq>:


void CK_CPU_EnAllNormalIrq(void)
{
  asm  ("psrset ee,ie");
     25a:	c1807420 	psrset      	ee, ie
}
     25e:	783c      	jmp      	r15

00000260 <CK_CPU_DisAllNormalIrq>:

void CK_CPU_DisAllNormalIrq(void)
{
 asm  ("psrclr ie");
     260:	c0807020 	psrclr      	ie
}
     264:	783c      	jmp      	r15
     266:	0000      	bkpt
     268:	20000078 	.long	0x20000078

0000026c <EPT_Software_Prg>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void EPT_Software_Prg(void)
{
	EPT0->CEDR|=0X01;
     26c:	1067      	lrw      	r3, 0x20000034	// 288 <EPT_Software_Prg+0x1c>
	EPT0->RSSR=(EPT0->RSSR&0XFFFF0FFF)|(0X05<<12);
     26e:	31f0      	movi      	r1, 240
	EPT0->CEDR|=0X01;
     270:	9340      	ld.w      	r2, (r3, 0x0)
     272:	9260      	ld.w      	r3, (r2, 0x0)
     274:	3ba0      	bseti      	r3, 0
     276:	b260      	st.w      	r3, (r2, 0x0)
	EPT0->RSSR=(EPT0->RSSR&0XFFFF0FFF)|(0X05<<12);
     278:	9261      	ld.w      	r3, (r2, 0x4)
     27a:	4128      	lsli      	r1, r1, 8
     27c:	68c5      	andn      	r3, r1
     27e:	3bac      	bseti      	r3, 12
     280:	3bae      	bseti      	r3, 14
     282:	b261      	st.w      	r3, (r2, 0x4)
}
     284:	783c      	jmp      	r15
     286:	0000      	bkpt
     288:	20000034 	.long	0x20000034

0000028c <EPT_Start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/   
void EPT_Start(void)
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     28c:	0176      	lrw      	r3, 0x20000034	// 5b0 <EPT_CPCR_Config+0xa>
     28e:	3280      	movi      	r2, 128
     290:	9360      	ld.w      	r3, (r3, 0x0)
     292:	608c      	addu      	r2, r3
     294:	0137      	lrw      	r1, 0xa55ac73a	// 5b4 <EPT_CPCR_Config+0xe>
     296:	b23a      	st.w      	r1, (r2, 0x68)
	EPT0->RSSR|=0X01;
     298:	9341      	ld.w      	r2, (r3, 0x4)
     29a:	3aa0      	bseti      	r2, 0
     29c:	b341      	st.w      	r2, (r3, 0x4)
	while(!(EPT0->RSSR&0x01));
     29e:	3101      	movi      	r1, 1
     2a0:	9341      	ld.w      	r2, (r3, 0x4)
     2a2:	6884      	and      	r2, r1
     2a4:	3a40      	cmpnei      	r2, 0
     2a6:	0ffd      	bf      	0x2a0	// 2a0 <EPT_Start+0x14>
} 
     2a8:	783c      	jmp      	r15

000002aa <EPT_Stop>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/   
void EPT_Stop(void)
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     2aa:	017d      	lrw      	r3, 0x20000034	// 5b0 <EPT_CPCR_Config+0xa>
     2ac:	3280      	movi      	r2, 128
     2ae:	9360      	ld.w      	r3, (r3, 0x0)
     2b0:	608c      	addu      	r2, r3
     2b2:	013e      	lrw      	r1, 0xa55ac73a	// 5b4 <EPT_CPCR_Config+0xe>
     2b4:	b23a      	st.w      	r1, (r2, 0x68)
	EPT0->RSSR&=0Xfe;
     2b6:	9341      	ld.w      	r2, (r3, 0x4)
     2b8:	31fe      	movi      	r1, 254
     2ba:	6884      	and      	r2, r1
     2bc:	b341      	st.w      	r2, (r3, 0x4)
	while(EPT0->RSSR&0x01);
     2be:	3101      	movi      	r1, 1
     2c0:	9341      	ld.w      	r2, (r3, 0x4)
     2c2:	6884      	and      	r2, r1
     2c4:	3a40      	cmpnei      	r2, 0
     2c6:	0bfd      	bt      	0x2c0	// 2c0 <EPT_Stop+0x16>
}
     2c8:	783c      	jmp      	r15

000002ca <EPT_IO_SET>:
//EPT_IO_X:EPT_IO_CHAX,EPT_IO_CHAY,EPT_IO_CHBX,EPT_IO_CHBY,EPT_IO_CHCX,EPT_IO_CHCX,EPT_IO_CHD,EPT_IO_EPI
//ReturnValue:NONE
/*************************************************************/    
void EPT_IO_SET(EPT_IO_Mode_Type EPT_IO_X , EPT_IO_NUM_Type IO_Num_X)
{
	if(EPT_IO_X==EPT_IO_CHAX)
     2ca:	3840      	cmpnei      	r0, 0
     2cc:	082b      	bt      	0x322	// 322 <EPT_IO_SET+0x58>
	{
		if(IO_Num_X==IO_NUM_PA00)
     2ce:	3950      	cmpnei      	r1, 16
     2d0:	0809      	bt      	0x2e2	// 2e2 <EPT_IO_SET+0x18>
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0)|0X00000008;				//PA0.0
     2d2:	0265      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     2d4:	310f      	movi      	r1, 15
     2d6:	9340      	ld.w      	r2, (r3, 0x0)
     2d8:	9260      	ld.w      	r3, (r2, 0x0)
     2da:	68c5      	andn      	r3, r1
     2dc:	3ba3      	bseti      	r3, 3
		{
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFF0FFFF)|0X00080000;				//PA1.4
		}
		else if(IO_Num_X==IO_NUM_PB00)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)|0X00000006;				//PB0.0
     2de:	b260      	st.w      	r3, (r2, 0x0)
		else if(IO_Num_X==IO_NUM_PB02)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EBI3
		}
	}
}
     2e0:	783c      	jmp      	r15
		else if(IO_Num_X==IO_NUM_PA09)
     2e2:	3951      	cmpnei      	r1, 17
     2e4:	080a      	bt      	0x2f8	// 2f8 <EPT_IO_SET+0x2e>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F)|0X00000060;				//PA0.9
     2e6:	026a      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     2e8:	31f0      	movi      	r1, 240
     2ea:	9340      	ld.w      	r2, (r3, 0x0)
     2ec:	9261      	ld.w      	r3, (r2, 0x4)
     2ee:	68c5      	andn      	r3, r1
     2f0:	3ba5      	bseti      	r3, 5
     2f2:	3ba6      	bseti      	r3, 6
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)|0X00000006;				//PA0.8
     2f4:	b261      	st.w      	r3, (r2, 0x4)
     2f6:	07f5      	br      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
		else if(IO_Num_X==IO_NUM_PA14)
     2f8:	3952      	cmpnei      	r1, 18
     2fa:	080a      	bt      	0x30e	// 30e <EPT_IO_SET+0x44>
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFF0FFFF)|0X00080000;				//PA1.4
     2fc:	026f      	lrw      	r3, 0x20000010	// 5bc <EPT_CPCR_Config+0x16>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF)|0X00080000;				//PB0.4
     2fe:	9320      	ld.w      	r1, (r3, 0x0)
     300:	32f0      	movi      	r2, 240
     302:	9160      	ld.w      	r3, (r1, 0x0)
     304:	424c      	lsli      	r2, r2, 12
     306:	68c9      	andn      	r3, r2
     308:	3bb3      	bseti      	r3, 19
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EBI3
     30a:	b160      	st.w      	r3, (r1, 0x0)
}
     30c:	07ea      	br      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
		else if(IO_Num_X==IO_NUM_PB00)
     30e:	3953      	cmpnei      	r1, 19
     310:	0be8      	bt      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)|0X00000006;				//PB0.0
     312:	0273      	lrw      	r3, 0x2000000c	// 5c0 <EPT_CPCR_Config+0x1a>
     314:	9340      	ld.w      	r2, (r3, 0x0)
     316:	9260      	ld.w      	r3, (r2, 0x0)
     318:	310f      	movi      	r1, 15
     31a:	68c5      	andn      	r3, r1
     31c:	3ba1      	bseti      	r3, 1
     31e:	3ba2      	bseti      	r3, 2
     320:	07df      	br      	0x2de	// 2de <EPT_IO_SET+0x14>
	else if(EPT_IO_X==EPT_IO_CHAY)
     322:	3841      	cmpnei      	r0, 1
     324:	0820      	bt      	0x364	// 364 <EPT_IO_SET+0x9a>
		if(IO_Num_X==IO_NUM_PA01)
     326:	3954      	cmpnei      	r1, 20
     328:	0808      	bt      	0x338	// 338 <EPT_IO_SET+0x6e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)|0X00000080;				//PA0.1
     32a:	027b      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     32c:	31f0      	movi      	r1, 240
     32e:	9340      	ld.w      	r2, (r3, 0x0)
     330:	9260      	ld.w      	r3, (r2, 0x0)
     332:	68c5      	andn      	r3, r1
     334:	3ba7      	bseti      	r3, 7
     336:	07d4      	br      	0x2de	// 2de <EPT_IO_SET+0x14>
		else if(IO_Num_X==IO_NUM_PA010)
     338:	3955      	cmpnei      	r1, 21
     33a:	080b      	bt      	0x350	// 350 <EPT_IO_SET+0x86>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)|0X00000600;				//PA0.10
     33c:	0360      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     33e:	32f0      	movi      	r2, 240
     340:	9320      	ld.w      	r1, (r3, 0x0)
     342:	9161      	ld.w      	r3, (r1, 0x4)
     344:	4244      	lsli      	r2, r2, 4
     346:	68c9      	andn      	r3, r2
     348:	3ba9      	bseti      	r3, 9
     34a:	3baa      	bseti      	r3, 10
     34c:	b161      	st.w      	r3, (r1, 0x4)
     34e:	07c9      	br      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
		else if(IO_Num_X==IO_NUM_PB01)
     350:	3956      	cmpnei      	r1, 22
     352:	0bc7      	bt      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFF0F)|0X00000060;				//PB0.1
     354:	0364      	lrw      	r3, 0x2000000c	// 5c0 <EPT_CPCR_Config+0x1a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)|0X00000060;				//PA0.1
     356:	9340      	ld.w      	r2, (r3, 0x0)
     358:	9260      	ld.w      	r3, (r2, 0x0)
     35a:	31f0      	movi      	r1, 240
     35c:	68c5      	andn      	r3, r1
     35e:	3ba5      	bseti      	r3, 5
     360:	3ba6      	bseti      	r3, 6
     362:	07be      	br      	0x2de	// 2de <EPT_IO_SET+0x14>
	else if(EPT_IO_X==EPT_IO_CHBX)
     364:	3842      	cmpnei      	r0, 2
     366:	0819      	bt      	0x398	// 398 <EPT_IO_SET+0xce>
		if(IO_Num_X==IO_NUM_PA00)
     368:	3950      	cmpnei      	r1, 16
     36a:	0803      	bt      	0x370	// 370 <EPT_IO_SET+0xa6>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0)|0X00000006;				//PA0.0
     36c:	036c      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     36e:	07d3      	br      	0x314	// 314 <EPT_IO_SET+0x4a>
		else if(IO_Num_X==IO_NUM_PA07)
     370:	3957      	cmpnei      	r1, 23
     372:	0809      	bt      	0x384	// 384 <EPT_IO_SET+0xba>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)|0X60000000;				//PA0.7
     374:	036e      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     376:	9340      	ld.w      	r2, (r3, 0x0)
     378:	9260      	ld.w      	r3, (r2, 0x0)
     37a:	4364      	lsli      	r3, r3, 4
     37c:	4b64      	lsri      	r3, r3, 4
     37e:	3bbd      	bseti      	r3, 29
     380:	3bbe      	bseti      	r3, 30
     382:	07ae      	br      	0x2de	// 2de <EPT_IO_SET+0x14>
		else if(IO_Num_X==IO_NUM_PA15)
     384:	3958      	cmpnei      	r1, 24
     386:	0bad      	bt      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFF0FFFFF)|0X00800000;				//PA1.5
     388:	0372      	lrw      	r3, 0x20000010	// 5bc <EPT_CPCR_Config+0x16>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF0FFFFF)|0X00800000;				//PB0.5
     38a:	9320      	ld.w      	r1, (r3, 0x0)
     38c:	32f0      	movi      	r2, 240
     38e:	9160      	ld.w      	r3, (r1, 0x0)
     390:	4250      	lsli      	r2, r2, 16
     392:	68c9      	andn      	r3, r2
     394:	3bb7      	bseti      	r3, 23
     396:	07ba      	br      	0x30a	// 30a <EPT_IO_SET+0x40>
	else if(EPT_IO_X==EPT_IO_CHBY)
     398:	3843      	cmpnei      	r0, 3
     39a:	080f      	bt      	0x3b8	// 3b8 <EPT_IO_SET+0xee>
		if(IO_Num_X==IO_NUM_PA01)
     39c:	3954      	cmpnei      	r1, 20
     39e:	0803      	bt      	0x3a4	// 3a4 <EPT_IO_SET+0xda>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)|0X00000060;				//PA0.1
     3a0:	0379      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     3a2:	07da      	br      	0x356	// 356 <EPT_IO_SET+0x8c>
		else if(IO_Num_X==IO_NUM_PA08)
     3a4:	3959      	cmpnei      	r1, 25
     3a6:	0b9d      	bt      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)|0X00000006;				//PA0.8
     3a8:	037b      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     3aa:	310f      	movi      	r1, 15
     3ac:	9340      	ld.w      	r2, (r3, 0x0)
     3ae:	9261      	ld.w      	r3, (r2, 0x4)
     3b0:	68c5      	andn      	r3, r1
     3b2:	3ba1      	bseti      	r3, 1
     3b4:	3ba2      	bseti      	r3, 2
     3b6:	079f      	br      	0x2f4	// 2f4 <EPT_IO_SET+0x2a>
	else if(EPT_IO_X==EPT_IO_CHCX)
     3b8:	3844      	cmpnei      	r0, 4
     3ba:	0811      	bt      	0x3dc	// 3dc <EPT_IO_SET+0x112>
		if(IO_Num_X==IO_NUM_PA05)
     3bc:	395a      	cmpnei      	r1, 26
     3be:	080b      	bt      	0x3d4	// 3d4 <EPT_IO_SET+0x10a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)|0X00700000;				//PA0.5
     3c0:	137e      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     3c2:	32f0      	movi      	r2, 240
     3c4:	9320      	ld.w      	r1, (r3, 0x0)
     3c6:	4250      	lsli      	r2, r2, 16
     3c8:	9160      	ld.w      	r3, (r1, 0x0)
     3ca:	68c9      	andn      	r3, r2
     3cc:	32e0      	movi      	r2, 224
     3ce:	424f      	lsli      	r2, r2, 15
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EBI3
     3d0:	6cc8      	or      	r3, r2
     3d2:	079c      	br      	0x30a	// 30a <EPT_IO_SET+0x40>
		else if(IO_Num_X==IO_NUM_PB04)
     3d4:	395b      	cmpnei      	r1, 27
     3d6:	0b85      	bt      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF)|0X00080000;				//PB0.4
     3d8:	137a      	lrw      	r3, 0x2000000c	// 5c0 <EPT_CPCR_Config+0x1a>
     3da:	0792      	br      	0x2fe	// 2fe <EPT_IO_SET+0x34>
	else if(EPT_IO_X==EPT_IO_CHCY)
     3dc:	3845      	cmpnei      	r0, 5
     3de:	0810      	bt      	0x3fe	// 3fe <EPT_IO_SET+0x134>
		if(IO_Num_X==IO_NUM_PA06)
     3e0:	395c      	cmpnei      	r1, 28
     3e2:	080a      	bt      	0x3f6	// 3f6 <EPT_IO_SET+0x12c>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF)|0X07000000;				//PA0.6
     3e4:	1375      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
     3e6:	32f0      	movi      	r2, 240
     3e8:	9320      	ld.w      	r1, (r3, 0x0)
     3ea:	4254      	lsli      	r2, r2, 20
     3ec:	9160      	ld.w      	r3, (r1, 0x0)
     3ee:	68c9      	andn      	r3, r2
     3f0:	32e0      	movi      	r2, 224
     3f2:	4253      	lsli      	r2, r2, 19
     3f4:	07ee      	br      	0x3d0	// 3d0 <EPT_IO_SET+0x106>
		else if(IO_Num_X==IO_NUM_PB05)
     3f6:	395d      	cmpnei      	r1, 29
     3f8:	0b74      	bt      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF0FFFFF)|0X00800000;				//PB0.5
     3fa:	1372      	lrw      	r3, 0x2000000c	// 5c0 <EPT_CPCR_Config+0x1a>
     3fc:	07c7      	br      	0x38a	// 38a <EPT_IO_SET+0xc0>
	else if(EPT_IO_X==EPT_IO_CHD)
     3fe:	3846      	cmpnei      	r0, 6
     400:	0822      	bt      	0x444	// 444 <EPT_IO_SET+0x17a>
		if(IO_Num_X==IO_NUM_PA02)
     402:	395e      	cmpnei      	r1, 30
     404:	080a      	bt      	0x418	// 418 <EPT_IO_SET+0x14e>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)|0X00000700;				//PA0.2
     406:	136d      	lrw      	r3, 0x20000014	// 5b8 <EPT_CPCR_Config+0x12>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EBI3
     408:	9320      	ld.w      	r1, (r3, 0x0)
     40a:	32f0      	movi      	r2, 240
     40c:	4244      	lsli      	r2, r2, 4
     40e:	9160      	ld.w      	r3, (r1, 0x0)
     410:	68c9      	andn      	r3, r2
     412:	32e0      	movi      	r2, 224
     414:	4243      	lsli      	r2, r2, 3
     416:	07dd      	br      	0x3d0	// 3d0 <EPT_IO_SET+0x106>
		else if(IO_Num_X==IO_NUM_PA13)
     418:	395f      	cmpnei      	r1, 31
     41a:	080a      	bt      	0x42e	// 42e <EPT_IO_SET+0x164>
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFF0FFF)|0X00007000;				//PA1.3
     41c:	1368      	lrw      	r3, 0x20000010	// 5bc <EPT_CPCR_Config+0x16>
     41e:	32f0      	movi      	r2, 240
     420:	9320      	ld.w      	r1, (r3, 0x0)
     422:	4248      	lsli      	r2, r2, 8
     424:	9160      	ld.w      	r3, (r1, 0x0)
     426:	68c9      	andn      	r3, r2
     428:	32e0      	movi      	r2, 224
     42a:	4247      	lsli      	r2, r2, 7
     42c:	07d2      	br      	0x3d0	// 3d0 <EPT_IO_SET+0x106>
		else if(IO_Num_X==IO_NUM_PB04)
     42e:	395b      	cmpnei      	r1, 27
     430:	0b58      	bt      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF)|0X00060000;				//PB0.4
     432:	1364      	lrw      	r3, 0x2000000c	// 5c0 <EPT_CPCR_Config+0x1a>
     434:	32f0      	movi      	r2, 240
     436:	9320      	ld.w      	r1, (r3, 0x0)
     438:	9160      	ld.w      	r3, (r1, 0x0)
     43a:	424c      	lsli      	r2, r2, 12
     43c:	68c9      	andn      	r3, r2
     43e:	3bb1      	bseti      	r3, 17
     440:	3bb2      	bseti      	r3, 18
     442:	0764      	br      	0x30a	// 30a <EPT_IO_SET+0x40>
	else if(EPT_IO_X==EPT_IO_EBI)
     444:	3847      	cmpnei      	r0, 7
     446:	0b4d      	bt      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
		if(IO_Num_X==IO_NUM_PA10)
     448:	3320      	movi      	r3, 32
     44a:	64c6      	cmpne      	r1, r3
     44c:	0809      	bt      	0x45e	// 45e <EPT_IO_SET+0x194>
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFFFF0)|0X00000007;				//PA1.0 EBI0
     44e:	127c      	lrw      	r3, 0x20000010	// 5bc <EPT_CPCR_Config+0x16>
     450:	310f      	movi      	r1, 15
     452:	9340      	ld.w      	r2, (r3, 0x0)
     454:	9260      	ld.w      	r3, (r2, 0x0)
     456:	68c5      	andn      	r3, r1
     458:	6c0c      	or      	r0, r3
     45a:	b200      	st.w      	r0, (r2, 0x0)
     45c:	0742      	br      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
		else if(IO_Num_X==IO_NUM_PA11)
     45e:	3321      	movi      	r3, 33
     460:	64c6      	cmpne      	r1, r3
     462:	0809      	bt      	0x474	// 474 <EPT_IO_SET+0x1aa>
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFFF0F)|0X00000070;				//PA1.1 EBI1
     464:	1276      	lrw      	r3, 0x20000010	// 5bc <EPT_CPCR_Config+0x16>
     466:	31f0      	movi      	r1, 240
     468:	9340      	ld.w      	r2, (r3, 0x0)
     46a:	9260      	ld.w      	r3, (r2, 0x0)
     46c:	68c5      	andn      	r3, r1
     46e:	3170      	movi      	r1, 112
     470:	6cc4      	or      	r3, r1
     472:	0736      	br      	0x2de	// 2de <EPT_IO_SET+0x14>
		else if(IO_Num_X==IO_NUM_PA12)
     474:	3322      	movi      	r3, 34
     476:	64c6      	cmpne      	r1, r3
     478:	0803      	bt      	0x47e	// 47e <EPT_IO_SET+0x1b4>
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFF0FF)|0X00000700;				//PA1.2 EBI2
     47a:	1271      	lrw      	r3, 0x20000010	// 5bc <EPT_CPCR_Config+0x16>
     47c:	07c6      	br      	0x408	// 408 <EPT_IO_SET+0x13e>
		else if(IO_Num_X==IO_NUM_PB02)
     47e:	3323      	movi      	r3, 35
     480:	64c6      	cmpne      	r1, r3
     482:	0b2f      	bt      	0x2e0	// 2e0 <EPT_IO_SET+0x16>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)|0X00000700;				//PB0.2 EBI3
     484:	126f      	lrw      	r3, 0x2000000c	// 5c0 <EPT_CPCR_Config+0x1a>
     486:	07c1      	br      	0x408	// 408 <EPT_IO_SET+0x13e>

00000488 <EPT_PWM_Config>:
//ReturnValue:NONE
/*************************************************************/  
//Fclk=Fpclk/(PSC+1)
void EPT_PWM_Config(EPT_TCLK_Selecte_Type EPT_TCLK_Selecte_X , EPT_CNTMD_SELECTE_Type EPT_CNTMD_SELECTE_X  , EPT_OPM_SELECTE_Type EPT_OPM_SELECTE_X
					, U16_T EPT_PSCR)		
{
     488:	14c3      	push      	r4-r6
     48a:	6d8b      	mov      	r6, r2
	EPT0->CEDR=(EPT0->CEDR&0XFFFFFF00)|(0X01|EPT_TCLK_Selecte_X|(0X01<<1)|(0X00<<6));
     48c:	1249      	lrw      	r2, 0x20000034	// 5b0 <EPT_CPCR_Config+0xa>
	if(EPT_TCLK_Selecte_X==EPT_Selecte_PCLK)
     48e:	3840      	cmpnei      	r0, 0
	EPT0->CEDR=(EPT0->CEDR&0XFFFFFF00)|(0X01|EPT_TCLK_Selecte_X|(0X01<<1)|(0X00<<6));
     490:	92a0      	ld.w      	r5, (r2, 0x0)
     492:	9580      	ld.w      	r4, (r5, 0x0)
     494:	32ff      	movi      	r2, 255
     496:	6909      	andn      	r4, r2
     498:	3ca0      	bseti      	r4, 0
     49a:	3ca1      	bseti      	r4, 1
     49c:	6d00      	or      	r4, r0
     49e:	b580      	st.w      	r4, (r5, 0x0)
	if(EPT_TCLK_Selecte_X==EPT_Selecte_PCLK)
     4a0:	0802      	bt      	0x4a4	// 4a4 <EPT_PWM_Config+0x1c>
	{
		EPT0->PSCR=EPT_PSCR;
     4a2:	b562      	st.w      	r3, (r5, 0x8)
	}
	EPT0->CR=(EPT0->CR&0xfff8ffc0)|EPT_CNTMD_SELECTE_X|(0x1<<2)|(0x0<<3)|(0x0<<4)|EPT_OPM_SELECTE_X|(0X0<<16)|(0x1<<18);
     4a4:	9543      	ld.w      	r2, (r5, 0xc)
     4a6:	1268      	lrw      	r3, 0x7003f	// 5c4 <EPT_CPCR_Config+0x1e>
     4a8:	688d      	andn      	r2, r3
     4aa:	6c98      	or      	r2, r6
     4ac:	3aa2      	bseti      	r2, 2
     4ae:	3ab2      	bseti      	r2, 18
     4b0:	6c48      	or      	r1, r2
     4b2:	b523      	st.w      	r1, (r5, 0xc)
} 
     4b4:	1483      	pop      	r4-r6

000004b6 <EPT_CG_gate_Config>:
//EPT_CGFLT_CNT:0~7
//EPT_BURST_CMD:EPT_BURST_ENABLE,EPT_BURST_DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void EPT_CG_gate_Config(EPT_CGSRC_TIN_Selecte_Type EPT_CGSRC_TIN_Selecte_X , U8_T EPT_CGFLT_DIV , U8_T EPT_CGFLT_CNT , EPT_BURST_CMD_Type EPT_BURST_CMD)
{
     4b6:	14c3      	push      	r4-r6
	EPT0->CR=(EPT0->CR&0xffff01ff)|EPT_BURST_CMD|EPT_CGFLT_CNT<<13|0x01<<10;
     4b8:	119e      	lrw      	r4, 0x20000034	// 5b0 <EPT_CPCR_Config+0xa>
     4ba:	36fe      	movi      	r6, 254
     4bc:	9480      	ld.w      	r4, (r4, 0x0)
     4be:	94a3      	ld.w      	r5, (r4, 0xc)
     4c0:	46c8      	lsli      	r6, r6, 8
     4c2:	6959      	andn      	r5, r6
     4c4:	3daa      	bseti      	r5, 10
     4c6:	424d      	lsli      	r2, r2, 13
     4c8:	6cd4      	or      	r3, r5
     4ca:	6cc8      	or      	r3, r2
     4cc:	b463      	st.w      	r3, (r4, 0xc)
	EPT0->CEDR=(EPT0->CEDR&0XFFFF00CF)|(EPT_CGFLT_DIV<<8);
     4ce:	9460      	ld.w      	r3, (r4, 0x0)
     4d0:	115e      	lrw      	r2, 0xff30	// 5c8 <EPT_CPCR_Config+0x22>
     4d2:	68c9      	andn      	r3, r2
     4d4:	4128      	lsli      	r1, r1, 8
     4d6:	6c4c      	or      	r1, r3
	if(EPT_CGSRC_TIN_Selecte_X==EPT_CGSRC_DIS)
     4d8:	3844      	cmpnei      	r0, 4
	EPT0->CEDR=(EPT0->CEDR&0XFFFF00CF)|(EPT_CGFLT_DIV<<8);
     4da:	b420      	st.w      	r1, (r4, 0x0)
	if(EPT_CGSRC_TIN_Selecte_X==EPT_CGSRC_DIS)
     4dc:	0808      	bt      	0x4ec	// 4ec <EPT_CG_gate_Config+0x36>
	{
		EPT0->CEDR|=0X00<<4;
     4de:	9460      	ld.w      	r3, (r4, 0x0)
     4e0:	b460      	st.w      	r3, (r4, 0x0)
		EPT0->CR|=0X03<<11;
     4e2:	9463      	ld.w      	r3, (r4, 0xc)
     4e4:	3bab      	bseti      	r3, 11
     4e6:	3bac      	bseti      	r3, 12
		EPT0->CR|=0X00<<11;
	}
	else if(EPT_CGSRC_TIN_Selecte_X==EPT_CGSRC_CHBX)
	{
		EPT0->CEDR|=0X00<<4;
		EPT0->CR|=0X01<<11;
     4e8:	b463      	st.w      	r3, (r4, 0xc)
	}
}
     4ea:	1483      	pop      	r4-r6
	else if(EPT_CGSRC_TIN_Selecte_X==EPT_CGSRC_TIN_BT0OUT)
     4ec:	3840      	cmpnei      	r0, 0
     4ee:	0807      	bt      	0x4fc	// 4fc <EPT_CG_gate_Config+0x46>
		EPT0->CEDR|=0X01<<4;
     4f0:	9460      	ld.w      	r3, (r4, 0x0)
     4f2:	3ba4      	bseti      	r3, 4
		EPT0->CEDR|=0X02<<4;
     4f4:	b460      	st.w      	r3, (r4, 0x0)
		EPT0->CR|=0X02<<11;
     4f6:	9463      	ld.w      	r3, (r4, 0xc)
     4f8:	3bac      	bseti      	r3, 12
     4fa:	07f7      	br      	0x4e8	// 4e8 <EPT_CG_gate_Config+0x32>
	else if(EPT_CGSRC_TIN_Selecte_X==EPT_CGSRC_TIN_BT1OUT)
     4fc:	3841      	cmpnei      	r0, 1
     4fe:	0804      	bt      	0x506	// 506 <EPT_CG_gate_Config+0x50>
		EPT0->CEDR|=0X02<<4;
     500:	9460      	ld.w      	r3, (r4, 0x0)
     502:	3ba5      	bseti      	r3, 5
     504:	07f8      	br      	0x4f4	// 4f4 <EPT_CG_gate_Config+0x3e>
	else if(EPT_CGSRC_TIN_Selecte_X==EPT_CGSRC_CHAX)
     506:	3842      	cmpnei      	r0, 2
     508:	0805      	bt      	0x512	// 512 <EPT_CG_gate_Config+0x5c>
		EPT0->CEDR|=0X00<<4;
     50a:	9460      	ld.w      	r3, (r4, 0x0)
     50c:	b460      	st.w      	r3, (r4, 0x0)
		EPT0->CR|=0X00<<11;
     50e:	9463      	ld.w      	r3, (r4, 0xc)
     510:	07ec      	br      	0x4e8	// 4e8 <EPT_CG_gate_Config+0x32>
	else if(EPT_CGSRC_TIN_Selecte_X==EPT_CGSRC_CHBX)
     512:	3843      	cmpnei      	r0, 3
     514:	0beb      	bt      	0x4ea	// 4ea <EPT_CG_gate_Config+0x34>
		EPT0->CEDR|=0X00<<4;
     516:	9460      	ld.w      	r3, (r4, 0x0)
     518:	b460      	st.w      	r3, (r4, 0x0)
		EPT0->CR|=0X01<<11;
     51a:	9463      	ld.w      	r3, (r4, 0xc)
     51c:	3bab      	bseti      	r3, 11
     51e:	07e5      	br      	0x4e8	// 4e8 <EPT_CG_gate_Config+0x32>

00000520 <EPT_Capture_Config>:
//ReturnValue:NONE
/*************************************************************/  
void EPT_Capture_Config(EPT_TCLK_Selecte_Type EPT_TCLK_Selecte_X , EPT_CNTMD_SELECTE_Type EPT_CNTMD_SELECTE_X  , EPT_CAPMD_SELECTE_Type EPT_CAPMD_SELECTE_X , EPT_CAPLDEN_CMD_Type CAP_CMD 
					, EPT_LOAD_CMPA_RST_CMD_Type EPT_LOAD_CMPA_RST_CMD , EPT_LOAD_CMPB_RST_CMD_Type EPT_LOAD_CMPB_RST_CMD , EPT_LOAD_CMPC_RST_CMD_Type EPT_LOAD_CMPC_RST_CMD
					, EPT_LOAD_CMPD_RST_CMD_Type EPT_LOAD_CMPD_RST_CMD , U8_T EPT_STOP_WRAP , U16_T EPT_PSCR)
{
     520:	14c4      	push      	r4-r7
     522:	1425      	subi      	r14, r14, 20
     524:	9889      	ld.w      	r4, (r14, 0x24)
     526:	b880      	st.w      	r4, (r14, 0x0)
     528:	988a      	ld.w      	r4, (r14, 0x28)
     52a:	b881      	st.w      	r4, (r14, 0x4)
     52c:	988b      	ld.w      	r4, (r14, 0x2c)
     52e:	b882      	st.w      	r4, (r14, 0x8)
     530:	988c      	ld.w      	r4, (r14, 0x30)
     532:	b883      	st.w      	r4, (r14, 0xc)
     534:	1c0d      	addi      	r4, r14, 52
     536:	8480      	ld.b      	r4, (r4, 0x0)
     538:	b884      	st.w      	r4, (r14, 0x10)
	EPT0->CEDR=(EPT0->CEDR&0XFFFFFF00)|(0X01|EPT_TCLK_Selecte_X|(0X01<<1)|(0X00<<6));
     53a:	37ff      	movi      	r7, 255
     53c:	109d      	lrw      	r4, 0x20000034	// 5b0 <EPT_CPCR_Config+0xa>
	if(EPT_TCLK_Selecte_X==EPT_Selecte_PCLK)
     53e:	3840      	cmpnei      	r0, 0
	EPT0->CEDR=(EPT0->CEDR&0XFFFFFF00)|(0X01|EPT_TCLK_Selecte_X|(0X01<<1)|(0X00<<6));
     540:	94a0      	ld.w      	r5, (r4, 0x0)
     542:	9580      	ld.w      	r4, (r5, 0x0)
     544:	691d      	andn      	r4, r7
     546:	3ca0      	bseti      	r4, 0
     548:	3ca1      	bseti      	r4, 1
     54a:	6d00      	or      	r4, r0
{
     54c:	d8ce101c 	ld.h      	r6, (r14, 0x38)
	EPT0->CEDR=(EPT0->CEDR&0XFFFFFF00)|(0X01|EPT_TCLK_Selecte_X|(0X01<<1)|(0X00<<6));
     550:	b580      	st.w      	r4, (r5, 0x0)
	if(EPT_TCLK_Selecte_X==EPT_Selecte_PCLK)
     552:	0802      	bt      	0x556	// 556 <EPT_Capture_Config+0x36>
	{
		EPT0->PSCR=EPT_PSCR;
     554:	b5c2      	st.w      	r6, (r5, 0x8)
	}
	EPT0->CR=(EPT0->CR&0xf800fec0)|EPT_CNTMD_SELECTE_X|(0x0<<2)|(0x0<<3)|(0x0<<4)|CAP_CMD|EPT_CAPMD_SELECTE_X|(0X0<<16)|(0x0<<18)|(EPT_STOP_WRAP<<21)|
     556:	9503      	ld.w      	r0, (r5, 0xc)
     558:	109d      	lrw      	r4, 0x7ff013f	// 5cc <EPT_CPCR_Config+0x26>
     55a:	6811      	andn      	r0, r4
				EPT_LOAD_CMPA_RST_CMD|EPT_LOAD_CMPB_RST_CMD|EPT_LOAD_CMPC_RST_CMD|EPT_LOAD_CMPD_RST_CMD;
     55c:	9883      	ld.w      	r4, (r14, 0xc)
     55e:	6c10      	or      	r0, r4
     560:	9882      	ld.w      	r4, (r14, 0x8)
     562:	6c10      	or      	r0, r4
     564:	9881      	ld.w      	r4, (r14, 0x4)
     566:	6c10      	or      	r0, r4
     568:	9880      	ld.w      	r4, (r14, 0x0)
     56a:	6c10      	or      	r0, r4
     56c:	6c80      	or      	r2, r0
     56e:	6cc8      	or      	r3, r2
     570:	6c4c      	or      	r1, r3
	EPT0->CR=(EPT0->CR&0xf800fec0)|EPT_CNTMD_SELECTE_X|(0x0<<2)|(0x0<<3)|(0x0<<4)|CAP_CMD|EPT_CAPMD_SELECTE_X|(0X0<<16)|(0x0<<18)|(EPT_STOP_WRAP<<21)|
     572:	9864      	ld.w      	r3, (r14, 0x10)
     574:	4375      	lsli      	r3, r3, 21
				EPT_LOAD_CMPA_RST_CMD|EPT_LOAD_CMPB_RST_CMD|EPT_LOAD_CMPC_RST_CMD|EPT_LOAD_CMPD_RST_CMD;
     576:	6c4c      	or      	r1, r3
	EPT0->CR=(EPT0->CR&0xf800fec0)|EPT_CNTMD_SELECTE_X|(0x0<<2)|(0x0<<3)|(0x0<<4)|CAP_CMD|EPT_CAPMD_SELECTE_X|(0X0<<16)|(0x0<<18)|(EPT_STOP_WRAP<<21)|
     578:	b523      	st.w      	r1, (r5, 0xc)
}
     57a:	1405      	addi      	r14, r14, 20
     57c:	1484      	pop      	r4-r7

0000057e <EPT_SYNCR_Config>:
//EPT_SYNCR_EN:0~0X3F
//ReturnValue:NONE
/*************************************************************/  
void EPT_SYNCR_Config(EPT_Triggle_Mode_Type EPT_Triggle_X , EPT_SYNCUSR0_REARMTrig_Selecte_Type EPT_SYNCUSR0_REARMTrig_Selecte , EPT_TRGSRC0_ExtSync_Selected_Type EPT_TRGSRC0_ExtSync_Selected ,
					  EPT_TRGSRC1_ExtSync_Selected_Type EPT_TRGSRC1_ExtSync_Selected , U8_T EPT_SYNCR_EN)
{
     57e:	14c4      	push      	r4-r7
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     580:	108c      	lrw      	r4, 0x20000034	// 5b0 <EPT_CPCR_Config+0xa>
     582:	3680      	movi      	r6, 128
     584:	9480      	ld.w      	r4, (r4, 0x0)
     586:	6190      	addu      	r6, r4
     588:	10eb      	lrw      	r7, 0xa55ac73a	// 5b4 <EPT_CPCR_Config+0xe>
     58a:	b6fa      	st.w      	r7, (r6, 0x68)
	EPT0->SYNCR = (EPT0->SYNCR&0XC03F0000) |EPT_SYNCR_EN|EPT_Triggle_X|EPT_SYNCUSR0_REARMTrig_Selecte|EPT_TRGSRC0_ExtSync_Selected|EPT_TRGSRC1_ExtSync_Selected;
     58c:	10f1      	lrw      	r7, 0x3fc10000	// 5d0 <EPT_CPCR_Config+0x2a>
     58e:	94c4      	ld.w      	r6, (r4, 0x10)
     590:	2f00      	subi      	r7, 1
     592:	699d      	andn      	r6, r7
     594:	6cd8      	or      	r3, r6
     596:	6c8c      	or      	r2, r3
     598:	6c48      	or      	r1, r2
{
     59a:	d8ae0010 	ld.b      	r5, (r14, 0x10)
	EPT0->SYNCR = (EPT0->SYNCR&0XC03F0000) |EPT_SYNCR_EN|EPT_Triggle_X|EPT_SYNCUSR0_REARMTrig_Selecte|EPT_TRGSRC0_ExtSync_Selected|EPT_TRGSRC1_ExtSync_Selected;
     59e:	6c04      	or      	r0, r1
     5a0:	6c14      	or      	r0, r5
     5a2:	b404      	st.w      	r0, (r4, 0x10)
}
     5a4:	1484      	pop      	r4-r7

000005a6 <EPT_CPCR_Config>:
//ReturnValue:NONE
/*************************************************************/ 
//Fchop=PCLK/((CDIV+1)/8)  //Carrier frequency setting (CDIV>=1)
//Twidth=Tchop*OSPWTH //First pulse width setting  
void EPT_CPCR_Config(EPT_CPCR_CMD_Type EPT_CPCR_CMD , EPT_CPCR_Source_Selecte_Type EPT_CPCR_Source_X , EPT_CDUTY_Type EPT_CDUTY_X , U8_T EPT_CPCR_OSPWTH , U8_T EPT_CPCR_CDIV)
{
     5a6:	14c3      	push      	r4-r6
     5a8:	d8ae000c 	ld.b      	r5, (r14, 0xc)
     5ac:	0414      	br      	0x5d4	// 5d4 <EPT_CPCR_Config+0x2e>
     5ae:	0000      	bkpt
     5b0:	20000034 	.long	0x20000034
     5b4:	a55ac73a 	.long	0xa55ac73a
     5b8:	20000014 	.long	0x20000014
     5bc:	20000010 	.long	0x20000010
     5c0:	2000000c 	.long	0x2000000c
     5c4:	0007003f 	.long	0x0007003f
     5c8:	0000ff30 	.long	0x0000ff30
     5cc:	07ff013f 	.long	0x07ff013f
     5d0:	3fc10000 	.long	0x3fc10000
	if(EPT_CPCR_Source_X==EPT_CPCR_Source_TCLK)
     5d4:	3940      	cmpnei      	r1, 0
{
     5d6:	6d83      	mov      	r6, r0
     5d8:	0289      	lrw      	r4, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
     5da:	4010      	lsli      	r0, r0, 16
     5dc:	4362      	lsli      	r3, r3, 2
     5de:	45a7      	lsli      	r5, r5, 7
	if(EPT_CPCR_Source_X==EPT_CPCR_Source_TCLK)
     5e0:	0807      	bt      	0x5ee	// 5ee <EPT_CPCR_Config+0x48>
	{
		EPT0->CPCR=(EPT_CPCR_CMD<<16)|(EPT_CPCR_CDIV<<7)|(EPT_CPCR_OSPWTH<<2)|EPT_CDUTY_X|(0x00<<14);
     5e2:	6c0c      	or      	r0, r3
     5e4:	6c08      	or      	r0, r2
     5e6:	9420      	ld.w      	r1, (r4, 0x0)
     5e8:	6c14      	or      	r0, r5
     5ea:	b11e      	st.w      	r0, (r1, 0x78)
		if(EPT_CPCR_Source_X==EPT_CPCR_Source_TIN_BT1OUT)
		{
			EPT0->CEDR=(EPT0->CEDR&0xffffffcf)|(0x02<<4);
		}
	}
}
     5ec:	1483      	pop      	r4-r6
		EPT0->CPCR=(EPT_CPCR_CMD<<16)|(EPT_CPCR_CDIV<<7)|(EPT_CPCR_OSPWTH<<2)|EPT_CDUTY_X|(0x01<<14);
     5ee:	3aae      	bseti      	r2, 14
     5f0:	6c08      	or      	r0, r2
     5f2:	6c0c      	or      	r0, r3
     5f4:	9480      	ld.w      	r4, (r4, 0x0)
     5f6:	6c14      	or      	r0, r5
		if(EPT_CPCR_Source_X==EPT_CPCR_Source_TIN_BT0OUT)
     5f8:	3941      	cmpnei      	r1, 1
		EPT0->CPCR=(EPT_CPCR_CMD<<16)|(EPT_CPCR_CDIV<<7)|(EPT_CPCR_OSPWTH<<2)|EPT_CDUTY_X|(0x01<<14);
     5fa:	b41e      	st.w      	r0, (r4, 0x78)
		if(EPT_CPCR_Source_X==EPT_CPCR_Source_TIN_BT0OUT)
     5fc:	0807      	bt      	0x60a	// 60a <EPT_CPCR_Config+0x64>
			EPT0->CEDR=(EPT0->CEDR&0xffffffcf)|(0x01<<4);
     5fe:	9460      	ld.w      	r3, (r4, 0x0)
     600:	3b84      	bclri      	r3, 4
     602:	3b85      	bclri      	r3, 5
     604:	3ba4      	bseti      	r3, 4
			EPT0->CEDR=(EPT0->CEDR&0xffffffcf)|(0x02<<4);
     606:	b460      	st.w      	r3, (r4, 0x0)
}
     608:	07f2      	br      	0x5ec	// 5ec <EPT_CPCR_Config+0x46>
		if(EPT_CPCR_Source_X==EPT_CPCR_Source_TIN_BT1OUT)
     60a:	3942      	cmpnei      	r1, 2
     60c:	0bf0      	bt      	0x5ec	// 5ec <EPT_CPCR_Config+0x46>
			EPT0->CEDR=(EPT0->CEDR&0xffffffcf)|(0x02<<4);
     60e:	9460      	ld.w      	r3, (r4, 0x0)
     610:	3b84      	bclri      	r3, 4
     612:	3b85      	bclri      	r3, 5
     614:	3ba5      	bseti      	r3, 5
     616:	07f8      	br      	0x606	// 606 <EPT_CPCR_Config+0x60>

00000618 <EPT_DBCR_Config>:
//EPT_OUT_POLARITY_X:EPT_PA_PB_OUT_Direct,EPT_PA_OUT_Reverse,EPT_PB_OUT_Reverse,EPT_PA_PB_OUT_Reverse
//EPT_OUT_SWAP_X:EPT_PAtoCHX_PBtoCHY,EPT_PBtoCHX_PBtoCHY,EPT_PAtoCHX_PAtoCHY,EPT_PBtoCHX_PAtoCHY
//ReturnValue:NONE
/*************************************************************/   
void EPT_DBCR_Config(EPT_CHX_Selecte_Type EPT_CHX_Selecte , EPT_INSEL_Type EPT_INSEL_X , EPT_OUTSEL_Type EPT_OUTSEL_X , EPT_OUT_POLARITY_Type EPT_OUT_POLARITY_X , EPT_OUT_SWAP_Type EPT_OUT_SWAP_X)
{	
     618:	14c4      	push      	r4-r7
	if(EPT_CHX_Selecte==EPT_CHA_Selecte)
     61a:	3840      	cmpnei      	r0, 0
{	
     61c:	98c4      	ld.w      	r6, (r14, 0x10)
     61e:	029a      	lrw      	r4, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
	if(EPT_CHX_Selecte==EPT_CHA_Selecte)
     620:	0811      	bt      	0x642	// 642 <EPT_DBCR_Config+0x2a>
	{
		EPT0->DBCR=(EPT0->DBCR&0XFFFFFF00)|EPT_INSEL_X|EPT_OUTSEL_X|(EPT_OUT_POLARITY_X<<2)|(EPT_OUT_SWAP_X<<6);
     622:	94a0      	ld.w      	r5, (r4, 0x0)
     624:	95fa      	ld.w      	r7, (r5, 0x68)
     626:	30ff      	movi      	r0, 255
     628:	69c1      	andn      	r7, r0
     62a:	46c6      	lsli      	r6, r6, 6
     62c:	6d9c      	or      	r6, r7
     62e:	6c98      	or      	r2, r6
     630:	4362      	lsli      	r3, r3, 2
	{
		EPT0->DBCR=(EPT0->DBCR&0XFFFF00FF)|EPT_INSEL_X|EPT_OUTSEL_X|(EPT_OUT_POLARITY_X<<10)|(EPT_OUT_SWAP_X<<14);
	}
	else if(EPT_CHX_Selecte==EPT_CHC_Selecte)
	{
		EPT0->DBCR=(EPT0->DBCR&0XFF00FFFF)|EPT_INSEL_X|EPT_OUTSEL_X|(EPT_OUT_POLARITY_X<<18)|(EPT_OUT_SWAP_X<<22);
     632:	6cc8      	or      	r3, r2
     634:	6c4c      	or      	r1, r3
     636:	b53a      	st.w      	r1, (r5, 0x68)
	}
	EPT0->DBCR|=0x01<<24;
     638:	9440      	ld.w      	r2, (r4, 0x0)
     63a:	927a      	ld.w      	r3, (r2, 0x68)
     63c:	3bb8      	bseti      	r3, 24
     63e:	b27a      	st.w      	r3, (r2, 0x68)
}
     640:	1484      	pop      	r4-r7
	else if(EPT_CHX_Selecte==EPT_CHB_Selecte)
     642:	3841      	cmpnei      	r0, 1
     644:	080b      	bt      	0x65a	// 65a <EPT_DBCR_Config+0x42>
		EPT0->DBCR=(EPT0->DBCR&0XFFFF00FF)|EPT_INSEL_X|EPT_OUTSEL_X|(EPT_OUT_POLARITY_X<<10)|(EPT_OUT_SWAP_X<<14);
     646:	94a0      	ld.w      	r5, (r4, 0x0)
     648:	30ff      	movi      	r0, 255
     64a:	95fa      	ld.w      	r7, (r5, 0x68)
     64c:	4008      	lsli      	r0, r0, 8
     64e:	69c1      	andn      	r7, r0
     650:	46ce      	lsli      	r6, r6, 14
     652:	6d9c      	or      	r6, r7
     654:	6c98      	or      	r2, r6
     656:	436a      	lsli      	r3, r3, 10
     658:	07ed      	br      	0x632	// 632 <EPT_DBCR_Config+0x1a>
	else if(EPT_CHX_Selecte==EPT_CHC_Selecte)
     65a:	3842      	cmpnei      	r0, 2
     65c:	0bee      	bt      	0x638	// 638 <EPT_DBCR_Config+0x20>
		EPT0->DBCR=(EPT0->DBCR&0XFF00FFFF)|EPT_INSEL_X|EPT_OUTSEL_X|(EPT_OUT_POLARITY_X<<18)|(EPT_OUT_SWAP_X<<22);
     65e:	94a0      	ld.w      	r5, (r4, 0x0)
     660:	37ff      	movi      	r7, 255
     662:	951a      	ld.w      	r0, (r5, 0x68)
     664:	47f0      	lsli      	r7, r7, 16
     666:	681d      	andn      	r0, r7
     668:	46d6      	lsli      	r6, r6, 22
     66a:	6c18      	or      	r0, r6
     66c:	6c80      	or      	r2, r0
     66e:	4372      	lsli      	r3, r3, 18
     670:	07e1      	br      	0x632	// 632 <EPT_DBCR_Config+0x1a>

00000672 <EPT_DB_CLK_Config>:
//ReturnValue:NONE
/*************************************************************/   
//Fdbclk=Fhclk/(DPSC+1)
void EPT_DB_CLK_Config(U16_T DPSC , U16_T DTR , U16_T DTF)
{
	EPT0->DPSCR=DPSC;
     672:	036f      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
     674:	9360      	ld.w      	r3, (r3, 0x0)
     676:	b31b      	st.w      	r0, (r3, 0x6c)
	EPT0->DBDTR=DTR;
     678:	b33c      	st.w      	r1, (r3, 0x70)
	EPT0->DBDTF=DTF;
     67a:	b35d      	st.w      	r2, (r3, 0x74)
}
     67c:	783c      	jmp      	r15

0000067e <EPT_PWMX_Output_Control>:
							 EPT_PWM_CAU_Output_Type EPT_PWM_CAU_Event_Output , EPT_PWM_CAD_Output_Type EPT_PWM_CAD_Event_Output ,
							 EPT_PWM_CBU_Output_Type EPT_PWM_CBU_Event_Output , EPT_PWM_CBD_Output_Type EPT_PWM_CBD_Event_Output ,
							 EPT_PWM_T1U_Output_Type EPT_PWM_T1U_Event_Output , EPT_PWM_T1D_Output_Type EPT_PWM_T1D_Event_Output ,
							 EPT_PWM_T2U_Output_Type EPT_PWM_T2U_Event_Output , EPT_PWM_T2D_Output_Type EPT_PWM_T2D_Event_Output 
							 )
{
     67e:	14c4      	push      	r4-r7
     680:	1425      	subi      	r14, r14, 20
     682:	9889      	ld.w      	r4, (r14, 0x24)
     684:	b880      	st.w      	r4, (r14, 0x0)
     686:	988a      	ld.w      	r4, (r14, 0x28)
     688:	b881      	st.w      	r4, (r14, 0x4)
     68a:	988b      	ld.w      	r4, (r14, 0x2c)
     68c:	b882      	st.w      	r4, (r14, 0x8)
     68e:	988c      	ld.w      	r4, (r14, 0x30)
     690:	b883      	st.w      	r4, (r14, 0xc)
	if(EPT_PWMX_Selecte==EPT_PWMA)
     692:	3840      	cmpnei      	r0, 0
{
     694:	988d      	ld.w      	r4, (r14, 0x34)
     696:	b884      	st.w      	r4, (r14, 0x10)
     698:	98ce      	ld.w      	r6, (r14, 0x38)
     69a:	98ef      	ld.w      	r7, (r14, 0x3c)
     69c:	98b0      	ld.w      	r5, (r14, 0x40)
     69e:	9891      	ld.w      	r4, (r14, 0x44)
	if(EPT_PWMX_Selecte==EPT_PWMA)
     6a0:	0816      	bt      	0x6cc	// 6cc <EPT_PWMX_Output_Control+0x4e>
	{
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     6a2:	6d14      	or      	r4, r5
     6a4:	6d1c      	or      	r4, r7
     6a6:	98a4      	ld.w      	r5, (r14, 0x10)
     6a8:	6d18      	or      	r4, r6
     6aa:	6d14      	or      	r4, r5
     6ac:	98a3      	ld.w      	r5, (r14, 0xc)
     6ae:	6d14      	or      	r4, r5
     6b0:	98a2      	ld.w      	r5, (r14, 0x8)
     6b2:	6d14      	or      	r4, r5
     6b4:	98a1      	ld.w      	r5, (r14, 0x4)
     6b6:	6d14      	or      	r4, r5
     6b8:	98a0      	ld.w      	r5, (r14, 0x0)
     6ba:	6d14      	or      	r4, r5
     6bc:	6cd0      	or      	r3, r4
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     6be:	131d      	lrw      	r0, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     6c0:	6c8c      	or      	r2, r3
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     6c2:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     6c4:	6c48      	or      	r1, r2
		EPT0->AQCRA=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     6c6:	b032      	st.w      	r1, (r0, 0x48)
	{
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
	}
	
}
     6c8:	1405      	addi      	r14, r14, 20
     6ca:	1484      	pop      	r4-r7
	else if(EPT_PWMX_Selecte==EPT_PWMB)
     6cc:	3841      	cmpnei      	r0, 1
     6ce:	0815      	bt      	0x6f8	// 6f8 <EPT_PWMX_Output_Control+0x7a>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     6d0:	6d14      	or      	r4, r5
     6d2:	6d1c      	or      	r4, r7
     6d4:	98a4      	ld.w      	r5, (r14, 0x10)
     6d6:	6d18      	or      	r4, r6
     6d8:	6d14      	or      	r4, r5
     6da:	98a3      	ld.w      	r5, (r14, 0xc)
     6dc:	6d14      	or      	r4, r5
     6de:	98a2      	ld.w      	r5, (r14, 0x8)
     6e0:	6d14      	or      	r4, r5
     6e2:	98a1      	ld.w      	r5, (r14, 0x4)
     6e4:	6d14      	or      	r4, r5
     6e6:	98a0      	ld.w      	r5, (r14, 0x0)
     6e8:	6d14      	or      	r4, r5
     6ea:	6cd0      	or      	r3, r4
		EPT0->AQCRB=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     6ec:	1311      	lrw      	r0, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     6ee:	6c8c      	or      	r2, r3
		EPT0->AQCRB=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     6f0:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     6f2:	6c48      	or      	r1, r2
		EPT0->AQCRB=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     6f4:	b033      	st.w      	r1, (r0, 0x4c)
     6f6:	07e9      	br      	0x6c8	// 6c8 <EPT_PWMX_Output_Control+0x4a>
	else if(EPT_PWMX_Selecte==EPT_PWMC)
     6f8:	3842      	cmpnei      	r0, 2
     6fa:	0815      	bt      	0x724	// 724 <EPT_PWMX_Output_Control+0xa6>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     6fc:	6d14      	or      	r4, r5
     6fe:	6d1c      	or      	r4, r7
     700:	98a4      	ld.w      	r5, (r14, 0x10)
     702:	6d18      	or      	r4, r6
     704:	6d14      	or      	r4, r5
     706:	98a3      	ld.w      	r5, (r14, 0xc)
     708:	6d14      	or      	r4, r5
     70a:	98a2      	ld.w      	r5, (r14, 0x8)
     70c:	6d14      	or      	r4, r5
     70e:	98a1      	ld.w      	r5, (r14, 0x4)
     710:	6d14      	or      	r4, r5
     712:	98a0      	ld.w      	r5, (r14, 0x0)
     714:	6d14      	or      	r4, r5
     716:	6cd0      	or      	r3, r4
		EPT0->AQCRC=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     718:	1306      	lrw      	r0, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     71a:	6c8c      	or      	r2, r3
		EPT0->AQCRC=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     71c:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     71e:	6c48      	or      	r1, r2
		EPT0->AQCRC=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     720:	b034      	st.w      	r1, (r0, 0x50)
     722:	07d3      	br      	0x6c8	// 6c8 <EPT_PWMX_Output_Control+0x4a>
	else if(EPT_PWMX_Selecte==EPT_PWMD)
     724:	3843      	cmpnei      	r0, 3
     726:	0bd1      	bt      	0x6c8	// 6c8 <EPT_PWMX_Output_Control+0x4a>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     728:	6d14      	or      	r4, r5
     72a:	6d1c      	or      	r4, r7
     72c:	98a4      	ld.w      	r5, (r14, 0x10)
     72e:	6d18      	or      	r4, r6
     730:	6d14      	or      	r4, r5
     732:	98a3      	ld.w      	r5, (r14, 0xc)
     734:	6d14      	or      	r4, r5
     736:	98a2      	ld.w      	r5, (r14, 0x8)
     738:	6d14      	or      	r4, r5
     73a:	98a1      	ld.w      	r5, (r14, 0x4)
     73c:	6d14      	or      	r4, r5
     73e:	98a0      	ld.w      	r5, (r14, 0x0)
     740:	6d14      	or      	r4, r5
     742:	6cd0      	or      	r3, r4
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     744:	121b      	lrw      	r0, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     746:	6c8c      	or      	r2, r3
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     748:	9000      	ld.w      	r0, (r0, 0x0)
					EPT_PWM_CBU_Event_Output|EPT_PWM_CBD_Event_Output|EPT_PWM_T1U_Event_Output|EPT_PWM_T1D_Event_Output|EPT_PWM_T2U_Event_Output|EPT_PWM_T2D_Event_Output;
     74a:	6c48      	or      	r1, r2
		EPT0->AQCRD=EPT_CA_Selecte_X|EPT_CB_Selecte_X|EPT_PWM_ZRO_Event_Output|EPT_PWM_PRD_Event_Output|EPT_PWM_CAU_Event_Output|EPT_PWM_CAD_Event_Output|
     74c:	b035      	st.w      	r1, (r0, 0x54)
}
     74e:	07bd      	br      	0x6c8	// 6c8 <EPT_PWMX_Output_Control+0x4a>

00000750 <EPT_Tevent_Selecte>:
//EPT_T2_Selecte:0->SYNCUSR5,1->EP0,2->EP1,3->EP2,4->EP3,5->EP4,6->EP5,7->EP6
//ReturnValue:NONE
/*************************************************************/
void EPT_Tevent_Selecte( U8_T EPT_T1_Selecte, U8_T EPT_T2_Selecte)
{
	EPT0->AQTSCR=EPT_T1_Selecte|(EPT_T2_Selecte<<4);
     750:	4124      	lsli      	r1, r1, 4
     752:	1278      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
     754:	6c04      	or      	r0, r1
     756:	9360      	ld.w      	r3, (r3, 0x0)
     758:	b316      	st.w      	r0, (r3, 0x58)
}
     75a:	783c      	jmp      	r15

0000075c <EPT_PHSEN_Config>:
//EPT_PHSDIR:EPT_PHSDIR_increase,EPT_PHSEN_decrease
//PHSR:0~0xffff
//ReturnValue:NONE
/*************************************************************/  
void EPT_PHSEN_Config(EPT_PHSEN_CMD_Type EPT_PHSEN_CMD , EPT_PHSDIR_Type EPT_PHSDIR , U16_T PHSR)    
{
     75c:	14c1      	push      	r4
	EPT0->CR=(EPT0->CR&0xffffff7f)|EPT_PHSEN_CMD;
     75e:	1275      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
	EPT0->PHSR=PHSR|EPT_PHSDIR;
     760:	6c84      	or      	r2, r1
	EPT0->CR=(EPT0->CR&0xffffff7f)|EPT_PHSEN_CMD;
     762:	9380      	ld.w      	r4, (r3, 0x0)
     764:	9463      	ld.w      	r3, (r4, 0xc)
     766:	3b87      	bclri      	r3, 7
     768:	6c0c      	or      	r0, r3
     76a:	b403      	st.w      	r0, (r4, 0xc)
	EPT0->PHSR=PHSR|EPT_PHSDIR;
     76c:	b44a      	st.w      	r2, (r4, 0x28)
}
     76e:	1481      	pop      	r4

00000770 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>:
//EPT_CMPB_Value:0~0xff
//EPT_CMPC_Value:0~0xff
//EPT_CMPD_Value:0~0xff
/*************************************************************/ 
void EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(U16_T EPT_PRDR_Value , U16_T EPT_CMPA_Value , U16_T EPT_CMPB_Value , U16_T EPT_CMPC_Value , U16_T EPT_CMPD_Value)
{
     770:	14c2      	push      	r4-r5
	EPT0->PRDR=EPT_PRDR_Value;
     772:	1290      	lrw      	r4, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
{
     774:	d8ae1004 	ld.h      	r5, (r14, 0x8)
	EPT0->PRDR=EPT_PRDR_Value;
     778:	9480      	ld.w      	r4, (r4, 0x0)
     77a:	b409      	st.w      	r0, (r4, 0x24)
	EPT0->CMPA=EPT_CMPA_Value;
     77c:	b42b      	st.w      	r1, (r4, 0x2c)
	EPT0->CMPB=EPT_CMPB_Value;
     77e:	b44c      	st.w      	r2, (r4, 0x30)
	EPT0->CMPC=EPT_CMPC_Value;
     780:	b46d      	st.w      	r3, (r4, 0x34)
	EPT0->CMPD=EPT_CMPD_Value;
     782:	b4ae      	st.w      	r5, (r4, 0x38)
}
     784:	1482      	pop      	r4-r5

00000786 <EPT_SYNCR_RearmClr>:
//EPT_REARMX:EPT_REARM_SYNCEN0,EPT_REARM_SYNCEN1,EPT_REARM_SYNCEN2,EPT_REARM_SYNCEN3,EPT_REARM_SYNCEN4,EPT_REARM_SYNCEN5
//ReturnValue:NONE
/*************************************************************/  
void EPT_SYNCR_RearmClr(EPT_REARMX_Type EPT_REARMX )
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     786:	126b      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
     788:	122b      	lrw      	r1, 0xa55ac73a	// 8b4 <EPT_TRGSRCX_Config+0x2c>
     78a:	9340      	ld.w      	r2, (r3, 0x0)
     78c:	3380      	movi      	r3, 128
     78e:	60c8      	addu      	r3, r2
     790:	b33a      	st.w      	r1, (r3, 0x68)
	EPT0->SYNCR = (EPT0->SYNCR&0X3FC0FFFF)|EPT_REARMX;
     792:	122a      	lrw      	r1, 0x3fc10000	// 8b8 <EPT_TRGSRCX_Config+0x30>
     794:	9264      	ld.w      	r3, (r2, 0x10)
     796:	2900      	subi      	r1, 1
     798:	68c4      	and      	r3, r1
     79a:	6c0c      	or      	r0, r3
     79c:	b204      	st.w      	r0, (r2, 0x10)
}
     79e:	783c      	jmp      	r15

000007a0 <EPT_Caputure_Rearm>:
//ReturnValue:NONE
/*************************************************************/  
//EPT Caputer Rearm:clear counter， enable CAPLDEN automatic
void EPT_Caputure_Rearm(void)
{
	EPT0->CR=(EPT0->CR&0xfffdffff)|(0x01<<19);
     7a0:	1264      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
     7a2:	9340      	ld.w      	r2, (r3, 0x0)
     7a4:	9263      	ld.w      	r3, (r2, 0xc)
     7a6:	3b91      	bclri      	r3, 17
     7a8:	3b93      	bclri      	r3, 19
     7aa:	3bb3      	bseti      	r3, 19
     7ac:	b263      	st.w      	r3, (r2, 0xc)
}
     7ae:	783c      	jmp      	r15

000007b0 <EPT_Globle_Eventload_Config>:
//GLDCFG_EN:0~0x3fff
//ReturnValue:NONE
/*************************************************************/  
//PRDR/CMPA/CMPB/CMPC/CMPD/DBDTR/DBCR/AQCRA/AQCRB/AQCRD/AQCSF/EMPSR load config
void EPT_Globle_Eventload_Config(EPT_GLD_OneShot_CMD_Type EPT_GLD_OneShot_CMD , EPT_GLDMD_Selecte_Type EPT_GLDMD_Selecte_X , U8_T GLDPRD_CNT , U16_T GLDCFG_EN)
{
     7b0:	14c1      	push      	r4
	EPT0->GLDCR=0X01|EPT_GLD_OneShot_CMD|EPT_GLDMD_Selecte_X|(GLDPRD_CNT<<7);
     7b2:	39a0      	bseti      	r1, 0
     7b4:	6c40      	or      	r1, r0
     7b6:	4247      	lsli      	r2, r2, 7
     7b8:	119e      	lrw      	r4, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
     7ba:	6c48      	or      	r1, r2
     7bc:	9480      	ld.w      	r4, (r4, 0x0)
     7be:	b425      	st.w      	r1, (r4, 0x14)
	EPT0->GLDCFG=GLDCFG_EN;
     7c0:	b466      	st.w      	r3, (r4, 0x18)
	/*if(EPT_GLDMD_Selecte_X==EPT_GLDMD_Selecte_SW)
	{
		EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
		EPT0->GLDCR2=0X02;
	}*/
}
     7c2:	1481      	pop      	r4

000007c4 <EPT_Globle_SwLoad_CMD>:
//PRDR/CMPA/CMPB/CMPC/CMPD/DBDTR/DBCR/AQCRA/AQCRB/AQCRD/AQCSF/EMPSR load config
void EPT_Globle_SwLoad_CMD(void)
{
	//EPT0->GLDCR=0X01|EPT_GLDMD_Selecte_SW;
	//EPT0->GLDCFG=GLDCFG_EN;
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     7c4:	117b      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
     7c6:	3280      	movi      	r2, 128
     7c8:	9360      	ld.w      	r3, (r3, 0x0)
     7ca:	608c      	addu      	r2, r3
     7cc:	113a      	lrw      	r1, 0xa55ac73a	// 8b4 <EPT_TRGSRCX_Config+0x2c>
     7ce:	b23a      	st.w      	r1, (r2, 0x68)
	EPT0->GLDCR2=0X03;
     7d0:	3203      	movi      	r2, 3
     7d2:	b347      	st.w      	r2, (r3, 0x1c)
}
     7d4:	783c      	jmp      	r15

000007d6 <EPT_PRDR_EventLoad_Config>:
//EPT_PRDR_EventLoad_x:EPT_PRDR_EventLoad_PEND,EPT_PRDR_EventLoad_ExiLoad_SYNC,EPT_PRDR_EventLoad_Zro_ExiLoad_SYNC,
//EPT_PRDR_EventLoad_Immediate
/*************************************************************/ 
void EPT_PRDR_EventLoad_Config(EPT_PRDR_EventLoad_Type EPT_PRDR_EventLoad_x)
{
	EPT0->GLDCR&=0XFFFFFFFE;	//Use independent configurations
     7d6:	1177      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
     7d8:	9340      	ld.w      	r2, (r3, 0x0)
     7da:	9265      	ld.w      	r3, (r2, 0x14)
     7dc:	3b80      	bclri      	r3, 0
     7de:	b265      	st.w      	r3, (r2, 0x14)
	EPT0->CR=(EPT0->CR&0xffffffcf)|EPT_PRDR_EventLoad_x;
     7e0:	9263      	ld.w      	r3, (r2, 0xc)
     7e2:	3b84      	bclri      	r3, 4
     7e4:	3b85      	bclri      	r3, 5
     7e6:	6c0c      	or      	r0, r3
     7e8:	b203      	st.w      	r0, (r2, 0xc)
}
     7ea:	783c      	jmp      	r15

000007ec <EPT_CMP_EventLoad_Config>:
//EPT_CMPX_EventLoad_PRD,EPT_CMPX_EventLoad_ExiLoad_SYNC
/*************************************************************/ 
//Unified load register:CMPA,CMPB,CMPC,CMPD
void EPT_CMP_EventLoad_Config(EPT_CMPX_EventLoad_Type EPT_CMPX_EventLoad_x)
{
	EPT0->GLDCR&=0XFFFFFFFE;		//Use independent configurations
     7ec:	1171      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
	if(EPT_CMPX_EventLoad_x==EPT_CMPX_EventLoad_DIS)
     7ee:	3840      	cmpnei      	r0, 0
	EPT0->GLDCR&=0XFFFFFFFE;		//Use independent configurations
     7f0:	9360      	ld.w      	r3, (r3, 0x0)
     7f2:	9345      	ld.w      	r2, (r3, 0x14)
     7f4:	3a80      	bclri      	r2, 0
     7f6:	b345      	st.w      	r2, (r3, 0x14)
	if(EPT_CMPX_EventLoad_x==EPT_CMPX_EventLoad_DIS)
     7f8:	0803      	bt      	0x7fe	// 7fe <EPT_CMP_EventLoad_Config+0x12>
	{
		EPT0->CMPLDR=0;
     7fa:	b30f      	st.w      	r0, (r3, 0x3c)
	}
	else if(EPT_CMPX_EventLoad_x==EPT_CMPX_EventLoad_ExiLoad_SYNC)
	{
		EPT0->CMPLDR=0x8240;
	}
}
     7fc:	783c      	jmp      	r15
	else if(EPT_CMPX_EventLoad_x==EPT_CMPX_EventLoad_Immediate)
     7fe:	3841      	cmpnei      	r0, 1
     800:	0804      	bt      	0x808	// 808 <EPT_CMP_EventLoad_Config+0x1c>
		EPT0->CMPLDR=0xf;
     802:	320f      	movi      	r2, 15
		EPT0->CMPLDR=0x8240;
     804:	b34f      	st.w      	r2, (r3, 0x3c)
}
     806:	07fb      	br      	0x7fc	// 7fc <EPT_CMP_EventLoad_Config+0x10>
	else if(EPT_CMPX_EventLoad_x==EPT_CMPX_EventLoad_ZRO)
     808:	3842      	cmpnei      	r0, 2
     80a:	0803      	bt      	0x810	// 810 <EPT_CMP_EventLoad_Config+0x24>
		EPT0->CMPLDR=0x2410;	
     80c:	114c      	lrw      	r2, 0x2410	// 8bc <EPT_TRGSRCX_Config+0x34>
     80e:	07fb      	br      	0x804	// 804 <EPT_CMP_EventLoad_Config+0x18>
	else if(EPT_CMPX_EventLoad_x==EPT_CMPX_EventLoad_PRD)
     810:	3843      	cmpnei      	r0, 3
     812:	0803      	bt      	0x818	// 818 <EPT_CMP_EventLoad_Config+0x2c>
		EPT0->CMPLDR=0x4920;
     814:	114b      	lrw      	r2, 0x4920	// 8c0 <EPT_TRGSRCX_Config+0x38>
     816:	07f7      	br      	0x804	// 804 <EPT_CMP_EventLoad_Config+0x18>
	else if(EPT_CMPX_EventLoad_x==EPT_CMPX_EventLoad_ExiLoad_SYNC)
     818:	3844      	cmpnei      	r0, 4
     81a:	0bf1      	bt      	0x7fc	// 7fc <EPT_CMP_EventLoad_Config+0x10>
		EPT0->CMPLDR=0x8240;
     81c:	114a      	lrw      	r2, 0x8240	// 8c4 <EPT_TRGSRCX_Config+0x3c>
     81e:	07f3      	br      	0x804	// 804 <EPT_CMP_EventLoad_Config+0x18>

00000820 <EPT_AQCR_Eventload_Config>:
//EPT_AQCRX_EventLoad_PRD,EPT_AQCRX_EventLoad_ExiLoad_SYNC
/*************************************************************/ 
//Unified load register:AQCRA,AQCRB,AQCRC,AQCRD
void EPT_AQCR_Eventload_Config(EPT_AQCRX_EventLoad_Type EPT_AQCRX_EventLoad_X)
{
	EPT0->GLDCR&=0XFFFFFFFE;		//Use independent configurations
     820:	1164      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
	if(EPT_AQCRX_EventLoad_X==EPT_AQCRX_EventLoad_DIS)
     822:	3840      	cmpnei      	r0, 0
	EPT0->GLDCR&=0XFFFFFFFE;		//Use independent configurations
     824:	9360      	ld.w      	r3, (r3, 0x0)
     826:	9345      	ld.w      	r2, (r3, 0x14)
     828:	3a80      	bclri      	r2, 0
     82a:	b345      	st.w      	r2, (r3, 0x14)
	if(EPT_AQCRX_EventLoad_X==EPT_AQCRX_EventLoad_DIS)
     82c:	0803      	bt      	0x832	// 832 <EPT_AQCR_Eventload_Config+0x12>
	{
		EPT0->AQLDR=0;
     82e:	b311      	st.w      	r0, (r3, 0x44)
	}
	else if(EPT_AQCRX_EventLoad_X==EPT_AQCRX_EventLoad_ExiLoad_SYNC)
	{
		EPT0->AQLDR=0x9090;
	}
}
     830:	783c      	jmp      	r15
	else if(EPT_AQCRX_EventLoad_X==EPT_AQCRX_EventLoad_Immediate)
     832:	3841      	cmpnei      	r0, 1
     834:	0804      	bt      	0x83c	// 83c <EPT_AQCR_Eventload_Config+0x1c>
		EPT0->AQLDR=0x303;
     836:	1145      	lrw      	r2, 0x303	// 8c8 <EPT_TRGSRCX_Config+0x40>
		EPT0->AQLDR=0x9090;
     838:	b351      	st.w      	r2, (r3, 0x44)
}
     83a:	07fb      	br      	0x830	// 830 <EPT_AQCR_Eventload_Config+0x10>
	else if(EPT_AQCRX_EventLoad_X==EPT_AQCRX_EventLoad_ZRO)
     83c:	3842      	cmpnei      	r0, 2
     83e:	0803      	bt      	0x844	// 844 <EPT_AQCR_Eventload_Config+0x24>
		EPT0->AQLDR=0x2424;	
     840:	1143      	lrw      	r2, 0x2424	// 8cc <EPT_TRGSRCX_Config+0x44>
     842:	07fb      	br      	0x838	// 838 <EPT_AQCR_Eventload_Config+0x18>
	else if(EPT_AQCRX_EventLoad_X==EPT_AQCRX_EventLoad_PRD)
     844:	3843      	cmpnei      	r0, 3
     846:	0803      	bt      	0x84c	// 84c <EPT_AQCR_Eventload_Config+0x2c>
		EPT0->AQLDR=0x4848;
     848:	1142      	lrw      	r2, 0x4848	// 8d0 <EPT_TRGSRCX_Config+0x48>
     84a:	07f7      	br      	0x838	// 838 <EPT_AQCR_Eventload_Config+0x18>
	else if(EPT_AQCRX_EventLoad_X==EPT_AQCRX_EventLoad_ExiLoad_SYNC)
     84c:	3844      	cmpnei      	r0, 4
     84e:	0bf1      	bt      	0x830	// 830 <EPT_AQCR_Eventload_Config+0x10>
		EPT0->AQLDR=0x9090;
     850:	1141      	lrw      	r2, 0x9090	// 8d4 <EPT_TRGSRCX_Config+0x4c>
     852:	07f3      	br      	0x838	// 838 <EPT_AQCR_Eventload_Config+0x18>

00000854 <EPT_DB_Eventload_Config>:
//EPT_DB_EventLoad_PRD,EPT_DB_EventLoad_ZRO_PRD
/*************************************************************/ 
//Unified load register:DBCR,DBDTR,DBDTF,DPSCR
void EPT_DB_Eventload_Config(EPT_DB_EventLoad_Type EPT_DB_EventLoad_X)
{
	EPT0->GLDCR&=0XFFFFFFFE;		//Use independent configurations
     854:	1077      	lrw      	r3, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
	if(EPT_DB_EventLoad_X==EPT_DB_EventLoad_DIS)
     856:	3840      	cmpnei      	r0, 0
	EPT0->GLDCR&=0XFFFFFFFE;		//Use independent configurations
     858:	9360      	ld.w      	r3, (r3, 0x0)
     85a:	9345      	ld.w      	r2, (r3, 0x14)
     85c:	3a80      	bclri      	r2, 0
     85e:	b345      	st.w      	r2, (r3, 0x14)
	if(EPT_DB_EventLoad_X==EPT_DB_EventLoad_DIS)
     860:	0804      	bt      	0x868	// 868 <EPT_DB_Eventload_Config+0x14>
	{
		EPT0->DBLDR=0X249;
     862:	105e      	lrw      	r2, 0x249	// 8d8 <EPT_TRGSRCX_Config+0x50>
	{
		EPT0->DBLDR=0X249|(0X02<<1)|(0X02<<4)|(0X02<<7)|(0X02<<10);
	}
	else if(EPT_DB_EventLoad_X==EPT_DB_EventLoad_ZRO_PRD)
	{
		EPT0->DBLDR=0X249|(0X03<<1)|(0X03<<4)|(0X03<<7)|(0X03<<10);
     864:	b359      	st.w      	r2, (r3, 0x64)
	}
}
     866:	783c      	jmp      	r15
	else if(EPT_DB_EventLoad_X==EPT_DB_EventLoad_Immediate)
     868:	3841      	cmpnei      	r0, 1
     86a:	0803      	bt      	0x870	// 870 <EPT_DB_Eventload_Config+0x1c>
		EPT0->DBLDR=0;
     86c:	3200      	movi      	r2, 0
     86e:	07fb      	br      	0x864	// 864 <EPT_DB_Eventload_Config+0x10>
	else if(EPT_DB_EventLoad_X==EPT_DB_EventLoad_ZRO)
     870:	3842      	cmpnei      	r0, 2
     872:	0803      	bt      	0x878	// 878 <EPT_DB_Eventload_Config+0x24>
		EPT0->DBLDR=0X249|(0X01<<1)|(0X01<<4)|(0X01<<7)|(0X01<<10);
     874:	105a      	lrw      	r2, 0x6db	// 8dc <EPT_TRGSRCX_Config+0x54>
     876:	07f7      	br      	0x864	// 864 <EPT_DB_Eventload_Config+0x10>
	else if(EPT_DB_EventLoad_X==EPT_DB_EventLoad_PRD)
     878:	3843      	cmpnei      	r0, 3
     87a:	0803      	bt      	0x880	// 880 <EPT_DB_Eventload_Config+0x2c>
		EPT0->DBLDR=0X249|(0X02<<1)|(0X02<<4)|(0X02<<7)|(0X02<<10);
     87c:	1059      	lrw      	r2, 0xb6d	// 8e0 <EPT_TRGSRCX_Config+0x58>
     87e:	07f3      	br      	0x864	// 864 <EPT_DB_Eventload_Config+0x10>
	else if(EPT_DB_EventLoad_X==EPT_DB_EventLoad_ZRO_PRD)
     880:	3844      	cmpnei      	r0, 4
     882:	0bf2      	bt      	0x866	// 866 <EPT_DB_Eventload_Config+0x12>
		EPT0->DBLDR=0X249|(0X03<<1)|(0X03<<4)|(0X03<<7)|(0X03<<10);
     884:	1058      	lrw      	r2, 0xfff	// 8e4 <EPT_TRGSRCX_Config+0x5c>
     886:	07ef      	br      	0x864	// 864 <EPT_DB_Eventload_Config+0x10>

00000888 <EPT_TRGSRCX_Config>:
//EPT_TRGSRCX_CMD:
//TRGEVXPRD:0~0xf
//ReturnValue: NONE
/*************************************************************/
void EPT_TRGSRCX_Config(EPT_TRGSRCX_Select_Type EPT_TRGSRCX_Select , EPT_EVTRG_TRGSRCX_TypeDef EPT_EVTRG_TRGSRCX_X , EPT_TRGSRCX_CMD_TypeDef EPT_TRGSRCX_CMD , U8_T TRGEVXPRD)
{
     888:	14c2      	push      	r4-r5
	if(EPT_TRGSRCX_Select==EPT_TRGSRC0)
     88a:	3840      	cmpnei      	r0, 0
     88c:	1089      	lrw      	r4, 0x20000034	// 8b0 <EPT_TRGSRCX_Config+0x28>
     88e:	0831      	bt      	0x8f0	// 8f0 <EPT_TRGSRCX_Config+0x68>
	{
		EPT0->EVTRG=(EPT0->EVTRG&0xffeffff0)|(EPT_EVTRG_TRGSRCX_X<<0)|(EPT_TRGSRCX_CMD<<20);
     890:	9460      	ld.w      	r3, (r4, 0x0)
     892:	237f      	addi      	r3, 128
     894:	4254      	lsli      	r2, r2, 20
     896:	9310      	ld.w      	r0, (r3, 0x40)
     898:	6c48      	or      	r1, r2
     89a:	1054      	lrw      	r2, 0x10000f	// 8e8 <EPT_TRGSRCX_Config+0x60>
     89c:	6809      	andn      	r0, r2
     89e:	6c40      	or      	r1, r0
     8a0:	b330      	st.w      	r1, (r3, 0x40)
	}
	else if(EPT_TRGSRCX_Select==EPT_TRGSRC3)
	{
		EPT0->EVTRG=(EPT0->EVTRG&0xff7f0fff)|(EPT_EVTRG_TRGSRCX_X<<12)|(EPT_TRGSRCX_CMD<<23);
	}
	EPT0->EVTRG|=0x0f0f0000;
     8a2:	9460      	ld.w      	r3, (r4, 0x0)
     8a4:	237f      	addi      	r3, 128
     8a6:	9350      	ld.w      	r2, (r3, 0x40)
     8a8:	1031      	lrw      	r1, 0xf0f0000	// 8ec <EPT_TRGSRCX_Config+0x64>
     8aa:	6c84      	or      	r2, r1
     8ac:	b350      	st.w      	r2, (r3, 0x40)
}
     8ae:	1482      	pop      	r4-r5
     8b0:	20000034 	.long	0x20000034
     8b4:	a55ac73a 	.long	0xa55ac73a
     8b8:	3fc10000 	.long	0x3fc10000
     8bc:	00002410 	.long	0x00002410
     8c0:	00004920 	.long	0x00004920
     8c4:	00008240 	.long	0x00008240
     8c8:	00000303 	.long	0x00000303
     8cc:	00002424 	.long	0x00002424
     8d0:	00004848 	.long	0x00004848
     8d4:	00009090 	.long	0x00009090
     8d8:	00000249 	.long	0x00000249
     8dc:	000006db 	.long	0x000006db
     8e0:	00000b6d 	.long	0x00000b6d
     8e4:	00000fff 	.long	0x00000fff
     8e8:	0010000f 	.long	0x0010000f
     8ec:	0f0f0000 	.long	0x0f0f0000
	else if(EPT_TRGSRCX_Select==EPT_TRGSRC1)
     8f0:	3841      	cmpnei      	r0, 1
     8f2:	080c      	bt      	0x90a	// 90a <EPT_TRGSRCX_Config+0x82>
		EPT0->EVTRG=(EPT0->EVTRG&0xffdfff0f)|(EPT_EVTRG_TRGSRCX_X<<4)|(EPT_TRGSRCX_CMD<<21);
     8f4:	9400      	ld.w      	r0, (r4, 0x0)
     8f6:	207f      	addi      	r0, 128
     8f8:	9070      	ld.w      	r3, (r0, 0x40)
     8fa:	03ae      	lrw      	r5, 0x2000f0	// b3c <EPT_SW_Set_lock+0x14>
     8fc:	68d5      	andn      	r3, r5
     8fe:	4255      	lsli      	r2, r2, 21
     900:	6c8c      	or      	r2, r3
     902:	4124      	lsli      	r1, r1, 4
		EPT0->EVTRG=(EPT0->EVTRG&0xff7f0fff)|(EPT_EVTRG_TRGSRCX_X<<12)|(EPT_TRGSRCX_CMD<<23);
     904:	6c48      	or      	r1, r2
     906:	b030      	st.w      	r1, (r0, 0x40)
     908:	07cd      	br      	0x8a2	// 8a2 <EPT_TRGSRCX_Config+0x1a>
	else if(EPT_TRGSRCX_Select==EPT_TRGSRC2)
     90a:	3842      	cmpnei      	r0, 2
     90c:	080a      	bt      	0x920	// 920 <EPT_TRGSRCX_Config+0x98>
		EPT0->EVTRG=(EPT0->EVTRG&0xffbff0ff)|(EPT_EVTRG_TRGSRCX_X<<8)|(EPT_TRGSRCX_CMD<<22);
     90e:	9400      	ld.w      	r0, (r4, 0x0)
     910:	207f      	addi      	r0, 128
     912:	9070      	ld.w      	r3, (r0, 0x40)
     914:	03b4      	lrw      	r5, 0x400f00	// b40 <EPT_SW_Set_lock+0x18>
     916:	68d5      	andn      	r3, r5
     918:	4256      	lsli      	r2, r2, 22
     91a:	6c8c      	or      	r2, r3
     91c:	4128      	lsli      	r1, r1, 8
     91e:	07f3      	br      	0x904	// 904 <EPT_TRGSRCX_Config+0x7c>
	else if(EPT_TRGSRCX_Select==EPT_TRGSRC3)
     920:	3843      	cmpnei      	r0, 3
     922:	0bc0      	bt      	0x8a2	// 8a2 <EPT_TRGSRCX_Config+0x1a>
		EPT0->EVTRG=(EPT0->EVTRG&0xff7f0fff)|(EPT_EVTRG_TRGSRCX_X<<12)|(EPT_TRGSRCX_CMD<<23);
     924:	9400      	ld.w      	r0, (r4, 0x0)
     926:	207f      	addi      	r0, 128
     928:	9070      	ld.w      	r3, (r0, 0x40)
     92a:	03b8      	lrw      	r5, 0x80f000	// b44 <EPT_SW_Set_lock+0x1c>
     92c:	68d5      	andn      	r3, r5
     92e:	4257      	lsli      	r2, r2, 23
     930:	6c8c      	or      	r2, r3
     932:	412c      	lsli      	r1, r1, 12
     934:	07e8      	br      	0x904	// 904 <EPT_TRGSRCX_Config+0x7c>

00000936 <EPT_TRGSRCX_SWFTRG>:
//EPT_TRGSRCX_Select:EPT_TRGSRC0,EPT_TRGSRC1,EPT_TRGSRC2,EPT_TRGSRC3
//ReturnValue: NONE
/*************************************************************/
void EPT_TRGSRCX_SWFTRG(EPT_TRGSRCX_Select_Type EPT_TRGSRCX_Select)
{
	if(EPT_TRGSRCX_Select==EPT_TRGSRC0)
     936:	3840      	cmpnei      	r0, 0
     938:	0808      	bt      	0x948	// 948 <EPT_TRGSRCX_SWFTRG+0x12>
	{
		EPT0->EVSWF|=0X01;
     93a:	037b      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     93c:	9360      	ld.w      	r3, (r3, 0x0)
     93e:	237f      	addi      	r3, 128
     940:	9353      	ld.w      	r2, (r3, 0x4c)
     942:	3aa0      	bseti      	r2, 0
	{
		EPT0->EVSWF|=0X04;
	}
	else if(EPT_TRGSRCX_Select==EPT_TRGSRC3)
	{
		EPT0->EVSWF|=0X08;
     944:	b353      	st.w      	r2, (r3, 0x4c)
	}
}
     946:	783c      	jmp      	r15
	else if(EPT_TRGSRCX_Select==EPT_TRGSRC1)
     948:	3841      	cmpnei      	r0, 1
     94a:	0807      	bt      	0x958	// 958 <EPT_TRGSRCX_SWFTRG+0x22>
		EPT0->EVSWF|=0X02;
     94c:	137f      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     94e:	9360      	ld.w      	r3, (r3, 0x0)
     950:	237f      	addi      	r3, 128
     952:	9353      	ld.w      	r2, (r3, 0x4c)
     954:	3aa1      	bseti      	r2, 1
     956:	07f7      	br      	0x944	// 944 <EPT_TRGSRCX_SWFTRG+0xe>
	else if(EPT_TRGSRCX_Select==EPT_TRGSRC2)
     958:	3842      	cmpnei      	r0, 2
     95a:	0807      	bt      	0x968	// 968 <EPT_TRGSRCX_SWFTRG+0x32>
		EPT0->EVSWF|=0X04;
     95c:	137b      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     95e:	9360      	ld.w      	r3, (r3, 0x0)
     960:	237f      	addi      	r3, 128
     962:	9353      	ld.w      	r2, (r3, 0x4c)
     964:	3aa2      	bseti      	r2, 2
     966:	07ef      	br      	0x944	// 944 <EPT_TRGSRCX_SWFTRG+0xe>
	else if(EPT_TRGSRCX_Select==EPT_TRGSRC3)
     968:	3843      	cmpnei      	r0, 3
     96a:	0bee      	bt      	0x946	// 946 <EPT_TRGSRCX_SWFTRG+0x10>
		EPT0->EVSWF|=0X08;
     96c:	1377      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     96e:	9360      	ld.w      	r3, (r3, 0x0)
     970:	237f      	addi      	r3, 128
     972:	9353      	ld.w      	r2, (r3, 0x4c)
     974:	3aa3      	bseti      	r2, 3
     976:	07e7      	br      	0x944	// 944 <EPT_TRGSRCX_SWFTRG+0xe>

00000978 <EPT_Int_Enable>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void EPT_Int_Enable(EPT_INT_TypeDef EPT_X_INT)
{
	EPT0->ICR 	= EPT_X_INT;							//clear LVD INT status
     978:	1374      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     97a:	9360      	ld.w      	r3, (r3, 0x0)
     97c:	237f      	addi      	r3, 128
     97e:	b317      	st.w      	r0, (r3, 0x5c)
	EPT0->IMCR  |= EPT_X_INT;
     980:	9356      	ld.w      	r2, (r3, 0x58)
     982:	6c08      	or      	r0, r2
     984:	b316      	st.w      	r0, (r3, 0x58)
}
     986:	783c      	jmp      	r15

00000988 <EPT_Int_Disable>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void EPT_Int_Disable(EPT_INT_TypeDef EPT_X_INT)
{
	EPT0->IMCR  &= ~EPT_X_INT;
     988:	1370      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     98a:	9360      	ld.w      	r3, (r3, 0x0)
     98c:	237f      	addi      	r3, 128
     98e:	9356      	ld.w      	r2, (r3, 0x58)
     990:	6881      	andn      	r2, r0
     992:	b356      	st.w      	r2, (r3, 0x58)
}
     994:	783c      	jmp      	r15

00000996 <EPT_EMInt_Enable>:
//EPT_X_EMINT:EPT_EP0_EMINT~EPT_EP7_EMINT,EPT_CPU_FAULT_EMINT,EPT_MEM_FAULT_EMINT,EPT_EOM_FAULT_EMINT
//ReturnValue: NONE
/*************************************************************/
void EPT_EMInt_Enable(EPT_EMINT_TypeDef EPT_X_EMINT)
{
	EPT0->EMICR = EPT_X_EMINT;							//clear LVD INT status
     996:	136d      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     998:	9360      	ld.w      	r3, (r3, 0x0)
     99a:	237f      	addi      	r3, 128
     99c:	b30d      	st.w      	r0, (r3, 0x34)
	EPT0->EMIMCR  |= EPT_X_EMINT;
     99e:	934c      	ld.w      	r2, (r3, 0x30)
     9a0:	6c08      	or      	r0, r2
     9a2:	b30c      	st.w      	r0, (r3, 0x30)
}
     9a4:	783c      	jmp      	r15

000009a6 <EPT_EMInt_Disable>:
//EPT_X_EMINT:EPT_EP0_EMINT~EPT_EP7_EMINT,EPT_CPU_FAULT_EMINT,EPT_MEM_FAULT_EMINT,EPT_EOM_FAULT_EMINT
//ReturnValue: NONE
/*************************************************************/
void EPT_EMInt_Disable(EPT_EMINT_TypeDef EPT_X_EMINT)
{
	EPT0->EMIMCR  &= ~EPT_X_EMINT;
     9a6:	1369      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     9a8:	9360      	ld.w      	r3, (r3, 0x0)
     9aa:	237f      	addi      	r3, 128
     9ac:	934c      	ld.w      	r2, (r3, 0x30)
     9ae:	6881      	andn      	r2, r0
     9b0:	b34c      	st.w      	r2, (r3, 0x30)
}
     9b2:	783c      	jmp      	r15

000009b4 <EPT_Vector_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPT_Vector_Int_Enable(void)
{
	INTC_ISER_WRITE(EPT_INT);    
     9b4:	1366      	lrw      	r3, 0x20000078	// b4c <EPT_SW_Set_lock+0x24>
     9b6:	3280      	movi      	r2, 128
     9b8:	9360      	ld.w      	r3, (r3, 0x0)
     9ba:	23ff      	addi      	r3, 256
     9bc:	4247      	lsli      	r2, r2, 7
     9be:	b340      	st.w      	r2, (r3, 0x0)
}
     9c0:	783c      	jmp      	r15

000009c2 <EPT_Vector_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPT_Vector_Int_Disable(void)
{
    INTC_ICER_WRITE(EPT_INT);    
     9c2:	1363      	lrw      	r3, 0x20000078	// b4c <EPT_SW_Set_lock+0x24>
     9c4:	32c0      	movi      	r2, 192
     9c6:	9360      	ld.w      	r3, (r3, 0x0)
     9c8:	4241      	lsli      	r2, r2, 1
     9ca:	60c8      	addu      	r3, r2
     9cc:	3280      	movi      	r2, 128
     9ce:	4247      	lsli      	r2, r2, 7
     9d0:	b340      	st.w      	r2, (r3, 0x0)
}
     9d2:	783c      	jmp      	r15

000009d4 <EPT_EPX_Config>:
//EPT_FLT_PACE0_x:EPT_FLT_PACE0_DIS~EPT_FLT_PACE0_4CLK(EP0~EP3)
//EPT_FLT_PACE1_x:EPT_FLT_PACE1_DIS~EPT_FLT_PACE1_4CLK(EP4~EP7)
//ReturnValue:NONE
/*************************************************************/   
void EPT_EPX_Config(EPT_EPX_Type EPT_EPX , EPT_Input_selecte_Type EPT_Input_selecte_x , EPT_FLT_PACE0_Type EPT_FLT_PACE0_x , EPT_FLT_PACE1_Type EPT_FLT_PACE1_x , U8_T ORL0_EPIx , U8_T ORL1_EPIx)
{
     9d4:	14c4      	push      	r4-r7
     9d6:	1421      	subi      	r14, r14, 4
     9d8:	d88e0014 	ld.b      	r4, (r14, 0x14)
     9dc:	b880      	st.w      	r4, (r14, 0x0)
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     9de:	3680      	movi      	r6, 128
     9e0:	129a      	lrw      	r4, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     9e2:	12fc      	lrw      	r7, 0xa55ac73a	// b50 <EPT_SW_Set_lock+0x28>
     9e4:	9480      	ld.w      	r4, (r4, 0x0)
     9e6:	6190      	addu      	r6, r4
	if(EPT_EPX==EPT_EP0)
     9e8:	3840      	cmpnei      	r0, 0
{
     9ea:	d8ae0018 	ld.b      	r5, (r14, 0x18)
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     9ee:	b6fa      	st.w      	r7, (r6, 0x68)
	if(EPT_EPX==EPT_EP0)
     9f0:	0810      	bt      	0xa10	// a10 <EPT_EPX_Config+0x3c>
	{
		EPT0->EMSRC=(EPT0->EMSRC&0XFFFFFFF0)|(EPT_Input_selecte_x<<0);
     9f2:	941f      	ld.w      	r0, (r4, 0x7c)
     9f4:	370f      	movi      	r7, 15
     9f6:	681d      	andn      	r0, r7
	{
		EPT0->EMSRC=(EPT0->EMSRC&0XF0FFFFFF)|(EPT_Input_selecte_x<<24);
	}
	else if(EPT_EPX==EPT_EP7)
	{
		EPT0->EMSRC=(EPT0->EMSRC&0X0FFFFFFF)|(EPT_Input_selecte_x<<28);
     9f8:	6c40      	or      	r1, r0
     9fa:	b43f      	st.w      	r1, (r4, 0x7c)
	}
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     9fc:	1235      	lrw      	r1, 0xa55ac73a	// b50 <EPT_SW_Set_lock+0x28>
     9fe:	b63a      	st.w      	r1, (r6, 0x68)
	EPT0->EMSRC2=ORL0_EPIx|(ORL1_EPIx<<16)|EPT_FLT_PACE0_x|EPT_FLT_PACE1_x;
     a00:	45b0      	lsli      	r5, r5, 16
     a02:	9820      	ld.w      	r1, (r14, 0x0)
     a04:	6d44      	or      	r5, r1
     a06:	6c8c      	or      	r2, r3
     a08:	6c94      	or      	r2, r5
     a0a:	b640      	st.w      	r2, (r6, 0x0)
}
     a0c:	1401      	addi      	r14, r14, 4
     a0e:	1484      	pop      	r4-r7
	else if(EPT_EPX==EPT_EP1)
     a10:	3841      	cmpnei      	r0, 1
     a12:	0806      	bt      	0xa1e	// a1e <EPT_EPX_Config+0x4a>
		EPT0->EMSRC=(EPT0->EMSRC&0XFFFFFF0F)|(EPT_Input_selecte_x<<4);
     a14:	941f      	ld.w      	r0, (r4, 0x7c)
     a16:	37f0      	movi      	r7, 240
     a18:	681d      	andn      	r0, r7
     a1a:	4124      	lsli      	r1, r1, 4
     a1c:	07ee      	br      	0x9f8	// 9f8 <EPT_EPX_Config+0x24>
	else if(EPT_EPX==EPT_EP2)
     a1e:	3842      	cmpnei      	r0, 2
     a20:	0807      	bt      	0xa2e	// a2e <EPT_EPX_Config+0x5a>
		EPT0->EMSRC=(EPT0->EMSRC&0XFFFFF0FF)|(EPT_Input_selecte_x<<8);
     a22:	37f0      	movi      	r7, 240
     a24:	941f      	ld.w      	r0, (r4, 0x7c)
     a26:	47e4      	lsli      	r7, r7, 4
     a28:	681d      	andn      	r0, r7
     a2a:	4128      	lsli      	r1, r1, 8
     a2c:	07e6      	br      	0x9f8	// 9f8 <EPT_EPX_Config+0x24>
	else if(EPT_EPX==EPT_EP3)
     a2e:	3843      	cmpnei      	r0, 3
     a30:	0807      	bt      	0xa3e	// a3e <EPT_EPX_Config+0x6a>
		EPT0->EMSRC=(EPT0->EMSRC&0XFFFF0FFF)|(EPT_Input_selecte_x<<12);
     a32:	37f0      	movi      	r7, 240
     a34:	941f      	ld.w      	r0, (r4, 0x7c)
     a36:	47e8      	lsli      	r7, r7, 8
     a38:	681d      	andn      	r0, r7
     a3a:	412c      	lsli      	r1, r1, 12
     a3c:	07de      	br      	0x9f8	// 9f8 <EPT_EPX_Config+0x24>
	else if(EPT_EPX==EPT_EP4)
     a3e:	3844      	cmpnei      	r0, 4
     a40:	0807      	bt      	0xa4e	// a4e <EPT_EPX_Config+0x7a>
		EPT0->EMSRC=(EPT0->EMSRC&0XFFF0FFFF)|(EPT_Input_selecte_x<<16);
     a42:	37f0      	movi      	r7, 240
     a44:	941f      	ld.w      	r0, (r4, 0x7c)
     a46:	47ec      	lsli      	r7, r7, 12
     a48:	681d      	andn      	r0, r7
     a4a:	4130      	lsli      	r1, r1, 16
     a4c:	07d6      	br      	0x9f8	// 9f8 <EPT_EPX_Config+0x24>
	else if(EPT_EPX==EPT_EP5)
     a4e:	3845      	cmpnei      	r0, 5
     a50:	0807      	bt      	0xa5e	// a5e <EPT_EPX_Config+0x8a>
		EPT0->EMSRC=(EPT0->EMSRC&0XFF0FFFFF)|(EPT_Input_selecte_x<<20);
     a52:	37f0      	movi      	r7, 240
     a54:	941f      	ld.w      	r0, (r4, 0x7c)
     a56:	47f0      	lsli      	r7, r7, 16
     a58:	681d      	andn      	r0, r7
     a5a:	4134      	lsli      	r1, r1, 20
     a5c:	07ce      	br      	0x9f8	// 9f8 <EPT_EPX_Config+0x24>
	else if(EPT_EPX==EPT_EP6)
     a5e:	3846      	cmpnei      	r0, 6
     a60:	0807      	bt      	0xa6e	// a6e <EPT_EPX_Config+0x9a>
		EPT0->EMSRC=(EPT0->EMSRC&0XF0FFFFFF)|(EPT_Input_selecte_x<<24);
     a62:	37f0      	movi      	r7, 240
     a64:	941f      	ld.w      	r0, (r4, 0x7c)
     a66:	47f4      	lsli      	r7, r7, 20
     a68:	681d      	andn      	r0, r7
     a6a:	4138      	lsli      	r1, r1, 24
     a6c:	07c6      	br      	0x9f8	// 9f8 <EPT_EPX_Config+0x24>
	else if(EPT_EPX==EPT_EP7)
     a6e:	3847      	cmpnei      	r0, 7
     a70:	0bc6      	bt      	0x9fc	// 9fc <EPT_EPX_Config+0x28>
		EPT0->EMSRC=(EPT0->EMSRC&0X0FFFFFFF)|(EPT_Input_selecte_x<<28);
     a72:	941f      	ld.w      	r0, (r4, 0x7c)
     a74:	4004      	lsli      	r0, r0, 4
     a76:	4804      	lsri      	r0, r0, 4
     a78:	413c      	lsli      	r1, r1, 28
     a7a:	07bf      	br      	0x9f8	// 9f8 <EPT_EPX_Config+0x24>

00000a7c <EPT_EPIX_POL_Config>:
//BIT5->CMP1(0:Active high 1:Active low)
//ReturnValue:NONE
/*************************************************************/   
void EPT_EPIX_POL_Config(U8_T EPT_EPIX_POL)
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     a7c:	1173      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     a7e:	1155      	lrw      	r2, 0xa55ac73a	// b50 <EPT_SW_Set_lock+0x28>
     a80:	9360      	ld.w      	r3, (r3, 0x0)
     a82:	237f      	addi      	r3, 128
     a84:	b35a      	st.w      	r2, (r3, 0x68)
	EPT0->EMPOL=EPT_EPIX_POL;
     a86:	b301      	st.w      	r0, (r3, 0x4)
}
     a88:	783c      	jmp      	r15

00000a8a <EPT_LKCR_TRG_Config>:
//EPT_LKCR_TRG_X:EPT_LKCR_TRG_EP0~EPT_LKCR_TRG_EP7,EPT_LKCR_TRG_CPU_FAULT,EPT_LKCR_TRG_MEM_FAULT,EPT_LKCR_TRG_EOM_FAULT
//EPT_LKCR_Mode_X:EPT_LKCR_Mode_LOCK_DIS,EPT_LKCR_Mode_SLOCK_EN,EPT_LKCR_Mode_HLOCK_EN,EPT_LKCR_TRG_X_FAULT_HLOCK_EN,EPT_LKCR_TRG_X_FAULT_HLOCK_DIS
//ReturnValue:NONE
/*************************************************************/
void EPT_LKCR_TRG_Config(EPT_LKCR_TRG_Source_Type EPT_LKCR_TRG_X , EPT_LKCR_Mode_Type EPT_LKCR_Mode_X)
{
     a8a:	14c2      	push      	r4-r5
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     a8c:	116f      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     a8e:	11b1      	lrw      	r5, 0xa55ac73a	// b50 <EPT_SW_Set_lock+0x28>
     a90:	9360      	ld.w      	r3, (r3, 0x0)
     a92:	237f      	addi      	r3, 128
     a94:	b3ba      	st.w      	r5, (r3, 0x68)
	EPT0->EMECR|=(0X01<<21)|(0X01<<22)|(0X02<<24);			//EMOSR CNT=ZRO load，Automatically clear soft lock when CNT=ZRO&PRD
     a96:	3498      	movi      	r4, 152
     a98:	9342      	ld.w      	r2, (r3, 0x8)
     a9a:	4492      	lsli      	r4, r4, 18
     a9c:	6c90      	or      	r2, r4
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
	if(EPT_LKCR_TRG_X==EPT_LKCR_TRG_CPU_FAULT)
     a9e:	384f      	cmpnei      	r0, 15
	EPT0->EMECR|=(0X01<<21)|(0X01<<22)|(0X02<<24);			//EMOSR CNT=ZRO load，Automatically clear soft lock when CNT=ZRO&PRD
     aa0:	b342      	st.w      	r2, (r3, 0x8)
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     aa2:	b3ba      	st.w      	r5, (r3, 0x68)
	if(EPT_LKCR_TRG_X==EPT_LKCR_TRG_CPU_FAULT)
     aa4:	080c      	bt      	0xabc	// abc <EPT_LKCR_TRG_Config+0x32>
	{
		if(EPT_LKCR_Mode_X==EPT_LKCR_TRG_X_FAULT_HLOCK_EN)
     aa6:	3943      	cmpnei      	r1, 3
     aa8:	0805      	bt      	0xab2	// ab2 <EPT_LKCR_TRG_Config+0x28>
		{
			EPT0->EMECR|=(0x01<<28);
     aaa:	9342      	ld.w      	r2, (r3, 0x8)
     aac:	3abc      	bseti      	r2, 28
		{
			EPT0->EMECR|=(0x01<<30);
		}
		else if(EPT_LKCR_Mode_X==EPT_LKCR_TRG_X_FAULT_HLOCK_DIS)
		{
			EPT0->EMECR&=~(0x01<<30);
     aae:	b342      	st.w      	r2, (r3, 0x8)
	}
	else
	{
		EPT0->EMECR|=(EPT_LKCR_Mode_X<<(EPT_LKCR_TRG_X))|(0X01<<26);
	}
}
     ab0:	1482      	pop      	r4-r5
		else if(EPT_LKCR_Mode_X==EPT_LKCR_TRG_X_FAULT_HLOCK_DIS)
     ab2:	3944      	cmpnei      	r1, 4
     ab4:	0bfe      	bt      	0xab0	// ab0 <EPT_LKCR_TRG_Config+0x26>
			EPT0->EMECR&=~(0x01<<28);
     ab6:	9342      	ld.w      	r2, (r3, 0x8)
     ab8:	3a9c      	bclri      	r2, 28
     aba:	07fa      	br      	0xaae	// aae <EPT_LKCR_TRG_Config+0x24>
	else if(EPT_LKCR_TRG_X==EPT_LKCR_TRG_MEM_FAULT)
     abc:	3850      	cmpnei      	r0, 16
     abe:	080b      	bt      	0xad4	// ad4 <EPT_LKCR_TRG_Config+0x4a>
		if(EPT_LKCR_Mode_X==EPT_LKCR_TRG_X_FAULT_HLOCK_EN)
     ac0:	3943      	cmpnei      	r1, 3
     ac2:	0804      	bt      	0xaca	// aca <EPT_LKCR_TRG_Config+0x40>
			EPT0->EMECR|=(0x01<<29);
     ac4:	9342      	ld.w      	r2, (r3, 0x8)
     ac6:	3abd      	bseti      	r2, 29
     ac8:	07f3      	br      	0xaae	// aae <EPT_LKCR_TRG_Config+0x24>
		else if(EPT_LKCR_Mode_X==EPT_LKCR_TRG_X_FAULT_HLOCK_DIS)
     aca:	3944      	cmpnei      	r1, 4
     acc:	0bf2      	bt      	0xab0	// ab0 <EPT_LKCR_TRG_Config+0x26>
			EPT0->EMECR&=~(0x01<<29);
     ace:	9342      	ld.w      	r2, (r3, 0x8)
     ad0:	3a9d      	bclri      	r2, 29
     ad2:	07ee      	br      	0xaae	// aae <EPT_LKCR_TRG_Config+0x24>
	else if(EPT_LKCR_TRG_X==EPT_LKCR_TRG_EOM_FAULT)
     ad4:	3851      	cmpnei      	r0, 17
     ad6:	080b      	bt      	0xaec	// aec <EPT_LKCR_TRG_Config+0x62>
		if(EPT_LKCR_Mode_X==EPT_LKCR_TRG_X_FAULT_HLOCK_EN)
     ad8:	3943      	cmpnei      	r1, 3
     ada:	0804      	bt      	0xae2	// ae2 <EPT_LKCR_TRG_Config+0x58>
			EPT0->EMECR|=(0x01<<30);
     adc:	9342      	ld.w      	r2, (r3, 0x8)
     ade:	3abe      	bseti      	r2, 30
     ae0:	07e7      	br      	0xaae	// aae <EPT_LKCR_TRG_Config+0x24>
		else if(EPT_LKCR_Mode_X==EPT_LKCR_TRG_X_FAULT_HLOCK_DIS)
     ae2:	3944      	cmpnei      	r1, 4
     ae4:	0be6      	bt      	0xab0	// ab0 <EPT_LKCR_TRG_Config+0x26>
			EPT0->EMECR&=~(0x01<<30);
     ae6:	9342      	ld.w      	r2, (r3, 0x8)
     ae8:	3a9e      	bclri      	r2, 30
     aea:	07e2      	br      	0xaae	// aae <EPT_LKCR_TRG_Config+0x24>
		EPT0->EMECR|=(EPT_LKCR_Mode_X<<(EPT_LKCR_TRG_X))|(0X01<<26);
     aec:	9342      	ld.w      	r2, (r3, 0x8)
     aee:	7040      	lsl      	r1, r0
     af0:	3aba      	bseti      	r2, 26
     af2:	6c48      	or      	r1, r2
     af4:	b322      	st.w      	r1, (r3, 0x8)
}
     af6:	07dd      	br      	0xab0	// ab0 <EPT_LKCR_TRG_Config+0x26>

00000af8 <EPT_SHLOCK_OUTPUT_Config>:
//EPT_SHLOCK_OUTPUT_X:EPT_SHLOCK_OUTPUT_HImpedance,EPT_SHLOCK_OUTPUT_High,EPT_SHLOCK_OUTPUT_Low,EPT_SHLOCK_OUTPUT_Nochange
//ReturnValue:NONE
/*************************************************************/
void EPT_SHLOCK_OUTPUT_Config(EPT_OUTPUT_Channel_Type EPT_OUTPUT_Channel_X , EPT_SHLOCK_OUTPUT_Statue_Type EPT_SHLOCK_OUTPUT_X)
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     af8:	1074      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     afa:	1056      	lrw      	r2, 0xa55ac73a	// b50 <EPT_SW_Set_lock+0x28>
     afc:	9360      	ld.w      	r3, (r3, 0x0)
     afe:	237f      	addi      	r3, 128
     b00:	b35a      	st.w      	r2, (r3, 0x68)
	EPT0->EMOSR|=EPT_SHLOCK_OUTPUT_X<<EPT_OUTPUT_Channel_X;
     b02:	9343      	ld.w      	r2, (r3, 0xc)
     b04:	7040      	lsl      	r1, r0
     b06:	6c48      	or      	r1, r2
     b08:	b323      	st.w      	r1, (r3, 0xc)
}
     b0a:	783c      	jmp      	r15

00000b0c <EPT_SLock_CLR>:
//EPT_X_EMINT:EPT_EP0_EMINT~EPT_EP7_EMINT,EPT_CPU_FAULT_EMINT,EPT_MEM_FAULT_EMINT,EPT_EOM_FAULT_EMINT
//ReturnValue:NONE
/*************************************************************/
void EPT_SLock_CLR(EPT_EMINT_TypeDef EPT_X_EMINT)
{
	EPT0->EMSLCLR|=EPT_X_EMINT;
     b0c:	106f      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     b0e:	9360      	ld.w      	r3, (r3, 0x0)
     b10:	237f      	addi      	r3, 128
     b12:	9346      	ld.w      	r2, (r3, 0x18)
     b14:	6c08      	or      	r0, r2
     b16:	b306      	st.w      	r0, (r3, 0x18)
}
     b18:	783c      	jmp      	r15

00000b1a <EPT_HLock_CLR>:
//EPT_X_EMINT:EPT_EP0_EMINT~EPT_EP7_EMINT,EPT_CPU_FAULT_EMINT,EPT_MEM_FAULT_EMINT,EPT_EOM_FAULT_EMINT
//ReturnValue:NONE
/*************************************************************/
void EPT_HLock_CLR(EPT_EMINT_TypeDef EPT_X_EMINT)
{
	EPT0->EMHLCLR|=EPT_X_EMINT;
     b1a:	106c      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     b1c:	9360      	ld.w      	r3, (r3, 0x0)
     b1e:	237f      	addi      	r3, 128
     b20:	9348      	ld.w      	r2, (r3, 0x20)
     b22:	6c08      	or      	r0, r2
     b24:	b308      	st.w      	r0, (r3, 0x20)
}
     b26:	783c      	jmp      	r15

00000b28 <EPT_SW_Set_lock>:
//EPT_X_EMINT:EPT_EP0_EMINT~EPT_EP7_EMINT,EPT_CPU_FAULT_EMINT,EPT_MEM_FAULT_EMINT,EPT_EOM_FAULT_EMINT
//ReturnValue:NONE
/*************************************************************/
void EPT_SW_Set_lock(EPT_EMINT_TypeDef EPT_X_EMINT)
{
	EPT0->REGPROT = (0xA55A<<16) | 0xC73A;
     b28:	1068      	lrw      	r3, 0x20000034	// b48 <EPT_SW_Set_lock+0x20>
     b2a:	104a      	lrw      	r2, 0xa55ac73a	// b50 <EPT_SW_Set_lock+0x28>
     b2c:	9360      	ld.w      	r3, (r3, 0x0)
     b2e:	237f      	addi      	r3, 128
     b30:	b35a      	st.w      	r2, (r3, 0x68)
	EPT0->EMFRCR|=EPT_X_EMINT;
     b32:	9349      	ld.w      	r2, (r3, 0x24)
     b34:	6c08      	or      	r0, r2
     b36:	b309      	st.w      	r0, (r3, 0x24)
}
     b38:	783c      	jmp      	r15
     b3a:	0000      	bkpt
     b3c:	002000f0 	.long	0x002000f0
     b40:	00400f00 	.long	0x00400f00
     b44:	0080f000 	.long	0x0080f000
     b48:	20000034 	.long	0x20000034
     b4c:	20000078 	.long	0x20000078
     b50:	a55ac73a 	.long	0xa55ac73a

00000b54 <GPT_REG_PROT_UNLOCK>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPT_REG_PROT_UNLOCK()
{	
	 GPTA0->REGPROT=(0xa55a << 16 | 0xc73a);	
     b54:	1063      	lrw      	r3, 0x20000038	// b60 <GPT_REG_PROT_UNLOCK+0xc>
     b56:	1044      	lrw      	r2, 0xa55ac73a	// b64 <GPT_REG_PROT_UNLOCK+0x10>
     b58:	9360      	ld.w      	r3, (r3, 0x0)
     b5a:	237f      	addi      	r3, 128
     b5c:	b35a      	st.w      	r2, (r3, 0x68)
}
     b5e:	783c      	jmp      	r15
     b60:	20000038 	.long	0x20000038
     b64:	a55ac73a 	.long	0xa55ac73a

00000b68 <GPT_DeInit>:
//GPT RESET CLEAR ALL REGISTER
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void GPT_DeInit(void)
{
     b68:	14d0      	push      	r15
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     b6a:	e3fffff5 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->CEDR 		= 0xBE980000;
     b6e:	0170      	lrw      	r3, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
     b70:	0150      	lrw      	r2, 0xbe980000	// eac <GPT_Trigger_Configure+0x42>
     b72:	9360      	ld.w      	r3, (r3, 0x0)
     b74:	b340      	st.w      	r2, (r3, 0x0)
	GPTA0->RSSR 		= GPT_RESET_VALUE;
	GPTA0->PSCR 		= GPT_RESET_VALUE;
	GPTA0->CR 		= 0X00010010;
     b76:	0130      	lrw      	r1, 0x10010	// eb0 <GPT_Trigger_Configure+0x46>
	GPTA0->RSSR 		= GPT_RESET_VALUE;
     b78:	3200      	movi      	r2, 0
     b7a:	b341      	st.w      	r2, (r3, 0x4)
	GPTA0->PSCR 		= GPT_RESET_VALUE;
     b7c:	b342      	st.w      	r2, (r3, 0x8)
	GPTA0->CR 		= 0X00010010;
     b7e:	b323      	st.w      	r1, (r3, 0xc)
	GPTA0->GLDCR2 	= GPT_RESET_VALUE;
	GPTA0->PRDR 		= GPT_RESET_VALUE;
	GPTA0->PHSR 		= GPT_RESET_VALUE;
	GPTA0->CMPA 		= GPT_RESET_VALUE;
	GPTA0->CMPB 		= GPT_RESET_VALUE;
	GPTA0->CMPLDR 	= 0X00002490;
     b80:	0132      	lrw      	r1, 0x2490	// eb4 <GPT_Trigger_Configure+0x4a>
	GPTA0->SYNCR 	= GPT_RESET_VALUE;
     b82:	b344      	st.w      	r2, (r3, 0x10)
	GPTA0->GLDCR 	= GPT_RESET_VALUE;
     b84:	b345      	st.w      	r2, (r3, 0x14)
	GPTA0->GLDCFG 	= GPT_RESET_VALUE;
     b86:	b346      	st.w      	r2, (r3, 0x18)
	GPTA0->GLDCR2 	= GPT_RESET_VALUE;
     b88:	b347      	st.w      	r2, (r3, 0x1c)
	GPTA0->PRDR 		= GPT_RESET_VALUE;
     b8a:	b349      	st.w      	r2, (r3, 0x24)
	GPTA0->PHSR 		= GPT_RESET_VALUE;
     b8c:	b34a      	st.w      	r2, (r3, 0x28)
	GPTA0->CMPA 		= GPT_RESET_VALUE;
     b8e:	b34b      	st.w      	r2, (r3, 0x2c)
	GPTA0->CMPB 		= GPT_RESET_VALUE;
     b90:	b34c      	st.w      	r2, (r3, 0x30)
	GPTA0->CMPLDR 	= 0X00002490;
     b92:	b32f      	st.w      	r1, (r3, 0x3c)
	GPTA0->CNT 		= GPT_RESET_VALUE;
	GPTA0->AQLDR 	= 0X00000024;
     b94:	3124      	movi      	r1, 36
	GPTA0->CNT 		= GPT_RESET_VALUE;
     b96:	b350      	st.w      	r2, (r3, 0x40)
	GPTA0->AQLDR 	= 0X00000024;
     b98:	b331      	st.w      	r1, (r3, 0x44)
	GPTA0->AQCRA 	= GPT_RESET_VALUE;
	GPTA0->AQCRB 	= GPT_RESET_VALUE;
	GPTA0->AQOSF	 	= 0X00000100;
     b9a:	3180      	movi      	r1, 128
     b9c:	4121      	lsli      	r1, r1, 1
	GPTA0->AQCRA 	= GPT_RESET_VALUE;
     b9e:	b352      	st.w      	r2, (r3, 0x48)
	GPTA0->AQCRB 	= GPT_RESET_VALUE;
     ba0:	b353      	st.w      	r2, (r3, 0x4c)
	GPTA0->AQOSF	 	= 0X00000100;
     ba2:	b337      	st.w      	r1, (r3, 0x5c)
	GPTA0->AQCSF 	= GPT_RESET_VALUE;
     ba4:	b358      	st.w      	r2, (r3, 0x60)
	GPTA0->TRGFTCR 	= GPT_RESET_VALUE;
     ba6:	237f      	addi      	r3, 128
     ba8:	b34e      	st.w      	r2, (r3, 0x38)
	GPTA0->TRGFTWR	= GPT_RESET_VALUE;
     baa:	b34f      	st.w      	r2, (r3, 0x3c)
	GPTA0->EVTRG 	= GPT_RESET_VALUE;
     bac:	b350      	st.w      	r2, (r3, 0x40)
	GPTA0->EVPS 		= GPT_RESET_VALUE;
     bae:	b351      	st.w      	r2, (r3, 0x44)
	GPTA0->EVCNTINIT = GPT_RESET_VALUE;
     bb0:	b352      	st.w      	r2, (r3, 0x48)
	GPTA0->EVSWF 	= GPT_RESET_VALUE;
     bb2:	b353      	st.w      	r2, (r3, 0x4c)
	GPTA0->RISR		= GPT_RESET_VALUE;
     bb4:	b354      	st.w      	r2, (r3, 0x50)
	GPTA0->MISR 		= GPT_RESET_VALUE;
     bb6:	b355      	st.w      	r2, (r3, 0x54)
	GPTA0->IMCR 		= GPT_RESET_VALUE;
     bb8:	b356      	st.w      	r2, (r3, 0x58)
	GPTA0->ICR 		= GPT_RESET_VALUE;
     bba:	b357      	st.w      	r2, (r3, 0x5c)
	GPTA0->REGPROT 	= GPT_RESET_VALUE;
     bbc:	b35a      	st.w      	r2, (r3, 0x68)
}
     bbe:	1490      	pop      	r15

00000bc0 <GPT_IO_Init>:
//EntryParameter:GPT_CHA_PB01,GPT_CHA_PA09,GPT_CHA_PA010,GPT_CHB_PA010,GPT_CHB_PA011,GPT_CHB_PB00,GPT_CHB_PB01
//ReturnValue:NONE
/*************************************************************/
void GPT_IO_Init(GPT_IOSET_TypeDef IONAME)
{
	if(IONAME==GPT_CHA_PA03)
     bc0:	3840      	cmpnei      	r0, 0
     bc2:	080b      	bt      	0xbd8	// bd8 <GPT_IO_Init+0x18>
	{
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFF0FFF)|0x00006000;
     bc4:	0262      	lrw      	r3, 0x20000014	// eb8 <GPT_Trigger_Configure+0x4e>
     bc6:	32f0      	movi      	r2, 240
     bc8:	9320      	ld.w      	r1, (r3, 0x0)
     bca:	9160      	ld.w      	r3, (r1, 0x0)
     bcc:	4248      	lsli      	r2, r2, 8
     bce:	68c9      	andn      	r3, r2
     bd0:	3bad      	bseti      	r3, 13
     bd2:	3bae      	bseti      	r3, 14
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XF0FFFFFF)|0x04000000;
	}
	if(IONAME==GPT_CHB_PA04)
	{
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFF0FFFF)|0x00060000;
     bd4:	b160      	st.w      	r3, (r1, 0x0)
	}
	if(IONAME==GPT_CHB_PB07)
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0X0FFFFFFF)|0x40000000;
	}
}
     bd6:	783c      	jmp      	r15
	if(IONAME==GPT_CHA_PA13)
     bd8:	3841      	cmpnei      	r0, 1
     bda:	0809      	bt      	0xbec	// bec <GPT_IO_Init+0x2c>
		GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFF0FFF)|0x00004000;
     bdc:	0267      	lrw      	r3, 0x20000010	// ebc <GPT_Trigger_Configure+0x52>
     bde:	32f0      	movi      	r2, 240
     be0:	9320      	ld.w      	r1, (r3, 0x0)
     be2:	9160      	ld.w      	r3, (r1, 0x0)
     be4:	4248      	lsli      	r2, r2, 8
     be6:	68c9      	andn      	r3, r2
     be8:	3bae      	bseti      	r3, 14
     bea:	07f5      	br      	0xbd4	// bd4 <GPT_IO_Init+0x14>
	if(IONAME==GPT_CHA_PB00)
     bec:	3842      	cmpnei      	r0, 2
     bee:	0809      	bt      	0xc00	// c00 <GPT_IO_Init+0x40>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFFF0)|0x00000008;
     bf0:	026b      	lrw      	r3, 0x2000000c	// ec0 <GPT_Trigger_Configure+0x56>
     bf2:	310f      	movi      	r1, 15
     bf4:	9340      	ld.w      	r2, (r3, 0x0)
     bf6:	9260      	ld.w      	r3, (r2, 0x0)
     bf8:	68c5      	andn      	r3, r1
     bfa:	3ba3      	bseti      	r3, 3
		GPIOB0->CONLR=(GPIOB0->CONLR & 0X0FFFFFFF)|0x40000000;
     bfc:	b260      	st.w      	r3, (r2, 0x0)
}
     bfe:	07ec      	br      	0xbd6	// bd6 <GPT_IO_Init+0x16>
	if(IONAME==GPT_CHA_PB06)
     c00:	3843      	cmpnei      	r0, 3
     c02:	0809      	bt      	0xc14	// c14 <GPT_IO_Init+0x54>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XF0FFFFFF)|0x04000000;
     c04:	0270      	lrw      	r3, 0x2000000c	// ec0 <GPT_Trigger_Configure+0x56>
     c06:	32f0      	movi      	r2, 240
     c08:	9320      	ld.w      	r1, (r3, 0x0)
     c0a:	9160      	ld.w      	r3, (r1, 0x0)
     c0c:	4254      	lsli      	r2, r2, 20
     c0e:	68c9      	andn      	r3, r2
     c10:	3bba      	bseti      	r3, 26
     c12:	07e1      	br      	0xbd4	// bd4 <GPT_IO_Init+0x14>
	if(IONAME==GPT_CHB_PA04)
     c14:	3844      	cmpnei      	r0, 4
     c16:	080a      	bt      	0xc2a	// c2a <GPT_IO_Init+0x6a>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFF0FFFF)|0x00060000;
     c18:	0277      	lrw      	r3, 0x20000014	// eb8 <GPT_Trigger_Configure+0x4e>
     c1a:	32f0      	movi      	r2, 240
     c1c:	9320      	ld.w      	r1, (r3, 0x0)
     c1e:	9160      	ld.w      	r3, (r1, 0x0)
     c20:	424c      	lsli      	r2, r2, 12
     c22:	68c9      	andn      	r3, r2
     c24:	3bb1      	bseti      	r3, 17
     c26:	3bb2      	bseti      	r3, 18
     c28:	07d6      	br      	0xbd4	// bd4 <GPT_IO_Init+0x14>
	if(IONAME==GPT_CHB_PA14)
     c2a:	3845      	cmpnei      	r0, 5
     c2c:	0809      	bt      	0xc3e	// c3e <GPT_IO_Init+0x7e>
		GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x00040000;
     c2e:	027b      	lrw      	r3, 0x20000010	// ebc <GPT_Trigger_Configure+0x52>
     c30:	32f0      	movi      	r2, 240
     c32:	9320      	ld.w      	r1, (r3, 0x0)
     c34:	9160      	ld.w      	r3, (r1, 0x0)
     c36:	424c      	lsli      	r2, r2, 12
     c38:	68c9      	andn      	r3, r2
     c3a:	3bb2      	bseti      	r3, 18
     c3c:	07cc      	br      	0xbd4	// bd4 <GPT_IO_Init+0x14>
	if(IONAME==GPT_CHB_PB01)
     c3e:	3846      	cmpnei      	r0, 6
     c40:	0808      	bt      	0xc50	// c50 <GPT_IO_Init+0x90>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFF0F)|0x00000080;
     c42:	027f      	lrw      	r3, 0x2000000c	// ec0 <GPT_Trigger_Configure+0x56>
     c44:	31f0      	movi      	r1, 240
     c46:	9340      	ld.w      	r2, (r3, 0x0)
     c48:	9260      	ld.w      	r3, (r2, 0x0)
     c4a:	68c5      	andn      	r3, r1
     c4c:	3ba7      	bseti      	r3, 7
     c4e:	07d7      	br      	0xbfc	// bfc <GPT_IO_Init+0x3c>
	if(IONAME==GPT_CHB_PB07)
     c50:	3847      	cmpnei      	r0, 7
     c52:	0bc2      	bt      	0xbd6	// bd6 <GPT_IO_Init+0x16>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0X0FFFFFFF)|0x40000000;
     c54:	0364      	lrw      	r3, 0x2000000c	// ec0 <GPT_Trigger_Configure+0x56>
     c56:	9340      	ld.w      	r2, (r3, 0x0)
     c58:	9260      	ld.w      	r3, (r2, 0x0)
     c5a:	4364      	lsli      	r3, r3, 4
     c5c:	4b64      	lsri      	r3, r3, 4
     c5e:	3bbe      	bseti      	r3, 30
     c60:	07ce      	br      	0xbfc	// bfc <GPT_IO_Init+0x3c>

00000c62 <GPT_Configure>:
//GPT Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Configure(GPT_CLK_TypeDef GPTCLKX,GPT_CSS_TypeDef GCSSX,GPT_SHDWSTP_TypeDef GSHDWSTPX,U16_T GPSCX)
{
     c62:	14d4      	push      	r4-r7, r15
     c64:	1421      	subi      	r14, r14, 4
     c66:	6dc3      	mov      	r7, r0
     c68:	6d8f      	mov      	r6, r3
     c6a:	6d07      	mov      	r4, r1
     c6c:	b840      	st.w      	r2, (r14, 0x0)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     c6e:	e3ffff73 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->CEDR = GPTCLKX| GCSSX|GSHDWSTPX;
     c72:	9840      	ld.w      	r2, (r14, 0x0)
     c74:	6d08      	or      	r4, r2
     c76:	0372      	lrw      	r3, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
     c78:	6c13      	mov      	r0, r4
     c7a:	93a0      	ld.w      	r5, (r3, 0x0)
     c7c:	6c1c      	or      	r0, r7
     c7e:	b500      	st.w      	r0, (r5, 0x0)
	GPTA0->PSCR=GPSCX;
     c80:	b5c2      	st.w      	r6, (r5, 0x8)
}
     c82:	1401      	addi      	r14, r14, 4
     c84:	1494      	pop      	r4-r7, r15

00000c86 <GPT_WaveCtrl_Configure>:
/*************************************************************/
//GPT0->CR = (0X0<<0)|(0x00<<2)|(0x01<<3)|(0x00<<4)|(0X00<<6)|(0x01<<18)|(0x00<<9)|(0X00<<10)|(0x00<<11)|(0x00<<13) ;	
//GPT0->CMPLDR=(0X00<<0)|(0X00<<1)|(0X03<<4)|(0X03<<7);
void GPT_WaveCtrl_Configure(GPT_CNTMD_TypeDef GCNTMDX,GPT_SWSYN_TypeDef GSWSYNX,GPT_IDLEST_TypeDef GIDLEX,GPT_PRDLD0_TypeDef GPRDLD0,GPT_OPM_TypeDef GOPMX,
						GPT_BURST_TypeDef GBURSTX,GPT_CKS_TypeDef GCKS,GPT_CGSRC_TypeDef CGSRCX,GPT_CGFLT_TypeDef CGFLT,GPT_PSCLD_TypeDef PSCLDX)
{
     c86:	14d4      	push      	r4-r7, r15
     c88:	1427      	subi      	r14, r14, 28
     c8a:	b866      	st.w      	r3, (r14, 0x18)
     c8c:	986c      	ld.w      	r3, (r14, 0x30)
     c8e:	b860      	st.w      	r3, (r14, 0x0)
     c90:	986d      	ld.w      	r3, (r14, 0x34)
     c92:	b861      	st.w      	r3, (r14, 0x4)
     c94:	986e      	ld.w      	r3, (r14, 0x38)
     c96:	b862      	st.w      	r3, (r14, 0x8)
     c98:	986f      	ld.w      	r3, (r14, 0x3c)
     c9a:	b863      	st.w      	r3, (r14, 0xc)
     c9c:	9870      	ld.w      	r3, (r14, 0x40)
     c9e:	b864      	st.w      	r3, (r14, 0x10)
     ca0:	9871      	ld.w      	r3, (r14, 0x44)
     ca2:	6d43      	mov      	r5, r0
     ca4:	6d87      	mov      	r6, r1
     ca6:	6dcb      	mov      	r7, r2
     ca8:	b865      	st.w      	r3, (r14, 0x14)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     caa:	e3ffff55 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->CR =GCNTMDX|GSWSYNX|GIDLEX|GPRDLD0|GOPMX|GBURSTX|GCKS|CGSRCX|CGFLT|PSCLDX|GPT_WAVE_MODE;
     cae:	135f      	lrw      	r2, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
     cb0:	9280      	ld.w      	r4, (r2, 0x0)
     cb2:	9845      	ld.w      	r2, (r14, 0x14)
     cb4:	9864      	ld.w      	r3, (r14, 0x10)
     cb6:	3ab2      	bseti      	r2, 18
     cb8:	6c8c      	or      	r2, r3
     cba:	9863      	ld.w      	r3, (r14, 0xc)
     cbc:	6c8c      	or      	r2, r3
     cbe:	9862      	ld.w      	r3, (r14, 0x8)
     cc0:	6c8c      	or      	r2, r3
     cc2:	9861      	ld.w      	r3, (r14, 0x4)
     cc4:	6c8c      	or      	r2, r3
     cc6:	9860      	ld.w      	r3, (r14, 0x0)
     cc8:	6c8c      	or      	r2, r3
     cca:	9866      	ld.w      	r3, (r14, 0x18)
     ccc:	6cc8      	or      	r3, r2
     cce:	6dcc      	or      	r7, r3
     cd0:	6d9c      	or      	r6, r7
     cd2:	6d58      	or      	r5, r6
     cd4:	b4a3      	st.w      	r5, (r4, 0xc)
}
     cd6:	1407      	addi      	r14, r14, 28
     cd8:	1494      	pop      	r4-r7, r15

00000cda <GPT_WaveLoad_Configure>:
//GPT Wave control Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_WaveLoad_Configure(GPT_SHDWAQA_TypeDef SHDWAQAX,GPT_SHDWAQB_TypeDef SHDWAQBX,GPT_AQLDA_TypeDef AQLDAX, GPT_AQLDB_TypeDef AQLDBX)
{
     cda:	14d4      	push      	r4-r7, r15
     cdc:	1421      	subi      	r14, r14, 4
     cde:	6dc7      	mov      	r7, r1
     ce0:	6d83      	mov      	r6, r0
     ce2:	6d0b      	mov      	r4, r2
     ce4:	b860      	st.w      	r3, (r14, 0x0)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     ce6:	e3ffff37 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->AQLDR=SHDWAQAX|SHDWAQBX|AQLDAX|AQLDBX;
     cea:	9860      	ld.w      	r3, (r14, 0x0)
     cec:	6d0c      	or      	r4, r3
     cee:	6c53      	mov      	r1, r4
     cf0:	134e      	lrw      	r2, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
     cf2:	6c5c      	or      	r1, r7
     cf4:	92a0      	ld.w      	r5, (r2, 0x0)
     cf6:	6c58      	or      	r1, r6
     cf8:	b531      	st.w      	r1, (r5, 0x44)
}
     cfa:	1401      	addi      	r14, r14, 4
     cfc:	1494      	pop      	r4-r7, r15

00000cfe <GPT_PHSEN_Config>:
//EPT_PHSDIR:EPT_PHSDIR_increase,EPT_PHSEN_decrease
//PHSR:0~0xffff
//ReturnValue:NONE
/*************************************************************/  
void GPT_PHSEN_Config(GPTA_PHSEN_CMD_Type GPT_PHSEN_CMD ,GPTA_PHSDIR_Type GPTA_PHSDIR ,U16_T PHSR)   
{
     cfe:	14d4      	push      	r4-r7, r15
     d00:	6dc3      	mov      	r7, r0
     d02:	6d87      	mov      	r6, r1
     d04:	6d4b      	mov      	r5, r2
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     d06:	e3ffff27 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->CR=(GPTA0->CR&0xffffff7f)|GPT_PHSEN_CMD;                  
     d0a:	1368      	lrw      	r3, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
	GPTA0->PHSR=PHSR|GPTA_PHSDIR;                                               
     d0c:	6c97      	mov      	r2, r5
	GPTA0->CR=(GPTA0->CR&0xffffff7f)|GPT_PHSEN_CMD;                  
     d0e:	9380      	ld.w      	r4, (r3, 0x0)
     d10:	9463      	ld.w      	r3, (r4, 0xc)
     d12:	3b87      	bclri      	r3, 7
     d14:	6cdc      	or      	r3, r7
	GPTA0->PHSR=PHSR|GPTA_PHSDIR;                                               
     d16:	6c98      	or      	r2, r6
	GPTA0->CR=(GPTA0->CR&0xffffff7f)|GPT_PHSEN_CMD;                  
     d18:	b463      	st.w      	r3, (r4, 0xc)
	GPTA0->PHSR=PHSR|GPTA_PHSDIR;                                               
     d1a:	b44a      	st.w      	r2, (r4, 0x28)
}
     d1c:	1494      	pop      	r4-r7, r15

00000d1e <GPT_WaveOut_Configure>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_WaveOut_Configure(GPT_GPTCHX_TypeDef GPTCHX,GPT_CASEL_TypeDef CASELX,GPT_CBSEL_TypeDef CBSELX,U8_T ZROX,U8_T PRDX,U8_T CAUX,
						U8_T CADX,U8_T CBUX,U8_T CBDX,U8_T T1UX,U8_T T1DX,U8_T T2UX,U8_T T2DX)
{
     d1e:	14d4      	push      	r4-r7, r15
     d20:	1429      	subi      	r14, r14, 36
     d22:	b862      	st.w      	r3, (r14, 0x8)
     d24:	1b0e      	addi      	r3, r14, 56
     d26:	8360      	ld.b      	r3, (r3, 0x0)
     d28:	b863      	st.w      	r3, (r14, 0xc)
     d2a:	1b0f      	addi      	r3, r14, 60
     d2c:	8360      	ld.b      	r3, (r3, 0x0)
     d2e:	b864      	st.w      	r3, (r14, 0x10)
     d30:	1b10      	addi      	r3, r14, 64
     d32:	b820      	st.w      	r1, (r14, 0x0)
     d34:	8320      	ld.b      	r1, (r3, 0x0)
     d36:	1b11      	addi      	r3, r14, 68
     d38:	8380      	ld.b      	r4, (r3, 0x0)
     d3a:	1b12      	addi      	r3, r14, 72
     d3c:	83a0      	ld.b      	r5, (r3, 0x0)
     d3e:	1b13      	addi      	r3, r14, 76
     d40:	83c0      	ld.b      	r6, (r3, 0x0)
     d42:	1b14      	addi      	r3, r14, 80
     d44:	83e0      	ld.b      	r7, (r3, 0x0)
     d46:	1b15      	addi      	r3, r14, 84
     d48:	b841      	st.w      	r2, (r14, 0x4)
     d4a:	8340      	ld.b      	r2, (r3, 0x0)
     d4c:	1b16      	addi      	r3, r14, 88
     d4e:	8360      	ld.b      	r3, (r3, 0x0)
     d50:	b808      	st.w      	r0, (r14, 0x20)
     d52:	b827      	st.w      	r1, (r14, 0x1c)
     d54:	b846      	st.w      	r2, (r14, 0x18)
     d56:	b865      	st.w      	r3, (r14, 0x14)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     d58:	e3fffefe 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	if(GPTCHX==GPT_CHA)
     d5c:	9808      	ld.w      	r0, (r14, 0x20)
     d5e:	3840      	cmpnei      	r0, 0
     d60:	9865      	ld.w      	r3, (r14, 0x14)
     d62:	9846      	ld.w      	r2, (r14, 0x18)
     d64:	9827      	ld.w      	r1, (r14, 0x1c)
     d66:	081f      	bt      	0xda4	// da4 <GPT_WaveOut_Configure+0x86>
	{
	GPTA0->AQCRA=CASELX|CBSELX|(ZROX<<0)|(PRDX<<2)|(CAUX<<4)|(CADX<<6)|(CBUX<<8)|(CBDX<<10)|(T1UX<<12)|(T1DX<<14)|(T2UX<<16)|(T2DX<<18);
     d68:	4372      	lsli      	r3, r3, 18
     d6a:	4250      	lsli      	r2, r2, 16
     d6c:	6c8c      	or      	r2, r3
     d6e:	47ee      	lsli      	r7, r7, 14
     d70:	6c9c      	or      	r2, r7
     d72:	46cc      	lsli      	r6, r6, 12
     d74:	6c98      	or      	r2, r6
     d76:	45aa      	lsli      	r5, r5, 10
     d78:	6c94      	or      	r2, r5
     d7a:	4488      	lsli      	r4, r4, 8
     d7c:	6c90      	or      	r2, r4
     d7e:	4126      	lsli      	r1, r1, 6
     d80:	9861      	ld.w      	r3, (r14, 0x4)
     d82:	6c48      	or      	r1, r2
     d84:	6c4c      	or      	r1, r3
     d86:	9862      	ld.w      	r3, (r14, 0x8)
     d88:	6c4c      	or      	r1, r3
     d8a:	9864      	ld.w      	r3, (r14, 0x10)
     d8c:	4364      	lsli      	r3, r3, 4
     d8e:	6c4c      	or      	r1, r3
     d90:	9860      	ld.w      	r3, (r14, 0x0)
     d92:	6c4c      	or      	r1, r3
     d94:	9863      	ld.w      	r3, (r14, 0xc)
     d96:	4362      	lsli      	r3, r3, 2
     d98:	1204      	lrw      	r0, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
     d9a:	6c4c      	or      	r1, r3
     d9c:	9000      	ld.w      	r0, (r0, 0x0)
     d9e:	b032      	st.w      	r1, (r0, 0x48)
	}
	if(GPTCHX==GPT_CHB)
	{
	GPTA0->AQCRB=CASELX|CBSELX|(ZROX<<0)|(PRDX<<2)|(CAUX<<4)|(CADX<<6)|(CBUX<<8)|(CBDX<<10)|(T1UX<<12)|(T1DX<<14)|(T2UX<<16)|(T2DX<<18);
	}
}
     da0:	1409      	addi      	r14, r14, 36
     da2:	1494      	pop      	r4-r7, r15
	if(GPTCHX==GPT_CHB)
     da4:	3841      	cmpnei      	r0, 1
     da6:	0bfd      	bt      	0xda0	// da0 <GPT_WaveOut_Configure+0x82>
	GPTA0->AQCRB=CASELX|CBSELX|(ZROX<<0)|(PRDX<<2)|(CAUX<<4)|(CADX<<6)|(CBUX<<8)|(CBDX<<10)|(T1UX<<12)|(T1DX<<14)|(T2UX<<16)|(T2DX<<18);
     da8:	4372      	lsli      	r3, r3, 18
     daa:	4250      	lsli      	r2, r2, 16
     dac:	6c8c      	or      	r2, r3
     dae:	47ee      	lsli      	r7, r7, 14
     db0:	6c9c      	or      	r2, r7
     db2:	46cc      	lsli      	r6, r6, 12
     db4:	6c98      	or      	r2, r6
     db6:	45aa      	lsli      	r5, r5, 10
     db8:	6c94      	or      	r2, r5
     dba:	4488      	lsli      	r4, r4, 8
     dbc:	6c90      	or      	r2, r4
     dbe:	4126      	lsli      	r1, r1, 6
     dc0:	9861      	ld.w      	r3, (r14, 0x4)
     dc2:	6c48      	or      	r1, r2
     dc4:	6c4c      	or      	r1, r3
     dc6:	9862      	ld.w      	r3, (r14, 0x8)
     dc8:	6c4c      	or      	r1, r3
     dca:	9864      	ld.w      	r3, (r14, 0x10)
     dcc:	4364      	lsli      	r3, r3, 4
     dce:	6c4c      	or      	r1, r3
     dd0:	9860      	ld.w      	r3, (r14, 0x0)
     dd2:	6c4c      	or      	r1, r3
     dd4:	9863      	ld.w      	r3, (r14, 0xc)
     dd6:	4362      	lsli      	r3, r3, 2
     dd8:	1114      	lrw      	r0, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
     dda:	6c4c      	or      	r1, r3
     ddc:	9000      	ld.w      	r0, (r0, 0x0)
     dde:	b033      	st.w      	r1, (r0, 0x4c)
}
     de0:	07e0      	br      	0xda0	// da0 <GPT_WaveOut_Configure+0x82>

00000de2 <GPT_Capture_Config>:
//ReturnValue:NONE
/*************************************************************/  
void GPT_Capture_Config(GPT_CNTMD_SELECTE_Type GPT_CNTMD_SELECTE_X  , GPT_CAPMD_SELECTE_Type GPT_CAPMD_SELECTE_X , GPT_CAPLDEN_TypeDef CAP_CMD 
					, GPT_LDARST_TypeDef GPT_LOAD_CMPA_RST_CMD , GPT_LDBRST_TypeDef GPT_LOAD_CMPB_RST_CMD , 
					GPT_LOAD_CMPC_RST_CMD_Type GPT_LOAD_CMPC_RST_CMD , GPT_LOAD_CMPD_RST_CMD_Type GPT_LOAD_CMPD_RST_CMD, U8_T GPT_STOP_WRAP )
{
     de2:	14d4      	push      	r4-r7, r15
     de4:	1426      	subi      	r14, r14, 24
     de6:	b863      	st.w      	r3, (r14, 0xc)
     de8:	986b      	ld.w      	r3, (r14, 0x2c)
     dea:	b860      	st.w      	r3, (r14, 0x0)
     dec:	986c      	ld.w      	r3, (r14, 0x30)
     dee:	b861      	st.w      	r3, (r14, 0x4)
     df0:	986d      	ld.w      	r3, (r14, 0x34)
     df2:	b862      	st.w      	r3, (r14, 0x8)
     df4:	1b0e      	addi      	r3, r14, 56
     df6:	6dc3      	mov      	r7, r0
     df8:	b825      	st.w      	r1, (r14, 0x14)
     dfa:	b844      	st.w      	r2, (r14, 0x10)
     dfc:	83a0      	ld.b      	r5, (r3, 0x0)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     dfe:	e3fffeab 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->CR=(GPTA0->CR&0xf800fec0)|GPT_CNTMD_SELECTE_X|(0x0<<2)|(0x0<<3)|(0x0<<4)|CAP_CMD|GPT_CAPMD_SELECTE_X|(0X0<<16)|(0x0<<18)|(GPT_STOP_WRAP<<21)|
     e02:	110a      	lrw      	r0, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
     e04:	45b5      	lsli      	r5, r5, 21
     e06:	90c0      	ld.w      	r6, (r0, 0x0)
     e08:	9683      	ld.w      	r4, (r6, 0xc)
     e0a:	110f      	lrw      	r0, 0x7ff013f	// ec4 <GPT_Trigger_Configure+0x5a>
				GPT_LOAD_CMPA_RST_CMD|GPT_LOAD_CMPB_RST_CMD|GPT_LOAD_CMPC_RST_CMD|GPT_LOAD_CMPD_RST_CMD;
     e0c:	9862      	ld.w      	r3, (r14, 0x8)
	GPTA0->CR=(GPTA0->CR&0xf800fec0)|GPT_CNTMD_SELECTE_X|(0x0<<2)|(0x0<<3)|(0x0<<4)|CAP_CMD|GPT_CAPMD_SELECTE_X|(0X0<<16)|(0x0<<18)|(GPT_STOP_WRAP<<21)|
     e0e:	6901      	andn      	r4, r0
				GPT_LOAD_CMPA_RST_CMD|GPT_LOAD_CMPB_RST_CMD|GPT_LOAD_CMPC_RST_CMD|GPT_LOAD_CMPD_RST_CMD;
     e10:	6d0c      	or      	r4, r3
     e12:	9861      	ld.w      	r3, (r14, 0x4)
     e14:	6d0c      	or      	r4, r3
     e16:	9860      	ld.w      	r3, (r14, 0x0)
     e18:	6d0c      	or      	r4, r3
     e1a:	9863      	ld.w      	r3, (r14, 0xc)
     e1c:	6cd0      	or      	r3, r4
     e1e:	9825      	ld.w      	r1, (r14, 0x14)
     e20:	6c4c      	or      	r1, r3
     e22:	9844      	ld.w      	r2, (r14, 0x10)
     e24:	6c84      	or      	r2, r1
     e26:	6dc8      	or      	r7, r2
     e28:	6d5c      	or      	r5, r7
	GPTA0->CR=(GPTA0->CR&0xf800fec0)|GPT_CNTMD_SELECTE_X|(0x0<<2)|(0x0<<3)|(0x0<<4)|CAP_CMD|GPT_CAPMD_SELECTE_X|(0X0<<16)|(0x0<<18)|(GPT_STOP_WRAP<<21)|
     e2a:	b6a3      	st.w      	r5, (r6, 0xc)
}
     e2c:	1406      	addi      	r14, r14, 24
     e2e:	1494      	pop      	r4-r7, r15

00000e30 <GPT_SyncSet_Configure>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_SyncSet_Configure(GPT_SYNCENX_TypeDef SYNCENx,GPT_OSTMDX_TypeDef OSTMDx,GPT_TXREARM0_TypeDef TXREARM0x,GPT_TRGO0SEL_TypeDef TRGO0SELx,
							GPT_TRGO1SEL_TypeDef TRGO1SELx,GPT_AREARM_TypeDef AREARMx)
{
     e30:	14d4      	push      	r4-r7, r15
     e32:	1423      	subi      	r14, r14, 12
     e34:	b862      	st.w      	r3, (r14, 0x8)
     e36:	9868      	ld.w      	r3, (r14, 0x20)
     e38:	b860      	st.w      	r3, (r14, 0x0)
     e3a:	9869      	ld.w      	r3, (r14, 0x24)
     e3c:	6d87      	mov      	r6, r1
     e3e:	6dcb      	mov      	r7, r2
     e40:	6d43      	mov      	r5, r0
     e42:	b861      	st.w      	r3, (r14, 0x4)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     e44:	e3fffe88 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->SYNCR |= SYNCENx| OSTMDx| TXREARM0x |TRGO0SELx|TRGO1SELx|AREARMx;
     e48:	1058      	lrw      	r2, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
     e4a:	9280      	ld.w      	r4, (r2, 0x0)
     e4c:	9861      	ld.w      	r3, (r14, 0x4)
     e4e:	9840      	ld.w      	r2, (r14, 0x0)
     e50:	9424      	ld.w      	r1, (r4, 0x10)
     e52:	6c8c      	or      	r2, r3
     e54:	6c48      	or      	r1, r2
     e56:	9862      	ld.w      	r3, (r14, 0x8)
     e58:	6c4c      	or      	r1, r3
     e5a:	6c87      	mov      	r2, r1
     e5c:	6c9c      	or      	r2, r7
     e5e:	6c98      	or      	r2, r6
     e60:	6c4b      	mov      	r1, r2
     e62:	6c54      	or      	r1, r5
     e64:	b424      	st.w      	r1, (r4, 0x10)
}
     e66:	1403      	addi      	r14, r14, 12
     e68:	1494      	pop      	r4-r7, r15

00000e6a <GPT_Trigger_Configure>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Trigger_Configure(GPT_SRCSEL_TypeDef SRCSELx,GPT_BLKINV_TypeDef BLKINVx,GPT_ALIGNMD_TypeDef ALIGNMDx,GPT_CROSSMD_TypeDef CROSSMDx,
						U16_T G_OFFSET_DATA,U16_T G_WINDOW_DATA)
{
     e6a:	14d4      	push      	r4-r7, r15
     e6c:	1423      	subi      	r14, r14, 12
     e6e:	6d83      	mov      	r6, r0
     e70:	b822      	st.w      	r1, (r14, 0x8)
     e72:	b841      	st.w      	r2, (r14, 0x4)
     e74:	b860      	st.w      	r3, (r14, 0x0)
     e76:	d8ee1010 	ld.h      	r7, (r14, 0x20)
     e7a:	d88e1012 	ld.h      	r4, (r14, 0x24)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     e7e:	e3fffe6b 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->TRGFTCR |= SRCSELx| BLKINVx|ALIGNMDx| CROSSMDx;
     e82:	100a      	lrw      	r0, 0x20000038	// ea8 <GPT_Trigger_Configure+0x3e>
	GPTA0->TRGFTWR |= G_OFFSET_DATA |(G_WINDOW_DATA<<16);
     e84:	4490      	lsli      	r4, r4, 16
	GPTA0->TRGFTCR |= SRCSELx| BLKINVx|ALIGNMDx| CROSSMDx;
     e86:	90a0      	ld.w      	r5, (r0, 0x0)
     e88:	257f      	addi      	r5, 128
     e8a:	950e      	ld.w      	r0, (r5, 0x38)
     e8c:	9860      	ld.w      	r3, (r14, 0x0)
     e8e:	6cc0      	or      	r3, r0
     e90:	9841      	ld.w      	r2, (r14, 0x4)
     e92:	6c8c      	or      	r2, r3
     e94:	9822      	ld.w      	r1, (r14, 0x8)
     e96:	6c48      	or      	r1, r2
     e98:	6c58      	or      	r1, r6
     e9a:	b52e      	st.w      	r1, (r5, 0x38)
	GPTA0->TRGFTWR |= G_OFFSET_DATA |(G_WINDOW_DATA<<16);
     e9c:	956f      	ld.w      	r3, (r5, 0x3c)
     e9e:	6dd0      	or      	r7, r4
     ea0:	6dcc      	or      	r7, r3
     ea2:	b5ef      	st.w      	r7, (r5, 0x3c)
	
}
     ea4:	1403      	addi      	r14, r14, 12
     ea6:	1494      	pop      	r4-r7, r15
     ea8:	20000038 	.long	0x20000038
     eac:	be980000 	.long	0xbe980000
     eb0:	00010010 	.long	0x00010010
     eb4:	00002490 	.long	0x00002490
     eb8:	20000014 	.long	0x20000014
     ebc:	20000010 	.long	0x20000010
     ec0:	2000000c 	.long	0x2000000c
     ec4:	07ff013f 	.long	0x07ff013f

00000ec8 <GPT_EVTRG_Configure>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_EVTRG_Configure(GPT_TRGSRC0_TypeDef TRGSRC0x,GPT_TRGSRC1_TypeDef TRGSRC1x,GPT_ESYN0OE_TypeDef ESYN0OEx,GPT_ESYN1OE_TypeDef ESYN1OEx,
						GPT_CNT0INIT_TypeDef CNT0INITx,GPT_CNT1INIT_TypeDef CNT1INITx,U8_T TRGEV0prd,U8_T TRGEV1prd,U8_T TRGEV0cnt,U8_T TRGEV1cnt)
{
     ec8:	14d4      	push      	r4-r7, r15
     eca:	1428      	subi      	r14, r14, 32
     ecc:	b864      	st.w      	r3, (r14, 0x10)
     ece:	986d      	ld.w      	r3, (r14, 0x34)
     ed0:	b860      	st.w      	r3, (r14, 0x0)
     ed2:	986e      	ld.w      	r3, (r14, 0x38)
     ed4:	b861      	st.w      	r3, (r14, 0x4)
     ed6:	1b0f      	addi      	r3, r14, 60
     ed8:	8360      	ld.b      	r3, (r3, 0x0)
     eda:	b862      	st.w      	r3, (r14, 0x8)
     edc:	1b10      	addi      	r3, r14, 64
     ede:	8360      	ld.b      	r3, (r3, 0x0)
     ee0:	b863      	st.w      	r3, (r14, 0xc)
     ee2:	1b11      	addi      	r3, r14, 68
     ee4:	83a0      	ld.b      	r5, (r3, 0x0)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
	GPTA0->EVTRG |= TRGSRC0x |TRGSRC1x|ESYN0OEx|ESYN1OEx|CNT0INITx|CNT1INITx;
     ee6:	139b      	lrw      	r4, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
{
     ee8:	1b12      	addi      	r3, r14, 72
     eea:	b807      	st.w      	r0, (r14, 0x1c)
     eec:	b826      	st.w      	r1, (r14, 0x18)
     eee:	b845      	st.w      	r2, (r14, 0x14)
     ef0:	83e0      	ld.b      	r7, (r3, 0x0)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     ef2:	e3fffe31 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->EVTRG |= TRGSRC0x |TRGSRC1x|ESYN0OEx|ESYN1OEx|CNT0INITx|CNT1INITx;
     ef6:	94c0      	ld.w      	r6, (r4, 0x0)
     ef8:	267f      	addi      	r6, 128
     efa:	9690      	ld.w      	r4, (r6, 0x40)
     efc:	9861      	ld.w      	r3, (r14, 0x4)
     efe:	6d0c      	or      	r4, r3
     f00:	9860      	ld.w      	r3, (r14, 0x0)
     f02:	6d0c      	or      	r4, r3
     f04:	9864      	ld.w      	r3, (r14, 0x10)
     f06:	9845      	ld.w      	r2, (r14, 0x14)
     f08:	6cd0      	or      	r3, r4
     f0a:	6cc8      	or      	r3, r2
     f0c:	9826      	ld.w      	r1, (r14, 0x18)
	GPTA0->EVPS  |= TRGEV0prd|(TRGEV1prd<<4)|(TRGEV0cnt<<16)|(TRGEV1cnt<<20);
     f0e:	47f4      	lsli      	r7, r7, 20
     f10:	45b0      	lsli      	r5, r5, 16
	GPTA0->EVTRG |= TRGSRC0x |TRGSRC1x|ESYN0OEx|ESYN1OEx|CNT0INITx|CNT1INITx;
     f12:	6c4c      	or      	r1, r3
	GPTA0->EVPS  |= TRGEV0prd|(TRGEV1prd<<4)|(TRGEV0cnt<<16)|(TRGEV1cnt<<20);
     f14:	9842      	ld.w      	r2, (r14, 0x8)
	GPTA0->EVTRG |= TRGSRC0x |TRGSRC1x|ESYN0OEx|ESYN1OEx|CNT0INITx|CNT1INITx;
     f16:	9807      	ld.w      	r0, (r14, 0x1c)
	GPTA0->EVPS  |= TRGEV0prd|(TRGEV1prd<<4)|(TRGEV0cnt<<16)|(TRGEV1cnt<<20);
     f18:	6d5c      	or      	r5, r7
	GPTA0->EVTRG |= TRGSRC0x |TRGSRC1x|ESYN0OEx|ESYN1OEx|CNT0INITx|CNT1INITx;
     f1a:	6c04      	or      	r0, r1
	GPTA0->EVPS  |= TRGEV0prd|(TRGEV1prd<<4)|(TRGEV0cnt<<16)|(TRGEV1cnt<<20);
     f1c:	6d48      	or      	r5, r2
     f1e:	9843      	ld.w      	r2, (r14, 0xc)
	GPTA0->EVTRG |= TRGSRC0x |TRGSRC1x|ESYN0OEx|ESYN1OEx|CNT0INITx|CNT1INITx;
     f20:	b610      	st.w      	r0, (r6, 0x40)
	GPTA0->EVPS  |= TRGEV0prd|(TRGEV1prd<<4)|(TRGEV0cnt<<16)|(TRGEV1cnt<<20);
     f22:	42e4      	lsli      	r7, r2, 4
     f24:	9671      	ld.w      	r3, (r6, 0x44)
     f26:	6d5c      	or      	r5, r7
     f28:	6d4c      	or      	r5, r3
     f2a:	b6b1      	st.w      	r5, (r6, 0x44)
}
     f2c:	1408      	addi      	r14, r14, 32
     f2e:	1494      	pop      	r4-r7, r15

00000f30 <GPT_OneceForce_Out>:
//GPT OneceForce Out
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_OneceForce_Out(GPT_CHAFORCE_TypeDef CHAFORCEX,U8_T AFORCE_STATUS,GPT_CHBFORCE_TypeDef CHBFORCEX,U8_T BFORCE_STATUS,GPT_FORCELD_TypeDef FORCELDX)
{
     f30:	14d4      	push      	r4-r7, r15
     f32:	1422      	subi      	r14, r14, 8
     f34:	6dcf      	mov      	r7, r3
     f36:	9867      	ld.w      	r3, (r14, 0x1c)
     f38:	6d43      	mov      	r5, r0
     f3a:	6d07      	mov      	r4, r1
     f3c:	b841      	st.w      	r2, (r14, 0x4)
     f3e:	b860      	st.w      	r3, (r14, 0x0)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     f40:	e3fffe0a 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->AQOSF =CHAFORCEX|CHBFORCEX|FORCELDX|(AFORCE_STATUS<<1)|(BFORCE_STATUS<<5);
     f44:	1363      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
     f46:	4421      	lsli      	r1, r4, 1
     f48:	93c0      	ld.w      	r6, (r3, 0x0)
     f4a:	9841      	ld.w      	r2, (r14, 0x4)
     f4c:	4765      	lsli      	r3, r7, 5
     f4e:	6c8c      	or      	r2, r3
     f50:	9860      	ld.w      	r3, (r14, 0x0)
     f52:	6c8c      	or      	r2, r3
     f54:	6c94      	or      	r2, r5
     f56:	6c48      	or      	r1, r2
     f58:	b637      	st.w      	r1, (r6, 0x5c)
}
     f5a:	1402      	addi      	r14, r14, 8
     f5c:	1494      	pop      	r4-r7, r15

00000f5e <GPT_Force_Out>:
//GPT Continue Force Out
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Force_Out(GPT_FORCEA_TypeDef FORCEAX,GPT_FORCEB_TypeDef FORCEBX)
{
     f5e:	14d2      	push      	r4-r5, r15
     f60:	6d03      	mov      	r4, r0
     f62:	6d47      	mov      	r5, r1
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     f64:	e3fffdf8 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->AQCSF =FORCEAX|FORCEBX;
     f68:	127a      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
     f6a:	6d14      	or      	r4, r5
     f6c:	9360      	ld.w      	r3, (r3, 0x0)
     f6e:	b398      	st.w      	r4, (r3, 0x60)
}
     f70:	1492      	pop      	r4-r5, r15

00000f72 <GPT_CmpLoad_Configure>:
//GPT Wave Compare Load Init
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_CmpLoad_Configure(GPT_SHDWCMPA_TypeDef SHDWCMPAX,GPT_SHDWCMPB_TypeDef SHDWCMPBX,GPT_LDAMD_TypeDef LDAMDX,GPT_LDBMD_TypeDef LDBMDX)
{
     f72:	14d4      	push      	r4-r7, r15
     f74:	1421      	subi      	r14, r14, 4
     f76:	6dc7      	mov      	r7, r1
     f78:	6d83      	mov      	r6, r0
     f7a:	6d0b      	mov      	r4, r2
     f7c:	b860      	st.w      	r3, (r14, 0x0)
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     f7e:	e3fffdeb 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->CMPLDR=SHDWCMPAX|SHDWCMPBX|LDAMDX|LDBMDX;
     f82:	9860      	ld.w      	r3, (r14, 0x0)
     f84:	6d0c      	or      	r4, r3
     f86:	6c53      	mov      	r1, r4
     f88:	1252      	lrw      	r2, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
     f8a:	6c5c      	or      	r1, r7
     f8c:	92a0      	ld.w      	r5, (r2, 0x0)
     f8e:	6c58      	or      	r1, r6
     f90:	b52f      	st.w      	r1, (r5, 0x3c)
}
     f92:	1401      	addi      	r14, r14, 4
     f94:	1494      	pop      	r4-r7, r15

00000f96 <GPT_Debug_Mode>:
//GPT DEBUG MODE
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Debug_Mode(FunctionalStatus NewState)
{
     f96:	14d1      	push      	r4, r15
     f98:	6d03      	mov      	r4, r0
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     f9a:	e3fffddd 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
     f9e:	126d      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
	if (NewState != DISABLE)
     fa0:	3c40      	cmpnei      	r4, 0
	{
		GPTA0->CEDR  |= GPT_DEBUG_MODE;						
     fa2:	9340      	ld.w      	r2, (r3, 0x0)
     fa4:	9260      	ld.w      	r3, (r2, 0x0)
	if (NewState != DISABLE)
     fa6:	0c04      	bf      	0xfae	// fae <GPT_Debug_Mode+0x18>
		GPTA0->CEDR  |= GPT_DEBUG_MODE;						
     fa8:	3ba1      	bseti      	r3, 1
	}
	else
	{
		GPTA0->CEDR  &= ~GPT_DEBUG_MODE;					
     faa:	b260      	st.w      	r3, (r2, 0x0)
	}
}
     fac:	1491      	pop      	r4, r15
		GPTA0->CEDR  &= ~GPT_DEBUG_MODE;					
     fae:	3b81      	bclri      	r3, 1
     fb0:	07fd      	br      	0xfaa	// faa <GPT_Debug_Mode+0x14>

00000fb2 <GPT_Start>:
// GPT start
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Start(void)
{
     fb2:	14d0      	push      	r15
    GPT_REG_PROT_UNLOCK();     //寄存器解锁
     fb4:	e3fffdd0 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->RSSR |= 0X01;
     fb8:	1266      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
     fba:	9340      	ld.w      	r2, (r3, 0x0)
     fbc:	9261      	ld.w      	r3, (r2, 0x4)
     fbe:	3ba0      	bseti      	r3, 0
     fc0:	b261      	st.w      	r3, (r2, 0x4)
}
     fc2:	1490      	pop      	r15

00000fc4 <GPT_Stop>:
// GPT stop
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Stop(void)
{
     fc4:	14d0      	push      	r15
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     fc6:	e3fffdc7 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->RSSR &= 0XFFFFFFFE;
     fca:	1262      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
     fcc:	9340      	ld.w      	r2, (r3, 0x0)
     fce:	9261      	ld.w      	r3, (r2, 0x4)
     fd0:	3b80      	bclri      	r3, 0
     fd2:	b261      	st.w      	r3, (r2, 0x4)
}
     fd4:	1490      	pop      	r15

00000fd6 <GPT_Soft_Reset>:
// GPT soft reset
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Soft_Reset(void)
{
     fd6:	14d0      	push      	r15
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     fd8:	e3fffdbe 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->RSSR |= (0X5<<12);
     fdc:	117d      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
     fde:	9340      	ld.w      	r2, (r3, 0x0)
     fe0:	9261      	ld.w      	r3, (r2, 0x4)
     fe2:	3bac      	bseti      	r3, 12
     fe4:	3bae      	bseti      	r3, 14
     fe6:	b261      	st.w      	r3, (r2, 0x4)
}
     fe8:	1490      	pop      	r15

00000fea <GPT_Cap_Rearm>:
// GPT Capture rearm
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Cap_Rearm(void)
{
     fea:	14d0      	push      	r15
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
     fec:	e3fffdb4 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->CR |= (0X01<<19);
     ff0:	1178      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
     ff2:	9340      	ld.w      	r2, (r3, 0x0)
     ff4:	9263      	ld.w      	r3, (r2, 0xc)
     ff6:	3bb3      	bseti      	r3, 19
     ff8:	b263      	st.w      	r3, (r2, 0xc)
}
     ffa:	1490      	pop      	r15

00000ffc <GPT_Mode_CMD>:
// GPT MODE
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_Mode_CMD(GPT_WAVE_TypeDef WAVEX)
{
     ffc:	14d1      	push      	r4, r15
     ffe:	6d03      	mov      	r4, r0
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    1000:	e3fffdaa 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->CR |= WAVEX;
    1004:	1173      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
    1006:	9340      	ld.w      	r2, (r3, 0x0)
    1008:	9263      	ld.w      	r3, (r2, 0xc)
    100a:	6cd0      	or      	r3, r4
    100c:	b263      	st.w      	r3, (r2, 0xc)
}
    100e:	1491      	pop      	r4, r15

00001010 <GPT_REARM_Write>:
// GPT soft reset at once sync mode
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_REARM_Write(void)
{
    1010:	14d0      	push      	r15
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    1012:	e3fffda1 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->SYNCR |= (0X1<<16);
    1016:	116f      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
    1018:	9340      	ld.w      	r2, (r3, 0x0)
    101a:	9264      	ld.w      	r3, (r2, 0x10)
    101c:	3bb0      	bseti      	r3, 16
    101e:	b264      	st.w      	r3, (r2, 0x10)
}
    1020:	1490      	pop      	r15

00001022 <GPT_REARM_Read>:
// GPT soft read at once sync mode
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
U8_T GPT_REARM_Read(void)
{
    1022:	14d0      	push      	r15
	uint8_t value = 0;
    uint32_t dat = 0;
    GPT_REG_PROT_UNLOCK();     //寄存器解锁
    1024:	e3fffd98 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
    dat=(GPTA0->SYNCR)&(1<<16);
    1028:	116a      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
    102a:	9360      	ld.w      	r3, (r3, 0x0)
    102c:	9304      	ld.w      	r0, (r3, 0x10)
    if (dat)								
    102e:	4810      	lsri      	r0, r0, 16
    1030:	3301      	movi      	r3, 1
	{
	    value = 1;
	} 
    return value;
    1032:	680c      	and      	r0, r3
}
    1034:	1490      	pop      	r15

00001036 <GPT_Period_CMP_Write>:
//GPT Period / Compare set
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void GPT_Period_CMP_Write(U16_T PRDR_DATA,U16_T CMPA_DATA,U16_T CMPB_DATA)
{
    1036:	14d3      	push      	r4-r6, r15
    1038:	6d83      	mov      	r6, r0
    103a:	6d47      	mov      	r5, r1
    103c:	6d0b      	mov      	r4, r2
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    103e:	e3fffd8b 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
	GPTA0->PRDR =PRDR_DATA;
    1042:	1164      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
    1044:	9360      	ld.w      	r3, (r3, 0x0)
    1046:	b3c9      	st.w      	r6, (r3, 0x24)
	GPTA0->CMPA =CMPA_DATA;
    1048:	b3ab      	st.w      	r5, (r3, 0x2c)
	GPTA0->CMPB =CMPB_DATA;
    104a:	b38c      	st.w      	r4, (r3, 0x30)
}
    104c:	1493      	pop      	r4-r6, r15

0000104e <GPT_PRDR_Read>:
//GPT read counters
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
U16_T GPT_PRDR_Read(void)
{
    104e:	14d0      	push      	r15
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    1050:	e3fffd82 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
    return GPTA0->PRDR;
    1054:	107f      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
    1056:	9360      	ld.w      	r3, (r3, 0x0)
    1058:	9309      	ld.w      	r0, (r3, 0x24)
    105a:	7401      	zexth      	r0, r0
}
    105c:	1490      	pop      	r15

0000105e <GPT_CMPA_Read>:
U16_T GPT_CMPA_Read(void)
{
    105e:	14d0      	push      	r15
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    1060:	e3fffd7a 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
    return GPTA0->CMPA;
    1064:	107b      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
    1066:	9360      	ld.w      	r3, (r3, 0x0)
    1068:	930b      	ld.w      	r0, (r3, 0x2c)
    106a:	7401      	zexth      	r0, r0
}
    106c:	1490      	pop      	r15

0000106e <GPT_CMPB_Read>:
U16_T GPT_CMPB_Read(void)
{
    106e:	14d0      	push      	r15
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    1070:	e3fffd72 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
    return GPTA0->CMPB;
    1074:	1077      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
    1076:	9360      	ld.w      	r3, (r3, 0x0)
    1078:	930c      	ld.w      	r0, (r3, 0x30)
    107a:	7401      	zexth      	r0, r0
}
    107c:	1490      	pop      	r15

0000107e <GPT_CNT_Read>:
U16_T GPT_CNT_Read(void)
{
    107e:	14d0      	push      	r15
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    1080:	e3fffd6a 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
    return GPTA0->CNT;
    1084:	1073      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
    1086:	9360      	ld.w      	r3, (r3, 0x0)
    1088:	9310      	ld.w      	r0, (r3, 0x40)
    108a:	7401      	zexth      	r0, r0
}
    108c:	1490      	pop      	r15

0000108e <GPT_ConfigInterrupt_CMD>:
//EntryParameter:LPT_IMSCR_X,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_ConfigInterrupt_CMD(FunctionalStatus NewState,U32_T GPT_IMSCR_X)
{
    108e:	14d2      	push      	r4-r5, r15
    1090:	6d43      	mov      	r5, r0
    1092:	6d07      	mov      	r4, r1
	GPT_REG_PROT_UNLOCK();     //寄存器解锁
    1094:	e3fffd60 	bsr      	0xb54	// b54 <GPT_REG_PROT_UNLOCK>
    1098:	106e      	lrw      	r3, 0x20000038	// 10d0 <GPT_INT_DISABLE+0x12>
	if (NewState != DISABLE)
    109a:	3d40      	cmpnei      	r5, 0
	{
		GPTA0->IMCR  |= GPT_IMSCR_X;						
    109c:	9360      	ld.w      	r3, (r3, 0x0)
    109e:	237f      	addi      	r3, 128
    10a0:	9356      	ld.w      	r2, (r3, 0x58)
	if (NewState != DISABLE)
    10a2:	0c04      	bf      	0x10aa	// 10aa <GPT_ConfigInterrupt_CMD+0x1c>
		GPTA0->IMCR  |= GPT_IMSCR_X;						
    10a4:	6c90      	or      	r2, r4
    10a6:	b356      	st.w      	r2, (r3, 0x58)
	}
	else
	{
		GPTA0->IMCR  &= ~GPT_IMSCR_X;					
	}
}
    10a8:	1492      	pop      	r4-r5, r15
		GPTA0->IMCR  &= ~GPT_IMSCR_X;					
    10aa:	6891      	andn      	r2, r4
    10ac:	b356      	st.w      	r2, (r3, 0x58)
}
    10ae:	07fd      	br      	0x10a8	// 10a8 <GPT_ConfigInterrupt_CMD+0x1a>

000010b0 <GPT_INT_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPT_INT_ENABLE(void)
{
	INTC_ISER_WRITE(GPT_INT);
    10b0:	1069      	lrw      	r3, 0x20000078	// 10d4 <GPT_INT_DISABLE+0x16>
    10b2:	3280      	movi      	r2, 128
    10b4:	9360      	ld.w      	r3, (r3, 0x0)
    10b6:	23ff      	addi      	r3, 256
    10b8:	4248      	lsli      	r2, r2, 8
    10ba:	b340      	st.w      	r2, (r3, 0x0)
}
    10bc:	783c      	jmp      	r15

000010be <GPT_INT_DISABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPT_INT_DISABLE(void)
{
	INTC_ICER_WRITE(GPT_INT);
    10be:	1066      	lrw      	r3, 0x20000078	// 10d4 <GPT_INT_DISABLE+0x16>
    10c0:	32c0      	movi      	r2, 192
    10c2:	9360      	ld.w      	r3, (r3, 0x0)
    10c4:	4241      	lsli      	r2, r2, 1
    10c6:	60c8      	addu      	r3, r2
    10c8:	3280      	movi      	r2, 128
    10ca:	4248      	lsli      	r2, r2, 8
    10cc:	b340      	st.w      	r2, (r3, 0x0)
}
    10ce:	783c      	jmp      	r15
    10d0:	20000038 	.long	0x20000038
    10d4:	20000078 	.long	0x20000078

000010d8 <BT_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void BT_DeInit(CSP_BT_T *BTx)
{
	BTx->RSSR=BT_RESET_VALUE;
    10d8:	3300      	movi      	r3, 0
    10da:	b060      	st.w      	r3, (r0, 0x0)
	BTx->CR=BT_RESET_VALUE;
    10dc:	b061      	st.w      	r3, (r0, 0x4)
	BTx->PSCR=BT_RESET_VALUE;
    10de:	b062      	st.w      	r3, (r0, 0x8)
	BTx->PRDR=BT_RESET_VALUE;
    10e0:	b063      	st.w      	r3, (r0, 0xc)
	BTx->CMP=BT_RESET_VALUE;
    10e2:	b064      	st.w      	r3, (r0, 0x10)
	BTx->CNT=BT_RESET_VALUE;
    10e4:	b065      	st.w      	r3, (r0, 0x14)
	BTx->EVTRG=BT_RESET_VALUE;
    10e6:	b066      	st.w      	r3, (r0, 0x18)
	BTx->EVSWF=BT_RESET_VALUE;
    10e8:	b069      	st.w      	r3, (r0, 0x24)
	BTx->RISR=BT_RESET_VALUE;
    10ea:	b06a      	st.w      	r3, (r0, 0x28)
	BTx->IMCR=BT_RESET_VALUE;
    10ec:	b06b      	st.w      	r3, (r0, 0x2c)
	BTx->MISR=BT_RESET_VALUE;
    10ee:	b06c      	st.w      	r3, (r0, 0x30)
	BTx->ICR=BT_RESET_VALUE;
    10f0:	b06d      	st.w      	r3, (r0, 0x34)
}
    10f2:	783c      	jmp      	r15

000010f4 <BT_IO_Init>:
//EntryParameter:LPT_OUT_PA09,LPT_OUT_PB01,LPT_IN_PA10,
//ReturnValue:NONE
/*************************************************************/
void BT_IO_Init(BT_Pin_TypeDef BT_IONAME)
{
	if(BT_IONAME==BT0_PA02)										
    10f4:	3840      	cmpnei      	r0, 0
    10f6:	080b      	bt      	0x110c	// 110c <BT_IO_Init+0x18>
	{
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFF0FF)|0x00000500;  //BT0 PA0.2
    10f8:	037b      	lrw      	r3, 0x20000014	// 1308 <BT3_INT_DISABLE+0x12>
    10fa:	32f0      	movi      	r2, 240
    10fc:	9320      	ld.w      	r1, (r3, 0x0)
    10fe:	9160      	ld.w      	r3, (r1, 0x0)
    1100:	4244      	lsli      	r2, r2, 4
    1102:	68c9      	andn      	r3, r2
    1104:	3ba8      	bseti      	r3, 8
    1106:	3baa      	bseti      	r3, 10
	{
		GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFF0FFF)|0x00006000;  //BT1 PC0.3
	}
	if(BT_IONAME==BT2_PB04)										
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFF0FFFF)|0x00070000;  //BT2 PB0.4
    1108:	b160      	st.w      	r3, (r1, 0x0)
    110a:	040b      	br      	0x1120	// 1120 <BT_IO_Init+0x2c>
	if(BT_IONAME==BT0_PA08)										
    110c:	3841      	cmpnei      	r0, 1
    110e:	080a      	bt      	0x1122	// 1122 <BT_IO_Init+0x2e>
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x00000005;  //BT0 PA0.8
    1110:	137e      	lrw      	r3, 0x20000014	// 1308 <BT3_INT_DISABLE+0x12>
    1112:	310f      	movi      	r1, 15
    1114:	9340      	ld.w      	r2, (r3, 0x0)
    1116:	9261      	ld.w      	r3, (r2, 0x4)
    1118:	68c5      	andn      	r3, r1
    111a:	3ba0      	bseti      	r3, 0
    111c:	3ba2      	bseti      	r3, 2
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFF0F)|0x00000050;  //BT1 PA0.9
    111e:	b261      	st.w      	r3, (r2, 0x4)
	}
	if(BT_IONAME==BT3_PC00)										
	{
		GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFFFF0)|0x00000005;  //BT3 PC0.0
	}
}
    1120:	783c      	jmp      	r15
	if(BT_IONAME==BT1_PA09)										
    1122:	3842      	cmpnei      	r0, 2
    1124:	0809      	bt      	0x1136	// 1136 <BT_IO_Init+0x42>
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFF0F)|0x00000050;  //BT1 PA0.9
    1126:	1379      	lrw      	r3, 0x20000014	// 1308 <BT3_INT_DISABLE+0x12>
    1128:	31f0      	movi      	r1, 240
    112a:	9340      	ld.w      	r2, (r3, 0x0)
    112c:	9261      	ld.w      	r3, (r2, 0x4)
    112e:	68c5      	andn      	r3, r1
    1130:	3ba4      	bseti      	r3, 4
    1132:	3ba6      	bseti      	r3, 6
    1134:	07f5      	br      	0x111e	// 111e <BT_IO_Init+0x2a>
	if(BT_IONAME==BT1_PC03)										
    1136:	3843      	cmpnei      	r0, 3
    1138:	080a      	bt      	0x114c	// 114c <BT_IO_Init+0x58>
		GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFF0FFF)|0x00006000;  //BT1 PC0.3
    113a:	1375      	lrw      	r3, 0x20000008	// 130c <BT3_INT_DISABLE+0x16>
    113c:	32f0      	movi      	r2, 240
    113e:	9320      	ld.w      	r1, (r3, 0x0)
    1140:	9160      	ld.w      	r3, (r1, 0x0)
    1142:	4248      	lsli      	r2, r2, 8
    1144:	68c9      	andn      	r3, r2
    1146:	3bad      	bseti      	r3, 13
    1148:	3bae      	bseti      	r3, 14
    114a:	07df      	br      	0x1108	// 1108 <BT_IO_Init+0x14>
	if(BT_IONAME==BT2_PB04)										
    114c:	3844      	cmpnei      	r0, 4
    114e:	080b      	bt      	0x1164	// 1164 <BT_IO_Init+0x70>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFF0FFFF)|0x00070000;  //BT2 PB0.4
    1150:	1370      	lrw      	r3, 0x2000000c	// 1310 <BT3_INT_DISABLE+0x1a>
    1152:	32f0      	movi      	r2, 240
    1154:	9320      	ld.w      	r1, (r3, 0x0)
    1156:	424c      	lsli      	r2, r2, 12
    1158:	9160      	ld.w      	r3, (r1, 0x0)
    115a:	68c9      	andn      	r3, r2
    115c:	32e0      	movi      	r2, 224
    115e:	424b      	lsli      	r2, r2, 11
    1160:	6cc8      	or      	r3, r2
    1162:	07d3      	br      	0x1108	// 1108 <BT_IO_Init+0x14>
	if(BT_IONAME==BT2_PC02)										
    1164:	3845      	cmpnei      	r0, 5
    1166:	080a      	bt      	0x117a	// 117a <BT_IO_Init+0x86>
		GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFF0FF)|0x00000700;  //BT2 PC0.2
    1168:	1369      	lrw      	r3, 0x20000008	// 130c <BT3_INT_DISABLE+0x16>
    116a:	32f0      	movi      	r2, 240
    116c:	9320      	ld.w      	r1, (r3, 0x0)
    116e:	4244      	lsli      	r2, r2, 4
    1170:	9160      	ld.w      	r3, (r1, 0x0)
    1172:	68c9      	andn      	r3, r2
    1174:	32e0      	movi      	r2, 224
    1176:	4243      	lsli      	r2, r2, 3
    1178:	07f4      	br      	0x1160	// 1160 <BT_IO_Init+0x6c>
	if(BT_IONAME==BT3_PB07)										
    117a:	3846      	cmpnei      	r0, 6
    117c:	0809      	bt      	0x118e	// 118e <BT_IO_Init+0x9a>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0X0FFFFFFF)|0x70000000;  //BT3 PB0.7
    117e:	1365      	lrw      	r3, 0x2000000c	// 1310 <BT3_INT_DISABLE+0x1a>
    1180:	32e0      	movi      	r2, 224
    1182:	9320      	ld.w      	r1, (r3, 0x0)
    1184:	9160      	ld.w      	r3, (r1, 0x0)
    1186:	4364      	lsli      	r3, r3, 4
    1188:	4b64      	lsri      	r3, r3, 4
    118a:	4257      	lsli      	r2, r2, 23
    118c:	07ea      	br      	0x1160	// 1160 <BT_IO_Init+0x6c>
	if(BT_IONAME==BT3_PC00)										
    118e:	3847      	cmpnei      	r0, 7
    1190:	0bc8      	bt      	0x1120	// 1120 <BT_IO_Init+0x2c>
		GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFFFF0)|0x00000005;  //BT3 PC0.0
    1192:	127f      	lrw      	r3, 0x20000008	// 130c <BT3_INT_DISABLE+0x16>
    1194:	310f      	movi      	r1, 15
    1196:	9340      	ld.w      	r2, (r3, 0x0)
    1198:	9260      	ld.w      	r3, (r2, 0x0)
    119a:	68c5      	andn      	r3, r1
    119c:	3ba0      	bseti      	r3, 0
    119e:	3ba2      	bseti      	r3, 2
    11a0:	b260      	st.w      	r3, (r2, 0x0)
}
    11a2:	07bf      	br      	0x1120	// 1120 <BT_IO_Init+0x2c>

000011a4 <BT_Start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Start(CSP_BT_T *BTx)
{
	BTx->RSSR |=0X01;
    11a4:	9060      	ld.w      	r3, (r0, 0x0)
    11a6:	3ba0      	bseti      	r3, 0
    11a8:	b060      	st.w      	r3, (r0, 0x0)
}
    11aa:	783c      	jmp      	r15

000011ac <BT_Stop>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Stop(CSP_BT_T *BTx)
{
	BTx->RSSR &=0X0;
    11ac:	9060      	ld.w      	r3, (r0, 0x0)
    11ae:	3300      	movi      	r3, 0
    11b0:	b060      	st.w      	r3, (r0, 0x0)
}
    11b2:	783c      	jmp      	r15

000011b4 <BT_Stop_High>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Stop_High(CSP_BT_T *BTx)
{
	BTx->CR |=(0x01<<6);
    11b4:	9061      	ld.w      	r3, (r0, 0x4)
    11b6:	3ba6      	bseti      	r3, 6
    11b8:	b061      	st.w      	r3, (r0, 0x4)
	BTx->RSSR &=0X0;
    11ba:	9060      	ld.w      	r3, (r0, 0x0)
    11bc:	3300      	movi      	r3, 0
    11be:	b060      	st.w      	r3, (r0, 0x0)
}
    11c0:	783c      	jmp      	r15

000011c2 <BT_Stop_Low>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Stop_Low(CSP_BT_T *BTx)
{
	BTx->CR =BTx->CR & ~(0x01<<6);
    11c2:	9061      	ld.w      	r3, (r0, 0x4)
    11c4:	3b86      	bclri      	r3, 6
    11c6:	b061      	st.w      	r3, (r0, 0x4)
	BTx->RSSR &=0X0;
    11c8:	9060      	ld.w      	r3, (r0, 0x0)
    11ca:	3300      	movi      	r3, 0
    11cc:	b060      	st.w      	r3, (r0, 0x0)
}
    11ce:	783c      	jmp      	r15

000011d0 <BT_Soft_Reset>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Soft_Reset(CSP_BT_T *BTx)
{
	BTx->RSSR |= (0X5<<12);
    11d0:	9060      	ld.w      	r3, (r0, 0x0)
    11d2:	3bac      	bseti      	r3, 12
    11d4:	3bae      	bseti      	r3, 14
    11d6:	b060      	st.w      	r3, (r0, 0x0)
}
    11d8:	783c      	jmp      	r15

000011da <BT_Configure>:
//BT Configure
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Configure(CSP_BT_T *BTx,BT_CLK_TypeDef BTCLK,U16_T PSCR_DATA,BT_SHDWSTP_TypeDef BTSHDWSTP,BT_OPM_TypeDef BTOPM,BT_EXTCKM_TypeDef BTEXTCKM)
{
    11da:	14c3      	push      	r4-r6
    11dc:	98a4      	ld.w      	r5, (r14, 0x10)
    11de:	6d97      	mov      	r6, r5
    11e0:	9883      	ld.w      	r4, (r14, 0xc)
	BTx->CR |=BTCLK| BTSHDWSTP| BTOPM| BTEXTCKM;
    11e2:	6d18      	or      	r4, r6
    11e4:	6cd0      	or      	r3, r4
    11e6:	90a1      	ld.w      	r5, (r0, 0x4)
    11e8:	6c4c      	or      	r1, r3
    11ea:	6c54      	or      	r1, r5
    11ec:	b021      	st.w      	r1, (r0, 0x4)
	BTx->PSCR = PSCR_DATA;
    11ee:	b042      	st.w      	r2, (r0, 0x8)
}
    11f0:	1483      	pop      	r4-r6

000011f2 <BT_ControlSet_Configure>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_ControlSet_Configure(CSP_BT_T *BTx,BT_STARTST_TypeDef BTSTART,BT_IDLEST_TypeDef BTIDLE,BT_SYNCEN0_TypeDef BTSYNC0,BT_SYNCEN1_TypeDef BTSYNC1,BT_SYNCEN2_TypeDef BTSYNC2,BT_SYNCMD_TypeDef BTSYNCMD,
							BT_OSTMDX_TypeDef BTOSTMD,BT_AREARM0_TypeDef BTAREARM0,BT_AREARM1_TypeDef BTAREARM1,BT_CNTRLD_TypeDef BTCNTRLD)
{
    11f2:	14c4      	push      	r4-r7
    11f4:	1424      	subi      	r14, r14, 16
    11f6:	9888      	ld.w      	r4, (r14, 0x20)
    11f8:	6dd3      	mov      	r7, r4
    11fa:	9889      	ld.w      	r4, (r14, 0x24)
    11fc:	b880      	st.w      	r4, (r14, 0x0)
    11fe:	988a      	ld.w      	r4, (r14, 0x28)
    1200:	b881      	st.w      	r4, (r14, 0x4)
    1202:	988b      	ld.w      	r4, (r14, 0x2c)
    1204:	b882      	st.w      	r4, (r14, 0x8)
    1206:	988c      	ld.w      	r4, (r14, 0x30)
    1208:	b883      	st.w      	r4, (r14, 0xc)
    120a:	988d      	ld.w      	r4, (r14, 0x34)
    120c:	6d93      	mov      	r6, r4
    120e:	98ae      	ld.w      	r5, (r14, 0x38)
	BTx->CR |=BTSTART| BTIDLE| BTSYNC0| BTSYNC1| BTSYNC2| BTSYNCMD| BTOSTMD| BTAREARM0| BTAREARM1| BTCNTRLD;
    1210:	6d58      	or      	r5, r6
    1212:	98c3      	ld.w      	r6, (r14, 0xc)
    1214:	6d58      	or      	r5, r6
    1216:	98c2      	ld.w      	r6, (r14, 0x8)
    1218:	6d58      	or      	r5, r6
    121a:	98c1      	ld.w      	r6, (r14, 0x4)
    121c:	6d58      	or      	r5, r6
    121e:	98c0      	ld.w      	r6, (r14, 0x0)
    1220:	6d58      	or      	r5, r6
    1222:	6d5c      	or      	r5, r7
    1224:	6cd4      	or      	r3, r5
    1226:	6c8c      	or      	r2, r3
    1228:	9081      	ld.w      	r4, (r0, 0x4)
    122a:	6c48      	or      	r1, r2
    122c:	6d04      	or      	r4, r1
    122e:	6d9f      	mov      	r6, r7
    1230:	b081      	st.w      	r4, (r0, 0x4)
}
    1232:	1404      	addi      	r14, r14, 16
    1234:	1484      	pop      	r4-r7

00001236 <BT_Read_REARM>:
/*************************************************************/
uint8_t BT_Read_REARM(CSP_BT_T *BTx,BT_REARMX_TypeDef REARMX)       //cl
{
	uint8_t value = 0;
    uint32_t dat = 0;
	dat=((BTx)->CR)&(REARMX);
    1236:	9061      	ld.w      	r3, (r0, 0x4)
    1238:	68c4      	and      	r3, r1
    if (dat == (REARMX))								
    123a:	644e      	cmpne      	r3, r1
    123c:	6403      	mvcv      	r0
	{
	    value = 1;
	} 
    return value;
    123e:	7400      	zextb      	r0, r0
}
    1240:	783c      	jmp      	r15

00001242 <BT_Clear_REARM>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Clear_REARM(CSP_BT_T *BTx,BT_REARMX_TypeDef REARMX)       //cl
{
     BTx->CR |= REARMX;
    1242:	9061      	ld.w      	r3, (r0, 0x4)
    1244:	6c4c      	or      	r1, r3
    1246:	b021      	st.w      	r1, (r0, 0x4)
}
    1248:	783c      	jmp      	r15

0000124a <BT_Period_CMP_Write>:
//ReturnValue:NONE
/*************************************************************/
void BT_Period_CMP_Write(CSP_BT_T *BTx,U16_T BTPRDR_DATA,U16_T BTCMP_DATA)
{
	//BTx->CR|=0X01<<2;
	BTx->PRDR =BTPRDR_DATA;
    124a:	b023      	st.w      	r1, (r0, 0xc)
	BTx->CMP =BTCMP_DATA;
    124c:	b044      	st.w      	r2, (r0, 0x10)
}
    124e:	783c      	jmp      	r15

00001250 <BT_CNT_Write>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_CNT_Write(CSP_BT_T *BTx,U16_T BTCNT_DATA)
{
	BTx->CNT =BTCNT_DATA;
    1250:	b025      	st.w      	r1, (r0, 0x14)
}
    1252:	783c      	jmp      	r15

00001254 <BT_PRDR_Read>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
U16_T BT_PRDR_Read(CSP_BT_T *BTx)
{
    return BTx->PRDR;
    1254:	9003      	ld.w      	r0, (r0, 0xc)
    1256:	7401      	zexth      	r0, r0
}
    1258:	783c      	jmp      	r15

0000125a <BT_CMP_Read>:
U16_T BT_CMP_Read(CSP_BT_T *BTx)
{
    return BTx->CMP;
    125a:	9004      	ld.w      	r0, (r0, 0x10)
    125c:	7401      	zexth      	r0, r0
}
    125e:	783c      	jmp      	r15

00001260 <BT_CNT_Read>:
U16_T BT_CNT_Read(CSP_BT_T *BTx)
{
    return BTx->CNT;
    1260:	9005      	ld.w      	r0, (r0, 0x14)
    1262:	7401      	zexth      	r0, r0
}
    1264:	783c      	jmp      	r15

00001266 <BT_Trigger_Configure>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Trigger_Configure(CSP_BT_T *BTx,BT_TRGSRC_TypeDef BTTRG,BT_TRGOE_TypeDef BTTRGOE)
{
	BTx->EVTRG|=BTTRG| BTTRGOE;
    1266:	9066      	ld.w      	r3, (r0, 0x18)
    1268:	6c48      	or      	r1, r2
    126a:	6c4c      	or      	r1, r3
    126c:	b026      	st.w      	r1, (r0, 0x18)
}
    126e:	783c      	jmp      	r15

00001270 <BT_Soft_Tigger>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Soft_Tigger(CSP_BT_T *BTx)
{
	BTx->EVSWF=0x01;
    1270:	3301      	movi      	r3, 1
    1272:	b069      	st.w      	r3, (r0, 0x24)
}
    1274:	783c      	jmp      	r15

00001276 <BT_ConfigInterrupt_CMD>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void BT_ConfigInterrupt_CMD(CSP_BT_T *BTx,FunctionalStatus NewState,BT_IMSCR_TypeDef BT_IMSCR_X)
{
	if (NewState != DISABLE)
    1276:	3940      	cmpnei      	r1, 0
	{
		BTx->IMCR  |= BT_IMSCR_X;						
    1278:	906b      	ld.w      	r3, (r0, 0x2c)
	if (NewState != DISABLE)
    127a:	0c04      	bf      	0x1282	// 1282 <BT_ConfigInterrupt_CMD+0xc>
		BTx->IMCR  |= BT_IMSCR_X;						
    127c:	6c8c      	or      	r2, r3
    127e:	b04b      	st.w      	r2, (r0, 0x2c)
	}
	else
	{
		BTx->IMCR  &= ~BT_IMSCR_X;					
	}
}
    1280:	783c      	jmp      	r15
		BTx->IMCR  &= ~BT_IMSCR_X;					
    1282:	68c9      	andn      	r3, r2
    1284:	b06b      	st.w      	r3, (r0, 0x2c)
}
    1286:	07fd      	br      	0x1280	// 1280 <BT_ConfigInterrupt_CMD+0xa>

00001288 <BT0_INT_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT0_INT);
    1288:	1163      	lrw      	r3, 0x20000078	// 1314 <BT3_INT_DISABLE+0x1e>
    128a:	3280      	movi      	r2, 128
    128c:	9360      	ld.w      	r3, (r3, 0x0)
    128e:	23ff      	addi      	r3, 256
    1290:	4249      	lsli      	r2, r2, 9
    1292:	b340      	st.w      	r2, (r3, 0x0)
}
    1294:	783c      	jmp      	r15

00001296 <BT0_INT_DISABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0_INT_DISABLE(void)
{
	INTC_ICER_WRITE(BT0_INT);
    1296:	1160      	lrw      	r3, 0x20000078	// 1314 <BT3_INT_DISABLE+0x1e>
    1298:	32c0      	movi      	r2, 192
    129a:	9360      	ld.w      	r3, (r3, 0x0)
    129c:	4241      	lsli      	r2, r2, 1
    129e:	60c8      	addu      	r3, r2
    12a0:	3280      	movi      	r2, 128
    12a2:	4249      	lsli      	r2, r2, 9
    12a4:	b340      	st.w      	r2, (r3, 0x0)
}
    12a6:	783c      	jmp      	r15

000012a8 <BT1_INT_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT1_INT);
    12a8:	107b      	lrw      	r3, 0x20000078	// 1314 <BT3_INT_DISABLE+0x1e>
    12aa:	3280      	movi      	r2, 128
    12ac:	9360      	ld.w      	r3, (r3, 0x0)
    12ae:	23ff      	addi      	r3, 256
    12b0:	424a      	lsli      	r2, r2, 10
    12b2:	b340      	st.w      	r2, (r3, 0x0)
}
    12b4:	783c      	jmp      	r15

000012b6 <BT1_INT_DISABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1_INT_DISABLE(void)
{
	INTC_ICER_WRITE(BT1_INT);
    12b6:	1078      	lrw      	r3, 0x20000078	// 1314 <BT3_INT_DISABLE+0x1e>
    12b8:	32c0      	movi      	r2, 192
    12ba:	9360      	ld.w      	r3, (r3, 0x0)
    12bc:	4241      	lsli      	r2, r2, 1
    12be:	60c8      	addu      	r3, r2
    12c0:	3280      	movi      	r2, 128
    12c2:	424a      	lsli      	r2, r2, 10
    12c4:	b340      	st.w      	r2, (r3, 0x0)
}
    12c6:	783c      	jmp      	r15

000012c8 <BT2_INT_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT2_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT2_INT);
    12c8:	1073      	lrw      	r3, 0x20000078	// 1314 <BT3_INT_DISABLE+0x1e>
    12ca:	3280      	movi      	r2, 128
    12cc:	9360      	ld.w      	r3, (r3, 0x0)
    12ce:	23ff      	addi      	r3, 256
    12d0:	424b      	lsli      	r2, r2, 11
    12d2:	b340      	st.w      	r2, (r3, 0x0)
}
    12d4:	783c      	jmp      	r15

000012d6 <BT2_INT_DISABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT2_INT_DISABLE(void)
{
	INTC_ICER_WRITE(BT2_INT);
    12d6:	1070      	lrw      	r3, 0x20000078	// 1314 <BT3_INT_DISABLE+0x1e>
    12d8:	32c0      	movi      	r2, 192
    12da:	9360      	ld.w      	r3, (r3, 0x0)
    12dc:	4241      	lsli      	r2, r2, 1
    12de:	60c8      	addu      	r3, r2
    12e0:	3280      	movi      	r2, 128
    12e2:	424b      	lsli      	r2, r2, 11
    12e4:	b340      	st.w      	r2, (r3, 0x0)
}
    12e6:	783c      	jmp      	r15

000012e8 <BT3_INT_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT3_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT3_INT);
    12e8:	106b      	lrw      	r3, 0x20000078	// 1314 <BT3_INT_DISABLE+0x1e>
    12ea:	3280      	movi      	r2, 128
    12ec:	9360      	ld.w      	r3, (r3, 0x0)
    12ee:	23ff      	addi      	r3, 256
    12f0:	424c      	lsli      	r2, r2, 12
    12f2:	b340      	st.w      	r2, (r3, 0x0)
}
    12f4:	783c      	jmp      	r15

000012f6 <BT3_INT_DISABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT3_INT_DISABLE(void)
{
	INTC_ICER_WRITE(BT3_INT);
    12f6:	1068      	lrw      	r3, 0x20000078	// 1314 <BT3_INT_DISABLE+0x1e>
    12f8:	32c0      	movi      	r2, 192
    12fa:	9360      	ld.w      	r3, (r3, 0x0)
    12fc:	4241      	lsli      	r2, r2, 1
    12fe:	60c8      	addu      	r3, r2
    1300:	3280      	movi      	r2, 128
    1302:	424c      	lsli      	r2, r2, 12
    1304:	b340      	st.w      	r2, (r3, 0x0)
}
    1306:	783c      	jmp      	r15
    1308:	20000014 	.long	0x20000014
    130c:	20000008 	.long	0x20000008
    1310:	2000000c 	.long	0x2000000c
    1314:	20000078 	.long	0x20000078

00001318 <ET_DeInit>:
//ET RESET CLEAR ALL REGISTER
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void ET_DeInit(void)
{
    1318:	14c1      	push      	r4
	int i=0;
	ETCB->EN 			= ET_RESET_VALUE;
    131a:	106c      	lrw      	r3, 0x2000006c	// 1348 <ET_DeInit+0x30>
    131c:	3200      	movi      	r2, 0
    131e:	9360      	ld.w      	r3, (r3, 0x0)
    1320:	b340      	st.w      	r2, (r3, 0x0)
	ETCB->CH0CON1	  	= ET_RESET_VALUE;
	ETCB->CH1CON0 		= ET_RESET_VALUE;
	ETCB->CH1CON1 		= ET_RESET_VALUE;
	ETCB->CH2CON0 		= ET_RESET_VALUE;
	ETCB->CH2CON1 		= ET_RESET_VALUE;
	for(i=0;i<29;i++)
    1322:	3100      	movi      	r1, 0
	ETCB->SWTRG 		= ET_RESET_VALUE;
    1324:	b341      	st.w      	r2, (r3, 0x4)
	{
	    ETCB->CH3_31CON[i] = ET_RESET_VALUE;
    1326:	340c      	movi      	r4, 12
	ETCB->CH0CON0 		= ET_RESET_VALUE;
    1328:	b342      	st.w      	r2, (r3, 0x8)
	    ETCB->CH3_31CON[i] = ET_RESET_VALUE;
    132a:	3000      	movi      	r0, 0
	ETCB->CH0CON1	  	= ET_RESET_VALUE;
    132c:	b343      	st.w      	r2, (r3, 0xc)
	ETCB->CH1CON0 		= ET_RESET_VALUE;
    132e:	b344      	st.w      	r2, (r3, 0x10)
	ETCB->CH1CON1 		= ET_RESET_VALUE;
    1330:	b345      	st.w      	r2, (r3, 0x14)
	ETCB->CH2CON0 		= ET_RESET_VALUE;
    1332:	b346      	st.w      	r2, (r3, 0x18)
	ETCB->CH2CON1 		= ET_RESET_VALUE;
    1334:	b347      	st.w      	r2, (r3, 0x1c)
	    ETCB->CH3_31CON[i] = ET_RESET_VALUE;
    1336:	5950      	addu      	r2, r1, r4
    1338:	4242      	lsli      	r2, r2, 2
	for(i=0;i<29;i++)
    133a:	2100      	addi      	r1, 1
	    ETCB->CH3_31CON[i] = ET_RESET_VALUE;
    133c:	608c      	addu      	r2, r3
	for(i=0;i<29;i++)
    133e:	395d      	cmpnei      	r1, 29
	    ETCB->CH3_31CON[i] = ET_RESET_VALUE;
    1340:	b200      	st.w      	r0, (r2, 0x0)
	for(i=0;i<29;i++)
    1342:	0bfa      	bt      	0x1336	// 1336 <ET_DeInit+0x1e>
	}
}
    1344:	1481      	pop      	r4
    1346:	0000      	bkpt
    1348:	2000006c 	.long	0x2000006c

0000134c <ET_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void ET_ENABLE(void)
{
	ETCB->EN	=	0x01;
    134c:	137e      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    134e:	3201      	movi      	r2, 1
    1350:	9360      	ld.w      	r3, (r3, 0x0)
    1352:	b340      	st.w      	r2, (r3, 0x0)
}
    1354:	783c      	jmp      	r15

00001356 <ET_DISABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void ET_DISABLE(void)
{
	ETCB->EN	=	0x00;
    1356:	137c      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1358:	3200      	movi      	r2, 0
    135a:	9360      	ld.w      	r3, (r3, 0x0)
    135c:	b340      	st.w      	r2, (r3, 0x0)
}
    135e:	783c      	jmp      	r15

00001360 <ET_SWTRG_CMD>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_SWTRG_CMD(CRC_ETSWTRG_TypeDef ETSWTRG_X,FunctionalStatus NewState)
{
	if (NewState != DISABLE)
    1360:	3940      	cmpnei      	r1, 0
    1362:	1379      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1364:	0c06      	bf      	0x1370	// 1370 <ET_SWTRG_CMD+0x10>
	{
		ETCB->SWTRG  |= ETSWTRG_X;						
    1366:	9360      	ld.w      	r3, (r3, 0x0)
    1368:	9341      	ld.w      	r2, (r3, 0x4)
    136a:	6c08      	or      	r0, r2
    136c:	b301      	st.w      	r0, (r3, 0x4)
	}
	else
	{
		ETCB->SWTRG  &= ~ETSWTRG_X;					
	}
}
    136e:	783c      	jmp      	r15
		ETCB->SWTRG  &= ~ETSWTRG_X;					
    1370:	9340      	ld.w      	r2, (r3, 0x0)
    1372:	9261      	ld.w      	r3, (r2, 0x4)
    1374:	68c1      	andn      	r3, r0
    1376:	b261      	st.w      	r3, (r2, 0x4)
}
    1378:	07fb      	br      	0x136e	// 136e <ET_SWTRG_CMD+0xe>

0000137a <ET_CH0_DSTSEL>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH0_DSTSEL(CRC_DSTSEL_TypeDef DST_X,FunctionalStatus NewState,U8_T DSTSEL_X)
{
	if (NewState != DISABLE)
    137a:	3940      	cmpnei      	r1, 0
    137c:	0c1b      	bf      	0x13b2	// 13b2 <ET_CH0_DSTSEL+0x38>
	{
		if(DST_X==0)
    137e:	3840      	cmpnei      	r0, 0
    1380:	0809      	bt      	0x1392	// 1392 <ET_CH0_DSTSEL+0x18>
		{
			ETCB->CH0CON0  |= 0X01| (DSTSEL_X<<1);
    1382:	1371      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1384:	4241      	lsli      	r2, r2, 1
    1386:	9320      	ld.w      	r1, (r3, 0x0)
    1388:	9162      	ld.w      	r3, (r1, 0x8)
    138a:	3ba0      	bseti      	r3, 0
		}
		if(DST_X==1)
		{
			ETCB->CH0CON0  |= (0X01<<10)| (DSTSEL_X<<11);
    138c:	6c8c      	or      	r2, r3
    138e:	b142      	st.w      	r2, (r1, 0x8)
		if(DST_X==2)
		{
			ETCB->CH0CON0  &= (0X00<<20)| (DSTSEL_X<<21);
		}				
	}
}
    1390:	783c      	jmp      	r15
		if(DST_X==1)
    1392:	3841      	cmpnei      	r0, 1
    1394:	0807      	bt      	0x13a2	// 13a2 <ET_CH0_DSTSEL+0x28>
			ETCB->CH0CON0  |= (0X01<<10)| (DSTSEL_X<<11);
    1396:	136c      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1398:	424b      	lsli      	r2, r2, 11
    139a:	9320      	ld.w      	r1, (r3, 0x0)
    139c:	9162      	ld.w      	r3, (r1, 0x8)
    139e:	3baa      	bseti      	r3, 10
    13a0:	07f6      	br      	0x138c	// 138c <ET_CH0_DSTSEL+0x12>
		if(DST_X==2)
    13a2:	3842      	cmpnei      	r0, 2
    13a4:	0bf6      	bt      	0x1390	// 1390 <ET_CH0_DSTSEL+0x16>
			ETCB->CH0CON0  |= (0X01<<20)| (DSTSEL_X<<21);
    13a6:	1368      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    13a8:	4255      	lsli      	r2, r2, 21
    13aa:	9320      	ld.w      	r1, (r3, 0x0)
    13ac:	9162      	ld.w      	r3, (r1, 0x8)
    13ae:	3bb4      	bseti      	r3, 20
    13b0:	07ee      	br      	0x138c	// 138c <ET_CH0_DSTSEL+0x12>
		if(DST_X==0)
    13b2:	3840      	cmpnei      	r0, 0
    13b4:	0809      	bt      	0x13c6	// 13c6 <ET_CH0_DSTSEL+0x4c>
			ETCB->CH0CON0  &= 0X01| (DSTSEL_X<<1);
    13b6:	1364      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    13b8:	4241      	lsli      	r2, r2, 1
    13ba:	9360      	ld.w      	r3, (r3, 0x0)
    13bc:	9322      	ld.w      	r1, (r3, 0x8)
    13be:	3aa0      	bseti      	r2, 0
			ETCB->CH0CON0  &= (0X00<<20)| (DSTSEL_X<<21);
    13c0:	6884      	and      	r2, r1
    13c2:	b342      	st.w      	r2, (r3, 0x8)
}
    13c4:	07e6      	br      	0x1390	// 1390 <ET_CH0_DSTSEL+0x16>
		if(DST_X==1)
    13c6:	3841      	cmpnei      	r0, 1
    13c8:	0806      	bt      	0x13d4	// 13d4 <ET_CH0_DSTSEL+0x5a>
			ETCB->CH0CON0  &= (0X00<<10)| (DSTSEL_X<<11);
    13ca:	127f      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    13cc:	424b      	lsli      	r2, r2, 11
    13ce:	9360      	ld.w      	r3, (r3, 0x0)
    13d0:	9322      	ld.w      	r1, (r3, 0x8)
    13d2:	07f7      	br      	0x13c0	// 13c0 <ET_CH0_DSTSEL+0x46>
		if(DST_X==2)
    13d4:	3842      	cmpnei      	r0, 2
    13d6:	0bdd      	bt      	0x1390	// 1390 <ET_CH0_DSTSEL+0x16>
			ETCB->CH0CON0  &= (0X00<<20)| (DSTSEL_X<<21);
    13d8:	127b      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    13da:	4255      	lsli      	r2, r2, 21
    13dc:	9360      	ld.w      	r3, (r3, 0x0)
    13de:	9322      	ld.w      	r1, (r3, 0x8)
    13e0:	07f0      	br      	0x13c0	// 13c0 <ET_CH0_DSTSEL+0x46>

000013e2 <ET_CH0_SRCSEL>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH0_SRCSEL(FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X)
{
	if (NewState != DISABLE)
    13e2:	3840      	cmpnei      	r0, 0
    13e4:	1278      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    13e6:	4259      	lsli      	r2, r2, 25
    13e8:	0c08      	bf      	0x13f8	// 13f8 <ET_CH0_SRCSEL+0x16>
	{
		ETCB->CH0CON1  |= 0x01| (SRCSEL_X<<25)| TRIGMODEX;          //cl
    13ea:	9300      	ld.w      	r0, (r3, 0x0)
    13ec:	9063      	ld.w      	r3, (r0, 0xc)
    13ee:	3ba0      	bseti      	r3, 0
    13f0:	6c4c      	or      	r1, r3
    13f2:	6c84      	or      	r2, r1
    13f4:	b043      	st.w      	r2, (r0, 0xc)
	else
	{
		ETCB->CH0CON1  &= 0x00| (SRCSEL_X<<25)| TRIGMODEX;
	}
	
}
    13f6:	783c      	jmp      	r15
		ETCB->CH0CON1  &= 0x00| (SRCSEL_X<<25)| TRIGMODEX;
    13f8:	9360      	ld.w      	r3, (r3, 0x0)
    13fa:	9303      	ld.w      	r0, (r3, 0xc)
    13fc:	6c84      	or      	r2, r1
    13fe:	6880      	and      	r2, r0
    1400:	b343      	st.w      	r2, (r3, 0xc)
}
    1402:	07fa      	br      	0x13f6	// 13f6 <ET_CH0_SRCSEL+0x14>

00001404 <ET_CH1_DSTSEL>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH1_DSTSEL(CRC_DSTSEL_TypeDef DST_X,FunctionalStatus NewState,U8_T DSTSEL_X)
{
	if (NewState != DISABLE)
    1404:	3940      	cmpnei      	r1, 0
    1406:	0c1b      	bf      	0x143c	// 143c <ET_CH1_DSTSEL+0x38>
	{
		if(DST_X==0)
    1408:	3840      	cmpnei      	r0, 0
    140a:	0809      	bt      	0x141c	// 141c <ET_CH1_DSTSEL+0x18>
		{
			ETCB->CH1CON0  |= 0X01| (DSTSEL_X<<1);
    140c:	126e      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    140e:	4241      	lsli      	r2, r2, 1
    1410:	9320      	ld.w      	r1, (r3, 0x0)
    1412:	9164      	ld.w      	r3, (r1, 0x10)
    1414:	3ba0      	bseti      	r3, 0
		}
		if(DST_X==1)
		{
			ETCB->CH1CON0  |= (0X01<<10)| (DSTSEL_X<<11);
    1416:	6c8c      	or      	r2, r3
    1418:	b144      	st.w      	r2, (r1, 0x10)
		if(DST_X==2)
		{
			ETCB->CH1CON0  &= (0X00<<20)| (DSTSEL_X<<21);
		}				
	}
}
    141a:	783c      	jmp      	r15
		if(DST_X==1)
    141c:	3841      	cmpnei      	r0, 1
    141e:	0807      	bt      	0x142c	// 142c <ET_CH1_DSTSEL+0x28>
			ETCB->CH1CON0  |= (0X01<<10)| (DSTSEL_X<<11);
    1420:	1269      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1422:	424b      	lsli      	r2, r2, 11
    1424:	9320      	ld.w      	r1, (r3, 0x0)
    1426:	9164      	ld.w      	r3, (r1, 0x10)
    1428:	3baa      	bseti      	r3, 10
    142a:	07f6      	br      	0x1416	// 1416 <ET_CH1_DSTSEL+0x12>
		if(DST_X==2)
    142c:	3842      	cmpnei      	r0, 2
    142e:	0bf6      	bt      	0x141a	// 141a <ET_CH1_DSTSEL+0x16>
			ETCB->CH1CON0  |= (0X01<<20)| (DSTSEL_X<<21);
    1430:	1265      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1432:	4255      	lsli      	r2, r2, 21
    1434:	9320      	ld.w      	r1, (r3, 0x0)
    1436:	9164      	ld.w      	r3, (r1, 0x10)
    1438:	3bb4      	bseti      	r3, 20
    143a:	07ee      	br      	0x1416	// 1416 <ET_CH1_DSTSEL+0x12>
		if(DST_X==0)
    143c:	3840      	cmpnei      	r0, 0
    143e:	0809      	bt      	0x1450	// 1450 <ET_CH1_DSTSEL+0x4c>
			ETCB->CH1CON0  &= 0X01| (DSTSEL_X<<1);
    1440:	1261      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1442:	4241      	lsli      	r2, r2, 1
    1444:	9360      	ld.w      	r3, (r3, 0x0)
    1446:	9324      	ld.w      	r1, (r3, 0x10)
    1448:	3aa0      	bseti      	r2, 0
			ETCB->CH1CON0  &= (0X00<<20)| (DSTSEL_X<<21);
    144a:	6884      	and      	r2, r1
    144c:	b344      	st.w      	r2, (r3, 0x10)
}
    144e:	07e6      	br      	0x141a	// 141a <ET_CH1_DSTSEL+0x16>
		if(DST_X==1)
    1450:	3841      	cmpnei      	r0, 1
    1452:	0806      	bt      	0x145e	// 145e <ET_CH1_DSTSEL+0x5a>
			ETCB->CH1CON0  &= (0X00<<10)| (DSTSEL_X<<11);
    1454:	117c      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1456:	424b      	lsli      	r2, r2, 11
    1458:	9360      	ld.w      	r3, (r3, 0x0)
    145a:	9324      	ld.w      	r1, (r3, 0x10)
    145c:	07f7      	br      	0x144a	// 144a <ET_CH1_DSTSEL+0x46>
		if(DST_X==2)
    145e:	3842      	cmpnei      	r0, 2
    1460:	0bdd      	bt      	0x141a	// 141a <ET_CH1_DSTSEL+0x16>
			ETCB->CH1CON0  &= (0X00<<20)| (DSTSEL_X<<21);
    1462:	1179      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1464:	4255      	lsli      	r2, r2, 21
    1466:	9360      	ld.w      	r3, (r3, 0x0)
    1468:	9324      	ld.w      	r1, (r3, 0x10)
    146a:	07f0      	br      	0x144a	// 144a <ET_CH1_DSTSEL+0x46>

0000146c <ET_CH1_SRCSEL>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH1_SRCSEL(FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X)
{
	if (NewState != DISABLE)
    146c:	3840      	cmpnei      	r0, 0
    146e:	1176      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1470:	4259      	lsli      	r2, r2, 25
    1472:	0c08      	bf      	0x1482	// 1482 <ET_CH1_SRCSEL+0x16>
	{
		ETCB->CH1CON1  |= 0x01| (SRCSEL_X<<25)| TRIGMODEX;          //cl
    1474:	9300      	ld.w      	r0, (r3, 0x0)
    1476:	9065      	ld.w      	r3, (r0, 0x14)
    1478:	3ba0      	bseti      	r3, 0
    147a:	6c4c      	or      	r1, r3
    147c:	6c84      	or      	r2, r1
    147e:	b045      	st.w      	r2, (r0, 0x14)
	else
	{
		ETCB->CH1CON1  &= 0x00| (SRCSEL_X<<25)| TRIGMODEX;
	}
	
}
    1480:	783c      	jmp      	r15
		ETCB->CH1CON1  &= 0x00| (SRCSEL_X<<25)| TRIGMODEX;
    1482:	9360      	ld.w      	r3, (r3, 0x0)
    1484:	9305      	ld.w      	r0, (r3, 0x14)
    1486:	6c84      	or      	r2, r1
    1488:	6880      	and      	r2, r0
    148a:	b345      	st.w      	r2, (r3, 0x14)
}
    148c:	07fa      	br      	0x1480	// 1480 <ET_CH1_SRCSEL+0x14>

0000148e <ET_CH2_DSTSEL>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH2_DSTSEL(CRC_DSTSEL_TypeDef DST_X,FunctionalStatus NewState,U8_T DSTSEL_X)
{
	if (NewState != DISABLE)
    148e:	3940      	cmpnei      	r1, 0
    1490:	0c1b      	bf      	0x14c6	// 14c6 <ET_CH2_DSTSEL+0x38>
	{
		if(DST_X==0)
    1492:	3840      	cmpnei      	r0, 0
    1494:	0809      	bt      	0x14a6	// 14a6 <ET_CH2_DSTSEL+0x18>
		{
			ETCB->CH2CON0  |= 0X01| (DSTSEL_X<<1);
    1496:	116c      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    1498:	4241      	lsli      	r2, r2, 1
    149a:	9320      	ld.w      	r1, (r3, 0x0)
    149c:	9166      	ld.w      	r3, (r1, 0x18)
    149e:	3ba0      	bseti      	r3, 0
		}
		if(DST_X==1)
		{
			ETCB->CH2CON0  |= (0X01<<10)| (DSTSEL_X<<11);
    14a0:	6c8c      	or      	r2, r3
    14a2:	b146      	st.w      	r2, (r1, 0x18)
		if(DST_X==2)
		{
			ETCB->CH2CON0  &= (0X00<<20)| (DSTSEL_X<<21);
		}				
	}
}
    14a4:	783c      	jmp      	r15
		if(DST_X==1)
    14a6:	3841      	cmpnei      	r0, 1
    14a8:	0807      	bt      	0x14b6	// 14b6 <ET_CH2_DSTSEL+0x28>
			ETCB->CH2CON0  |= (0X01<<10)| (DSTSEL_X<<11);
    14aa:	1167      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    14ac:	424b      	lsli      	r2, r2, 11
    14ae:	9320      	ld.w      	r1, (r3, 0x0)
    14b0:	9166      	ld.w      	r3, (r1, 0x18)
    14b2:	3baa      	bseti      	r3, 10
    14b4:	07f6      	br      	0x14a0	// 14a0 <ET_CH2_DSTSEL+0x12>
		if(DST_X==2)
    14b6:	3842      	cmpnei      	r0, 2
    14b8:	0bf6      	bt      	0x14a4	// 14a4 <ET_CH2_DSTSEL+0x16>
			ETCB->CH2CON0  |= (0X01<<20)| (DSTSEL_X<<21);
    14ba:	1163      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    14bc:	4255      	lsli      	r2, r2, 21
    14be:	9320      	ld.w      	r1, (r3, 0x0)
    14c0:	9166      	ld.w      	r3, (r1, 0x18)
    14c2:	3bb4      	bseti      	r3, 20
    14c4:	07ee      	br      	0x14a0	// 14a0 <ET_CH2_DSTSEL+0x12>
		if(DST_X==0)
    14c6:	3840      	cmpnei      	r0, 0
    14c8:	0809      	bt      	0x14da	// 14da <ET_CH2_DSTSEL+0x4c>
			ETCB->CH2CON0  &= 0X01| (DSTSEL_X<<1);
    14ca:	107f      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    14cc:	4241      	lsli      	r2, r2, 1
    14ce:	9360      	ld.w      	r3, (r3, 0x0)
    14d0:	9326      	ld.w      	r1, (r3, 0x18)
    14d2:	3aa0      	bseti      	r2, 0
			ETCB->CH2CON0  &= (0X00<<20)| (DSTSEL_X<<21);
    14d4:	6884      	and      	r2, r1
    14d6:	b346      	st.w      	r2, (r3, 0x18)
}
    14d8:	07e6      	br      	0x14a4	// 14a4 <ET_CH2_DSTSEL+0x16>
		if(DST_X==1)
    14da:	3841      	cmpnei      	r0, 1
    14dc:	0806      	bt      	0x14e8	// 14e8 <ET_CH2_DSTSEL+0x5a>
			ETCB->CH2CON0  &= (0X00<<10)| (DSTSEL_X<<11);
    14de:	107a      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    14e0:	424b      	lsli      	r2, r2, 11
    14e2:	9360      	ld.w      	r3, (r3, 0x0)
    14e4:	9326      	ld.w      	r1, (r3, 0x18)
    14e6:	07f7      	br      	0x14d4	// 14d4 <ET_CH2_DSTSEL+0x46>
		if(DST_X==2)
    14e8:	3842      	cmpnei      	r0, 2
    14ea:	0bdd      	bt      	0x14a4	// 14a4 <ET_CH2_DSTSEL+0x16>
			ETCB->CH2CON0  &= (0X00<<20)| (DSTSEL_X<<21);
    14ec:	1076      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    14ee:	4255      	lsli      	r2, r2, 21
    14f0:	9360      	ld.w      	r3, (r3, 0x0)
    14f2:	9326      	ld.w      	r1, (r3, 0x18)
    14f4:	07f0      	br      	0x14d4	// 14d4 <ET_CH2_DSTSEL+0x46>

000014f6 <ET_CH2_SRCSEL>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CH2_SRCSEL(FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X)
{
	if (NewState != DISABLE)
    14f6:	3840      	cmpnei      	r0, 0
    14f8:	1073      	lrw      	r3, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    14fa:	4259      	lsli      	r2, r2, 25
    14fc:	0c08      	bf      	0x150c	// 150c <ET_CH2_SRCSEL+0x16>
	{
		ETCB->CH2CON1  |= 0x01| (SRCSEL_X<<25)| TRIGMODEX;
    14fe:	9300      	ld.w      	r0, (r3, 0x0)
    1500:	9067      	ld.w      	r3, (r0, 0x1c)
    1502:	3ba0      	bseti      	r3, 0
    1504:	6c4c      	or      	r1, r3
    1506:	6c84      	or      	r2, r1
    1508:	b047      	st.w      	r2, (r0, 0x1c)
	else
	{
		ETCB->CH2CON1  &= 0x00| (SRCSEL_X<<25)| TRIGMODEX;
	}
	
}
    150a:	783c      	jmp      	r15
		ETCB->CH2CON1  &= 0x00| (SRCSEL_X<<25)| TRIGMODEX;
    150c:	9360      	ld.w      	r3, (r3, 0x0)
    150e:	9307      	ld.w      	r0, (r3, 0x1c)
    1510:	6c84      	or      	r2, r1
    1512:	6880      	and      	r2, r0
    1514:	b347      	st.w      	r2, (r3, 0x1c)
}
    1516:	07fa      	br      	0x150a	// 150a <ET_CH2_SRCSEL+0x14>

00001518 <ET_CHx_CONTROL>:
//EntryParameter:NewState,TRIGMODEX,SRCSEL_X
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ET_CHx_CONTROL(CRC_ETCHX_TypeDef ETCHX,FunctionalStatus NewState,CRC_TRIGMODE_TypeDef TRIGMODEX,U8_T SRCSEL_X,U8_T DSTSEL_X)
{
    1518:	14c3      	push      	r4-r6
    151a:	10ab      	lrw      	r5, 0x2000006c	// 1544 <ET_CHx_CONTROL+0x2c>
    151c:	4082      	lsli      	r4, r0, 2
    151e:	9500      	ld.w      	r0, (r5, 0x0)
    1520:	d8ce000c 	ld.b      	r6, (r14, 0xc)
	if (NewState != DISABLE)
    1524:	3940      	cmpnei      	r1, 0
    1526:	6010      	addu      	r0, r4
    1528:	463a      	lsli      	r1, r6, 26
    152a:	436c      	lsli      	r3, r3, 12
	{
		ETCB->CH3_31CON[ETCHX]  |= 0x01|(SRCSEL_X<<12)| (DSTSEL_X<<26)| TRIGMODEX;
    152c:	908c      	ld.w      	r4, (r0, 0x30)
	if (NewState != DISABLE)
    152e:	0c07      	bf      	0x153c	// 153c <ET_CHx_CONTROL+0x24>
		ETCB->CH3_31CON[ETCHX]  |= 0x01|(SRCSEL_X<<12)| (DSTSEL_X<<26)| TRIGMODEX;
    1530:	39a0      	bseti      	r1, 0
    1532:	6cc4      	or      	r3, r1
    1534:	6c90      	or      	r2, r4
    1536:	6cc8      	or      	r3, r2


	}
	else
	{
		ETCB->CH3_31CON[ETCHX]  &= 0x00|(SRCSEL_X<<12)| (DSTSEL_X<<26)| TRIGMODEX;
    1538:	b06c      	st.w      	r3, (r0, 0x30)

	}
    153a:	1483      	pop      	r4-r6
		ETCB->CH3_31CON[ETCHX]  &= 0x00|(SRCSEL_X<<12)| (DSTSEL_X<<26)| TRIGMODEX;
    153c:	6cc4      	or      	r3, r1
    153e:	6cc8      	or      	r3, r2
    1540:	68d0      	and      	r3, r4
    1542:	07fb      	br      	0x1538	// 1538 <ET_CHx_CONTROL+0x20>
    1544:	2000006c 	.long	0x2000006c

00001548 <WWDT_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void WWDT_DeInit(void)
{
	WWDT->CR 	= 0x000000FF;
    1548:	1066      	lrw      	r3, 0x20000030	// 1560 <WWDT_DeInit+0x18>
    154a:	32ff      	movi      	r2, 255
    154c:	9360      	ld.w      	r3, (r3, 0x0)
    154e:	b340      	st.w      	r2, (r3, 0x0)
	WWDT->CFGR 	= 0x000000FF;
    1550:	b341      	st.w      	r2, (r3, 0x4)
	WWDT->RISR 	= WWDT_RESET_VALUE;
    1552:	3200      	movi      	r2, 0
    1554:	b342      	st.w      	r2, (r3, 0x8)
	WWDT->MISR	= WWDT_RESET_VALUE;
    1556:	b343      	st.w      	r2, (r3, 0xc)
	WWDT->IMCR 	= WWDT_RESET_VALUE;
    1558:	b344      	st.w      	r2, (r3, 0x10)
	WWDT->ICR 	= WWDT_RESET_VALUE;
    155a:	b345      	st.w      	r2, (r3, 0x14)
}
    155c:	783c      	jmp      	r15
    155e:	0000      	bkpt
    1560:	20000030 	.long	0x20000030

00001564 <WWDT_CONFIG>:
//WWDT CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CONFIG(WWDT_PSCDIV_TypeDef PSCDIVX,U8_T WND_DATA,WWDT_DBGEN_TypeDef DBGENX)
{
    1564:	14c1      	push      	r4
	WWDT->CFGR =WND_DATA;
    1566:	1079      	lrw      	r3, 0x20000030	// 15c8 <WWDT_Int_Config+0x32>
    1568:	9380      	ld.w      	r4, (r3, 0x0)
    156a:	b421      	st.w      	r1, (r4, 0x4)
	WWDT->CFGR |= PSCDIVX |DBGENX;
    156c:	9461      	ld.w      	r3, (r4, 0x4)
    156e:	6c8c      	or      	r2, r3
    1570:	6c08      	or      	r0, r2
    1572:	b401      	st.w      	r0, (r4, 0x4)
}
    1574:	1481      	pop      	r4

00001576 <WWDT_CMD>:
//WWDT ENABLE/DISABLE
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CMD(FunctionalStatus NewState)
{
    1576:	1075      	lrw      	r3, 0x20000030	// 15c8 <WWDT_Int_Config+0x32>
	if (NewState != DISABLE)
    1578:	3840      	cmpnei      	r0, 0
	{
		WWDT->CR  |= 0x01<<8;						
    157a:	9340      	ld.w      	r2, (r3, 0x0)
    157c:	9260      	ld.w      	r3, (r2, 0x0)
	if (NewState != DISABLE)
    157e:	0c04      	bf      	0x1586	// 1586 <WWDT_CMD+0x10>
		WWDT->CR  |= 0x01<<8;						
    1580:	3ba8      	bseti      	r3, 8
	}
	else
	{
		WWDT->CR  &= 0xfffffeff;					
    1582:	b260      	st.w      	r3, (r2, 0x0)
	}
}
    1584:	783c      	jmp      	r15
		WWDT->CR  &= 0xfffffeff;					
    1586:	3b88      	bclri      	r3, 8
    1588:	07fd      	br      	0x1582	// 1582 <WWDT_CMD+0xc>

0000158a <WWDT_CNT_Load>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CNT_Load(U8_T cnt_data)
{
	WWDT->CR  |= cnt_data;						//SET
    158a:	1070      	lrw      	r3, 0x20000030	// 15c8 <WWDT_Int_Config+0x32>
    158c:	9360      	ld.w      	r3, (r3, 0x0)
    158e:	9340      	ld.w      	r2, (r3, 0x0)
    1590:	6c08      	or      	r0, r2
    1592:	b300      	st.w      	r0, (r3, 0x0)
}
    1594:	783c      	jmp      	r15

00001596 <WWDT_Int_Config>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void WWDT_Int_Config(FunctionalStatus NewState)
{
	if (NewState != DISABLE)
    1596:	3840      	cmpnei      	r0, 0
    1598:	106c      	lrw      	r3, 0x20000030	// 15c8 <WWDT_Int_Config+0x32>
    159a:	102d      	lrw      	r1, 0x20000078	// 15cc <WWDT_Int_Config+0x36>
    159c:	0c0d      	bf      	0x15b6	// 15b6 <WWDT_Int_Config+0x20>
	{
		WWDT->ICR = WWDT_EVI;				
    159e:	9360      	ld.w      	r3, (r3, 0x0)
    15a0:	3001      	movi      	r0, 1
    15a2:	b305      	st.w      	r0, (r3, 0x14)
		WWDT->IMCR  |= WWDT_EVI;
    15a4:	9344      	ld.w      	r2, (r3, 0x10)
    15a6:	6c80      	or      	r2, r0
    15a8:	b344      	st.w      	r2, (r3, 0x10)
		INTC_ISER_WRITE(WWDT_INT);  
    15aa:	9160      	ld.w      	r3, (r1, 0x0)
    15ac:	23ff      	addi      	r3, 256
	}
	else
	{
		WWDT->IMCR  &= ~WWDT_EVI;					//CLR
		INTC_ICER_WRITE(WWDT_INT);  
    15ae:	3280      	movi      	r2, 128
    15b0:	4245      	lsli      	r2, r2, 5
    15b2:	b340      	st.w      	r2, (r3, 0x0)
	}
    15b4:	783c      	jmp      	r15
		WWDT->IMCR  &= ~WWDT_EVI;					//CLR
    15b6:	9340      	ld.w      	r2, (r3, 0x0)
    15b8:	9264      	ld.w      	r3, (r2, 0x10)
    15ba:	3b80      	bclri      	r3, 0
    15bc:	b264      	st.w      	r3, (r2, 0x10)
		INTC_ICER_WRITE(WWDT_INT);  
    15be:	32c0      	movi      	r2, 192
    15c0:	9160      	ld.w      	r3, (r1, 0x0)
    15c2:	4241      	lsli      	r2, r2, 1
    15c4:	60c8      	addu      	r3, r2
    15c6:	07f4      	br      	0x15ae	// 15ae <WWDT_Int_Config+0x18>
    15c8:	20000030 	.long	0x20000030
    15cc:	20000078 	.long	0x20000078

000015d0 <SYSCON_General_CMD.part.0>:
/*************************************************************/  
void SYSCON_General_CMD(FunctionalStatus NewState, SYSCON_General_CMD_TypeDef ENDIS_X )
{
	if (NewState != DISABLE)
	{
		if(ENDIS_X==ENDIS_EMOSC) 
    15d0:	3848      	cmpnei      	r0, 8
    15d2:	080a      	bt      	0x15e6	// 15e6 <SYSCON_General_CMD.part.0+0x16>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFF00FFF)|0x00044000;					//enable EMOSC PIN
    15d4:	107a      	lrw      	r3, 0x20000014	// 163c <SYSCON_General_CMD.part.0+0x6c>
    15d6:	32ff      	movi      	r2, 255
    15d8:	9320      	ld.w      	r1, (r3, 0x0)
    15da:	9160      	ld.w      	r3, (r1, 0x0)
    15dc:	424c      	lsli      	r2, r2, 12
    15de:	68c9      	andn      	r3, r2
    15e0:	3bae      	bseti      	r3, 14
    15e2:	3bb2      	bseti      	r3, 18
    15e4:	b160      	st.w      	r3, (r1, 0x0)
		SYSCON->GCER|=ENDIS_X;													//enable SYSCON General Control
    15e6:	1077      	lrw      	r3, 0x20000070	// 1640 <SYSCON_General_CMD.part.0+0x70>
    15e8:	9360      	ld.w      	r3, (r3, 0x0)
    15ea:	9341      	ld.w      	r2, (r3, 0x4)
    15ec:	6c80      	or      	r2, r0
    15ee:	b341      	st.w      	r2, (r3, 0x4)
		while(!(SYSCON->GCSR&ENDIS_X));											//check  Enable?	
    15f0:	9343      	ld.w      	r2, (r3, 0xc)
    15f2:	6880      	and      	r2, r0
    15f4:	3a40      	cmpnei      	r2, 0
    15f6:	0ffd      	bf      	0x15f0	// 15f0 <SYSCON_General_CMD.part.0+0x20>
		switch(ENDIS_X)
    15f8:	3842      	cmpnei      	r0, 2
    15fa:	0807      	bt      	0x1608	// 1608 <SYSCON_General_CMD.part.0+0x38>
		{
			case ENDIS_IMOSC:
				while (!(SYSCON->CKST & ENDIS_IMOSC)); 	
    15fc:	3102      	movi      	r1, 2
    15fe:	9344      	ld.w      	r2, (r3, 0x10)
    1600:	6884      	and      	r2, r1
    1602:	3a40      	cmpnei      	r2, 0
    1604:	0ffd      	bf      	0x15fe	// 15fe <SYSCON_General_CMD.part.0+0x2e>
	{
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
		while(SYSCON->GCSR&ENDIS_X);											//check Disable?
		SYSCON->ICR|=ENDIS_X;													//Clear ENDIS_X stable bit
	}
}
    1606:	783c      	jmp      	r15
		switch(ENDIS_X)
    1608:	3802      	cmphsi      	r0, 3
    160a:	0809      	bt      	0x161c	// 161c <SYSCON_General_CMD.part.0+0x4c>
    160c:	3841      	cmpnei      	r0, 1
    160e:	0bfc      	bt      	0x1606	// 1606 <SYSCON_General_CMD.part.0+0x36>
				while (!(SYSCON->CKST & ENDIS_ISOSC)); 
    1610:	3101      	movi      	r1, 1
    1612:	9344      	ld.w      	r2, (r3, 0x10)
    1614:	6884      	and      	r2, r1
    1616:	3a40      	cmpnei      	r2, 0
    1618:	0ffd      	bf      	0x1612	// 1612 <SYSCON_General_CMD.part.0+0x42>
    161a:	07f6      	br      	0x1606	// 1606 <SYSCON_General_CMD.part.0+0x36>
		switch(ENDIS_X)
    161c:	3848      	cmpnei      	r0, 8
    161e:	0807      	bt      	0x162c	// 162c <SYSCON_General_CMD.part.0+0x5c>
				while (!(SYSCON->CKST & ENDIS_EMOSC)); 
    1620:	3108      	movi      	r1, 8
    1622:	9344      	ld.w      	r2, (r3, 0x10)
    1624:	6884      	and      	r2, r1
    1626:	3a40      	cmpnei      	r2, 0
    1628:	0ffd      	bf      	0x1622	// 1622 <SYSCON_General_CMD.part.0+0x52>
    162a:	07ee      	br      	0x1606	// 1606 <SYSCON_General_CMD.part.0+0x36>
		switch(ENDIS_X)
    162c:	3850      	cmpnei      	r0, 16
    162e:	0bec      	bt      	0x1606	// 1606 <SYSCON_General_CMD.part.0+0x36>
				while (!(SYSCON->CKST & ENDIS_HFOSC)); 
    1630:	3110      	movi      	r1, 16
    1632:	9344      	ld.w      	r2, (r3, 0x10)
    1634:	6884      	and      	r2, r1
    1636:	3a40      	cmpnei      	r2, 0
    1638:	0ffd      	bf      	0x1632	// 1632 <SYSCON_General_CMD.part.0+0x62>
    163a:	07e6      	br      	0x1606	// 1606 <SYSCON_General_CMD.part.0+0x36>
    163c:	20000014 	.long	0x20000014
    1640:	20000070 	.long	0x20000070

00001644 <SYSCON_RST_VALUE>:
	SYSCON->RAMCHK=SYSCON_RAMCHK_RST;
    1644:	0174      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    1646:	0153      	lrw      	r2, 0xffff	// 1974 <EXI1_WakeUp_Enable+0x8>
    1648:	9360      	ld.w      	r3, (r3, 0x0)
    164a:	b345      	st.w      	r2, (r3, 0x14)
	SYSCON->EFLCHK=SYSCON_EFLCHK_RST;
    164c:	0154      	lrw      	r2, 0xffffff	// 1978 <EXI1_WakeUp_Enable+0xc>
    164e:	b346      	st.w      	r2, (r3, 0x18)
	SYSCON->SCLKCR=SYSCON_SCLKCR_RST;
    1650:	0154      	lrw      	r2, 0xd22d0000	// 197c <EXI1_WakeUp_Enable+0x10>
    1652:	b347      	st.w      	r2, (r3, 0x1c)
	SYSCON->OSTR=SYSCON_OSTR_RST;
    1654:	0154      	lrw      	r2, 0x70ff3bff	// 1980 <EXI1_WakeUp_Enable+0x14>
    1656:	b350      	st.w      	r2, (r3, 0x40)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
    1658:	3180      	movi      	r1, 128
	SYSCON->LVDCR=SYSCON_LVDCR_RST;
    165a:	320a      	movi      	r2, 10
    165c:	b353      	st.w      	r2, (r3, 0x4c)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
    165e:	604c      	addu      	r1, r3
    1660:	3200      	movi      	r2, 0
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
    1662:	0116      	lrw      	r0, 0x70c	// 1984 <EXI1_WakeUp_Enable+0x18>
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
    1664:	b145      	st.w      	r2, (r1, 0x14)
	SYSCON->UREG0=SYSCON_UREG0_RST;
    1666:	23ff      	addi      	r3, 256
	SYSCON->EXIFT=SYSCON_EXIFT_RST;
    1668:	b146      	st.w      	r2, (r1, 0x18)
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
    166a:	b10d      	st.w      	r0, (r1, 0x34)
	SYSCON->IWDCNT=SYSCON_IWDCNT_RST;
    166c:	0118      	lrw      	r0, 0x3fe	// 1988 <EXI1_WakeUp_Enable+0x1c>
    166e:	b10e      	st.w      	r0, (r1, 0x38)
	SYSCON->EVTRG=SYSCON_EVTRG_RST;
    1670:	b15d      	st.w      	r2, (r1, 0x74)
	SYSCON->EVPS=SYSCON_EVPS_RST;
    1672:	b15e      	st.w      	r2, (r1, 0x78)
	SYSCON->EVSWF=SYSCON_EVSWF_RST;
    1674:	b15f      	st.w      	r2, (r1, 0x7c)
	SYSCON->UREG0=SYSCON_UREG0_RST;
    1676:	b340      	st.w      	r2, (r3, 0x0)
	SYSCON->UREG1=SYSCON_UREG1_RST;
    1678:	b341      	st.w      	r2, (r3, 0x4)
	SYSCON->UREG2=SYSCON_UREG2_RST;
    167a:	b342      	st.w      	r2, (r3, 0x8)
	SYSCON->DBGCR=SYSCON_DBGCR_RST;
    167c:	325a      	movi      	r2, 90
    167e:	b34a      	st.w      	r2, (r3, 0x28)
}
    1680:	783c      	jmp      	r15

00001682 <EMOSC_OSTR_Config>:
{
    1682:	14c2      	push      	r4-r5
    1684:	9882      	ld.w      	r4, (r14, 0x8)
    1686:	6d53      	mov      	r5, r4
	SYSCON->OSTR=EM_CNT|(EM_GM<<11)|EM_LFSEL_X|EM_FLEN_X|EM_FLSEL_X;
    1688:	6cd4      	or      	r3, r5
    168a:	412b      	lsli      	r1, r1, 11
    168c:	6c40      	or      	r1, r0
    168e:	6c8c      	or      	r2, r3
    1690:	0287      	lrw      	r4, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    1692:	6c48      	or      	r1, r2
    1694:	9480      	ld.w      	r4, (r4, 0x0)
    1696:	b430      	st.w      	r1, (r4, 0x40)
}
    1698:	1482      	pop      	r4-r5

0000169a <SYSCON_General_CMD>:
{
    169a:	14d0      	push      	r15
	if (NewState != DISABLE)
    169c:	3840      	cmpnei      	r0, 0
    169e:	0c05      	bf      	0x16a8	// 16a8 <SYSCON_General_CMD+0xe>
    16a0:	6c07      	mov      	r0, r1
    16a2:	e3ffff97 	bsr      	0x15d0	// 15d0 <SYSCON_General_CMD.part.0>
}
    16a6:	1490      	pop      	r15
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
    16a8:	026d      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    16aa:	9360      	ld.w      	r3, (r3, 0x0)
    16ac:	9342      	ld.w      	r2, (r3, 0x8)
    16ae:	6c84      	or      	r2, r1
    16b0:	b342      	st.w      	r2, (r3, 0x8)
		while(SYSCON->GCSR&ENDIS_X);											//check Disable?
    16b2:	9343      	ld.w      	r2, (r3, 0xc)
    16b4:	6884      	and      	r2, r1
    16b6:	3a40      	cmpnei      	r2, 0
    16b8:	0bfd      	bt      	0x16b2	// 16b2 <SYSCON_General_CMD+0x18>
		SYSCON->ICR|=ENDIS_X;													//Clear ENDIS_X stable bit
    16ba:	237f      	addi      	r3, 128
    16bc:	9301      	ld.w      	r0, (r3, 0x4)
    16be:	6c40      	or      	r1, r0
    16c0:	b321      	st.w      	r1, (r3, 0x4)
}
    16c2:	07f2      	br      	0x16a6	// 16a6 <SYSCON_General_CMD+0xc>

000016c4 <SystemCLK_HCLKDIV_PCLKDIV_Config>:
//SystemClk_data_x:EMOSC_24M,EMOSC_16M,EMOSC_12M,EMOSC_8M,EMOSC_4M,EMOSC_36K,
//ISOSC,IMOSC,HFOSC_48M,HFOSC_24M,HFOSC_12M,HFOSC_6M
//ReturnValue:NONE
/*************************************************************/ 
void SystemCLK_HCLKDIV_PCLKDIV_Config(SystemCLK_TypeDef SYSCLK_X , SystemCLK_Div_TypeDef HCLK_DIV_X , PCLK_Div_TypeDef PCLK_DIV_X , SystemClk_data_TypeDef SystemClk_data_x )
{
    16c4:	14c2      	push      	r4-r5
	if(SystemClk_data_x==HFOSC_48M)
    16c6:	3b48      	cmpnei      	r3, 8
    16c8:	0828      	bt      	0x1718	// 1718 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x54>
	{
		IFC->CEDR=0X01;						//CLKEN
    16ca:	028e      	lrw      	r4, 0x20000074	// 198c <EXI1_WakeUp_Enable+0x20>
    16cc:	3501      	movi      	r5, 1
    16ce:	9480      	ld.w      	r4, (r4, 0x0)
    16d0:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X04|(0X00<<16);			//High speed mode
    16d2:	3504      	movi      	r5, 4
    16d4:	b4a5      	st.w      	r5, (r4, 0x14)
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==HFOSC_24M))
	{
		IFC->CEDR=0X01;						//CLKEN
		IFC->MR=0X02|(0X00<<16);			//Medium speed mode
	}
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==EMOSC_16M))
    16d6:	5b83      	subi      	r4, r3, 1
    16d8:	3c01      	cmphsi      	r4, 2
    16da:	0c2b      	bf      	0x1730	// 1730 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x6c>
	{
		IFC->CEDR=0X01;						//CLKEN
		IFC->MR=0X01|(0X00<<16);			//Low speed mode
	}
	if((SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_6M))
    16dc:	5b8b      	subi      	r4, r3, 3
	if((SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
    16de:	3c04      	cmphsi      	r4, 5
    16e0:	0c03      	bf      	0x16e6	// 16e6 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x22>
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_6M))
    16e2:	3b4b      	cmpnei      	r3, 11
    16e4:	0807      	bt      	0x16f2	// 16f2 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x2e>
	{
		IFC->CEDR=0X01;						//CLKEN
    16e6:	0275      	lrw      	r3, 0x20000074	// 198c <EXI1_WakeUp_Enable+0x20>
    16e8:	3401      	movi      	r4, 1
    16ea:	9360      	ld.w      	r3, (r3, 0x0)
    16ec:	b381      	st.w      	r4, (r3, 0x4)
		IFC->MR=0X00|(0X00<<16);			//Low speed mode
    16ee:	3400      	movi      	r4, 0
    16f0:	b385      	st.w      	r4, (r3, 0x14)
	}
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
    16f2:	029c      	lrw      	r4, 0xd22d0000	// 197c <EXI1_WakeUp_Enable+0x10>
    16f4:	6c10      	or      	r0, r4
    16f6:	0360      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    16f8:	6c40      	or      	r1, r0
    16fa:	9360      	ld.w      	r3, (r3, 0x0)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
    16fc:	3080      	movi      	r0, 128
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
    16fe:	b327      	st.w      	r1, (r3, 0x1c)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
    1700:	4001      	lsli      	r0, r0, 1
    1702:	9324      	ld.w      	r1, (r3, 0x10)
    1704:	6840      	and      	r1, r0
    1706:	3940      	cmpnei      	r1, 0
    1708:	0ffd      	bf      	0x1702	// 1702 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x3e>
	SYSCON->PCLKCR=PCLK_KEY|PCLK_DIV_X;											//PCLK DIV 1 2 4 6 8 16		
    170a:	023d      	lrw      	r1, 0xc33c0000	// 1990 <EXI1_WakeUp_Enable+0x24>
    170c:	6c48      	or      	r1, r2
    170e:	b328      	st.w      	r1, (r3, 0x20)
	while(SYSCON->PCLKCR!=PCLK_DIV_X);											//Wait PCLK DIV
    1710:	9328      	ld.w      	r1, (r3, 0x20)
    1712:	644a      	cmpne      	r2, r1
    1714:	0bfe      	bt      	0x1710	// 1710 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x4c>
}
    1716:	1482      	pop      	r4-r5
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==HFOSC_24M))
    1718:	3b40      	cmpnei      	r3, 0
    171a:	0c03      	bf      	0x1720	// 1720 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x5c>
    171c:	3b49      	cmpnei      	r3, 9
    171e:	0807      	bt      	0x172c	// 172c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x68>
		IFC->CEDR=0X01;						//CLKEN
    1720:	0384      	lrw      	r4, 0x20000074	// 198c <EXI1_WakeUp_Enable+0x20>
    1722:	3501      	movi      	r5, 1
    1724:	9480      	ld.w      	r4, (r4, 0x0)
    1726:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X02|(0X00<<16);			//Medium speed mode
    1728:	3502      	movi      	r5, 2
    172a:	b4a5      	st.w      	r5, (r4, 0x14)
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==EMOSC_16M))
    172c:	3b4a      	cmpnei      	r3, 10
    172e:	0bd4      	bt      	0x16d6	// 16d6 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x12>
		IFC->CEDR=0X01;						//CLKEN
    1730:	0388      	lrw      	r4, 0x20000074	// 198c <EXI1_WakeUp_Enable+0x20>
    1732:	3501      	movi      	r5, 1
    1734:	9480      	ld.w      	r4, (r4, 0x0)
    1736:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X01|(0X00<<16);			//Low speed mode
    1738:	b4a5      	st.w      	r5, (r4, 0x14)
    173a:	07d1      	br      	0x16dc	// 16dc <SystemCLK_HCLKDIV_PCLKDIV_Config+0x18>

0000173c <SystemCLK_Clear>:
//clear system clk register
//ReturnValue:NONE
/*************************************************************/ 
void SystemCLK_Clear(void)
{
	SYSCON->SCLKCR=0xd22d0000;
    173c:	0372      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    173e:	034f      	lrw      	r2, 0xd22d0000	// 197c <EXI1_WakeUp_Enable+0x10>
    1740:	9360      	ld.w      	r3, (r3, 0x0)
    1742:	b347      	st.w      	r2, (r3, 0x1c)
	while(SYSCON->SCLKCR!=0);
    1744:	9347      	ld.w      	r2, (r3, 0x1c)
    1746:	3a40      	cmpnei      	r2, 0
    1748:	0bfe      	bt      	0x1744	// 1744 <SystemCLK_Clear+0x8>
}
    174a:	783c      	jmp      	r15

0000174c <SYSCON_IMOSC_SELECTE>:
//ReturnValue:NONE
/*************************************************************/  
void SYSCON_IMOSC_SELECTE(IMOSC_SELECTE_TypeDef IMOSC_SELECTE_X)
{		
	//SYSCON_General_CMD(DISABLE,ENDIS_IMOSC);					//disalbe IMOSC
	SYSCON->OPT1 = (SYSCON->OPT1 & 0XFFFFFFFC)|IMOSC_SELECTE_X;	//IMOSC CLK selected
    174c:	0376      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    174e:	9340      	ld.w      	r2, (r3, 0x0)
    1750:	9279      	ld.w      	r3, (r2, 0x64)
    1752:	3b80      	bclri      	r3, 0
    1754:	3b81      	bclri      	r3, 1
    1756:	6c0c      	or      	r0, r3
    1758:	b219      	st.w      	r0, (r2, 0x64)
	//SYSCON_General_CMD(ENABLE,ENDIS_IMOSC);						//enable IMOSC
}
    175a:	783c      	jmp      	r15

0000175c <SYSCON_HFOSC_SELECTE>:
//EntryParameter:HFOSC_SELECTE_X
//HFOSC_SELECTE_X:HFOSC_SELECTE_48M,HFOSC_SELECTE_24M;HFOSC_SELECTE_12M;HFOSC_SELECTE_6M
//ReturnValue:NONE
/*************************************************************/  
void SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_TypeDef HFOSC_SELECTE_X)
{		
    175c:	14d1      	push      	r4, r15
    175e:	6d03      	mov      	r4, r0
	SYSCON_General_CMD(DISABLE,ENDIS_HFOSC);					//disable HFOSC
    1760:	3110      	movi      	r1, 16
    1762:	3000      	movi      	r0, 0
    1764:	e3ffff9b 	bsr      	0x169a	// 169a <SYSCON_General_CMD>
	SYSCON->OPT1 = (SYSCON->OPT1 & 0XFFFFFFCF)|HFOSC_SELECTE_X;
    1768:	037d      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    176a:	9360      	ld.w      	r3, (r3, 0x0)
    176c:	9319      	ld.w      	r0, (r3, 0x64)
    176e:	3884      	bclri      	r0, 4
    1770:	3885      	bclri      	r0, 5
    1772:	6c10      	or      	r0, r4
    1774:	b319      	st.w      	r0, (r3, 0x64)
    1776:	3010      	movi      	r0, 16
    1778:	e3ffff2c 	bsr      	0x15d0	// 15d0 <SYSCON_General_CMD.part.0>
	SYSCON_General_CMD(ENABLE,ENDIS_HFOSC);						//enable HFOSC
}
    177c:	1491      	pop      	r4, r15

0000177e <SYSCON_WDT_CMD>:
//EntryParameter:,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_WDT_CMD(FunctionalStatus NewState)
{
    177e:	137d      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
	if(NewState != DISABLE)
    1780:	3840      	cmpnei      	r0, 0
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
    1782:	9360      	ld.w      	r3, (r3, 0x0)
    1784:	237f      	addi      	r3, 128
	if(NewState != DISABLE)
    1786:	0c0a      	bf      	0x179a	// 179a <SYSCON_WDT_CMD+0x1c>
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
    1788:	035c      	lrw      	r2, 0x78870000	// 1994 <EXI1_WakeUp_Enable+0x28>
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
    178a:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
    178c:	b34f      	st.w      	r2, (r3, 0x3c)
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
    178e:	4125      	lsli      	r1, r1, 5
    1790:	934d      	ld.w      	r2, (r3, 0x34)
    1792:	6884      	and      	r2, r1
    1794:	3a40      	cmpnei      	r2, 0
    1796:	0ffd      	bf      	0x1790	// 1790 <SYSCON_WDT_CMD+0x12>
	else
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
	}
}
    1798:	783c      	jmp      	r15
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
    179a:	035f      	lrw      	r2, 0x788755aa	// 1998 <EXI1_WakeUp_Enable+0x2c>
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
    179c:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
    179e:	b34f      	st.w      	r2, (r3, 0x3c)
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
    17a0:	4125      	lsli      	r1, r1, 5
    17a2:	934d      	ld.w      	r2, (r3, 0x34)
    17a4:	6884      	and      	r2, r1
    17a6:	3a40      	cmpnei      	r2, 0
    17a8:	0bfd      	bt      	0x17a2	// 17a2 <SYSCON_WDT_CMD+0x24>
    17aa:	07f7      	br      	0x1798	// 1798 <SYSCON_WDT_CMD+0x1a>

000017ac <SYSCON_IWDCNT_Reload>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Reload(void)
{
	SYSCON->IWDCNT=CLR_IWDT;
    17ac:	1371      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    17ae:	32b4      	movi      	r2, 180
    17b0:	9360      	ld.w      	r3, (r3, 0x0)
    17b2:	237f      	addi      	r3, 128
    17b4:	4257      	lsli      	r2, r2, 23
    17b6:	b34e      	st.w      	r2, (r3, 0x38)
}
    17b8:	783c      	jmp      	r15

000017ba <SYSCON_IWDCNT_Config>:
//IWDT_INTW_DIV_X:IWDT_INTW_DIV_1/2/3/4/4/5/6
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Config(IWDT_TIME_TypeDef IWDT_TIME_X , IWDT_TIMEDIV_TypeDef IWDT_INTW_DIV_X )
{
	SYSCON->IWDCR=IWDT_KEY|IWDT_TIME_X|IWDT_INTW_DIV_X;
    17ba:	1359      	lrw      	r2, 0x87780000	// 199c <EXI1_WakeUp_Enable+0x30>
    17bc:	136d      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    17be:	6c48      	or      	r1, r2
    17c0:	9360      	ld.w      	r3, (r3, 0x0)
    17c2:	6c04      	or      	r0, r1
    17c4:	237f      	addi      	r3, 128
    17c6:	b30d      	st.w      	r0, (r3, 0x34)
}
    17c8:	783c      	jmp      	r15

000017ca <SYSCON_LVD_Config>:
//X_LVD_INT:ENABLE_LVD_INT,DISABLE_LVD_INT
//INTDET_POL_X:INTDET_POL_fall,INTDET_POL_X_rise,INTDET_POL_X_riseORfall
//ReturnValue: NONE
/*************************************************************/
void SYSCON_LVD_Config(X_LVDEN_TypeDef X_LVDEN , INTDET_LVL_X_TypeDef INTDET_LVL_X , RSTDET_LVL_X_TypeDef RSTDET_LVL_X , X_LVD_INT_TypeDef X_LVD_INT , INTDET_POL_X_TypeDef INTDET_POL_X)
{
    17ca:	14c3      	push      	r4-r6
    17cc:	9883      	ld.w      	r4, (r14, 0xc)
	//SYSCON->LVDCR=LVD_KEY;
	SYSCON->LVDCR=LVD_KEY|X_LVDEN|INTDET_LVL_X|RSTDET_LVL_X|X_LVD_INT|INTDET_POL_X;
    17ce:	13d5      	lrw      	r6, 0xb44b0000	// 19a0 <EXI1_WakeUp_Enable+0x34>
    17d0:	6d18      	or      	r4, r6
    17d2:	6cd0      	or      	r3, r4
    17d4:	6c8c      	or      	r2, r3
    17d6:	6c48      	or      	r1, r2
    17d8:	13a6      	lrw      	r5, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    17da:	6c04      	or      	r0, r1
    17dc:	95a0      	ld.w      	r5, (r5, 0x0)
    17de:	b513      	st.w      	r0, (r5, 0x4c)
}
    17e0:	1483      	pop      	r4-r6

000017e2 <LVD_Int_Enable>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void LVD_Int_Enable(void)
{
	SYSCON->ICR = LVD_INT_ST;				//clear LVD INT status
    17e2:	1364      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    17e4:	3180      	movi      	r1, 128
    17e6:	9360      	ld.w      	r3, (r3, 0x0)
    17e8:	3280      	movi      	r2, 128
    17ea:	604c      	addu      	r1, r3
    17ec:	4244      	lsli      	r2, r2, 4
    17ee:	b141      	st.w      	r2, (r1, 0x4)
	SYSCON->IMER  |= LVD_INT_ST;
    17f0:	935d      	ld.w      	r2, (r3, 0x74)
    17f2:	3aab      	bseti      	r2, 11
    17f4:	b35d      	st.w      	r2, (r3, 0x74)
}
    17f6:	783c      	jmp      	r15

000017f8 <LVD_Int_Disable>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void LVD_Int_Disable(void)
{
	SYSCON->IMDR  |= LVD_INT_ST;
    17f8:	127e      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    17fa:	9340      	ld.w      	r2, (r3, 0x0)
    17fc:	927e      	ld.w      	r3, (r2, 0x78)
    17fe:	3bab      	bseti      	r3, 11
    1800:	b27e      	st.w      	r3, (r2, 0x78)
}
    1802:	783c      	jmp      	r15

00001804 <IWDT_Int_Enable>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void IWDT_Int_Enable(void)
{
	SYSCON->ICR = IWDT_INT_ST;				//clear LVD INT status
    1804:	127b      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    1806:	3180      	movi      	r1, 128
    1808:	9360      	ld.w      	r3, (r3, 0x0)
    180a:	3280      	movi      	r2, 128
    180c:	604c      	addu      	r1, r3
    180e:	4241      	lsli      	r2, r2, 1
    1810:	b141      	st.w      	r2, (r1, 0x4)
	SYSCON->IMER  |= IWDT_INT_ST;
    1812:	935d      	ld.w      	r2, (r3, 0x74)
    1814:	3aa8      	bseti      	r2, 8
    1816:	b35d      	st.w      	r2, (r3, 0x74)
}
    1818:	783c      	jmp      	r15

0000181a <IWDT_Int_Disable>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void IWDT_Int_Disable(void)
{
	SYSCON->IMDR  |= IWDT_INT_ST;
    181a:	1276      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    181c:	9340      	ld.w      	r2, (r3, 0x0)
    181e:	927e      	ld.w      	r3, (r2, 0x78)
    1820:	3ba8      	bseti      	r3, 8
    1822:	b27e      	st.w      	r3, (r2, 0x78)
}
    1824:	783c      	jmp      	r15

00001826 <Read_Reset_Status>:
//rsr_dat=0x80 cpu request reset
//rsr_dat=0x100 software reset
/*************************************************************/
U32_T Read_Reset_Status(void)
{
	return (SYSCON->RSR & 0x1ff);
    1826:	1273      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    1828:	9360      	ld.w      	r3, (r3, 0x0)
    182a:	237f      	addi      	r3, 128
    182c:	9304      	ld.w      	r0, (r3, 0x10)
    182e:	127e      	lrw      	r3, 0x1ff	// 19a4 <EXI1_WakeUp_Enable+0x38>
    1830:	680c      	and      	r0, r3
}
    1832:	783c      	jmp      	r15

00001834 <EXTI_trigger_CMD>:
//EXI_tringer_mode:_EXIRT,_EXIFT
//ReturnValue: LVD detection flag
/*************************************************************/
void EXTI_trigger_CMD(FunctionalStatus NewState , SYSCON_EXIPIN_TypeDef  EXIPIN , EXI_tringer_mode_TypeDef EXI_tringer_mode)
{
	switch(EXI_tringer_mode)
    1834:	3a40      	cmpnei      	r2, 0
    1836:	0c04      	bf      	0x183e	// 183e <EXTI_trigger_CMD+0xa>
    1838:	3a41      	cmpnei      	r2, 1
    183a:	0c0e      	bf      	0x1856	// 1856 <EXTI_trigger_CMD+0x22>
		{
			SYSCON->EXIFT &=~EXIPIN;	
		}
		break;
	}	
}
    183c:	783c      	jmp      	r15
    183e:	126d      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
		if(NewState != DISABLE)
    1840:	3840      	cmpnei      	r0, 0
			SYSCON->EXIRT |=EXIPIN;
    1842:	9360      	ld.w      	r3, (r3, 0x0)
    1844:	237f      	addi      	r3, 128
    1846:	9345      	ld.w      	r2, (r3, 0x14)
		if(NewState != DISABLE)
    1848:	0c04      	bf      	0x1850	// 1850 <EXTI_trigger_CMD+0x1c>
			SYSCON->EXIRT |=EXIPIN;
    184a:	6c48      	or      	r1, r2
    184c:	b325      	st.w      	r1, (r3, 0x14)
    184e:	07f7      	br      	0x183c	// 183c <EXTI_trigger_CMD+0x8>
			SYSCON->EXIRT &=~EXIPIN;	
    1850:	6885      	andn      	r2, r1
    1852:	b345      	st.w      	r2, (r3, 0x14)
    1854:	07f4      	br      	0x183c	// 183c <EXTI_trigger_CMD+0x8>
    1856:	1267      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
		if(NewState != DISABLE)
    1858:	3840      	cmpnei      	r0, 0
			SYSCON->EXIFT |=EXIPIN;
    185a:	9360      	ld.w      	r3, (r3, 0x0)
    185c:	237f      	addi      	r3, 128
    185e:	9346      	ld.w      	r2, (r3, 0x18)
		if(NewState != DISABLE)
    1860:	0c04      	bf      	0x1868	// 1868 <EXTI_trigger_CMD+0x34>
			SYSCON->EXIFT |=EXIPIN;
    1862:	6c48      	or      	r1, r2
    1864:	b326      	st.w      	r1, (r3, 0x18)
    1866:	07eb      	br      	0x183c	// 183c <EXTI_trigger_CMD+0x8>
			SYSCON->EXIFT &=~EXIPIN;	
    1868:	6885      	andn      	r2, r1
    186a:	b346      	st.w      	r2, (r3, 0x18)
}
    186c:	07e8      	br      	0x183c	// 183c <EXTI_trigger_CMD+0x8>

0000186e <EXTI_interrupt_CMD>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void EXTI_interrupt_CMD(FunctionalStatus NewState , SYSCON_EXIPIN_TypeDef  EXIPIN)
{
	SYSCON->EXICR = 0X3FFF;									//Claer EXI INT status
    186e:	1261      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    1870:	124e      	lrw      	r2, 0x3fff	// 19a8 <EXI1_WakeUp_Enable+0x3c>
    1872:	9360      	ld.w      	r3, (r3, 0x0)
    1874:	237f      	addi      	r3, 128
	if(NewState != DISABLE)
    1876:	3840      	cmpnei      	r0, 0
	SYSCON->EXICR = 0X3FFF;									//Claer EXI INT status
    1878:	b34b      	st.w      	r2, (r3, 0x2c)
	if(NewState != DISABLE)
    187a:	0c0c      	bf      	0x1892	// 1892 <EXTI_interrupt_CMD+0x24>
	{
		SYSCON->EXIER|=EXIPIN;								//EXI4 interrupt enable
    187c:	9347      	ld.w      	r2, (r3, 0x1c)
    187e:	6c84      	or      	r2, r1
    1880:	b347      	st.w      	r2, (r3, 0x1c)
		while(!(SYSCON->EXIMR&EXIPIN));						//Check EXI is enabled or not
    1882:	9349      	ld.w      	r2, (r3, 0x24)
    1884:	6884      	and      	r2, r1
    1886:	3a40      	cmpnei      	r2, 0
    1888:	0ffd      	bf      	0x1882	// 1882 <EXTI_interrupt_CMD+0x14>
		SYSCON->EXICR |=EXIPIN;								// Clear EXI status bit
    188a:	934b      	ld.w      	r2, (r3, 0x2c)
    188c:	6c48      	or      	r1, r2
    188e:	b32b      	st.w      	r1, (r3, 0x2c)
	}
	else
	{
		SYSCON->EXIDR|=EXIPIN;
	}
}
    1890:	783c      	jmp      	r15
		SYSCON->EXIDR|=EXIPIN;
    1892:	9348      	ld.w      	r2, (r3, 0x20)
    1894:	6c48      	or      	r1, r2
    1896:	b328      	st.w      	r1, (r3, 0x20)
}
    1898:	07fc      	br      	0x1890	// 1890 <EXTI_interrupt_CMD+0x22>

0000189a <GPIO_EXTI_interrupt>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPIO_EXTI_interrupt(CSP_GPIO_T * GPIOX,U32_T GPIO_IECR_VALUE)
{
	GPIOX->IECR=GPIO_IECR_VALUE;
    189a:	b02b      	st.w      	r1, (r0, 0x2c)
}
    189c:	783c      	jmp      	r15

0000189e <PCLK_goto_idle_mode>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void PCLK_goto_idle_mode(void)
{
	asm ("doze");											// Enter sleep mode
    189e:	c0005020 	doze
}  
    18a2:	783c      	jmp      	r15

000018a4 <PCLK_goto_deepsleep_mode>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void PCLK_goto_deepsleep_mode(void)
{
	SYSCON->WKCR=0X3F<<8;
    18a4:	1173      	lrw      	r3, 0x20000070	// 1970 <EXI1_WakeUp_Enable+0x4>
    18a6:	9340      	ld.w      	r2, (r3, 0x0)
    18a8:	33fc      	movi      	r3, 252
    18aa:	4366      	lsli      	r3, r3, 6
    18ac:	b27b      	st.w      	r3, (r2, 0x6c)
	asm ("stop");
    18ae:	c0004820 	stop
}  
    18b2:	783c      	jmp      	r15

000018b4 <EXI0_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0_Int_Enable(void)
{
	INTC_ISER_WRITE(EXI0_INT);    
    18b4:	117e      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    18b6:	3280      	movi      	r2, 128
    18b8:	9360      	ld.w      	r3, (r3, 0x0)
    18ba:	23ff      	addi      	r3, 256
    18bc:	b340      	st.w      	r2, (r3, 0x0)
}
    18be:	783c      	jmp      	r15

000018c0 <EXI0_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0_Int_Disable(void)
{
    INTC_ICER_WRITE(EXI0_INT);    
    18c0:	117b      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    18c2:	32c0      	movi      	r2, 192
    18c4:	9360      	ld.w      	r3, (r3, 0x0)
    18c6:	4241      	lsli      	r2, r2, 1
    18c8:	60c8      	addu      	r3, r2
    18ca:	3280      	movi      	r2, 128
    18cc:	b340      	st.w      	r2, (r3, 0x0)
}
    18ce:	783c      	jmp      	r15

000018d0 <EXI1_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1_Int_Enable(void)
{
	INTC_ISER_WRITE(EXI1_INT);    
    18d0:	1177      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    18d2:	3280      	movi      	r2, 128
    18d4:	9360      	ld.w      	r3, (r3, 0x0)
    18d6:	23ff      	addi      	r3, 256
    18d8:	4241      	lsli      	r2, r2, 1
    18da:	b340      	st.w      	r2, (r3, 0x0)
}
    18dc:	783c      	jmp      	r15

000018de <EXI1_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1_Int_Disable(void)
{
    INTC_ICER_WRITE(EXI1_INT);    
    18de:	1174      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    18e0:	32c0      	movi      	r2, 192
    18e2:	9360      	ld.w      	r3, (r3, 0x0)
    18e4:	4241      	lsli      	r2, r2, 1
    18e6:	60c8      	addu      	r3, r2
    18e8:	3280      	movi      	r2, 128
    18ea:	4241      	lsli      	r2, r2, 1
    18ec:	b340      	st.w      	r2, (r3, 0x0)
}
    18ee:	783c      	jmp      	r15

000018f0 <EXI2_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2_Int_Enable(void)
{
	INTC_ISER_WRITE(EXI2_INT);    
    18f0:	116f      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    18f2:	3280      	movi      	r2, 128
    18f4:	9360      	ld.w      	r3, (r3, 0x0)
    18f6:	23ff      	addi      	r3, 256
    18f8:	424e      	lsli      	r2, r2, 14
    18fa:	b340      	st.w      	r2, (r3, 0x0)
}
    18fc:	783c      	jmp      	r15

000018fe <EXI2_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2_Int_Disable(void)
{
    INTC_ICER_WRITE(EXI2_INT);    
    18fe:	116c      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    1900:	32c0      	movi      	r2, 192
    1902:	9360      	ld.w      	r3, (r3, 0x0)
    1904:	4241      	lsli      	r2, r2, 1
    1906:	60c8      	addu      	r3, r2
    1908:	3280      	movi      	r2, 128
    190a:	424e      	lsli      	r2, r2, 14
    190c:	b340      	st.w      	r2, (r3, 0x0)
}
    190e:	783c      	jmp      	r15

00001910 <EXI3_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI3_Int_Enable(void)
{
	INTC_ISER_WRITE(EXI3_INT);    
    1910:	1167      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    1912:	3280      	movi      	r2, 128
    1914:	9360      	ld.w      	r3, (r3, 0x0)
    1916:	23ff      	addi      	r3, 256
    1918:	424f      	lsli      	r2, r2, 15
    191a:	b340      	st.w      	r2, (r3, 0x0)
}
    191c:	783c      	jmp      	r15

0000191e <EXI3_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI3_Int_Disable(void)
{
    INTC_ICER_WRITE(EXI3_INT);    
    191e:	1164      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    1920:	32c0      	movi      	r2, 192
    1922:	9360      	ld.w      	r3, (r3, 0x0)
    1924:	4241      	lsli      	r2, r2, 1
    1926:	60c8      	addu      	r3, r2
    1928:	3280      	movi      	r2, 128
    192a:	424f      	lsli      	r2, r2, 15
    192c:	b340      	st.w      	r2, (r3, 0x0)
}
    192e:	783c      	jmp      	r15

00001930 <EXI4_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI4_Int_Enable(void)
{
	INTC_ISER_WRITE(EXI4_INT);    
    1930:	107f      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    1932:	3280      	movi      	r2, 128
    1934:	9360      	ld.w      	r3, (r3, 0x0)
    1936:	23ff      	addi      	r3, 256
    1938:	4250      	lsli      	r2, r2, 16
    193a:	b340      	st.w      	r2, (r3, 0x0)
}
    193c:	783c      	jmp      	r15

0000193e <EXI4_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI4_Int_Disable(void)
{
    INTC_ICER_WRITE(EXI4_INT);    
    193e:	107c      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    1940:	32c0      	movi      	r2, 192
    1942:	9360      	ld.w      	r3, (r3, 0x0)
    1944:	4241      	lsli      	r2, r2, 1
    1946:	60c8      	addu      	r3, r2
    1948:	3280      	movi      	r2, 128
    194a:	4250      	lsli      	r2, r2, 16
    194c:	b340      	st.w      	r2, (r3, 0x0)
}
    194e:	783c      	jmp      	r15

00001950 <EXI0_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(EXI0_INT);    
    1950:	1077      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    1952:	3280      	movi      	r2, 128
    1954:	9360      	ld.w      	r3, (r3, 0x0)
    1956:	23ff      	addi      	r3, 256
    1958:	b350      	st.w      	r2, (r3, 0x40)
}
    195a:	783c      	jmp      	r15

0000195c <EXI0_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(EXI0_INT);    
    195c:	1074      	lrw      	r3, 0x20000078	// 19ac <EXI1_WakeUp_Enable+0x40>
    195e:	32e0      	movi      	r2, 224
    1960:	9360      	ld.w      	r3, (r3, 0x0)
    1962:	4241      	lsli      	r2, r2, 1
    1964:	60c8      	addu      	r3, r2
    1966:	3280      	movi      	r2, 128
    1968:	b340      	st.w      	r2, (r3, 0x0)
}
    196a:	783c      	jmp      	r15

0000196c <EXI1_WakeUp_Enable>:
//EXI1 Wake up enable
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1_WakeUp_Enable(void)
{
    196c:	0422      	br      	0x19b0	// 19b0 <EXI1_WakeUp_Enable+0x44>
    196e:	0000      	bkpt
    1970:	20000070 	.long	0x20000070
    1974:	0000ffff 	.long	0x0000ffff
    1978:	00ffffff 	.long	0x00ffffff
    197c:	d22d0000 	.long	0xd22d0000
    1980:	70ff3bff 	.long	0x70ff3bff
    1984:	0000070c 	.long	0x0000070c
    1988:	000003fe 	.long	0x000003fe
    198c:	20000074 	.long	0x20000074
    1990:	c33c0000 	.long	0xc33c0000
    1994:	78870000 	.long	0x78870000
    1998:	788755aa 	.long	0x788755aa
    199c:	87780000 	.long	0x87780000
    19a0:	b44b0000 	.long	0xb44b0000
    19a4:	000001ff 	.long	0x000001ff
    19a8:	00003fff 	.long	0x00003fff
    19ac:	20000078 	.long	0x20000078
    INTC_IWER_WRITE(EXI1_INT);    
    19b0:	007d      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    19b2:	3280      	movi      	r2, 128
    19b4:	9360      	ld.w      	r3, (r3, 0x0)
    19b6:	23ff      	addi      	r3, 256
    19b8:	4241      	lsli      	r2, r2, 1
    19ba:	b350      	st.w      	r2, (r3, 0x40)
}
    19bc:	783c      	jmp      	r15

000019be <EXI1_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(EXI1_INT);    
    19be:	0160      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    19c0:	32e0      	movi      	r2, 224
    19c2:	9360      	ld.w      	r3, (r3, 0x0)
    19c4:	4241      	lsli      	r2, r2, 1
    19c6:	60c8      	addu      	r3, r2
    19c8:	3280      	movi      	r2, 128
    19ca:	4241      	lsli      	r2, r2, 1
    19cc:	b340      	st.w      	r2, (r3, 0x0)
}
    19ce:	783c      	jmp      	r15

000019d0 <EXI2_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(EXI2_INT);    
    19d0:	0165      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    19d2:	3280      	movi      	r2, 128
    19d4:	9360      	ld.w      	r3, (r3, 0x0)
    19d6:	23ff      	addi      	r3, 256
    19d8:	424e      	lsli      	r2, r2, 14
    19da:	b350      	st.w      	r2, (r3, 0x40)
}
    19dc:	783c      	jmp      	r15

000019de <EXI2_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(EXI2_INT);    
    19de:	0168      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    19e0:	32e0      	movi      	r2, 224
    19e2:	9360      	ld.w      	r3, (r3, 0x0)
    19e4:	4241      	lsli      	r2, r2, 1
    19e6:	60c8      	addu      	r3, r2
    19e8:	3280      	movi      	r2, 128
    19ea:	424e      	lsli      	r2, r2, 14
    19ec:	b340      	st.w      	r2, (r3, 0x0)
}
    19ee:	783c      	jmp      	r15

000019f0 <EXI3_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI3_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(EXI3_INT);    
    19f0:	016d      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    19f2:	3280      	movi      	r2, 128
    19f4:	9360      	ld.w      	r3, (r3, 0x0)
    19f6:	23ff      	addi      	r3, 256
    19f8:	424f      	lsli      	r2, r2, 15
    19fa:	b350      	st.w      	r2, (r3, 0x40)
}
    19fc:	783c      	jmp      	r15

000019fe <EXI3_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI3_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(EXI3_INT);    
    19fe:	0170      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    1a00:	32e0      	movi      	r2, 224
    1a02:	9360      	ld.w      	r3, (r3, 0x0)
    1a04:	4241      	lsli      	r2, r2, 1
    1a06:	60c8      	addu      	r3, r2
    1a08:	3280      	movi      	r2, 128
    1a0a:	424f      	lsli      	r2, r2, 15
    1a0c:	b340      	st.w      	r2, (r3, 0x0)
}
    1a0e:	783c      	jmp      	r15

00001a10 <EXI4_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI4_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(EXI4_INT);    
    1a10:	0175      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    1a12:	3280      	movi      	r2, 128
    1a14:	9360      	ld.w      	r3, (r3, 0x0)
    1a16:	23ff      	addi      	r3, 256
    1a18:	4250      	lsli      	r2, r2, 16
    1a1a:	b350      	st.w      	r2, (r3, 0x40)
}
    1a1c:	783c      	jmp      	r15

00001a1e <EXI4_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI4_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(EXI4_INT);    
    1a1e:	0178      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    1a20:	32e0      	movi      	r2, 224
    1a22:	9360      	ld.w      	r3, (r3, 0x0)
    1a24:	4241      	lsli      	r2, r2, 1
    1a26:	60c8      	addu      	r3, r2
    1a28:	3280      	movi      	r2, 128
    1a2a:	4250      	lsli      	r2, r2, 16
    1a2c:	b340      	st.w      	r2, (r3, 0x0)
}
    1a2e:	783c      	jmp      	r15

00001a30 <SYSCON_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_Int_Enable(void)
{
    INTC_ISER_WRITE(SYSCON_INT);    
    1a30:	017d      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    1a32:	3202      	movi      	r2, 2
    1a34:	9360      	ld.w      	r3, (r3, 0x0)
    1a36:	23ff      	addi      	r3, 256
    1a38:	b340      	st.w      	r2, (r3, 0x0)
}
    1a3a:	783c      	jmp      	r15

00001a3c <SYSCON_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_Int_Disable(void)
{
    INTC_ICER_WRITE(SYSCON_INT);    
    1a3c:	0260      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    1a3e:	32c0      	movi      	r2, 192
    1a40:	9360      	ld.w      	r3, (r3, 0x0)
    1a42:	4241      	lsli      	r2, r2, 1
    1a44:	60c8      	addu      	r3, r2
    1a46:	3202      	movi      	r2, 2
    1a48:	b340      	st.w      	r2, (r3, 0x0)
}
    1a4a:	783c      	jmp      	r15

00001a4c <SYSCON_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(SYSCON_INT);    
    1a4c:	0264      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    1a4e:	3202      	movi      	r2, 2
    1a50:	9360      	ld.w      	r3, (r3, 0x0)
    1a52:	23ff      	addi      	r3, 256
    1a54:	b350      	st.w      	r2, (r3, 0x40)
}
    1a56:	783c      	jmp      	r15

00001a58 <SYSCON_CLO_CONFIG>:
//EntryParameter:CLO_PA02/CLO_PA08
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CLO_CONFIG(CLO_IO_TypeDef clo_io)
{
	if (clo_io==CLO_PA13)
    1a58:	3840      	cmpnei      	r0, 0
    1a5a:	080b      	bt      	0x1a70	// 1a70 <SYSCON_CLO_CONFIG+0x18>
	{
		GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFF0FFF) | 0X00006000;
    1a5c:	0267      	lrw      	r3, 0x20000010	// 1d3c <GPIO_Remap+0x1d8>
    1a5e:	32f0      	movi      	r2, 240
    1a60:	9320      	ld.w      	r1, (r3, 0x0)
    1a62:	9160      	ld.w      	r3, (r1, 0x0)
    1a64:	4248      	lsli      	r2, r2, 8
    1a66:	68c9      	andn      	r3, r2
    1a68:	3bad      	bseti      	r3, 13
    1a6a:	3bae      	bseti      	r3, 14
	}
	if (clo_io==CLO_PB03)
	{
		GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF) | 0X00004000;
    1a6c:	b160      	st.w      	r3, (r1, 0x0)
	if (clo_io==CLO_PA08)
	{
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0) | 0X00000007;
	}
	
}
    1a6e:	783c      	jmp      	r15
	if (clo_io==CLO_PB03)
    1a70:	3841      	cmpnei      	r0, 1
    1a72:	0809      	bt      	0x1a84	// 1a84 <SYSCON_CLO_CONFIG+0x2c>
		GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF) | 0X00004000;
    1a74:	026c      	lrw      	r3, 0x2000000c	// 1d40 <GPIO_Remap+0x1dc>
    1a76:	32f0      	movi      	r2, 240
    1a78:	9320      	ld.w      	r1, (r3, 0x0)
    1a7a:	9160      	ld.w      	r3, (r1, 0x0)
    1a7c:	4248      	lsli      	r2, r2, 8
    1a7e:	68c9      	andn      	r3, r2
    1a80:	3bae      	bseti      	r3, 14
    1a82:	07f5      	br      	0x1a6c	// 1a6c <SYSCON_CLO_CONFIG+0x14>
	if (clo_io==CLO_PC01)
    1a84:	3842      	cmpnei      	r0, 2
    1a86:	080a      	bt      	0x1a9a	// 1a9a <SYSCON_CLO_CONFIG+0x42>
		GPIOC0->CONLR = (GPIOC0->CONLR&0XFFFFFF0F) | 0X00000050;
    1a88:	0270      	lrw      	r3, 0x20000008	// 1d44 <GPIO_Remap+0x1e0>
    1a8a:	31f0      	movi      	r1, 240
    1a8c:	9340      	ld.w      	r2, (r3, 0x0)
    1a8e:	9260      	ld.w      	r3, (r2, 0x0)
    1a90:	68c5      	andn      	r3, r1
    1a92:	3ba4      	bseti      	r3, 4
    1a94:	3ba6      	bseti      	r3, 6
    1a96:	b260      	st.w      	r3, (r2, 0x0)
    1a98:	07eb      	br      	0x1a6e	// 1a6e <SYSCON_CLO_CONFIG+0x16>
	if (clo_io==CLO_PA08)
    1a9a:	3843      	cmpnei      	r0, 3
    1a9c:	0be9      	bt      	0x1a6e	// 1a6e <SYSCON_CLO_CONFIG+0x16>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0) | 0X00000007;
    1a9e:	0274      	lrw      	r3, 0x20000014	// 1d48 <GPIO_Remap+0x1e4>
    1aa0:	310f      	movi      	r1, 15
    1aa2:	9340      	ld.w      	r2, (r3, 0x0)
    1aa4:	9261      	ld.w      	r3, (r2, 0x4)
    1aa6:	68c5      	andn      	r3, r1
    1aa8:	3107      	movi      	r1, 7
    1aaa:	6cc4      	or      	r3, r1
    1aac:	b261      	st.w      	r3, (r2, 0x4)
}
    1aae:	07e0      	br      	0x1a6e	// 1a6e <SYSCON_CLO_CONFIG+0x16>

00001ab0 <SYSCON_CLO_SRC_SET>:
//set CLO clk and div
//EntryParameter:clomxr/clodivr
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CLO_SRC_SET(SystemClk_CLOMX_TypeDef clomxr,SystemClk_CLODIV_TypeDef clodivr)
{
    1ab0:	14c1      	push      	r4
	SYSCON->OPT1=(SYSCON->OPT1 & 0XFFFF00FF)|(clomxr<<8)|(clodivr<<12);
    1ab2:	0278      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1ab4:	34ff      	movi      	r4, 255
    1ab6:	9340      	ld.w      	r2, (r3, 0x0)
    1ab8:	9279      	ld.w      	r3, (r2, 0x64)
    1aba:	4488      	lsli      	r4, r4, 8
    1abc:	68d1      	andn      	r3, r4
    1abe:	412c      	lsli      	r1, r1, 12
    1ac0:	6c4c      	or      	r1, r3
    1ac2:	4008      	lsli      	r0, r0, 8
    1ac4:	6c04      	or      	r0, r1
    1ac6:	b219      	st.w      	r0, (r2, 0x64)
}
    1ac8:	1481      	pop      	r4

00001aca <SYSCON_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(SYSCON_INT);    
    1aca:	0363      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    1acc:	32e0      	movi      	r2, 224
    1ace:	9360      	ld.w      	r3, (r3, 0x0)
    1ad0:	4241      	lsli      	r2, r2, 1
    1ad2:	60c8      	addu      	r3, r2
    1ad4:	3202      	movi      	r2, 2
    1ad6:	b340      	st.w      	r2, (r3, 0x0)
}
    1ad8:	783c      	jmp      	r15

00001ada <SYSCON_Read_CINF0>:
//ReturnValue:VALUE
/*************************************************************/
U32_T SYSCON_Read_CINF0(void)
{
    U32_T value = 0;
    value=SYSCON->CINF0;
    1ada:	0362      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1adc:	9360      	ld.w      	r3, (r3, 0x0)
    1ade:	237f      	addi      	r3, 128
    1ae0:	9312      	ld.w      	r0, (r3, 0x48)
    return value;
}
    1ae2:	783c      	jmp      	r15

00001ae4 <SYSCON_Read_CINF1>:
//ReturnValue:VALUE
/*************************************************************/
U32_T SYSCON_Read_CINF1(void)
{
    U32_T value = 0;
    value=SYSCON->CINF1;
    1ae4:	0365      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1ae6:	9360      	ld.w      	r3, (r3, 0x0)
    1ae8:	237f      	addi      	r3, 128
    1aea:	9313      	ld.w      	r0, (r3, 0x4c)
    return value;
}
    1aec:	783c      	jmp      	r15

00001aee <SYSCON_Software_Reset>:
//EntryParameter:None
//ReturnValue:MCU reset
/*************************************************************/
void SYSCON_Software_Reset(void)
{
	SYSCON->IDCCR=IDCCR_KEY|SWRST;
    1aee:	0367      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1af0:	0347      	lrw      	r2, 0xe11e0080	// 1d50 <GPIO_Remap+0x1ec>
    1af2:	9360      	ld.w      	r3, (r3, 0x0)
    1af4:	b340      	st.w      	r2, (r3, 0x0)
}
    1af6:	783c      	jmp      	r15

00001af8 <SYSCON_INT_Priority>:
//80:Priority 2
//C0:Priority 3		lowest
/*************************************************************/
void SYSCON_INT_Priority(void)
{
	INTC_IPR0_WRITE(0XC0C0C0C0);   //IQR0-3  low bit-->high bit
    1af8:	036f      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
    1afa:	3180      	movi      	r1, 128
    1afc:	9360      	ld.w      	r3, (r3, 0x0)
    1afe:	4123      	lsli      	r1, r1, 3
    1b00:	034a      	lrw      	r2, 0xc0c0c0c0	// 1d54 <GPIO_Remap+0x1f0>
    1b02:	604c      	addu      	r1, r3
    1b04:	b140      	st.w      	r2, (r1, 0x0)
	INTC_IPR1_WRITE(0XC0C0C0C0);   //IQR4-7  
    1b06:	032a      	lrw      	r1, 0x404	// 1d58 <GPIO_Remap+0x1f4>
    1b08:	604c      	addu      	r1, r3
    1b0a:	b140      	st.w      	r2, (r1, 0x0)
	INTC_IPR2_WRITE(0XC0C0C0C0);   //IQR8-11  
    1b0c:	3181      	movi      	r1, 129
    1b0e:	4123      	lsli      	r1, r1, 3
    1b10:	604c      	addu      	r1, r3
    1b12:	b140      	st.w      	r2, (r1, 0x0)
	INTC_IPR3_WRITE(0XC0C0C0C0);   //IQR12-15  
    1b14:	032d      	lrw      	r1, 0x40c	// 1d5c <GPIO_Remap+0x1f8>
    1b16:	604c      	addu      	r1, r3
    1b18:	b140      	st.w      	r2, (r1, 0x0)
	INTC_IPR4_WRITE(0XC0C0C0C0);   //IQR16-19  
    1b1a:	3182      	movi      	r1, 130
    1b1c:	4123      	lsli      	r1, r1, 3
    1b1e:	604c      	addu      	r1, r3
    1b20:	b140      	st.w      	r2, (r1, 0x0)
	INTC_IPR5_WRITE(0XC0C0C0C0);   //IQR20-23 
    1b22:	032f      	lrw      	r1, 0x414	// 1d60 <GPIO_Remap+0x1fc>
    1b24:	604c      	addu      	r1, r3
    1b26:	b140      	st.w      	r2, (r1, 0x0)
	INTC_IPR6_WRITE(0XC0C000C0);   //IQR24-27  
    1b28:	3183      	movi      	r1, 131
    1b2a:	4123      	lsli      	r1, r1, 3
    1b2c:	604c      	addu      	r1, r3
    1b2e:	0311      	lrw      	r0, 0xc0c000c0	// 1d64 <GPIO_Remap+0x200>
    1b30:	b100      	st.w      	r0, (r1, 0x0)
	INTC_IPR7_WRITE(0XC0C0C0C0);   //IQR28-31
    1b32:	0331      	lrw      	r1, 0x41c	// 1d68 <GPIO_Remap+0x204>
    1b34:	60c4      	addu      	r3, r1
    1b36:	b340      	st.w      	r2, (r3, 0x0)
}
    1b38:	783c      	jmp      	r15

00001b3a <Set_INT_Priority>:
//int_name:CORET_IRQ~BT1_IRQ
//int_level:0~3  0=highest   3=lowest
//ReturnValue:None
/*************************************************************/
void Set_INT_Priority(U8_T int_name,U8_T int_level)
{
    1b3a:	14c1      	push      	r4
    1b3c:	4862      	lsri      	r3, r0, 2
    1b3e:	4342      	lsli      	r2, r3, 2
    1b40:	137e      	lrw      	r3, 0x20000078	// 1d38 <GPIO_Remap+0x1d4>
	U8_T i_temp,j_temp;
	U32_T k_temp;
	i_temp=(int_name%4)*8;
    1b42:	3403      	movi      	r4, 3
    1b44:	9360      	ld.w      	r3, (r3, 0x0)
    1b46:	60c8      	addu      	r3, r2
	j_temp=int_name/4;
	k_temp=CK802 -> IPR[j_temp]&(~(0xff<<i_temp));
    1b48:	3280      	movi      	r2, 128
    1b4a:	4243      	lsli      	r2, r2, 3
	i_temp=(int_name%4)*8;
    1b4c:	6810      	and      	r0, r4
	k_temp=CK802 -> IPR[j_temp]&(~(0xff<<i_temp));
    1b4e:	60c8      	addu      	r3, r2
    1b50:	4003      	lsli      	r0, r0, 3
    1b52:	34ff      	movi      	r4, 255
    1b54:	9340      	ld.w      	r2, (r3, 0x0)
    1b56:	7100      	lsl      	r4, r0
	CK802 -> IPR[j_temp]=k_temp|((int_level*0x40)<<(i_temp));
    1b58:	4126      	lsli      	r1, r1, 6
	k_temp=CK802 -> IPR[j_temp]&(~(0xff<<i_temp));
    1b5a:	6891      	andn      	r2, r4
	CK802 -> IPR[j_temp]=k_temp|((int_level*0x40)<<(i_temp));
    1b5c:	7040      	lsl      	r1, r0
    1b5e:	6c48      	or      	r1, r2
    1b60:	b320      	st.w      	r1, (r3, 0x0)
}
    1b62:	1481      	pop      	r4

00001b64 <GPIO_Remap>:
//0x00=UART0_RX 0X01=UART0_TX 0X02=EPT_CHAX 0X03=PT_CHBX
//0X04=PT_CHCX 0X05=PT_CHAY 0X06=PT_CHBY 0X07=PT_CHCY
//ReturnValue:NONE
/*************************************************************/
void GPIO_Remap(CSP_GPIO_T *GPIOx,uint8_t bit,IOMAP_DIR_TypeDef iomap_data)
{
    1b64:	14c4      	push      	r4-r7
	U8_T i;
	if(iomap_data&0x10)
    1b66:	3310      	movi      	r3, 16
    1b68:	68c8      	and      	r3, r2
    1b6a:	3b40      	cmpnei      	r3, 0
    1b6c:	0caa      	bf      	0x1cc0	// 1cc0 <GPIO_Remap+0x15c>
	{
		iomap_data=iomap_data&0X0F;
    1b6e:	330f      	movi      	r3, 15
    1b70:	688c      	and      	r2, r3
		if(iomap_data==0)
    1b72:	3a40      	cmpnei      	r2, 0
    1b74:	0c12      	bf      	0x1b98	// 1b98 <GPIO_Remap+0x34>
				{
					SYSCON->IOMAP1=SYSCON->IOMAP1|(0xf<<i);
				}
			}
		}
		if(bit==2){SYSCON->IOMAP1=(SYSCON->IOMAP1&0xfffffff0)|iomap_data;(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFFF0FF) | 0x00000A00;}
    1b76:	3942      	cmpnei      	r1, 2
    1b78:	0822      	bt      	0x1bbc	// 1bbc <GPIO_Remap+0x58>
    1b7a:	1375      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1b7c:	340f      	movi      	r4, 15
    1b7e:	9320      	ld.w      	r1, (r3, 0x0)
    1b80:	217f      	addi      	r1, 128
    1b82:	9171      	ld.w      	r3, (r1, 0x44)
    1b84:	68d1      	andn      	r3, r4
    1b86:	6c8c      	or      	r2, r3
    1b88:	b151      	st.w      	r2, (r1, 0x44)
    1b8a:	32f0      	movi      	r2, 240
    1b8c:	9060      	ld.w      	r3, (r0, 0x0)
    1b8e:	4244      	lsli      	r2, r2, 4
    1b90:	68c9      	andn      	r3, r2
				}
			}
		}
		if(bit==0){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xfffffff0)|iomap_data;(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFFFFF0) | 0x0000000A;}
		if(bit==1){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xffffff0f)|(iomap_data<<4);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFFFF0F) | 0x000000A0;}
		if(bit==2){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xfffff0ff)|(iomap_data<<8);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFFF0FF) | 0x00000A00;}
    1b92:	3ba9      	bseti      	r3, 9
    1b94:	3bab      	bseti      	r3, 11
    1b96:	04c7      	br      	0x1d24	// 1d24 <GPIO_Remap+0x1c0>
				if((SYSCON->IOMAP1&(0xf<<i))==0)
    1b98:	136d      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1b9a:	3400      	movi      	r4, 0
    1b9c:	9360      	ld.w      	r3, (r3, 0x0)
    1b9e:	237f      	addi      	r3, 128
    1ba0:	360f      	movi      	r6, 15
    1ba2:	6d5b      	mov      	r5, r6
    1ba4:	93f1      	ld.w      	r7, (r3, 0x44)
    1ba6:	7150      	lsl      	r5, r4
    1ba8:	69d4      	and      	r7, r5
    1baa:	3f40      	cmpnei      	r7, 0
    1bac:	0804      	bt      	0x1bb4	// 1bb4 <GPIO_Remap+0x50>
					SYSCON->IOMAP1=SYSCON->IOMAP1|(0xf<<i);
    1bae:	93f1      	ld.w      	r7, (r3, 0x44)
    1bb0:	6d5c      	or      	r5, r7
    1bb2:	b3b1      	st.w      	r5, (r3, 0x44)
    1bb4:	2403      	addi      	r4, 4
			for(i=0;i<28;i+=4)
    1bb6:	3c5c      	cmpnei      	r4, 28
    1bb8:	0bf5      	bt      	0x1ba2	// 1ba2 <GPIO_Remap+0x3e>
    1bba:	07de      	br      	0x1b76	// 1b76 <GPIO_Remap+0x12>
		if(bit==3){SYSCON->IOMAP1=(SYSCON->IOMAP1&0xffffff0f)|(iomap_data<<4);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFF0FFF) | 0x0000A000;}
    1bbc:	3943      	cmpnei      	r1, 3
    1bbe:	0811      	bt      	0x1be0	// 1be0 <GPIO_Remap+0x7c>
    1bc0:	1363      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1bc2:	34f0      	movi      	r4, 240
    1bc4:	9320      	ld.w      	r1, (r3, 0x0)
    1bc6:	217f      	addi      	r1, 128
    1bc8:	9171      	ld.w      	r3, (r1, 0x44)
    1bca:	68d1      	andn      	r3, r4
    1bcc:	4244      	lsli      	r2, r2, 4
    1bce:	6c8c      	or      	r2, r3
    1bd0:	b151      	st.w      	r2, (r1, 0x44)
    1bd2:	32f0      	movi      	r2, 240
    1bd4:	9060      	ld.w      	r3, (r0, 0x0)
    1bd6:	4248      	lsli      	r2, r2, 8
    1bd8:	68c9      	andn      	r3, r2
		if(bit==3){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xffff0fff)|(iomap_data<<12);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFF0FFF) | 0x0000A000;}
    1bda:	3bad      	bseti      	r3, 13
    1bdc:	3baf      	bseti      	r3, 15
    1bde:	04a3      	br      	0x1d24	// 1d24 <GPIO_Remap+0x1c0>
		if(bit==8){SYSCON->IOMAP1=(SYSCON->IOMAP1&0xfffff0ff)|(iomap_data<<8);(GPIOx)->CONHR =((GPIOx)->CONHR&0XFFFFFFF0) | 0x0000000A;}
    1be0:	3948      	cmpnei      	r1, 8
    1be2:	0812      	bt      	0x1c06	// 1c06 <GPIO_Remap+0xa2>
    1be4:	127a      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1be6:	34f0      	movi      	r4, 240
    1be8:	9320      	ld.w      	r1, (r3, 0x0)
    1bea:	217f      	addi      	r1, 128
    1bec:	9171      	ld.w      	r3, (r1, 0x44)
    1bee:	4484      	lsli      	r4, r4, 4
    1bf0:	68d1      	andn      	r3, r4
    1bf2:	4248      	lsli      	r2, r2, 8
    1bf4:	6c8c      	or      	r2, r3
    1bf6:	b151      	st.w      	r2, (r1, 0x44)
    1bf8:	9061      	ld.w      	r3, (r0, 0x4)
    1bfa:	320f      	movi      	r2, 15
    1bfc:	68c9      	andn      	r3, r2
    1bfe:	3ba1      	bseti      	r3, 1
    1c00:	3ba3      	bseti      	r3, 3
		if(bit==10){SYSCON->IOMAP1=(SYSCON->IOMAP1&0xfff0ffff)|(iomap_data<<16);(GPIOx)->CONHR =((GPIOx)->CONHR&0XFFFFF0FF) | 0x00000A00;}
    1c02:	b061      	st.w      	r3, (r0, 0x4)
		if(bit==4){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xfff0ffff)|(iomap_data<<16);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFF0FFFF) | 0x000A0000;}
		if(bit==5){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xff0fffff)|(iomap_data<<20);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFF0FFFFF) | 0x00A00000;}
		if(bit==6){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xf0ffffff)|(iomap_data<<24);(GPIOx)->CONLR =((GPIOx)->CONLR&0XF0FFFFFF) | 0x0A000000;}
		if(bit==7){SYSCON->IOMAP0=(SYSCON->IOMAP0&0x0fffffff)|(iomap_data<<28);(GPIOx)->CONLR =((GPIOx)->CONLR&0X0FFFFFFF) | 0x0A0000000;}
	}
}
    1c04:	1484      	pop      	r4-r7
		if(bit==9){SYSCON->IOMAP1=(SYSCON->IOMAP1&0xffff0fff)|(iomap_data<<12);(GPIOx)->CONHR =((GPIOx)->CONHR&0XFFFFFF0F) | 0x000000A0;}
    1c06:	3949      	cmpnei      	r1, 9
    1c08:	0811      	bt      	0x1c2a	// 1c2a <GPIO_Remap+0xc6>
    1c0a:	1271      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1c0c:	34f0      	movi      	r4, 240
    1c0e:	9320      	ld.w      	r1, (r3, 0x0)
    1c10:	217f      	addi      	r1, 128
    1c12:	9171      	ld.w      	r3, (r1, 0x44)
    1c14:	4488      	lsli      	r4, r4, 8
    1c16:	68d1      	andn      	r3, r4
    1c18:	424c      	lsli      	r2, r2, 12
    1c1a:	6c8c      	or      	r2, r3
    1c1c:	b151      	st.w      	r2, (r1, 0x44)
    1c1e:	9061      	ld.w      	r3, (r0, 0x4)
    1c20:	32f0      	movi      	r2, 240
    1c22:	68c9      	andn      	r3, r2
    1c24:	3ba5      	bseti      	r3, 5
    1c26:	3ba7      	bseti      	r3, 7
    1c28:	07ed      	br      	0x1c02	// 1c02 <GPIO_Remap+0x9e>
		if(bit==10){SYSCON->IOMAP1=(SYSCON->IOMAP1&0xfff0ffff)|(iomap_data<<16);(GPIOx)->CONHR =((GPIOx)->CONHR&0XFFFFF0FF) | 0x00000A00;}
    1c2a:	394a      	cmpnei      	r1, 10
    1c2c:	0812      	bt      	0x1c50	// 1c50 <GPIO_Remap+0xec>
    1c2e:	1268      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1c30:	34f0      	movi      	r4, 240
    1c32:	9320      	ld.w      	r1, (r3, 0x0)
    1c34:	217f      	addi      	r1, 128
    1c36:	9171      	ld.w      	r3, (r1, 0x44)
    1c38:	448c      	lsli      	r4, r4, 12
    1c3a:	68d1      	andn      	r3, r4
    1c3c:	4250      	lsli      	r2, r2, 16
    1c3e:	6c8c      	or      	r2, r3
    1c40:	b151      	st.w      	r2, (r1, 0x44)
    1c42:	32f0      	movi      	r2, 240
    1c44:	9061      	ld.w      	r3, (r0, 0x4)
    1c46:	4244      	lsli      	r2, r2, 4
    1c48:	68c9      	andn      	r3, r2
    1c4a:	3ba9      	bseti      	r3, 9
    1c4c:	3bab      	bseti      	r3, 11
    1c4e:	07da      	br      	0x1c02	// 1c02 <GPIO_Remap+0x9e>
		if(bit==11){SYSCON->IOMAP1=(SYSCON->IOMAP1&0xff0fffff)|(iomap_data<<20);(GPIOx)->CONHR =((GPIOx)->CONHR&0XFFFF0FFF) | 0x0000A000;}
    1c50:	394b      	cmpnei      	r1, 11
    1c52:	0812      	bt      	0x1c76	// 1c76 <GPIO_Remap+0x112>
    1c54:	117e      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1c56:	34f0      	movi      	r4, 240
    1c58:	9320      	ld.w      	r1, (r3, 0x0)
    1c5a:	217f      	addi      	r1, 128
    1c5c:	9171      	ld.w      	r3, (r1, 0x44)
    1c5e:	4490      	lsli      	r4, r4, 16
    1c60:	68d1      	andn      	r3, r4
    1c62:	4254      	lsli      	r2, r2, 20
    1c64:	6c8c      	or      	r2, r3
    1c66:	b151      	st.w      	r2, (r1, 0x44)
    1c68:	32f0      	movi      	r2, 240
    1c6a:	9061      	ld.w      	r3, (r0, 0x4)
    1c6c:	4248      	lsli      	r2, r2, 8
    1c6e:	68c9      	andn      	r3, r2
    1c70:	3bad      	bseti      	r3, 13
    1c72:	3baf      	bseti      	r3, 15
    1c74:	07c7      	br      	0x1c02	// 1c02 <GPIO_Remap+0x9e>
		if(bit==12){SYSCON->IOMAP1=(SYSCON->IOMAP1&0xf0ffffff)|(iomap_data<<24);(GPIOx)->CONHR =((GPIOx)->CONHR&0XFFF0FFFF) | 0x000A0000;}
    1c76:	394c      	cmpnei      	r1, 12
    1c78:	0812      	bt      	0x1c9c	// 1c9c <GPIO_Remap+0x138>
    1c7a:	1175      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1c7c:	34f0      	movi      	r4, 240
    1c7e:	9320      	ld.w      	r1, (r3, 0x0)
    1c80:	217f      	addi      	r1, 128
    1c82:	9171      	ld.w      	r3, (r1, 0x44)
    1c84:	4494      	lsli      	r4, r4, 20
    1c86:	68d1      	andn      	r3, r4
    1c88:	4258      	lsli      	r2, r2, 24
    1c8a:	6c8c      	or      	r2, r3
    1c8c:	b151      	st.w      	r2, (r1, 0x44)
    1c8e:	32f0      	movi      	r2, 240
    1c90:	9061      	ld.w      	r3, (r0, 0x4)
    1c92:	424c      	lsli      	r2, r2, 12
    1c94:	68c9      	andn      	r3, r2
    1c96:	3bb1      	bseti      	r3, 17
    1c98:	3bb3      	bseti      	r3, 19
    1c9a:	07b4      	br      	0x1c02	// 1c02 <GPIO_Remap+0x9e>
		if(bit==13){SYSCON->IOMAP1=(SYSCON->IOMAP1&0x0fffffff)|(iomap_data<<28);(GPIOx)->CONHR =((GPIOx)->CONHR&0XFF0FFFFF) | 0x00A00000;}
    1c9c:	394d      	cmpnei      	r1, 13
    1c9e:	0bb3      	bt      	0x1c04	// 1c04 <GPIO_Remap+0xa0>
    1ca0:	116b      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1ca2:	425c      	lsli      	r2, r2, 28
    1ca4:	9320      	ld.w      	r1, (r3, 0x0)
    1ca6:	217f      	addi      	r1, 128
    1ca8:	9171      	ld.w      	r3, (r1, 0x44)
    1caa:	4364      	lsli      	r3, r3, 4
    1cac:	4b64      	lsri      	r3, r3, 4
    1cae:	6c8c      	or      	r2, r3
    1cb0:	b151      	st.w      	r2, (r1, 0x44)
    1cb2:	32f0      	movi      	r2, 240
    1cb4:	9061      	ld.w      	r3, (r0, 0x4)
    1cb6:	4250      	lsli      	r2, r2, 16
    1cb8:	68c9      	andn      	r3, r2
    1cba:	3bb5      	bseti      	r3, 21
    1cbc:	3bb7      	bseti      	r3, 23
    1cbe:	07a2      	br      	0x1c02	// 1c02 <GPIO_Remap+0x9e>
		if(iomap_data==0)
    1cc0:	3a40      	cmpnei      	r2, 0
    1cc2:	0c13      	bf      	0x1ce8	// 1ce8 <GPIO_Remap+0x184>
		if(bit==0){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xfffffff0)|iomap_data;(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFFFFF0) | 0x0000000A;}
    1cc4:	3940      	cmpnei      	r1, 0
    1cc6:	0c23      	bf      	0x1d0c	// 1d0c <GPIO_Remap+0x1a8>
		if(bit==1){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xffffff0f)|(iomap_data<<4);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFFFF0F) | 0x000000A0;}
    1cc8:	3941      	cmpnei      	r1, 1
    1cca:	082f      	bt      	0x1d28	// 1d28 <GPIO_Remap+0x1c4>
    1ccc:	1160      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1cce:	34f0      	movi      	r4, 240
    1cd0:	9320      	ld.w      	r1, (r3, 0x0)
    1cd2:	217f      	addi      	r1, 128
    1cd4:	9170      	ld.w      	r3, (r1, 0x40)
    1cd6:	68d1      	andn      	r3, r4
    1cd8:	4244      	lsli      	r2, r2, 4
    1cda:	6c8c      	or      	r2, r3
    1cdc:	b150      	st.w      	r2, (r1, 0x40)
    1cde:	9060      	ld.w      	r3, (r0, 0x0)
    1ce0:	68d1      	andn      	r3, r4
    1ce2:	3ba5      	bseti      	r3, 5
    1ce4:	3ba7      	bseti      	r3, 7
    1ce6:	041f      	br      	0x1d24	// 1d24 <GPIO_Remap+0x1c0>
			if((SYSCON->IOMAP0&(0xf<<i))==0)
    1ce8:	1079      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1cea:	3400      	movi      	r4, 0
    1cec:	9360      	ld.w      	r3, (r3, 0x0)
    1cee:	237f      	addi      	r3, 128
    1cf0:	360f      	movi      	r6, 15
    1cf2:	6d5b      	mov      	r5, r6
    1cf4:	93f0      	ld.w      	r7, (r3, 0x40)
    1cf6:	7150      	lsl      	r5, r4
    1cf8:	69d4      	and      	r7, r5
    1cfa:	3f40      	cmpnei      	r7, 0
    1cfc:	0804      	bt      	0x1d04	// 1d04 <GPIO_Remap+0x1a0>
					SYSCON->IOMAP0=SYSCON->IOMAP0|(0xf<<i);
    1cfe:	93f0      	ld.w      	r7, (r3, 0x40)
    1d00:	6d5c      	or      	r5, r7
    1d02:	b3b0      	st.w      	r5, (r3, 0x40)
    1d04:	2403      	addi      	r4, 4
			for(i=0;i<28;i+=4)
    1d06:	3c5c      	cmpnei      	r4, 28
    1d08:	0bf5      	bt      	0x1cf2	// 1cf2 <GPIO_Remap+0x18e>
    1d0a:	07dd      	br      	0x1cc4	// 1cc4 <GPIO_Remap+0x160>
		if(bit==0){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xfffffff0)|iomap_data;(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFFFFF0) | 0x0000000A;}
    1d0c:	1070      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1d0e:	340f      	movi      	r4, 15
    1d10:	9320      	ld.w      	r1, (r3, 0x0)
    1d12:	217f      	addi      	r1, 128
    1d14:	9170      	ld.w      	r3, (r1, 0x40)
    1d16:	68d1      	andn      	r3, r4
    1d18:	6c8c      	or      	r2, r3
    1d1a:	b150      	st.w      	r2, (r1, 0x40)
    1d1c:	9060      	ld.w      	r3, (r0, 0x0)
    1d1e:	68d1      	andn      	r3, r4
    1d20:	3ba1      	bseti      	r3, 1
    1d22:	3ba3      	bseti      	r3, 3
		if(bit==7){SYSCON->IOMAP0=(SYSCON->IOMAP0&0x0fffffff)|(iomap_data<<28);(GPIOx)->CONLR =((GPIOx)->CONLR&0X0FFFFFFF) | 0x0A0000000;}
    1d24:	b060      	st.w      	r3, (r0, 0x0)
}
    1d26:	076f      	br      	0x1c04	// 1c04 <GPIO_Remap+0xa0>
		if(bit==2){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xfffff0ff)|(iomap_data<<8);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFFF0FF) | 0x00000A00;}
    1d28:	3942      	cmpnei      	r1, 2
    1d2a:	0829      	bt      	0x1d7c	// 1d7c <GPIO_Remap+0x218>
    1d2c:	1068      	lrw      	r3, 0x20000070	// 1d4c <GPIO_Remap+0x1e8>
    1d2e:	31f0      	movi      	r1, 240
    1d30:	9380      	ld.w      	r4, (r3, 0x0)
    1d32:	247f      	addi      	r4, 128
    1d34:	9470      	ld.w      	r3, (r4, 0x40)
    1d36:	041b      	br      	0x1d6c	// 1d6c <GPIO_Remap+0x208>
    1d38:	20000078 	.long	0x20000078
    1d3c:	20000010 	.long	0x20000010
    1d40:	2000000c 	.long	0x2000000c
    1d44:	20000008 	.long	0x20000008
    1d48:	20000014 	.long	0x20000014
    1d4c:	20000070 	.long	0x20000070
    1d50:	e11e0080 	.long	0xe11e0080
    1d54:	c0c0c0c0 	.long	0xc0c0c0c0
    1d58:	00000404 	.long	0x00000404
    1d5c:	0000040c 	.long	0x0000040c
    1d60:	00000414 	.long	0x00000414
    1d64:	c0c000c0 	.long	0xc0c000c0
    1d68:	0000041c 	.long	0x0000041c
    1d6c:	4124      	lsli      	r1, r1, 4
    1d6e:	68c5      	andn      	r3, r1
    1d70:	4248      	lsli      	r2, r2, 8
    1d72:	6c8c      	or      	r2, r3
    1d74:	b450      	st.w      	r2, (r4, 0x40)
    1d76:	9060      	ld.w      	r3, (r0, 0x0)
    1d78:	68c5      	andn      	r3, r1
    1d7a:	070c      	br      	0x1b92	// 1b92 <GPIO_Remap+0x2e>
		if(bit==3){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xffff0fff)|(iomap_data<<12);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFFF0FFF) | 0x0000A000;}
    1d7c:	3943      	cmpnei      	r1, 3
    1d7e:	080e      	bt      	0x1d9a	// 1d9a <GPIO_Remap+0x236>
    1d80:	1169      	lrw      	r3, 0x20000070	// 1e24 <GPIO_Remap+0x2c0>
    1d82:	31f0      	movi      	r1, 240
    1d84:	9380      	ld.w      	r4, (r3, 0x0)
    1d86:	247f      	addi      	r4, 128
    1d88:	9470      	ld.w      	r3, (r4, 0x40)
    1d8a:	4128      	lsli      	r1, r1, 8
    1d8c:	68c5      	andn      	r3, r1
    1d8e:	424c      	lsli      	r2, r2, 12
    1d90:	6c8c      	or      	r2, r3
    1d92:	b450      	st.w      	r2, (r4, 0x40)
    1d94:	9060      	ld.w      	r3, (r0, 0x0)
    1d96:	68c5      	andn      	r3, r1
    1d98:	0721      	br      	0x1bda	// 1bda <GPIO_Remap+0x76>
		if(bit==4){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xfff0ffff)|(iomap_data<<16);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFFF0FFFF) | 0x000A0000;}
    1d9a:	3944      	cmpnei      	r1, 4
    1d9c:	0810      	bt      	0x1dbc	// 1dbc <GPIO_Remap+0x258>
    1d9e:	1162      	lrw      	r3, 0x20000070	// 1e24 <GPIO_Remap+0x2c0>
    1da0:	31f0      	movi      	r1, 240
    1da2:	9380      	ld.w      	r4, (r3, 0x0)
    1da4:	247f      	addi      	r4, 128
    1da6:	9470      	ld.w      	r3, (r4, 0x40)
    1da8:	412c      	lsli      	r1, r1, 12
    1daa:	68c5      	andn      	r3, r1
    1dac:	4250      	lsli      	r2, r2, 16
    1dae:	6c8c      	or      	r2, r3
    1db0:	b450      	st.w      	r2, (r4, 0x40)
    1db2:	9060      	ld.w      	r3, (r0, 0x0)
    1db4:	68c5      	andn      	r3, r1
    1db6:	3bb1      	bseti      	r3, 17
    1db8:	3bb3      	bseti      	r3, 19
    1dba:	07b5      	br      	0x1d24	// 1d24 <GPIO_Remap+0x1c0>
		if(bit==5){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xff0fffff)|(iomap_data<<20);(GPIOx)->CONLR =((GPIOx)->CONLR&0XFF0FFFFF) | 0x00A00000;}
    1dbc:	3945      	cmpnei      	r1, 5
    1dbe:	0810      	bt      	0x1dde	// 1dde <GPIO_Remap+0x27a>
    1dc0:	1079      	lrw      	r3, 0x20000070	// 1e24 <GPIO_Remap+0x2c0>
    1dc2:	31f0      	movi      	r1, 240
    1dc4:	9380      	ld.w      	r4, (r3, 0x0)
    1dc6:	247f      	addi      	r4, 128
    1dc8:	9470      	ld.w      	r3, (r4, 0x40)
    1dca:	4130      	lsli      	r1, r1, 16
    1dcc:	68c5      	andn      	r3, r1
    1dce:	4254      	lsli      	r2, r2, 20
    1dd0:	6c8c      	or      	r2, r3
    1dd2:	b450      	st.w      	r2, (r4, 0x40)
    1dd4:	9060      	ld.w      	r3, (r0, 0x0)
    1dd6:	68c5      	andn      	r3, r1
    1dd8:	3bb5      	bseti      	r3, 21
    1dda:	3bb7      	bseti      	r3, 23
    1ddc:	07a4      	br      	0x1d24	// 1d24 <GPIO_Remap+0x1c0>
		if(bit==6){SYSCON->IOMAP0=(SYSCON->IOMAP0&0xf0ffffff)|(iomap_data<<24);(GPIOx)->CONLR =((GPIOx)->CONLR&0XF0FFFFFF) | 0x0A000000;}
    1dde:	3946      	cmpnei      	r1, 6
    1de0:	0810      	bt      	0x1e00	// 1e00 <GPIO_Remap+0x29c>
    1de2:	1071      	lrw      	r3, 0x20000070	// 1e24 <GPIO_Remap+0x2c0>
    1de4:	31f0      	movi      	r1, 240
    1de6:	9380      	ld.w      	r4, (r3, 0x0)
    1de8:	247f      	addi      	r4, 128
    1dea:	9470      	ld.w      	r3, (r4, 0x40)
    1dec:	4134      	lsli      	r1, r1, 20
    1dee:	68c5      	andn      	r3, r1
    1df0:	4258      	lsli      	r2, r2, 24
    1df2:	6c8c      	or      	r2, r3
    1df4:	b450      	st.w      	r2, (r4, 0x40)
    1df6:	9060      	ld.w      	r3, (r0, 0x0)
    1df8:	68c5      	andn      	r3, r1
    1dfa:	3bb9      	bseti      	r3, 25
    1dfc:	3bbb      	bseti      	r3, 27
    1dfe:	0793      	br      	0x1d24	// 1d24 <GPIO_Remap+0x1c0>
		if(bit==7){SYSCON->IOMAP0=(SYSCON->IOMAP0&0x0fffffff)|(iomap_data<<28);(GPIOx)->CONLR =((GPIOx)->CONLR&0X0FFFFFFF) | 0x0A0000000;}
    1e00:	3947      	cmpnei      	r1, 7
    1e02:	0b01      	bt      	0x1c04	// 1c04 <GPIO_Remap+0xa0>
    1e04:	1068      	lrw      	r3, 0x20000070	// 1e24 <GPIO_Remap+0x2c0>
    1e06:	425c      	lsli      	r2, r2, 28
    1e08:	9320      	ld.w      	r1, (r3, 0x0)
    1e0a:	217f      	addi      	r1, 128
    1e0c:	9170      	ld.w      	r3, (r1, 0x40)
    1e0e:	4364      	lsli      	r3, r3, 4
    1e10:	4b64      	lsri      	r3, r3, 4
    1e12:	6c8c      	or      	r2, r3
    1e14:	b150      	st.w      	r2, (r1, 0x40)
    1e16:	9060      	ld.w      	r3, (r0, 0x0)
    1e18:	4364      	lsli      	r3, r3, 4
    1e1a:	4b64      	lsri      	r3, r3, 4
    1e1c:	3bbd      	bseti      	r3, 29
    1e1e:	3bbf      	bseti      	r3, 31
    1e20:	0782      	br      	0x1d24	// 1d24 <GPIO_Remap+0x1c0>
    1e22:	0000      	bkpt
    1e24:	20000070 	.long	0x20000070

00001e28 <USART_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_DeInit(void)
{
	USART0->IDR   	= USART_IDR_RST;
    1e28:	106b      	lrw      	r3, 0x2000002c	// 1e54 <USART_DeInit+0x2c>
    1e2a:	104c      	lrw      	r2, 0x3898	// 1e58 <USART_DeInit+0x30>
    1e2c:	9360      	ld.w      	r3, (r3, 0x0)
    1e2e:	b340      	st.w      	r2, (r3, 0x0)
	USART0->MR   	= USART_MR_RST;
	USART0->IMSCR   = USART_IMSCR_RST;
	USART0->RISR  	= USART_RISR_RST;
	USART0->MISR   	= USART_MISR_RST;
	USART0->ICR   	= USART_ICR_RST;
	USART0->SR   	= USART_SR_RST;
    1e30:	102b      	lrw      	r1, 0x64a02	// 1e5c <USART_DeInit+0x34>
	USART0->CEDR   	= USART_CEDR_RST;
    1e32:	3200      	movi      	r2, 0
    1e34:	b341      	st.w      	r2, (r3, 0x4)
	USART0->SRR 	= USART_SRR_RST;
    1e36:	b342      	st.w      	r2, (r3, 0x8)
	USART0->CR 		= USART_CR_RST;
    1e38:	b343      	st.w      	r2, (r3, 0xc)
	USART0->MR   	= USART_MR_RST;
    1e3a:	b344      	st.w      	r2, (r3, 0x10)
	USART0->IMSCR   = USART_IMSCR_RST;
    1e3c:	b345      	st.w      	r2, (r3, 0x14)
	USART0->RISR  	= USART_RISR_RST;
    1e3e:	b346      	st.w      	r2, (r3, 0x18)
	USART0->MISR   	= USART_MISR_RST;
    1e40:	b347      	st.w      	r2, (r3, 0x1c)
	USART0->ICR   	= USART_ICR_RST;
    1e42:	b348      	st.w      	r2, (r3, 0x20)
	USART0->SR   	= USART_SR_RST;
    1e44:	b329      	st.w      	r1, (r3, 0x24)
	USART0->RHR   	= USART_RHR_RST;
    1e46:	b34a      	st.w      	r2, (r3, 0x28)
	USART0->THR   	= USART_THR_RST;
    1e48:	b34b      	st.w      	r2, (r3, 0x2c)
	USART0->BRGR   	= USART_BRGR_RST;
    1e4a:	b34c      	st.w      	r2, (r3, 0x30)
	USART0->RTOR   	= USART_RTOR_RST;
    1e4c:	b34d      	st.w      	r2, (r3, 0x34)
	USART0->TTGR   	= USART_TTGR_RST;
    1e4e:	b34e      	st.w      	r2, (r3, 0x38)
}
    1e50:	783c      	jmp      	r15
    1e52:	0000      	bkpt
    1e54:	2000002c 	.long	0x2000002c
    1e58:	00003898 	.long	0x00003898
    1e5c:	00064a02 	.long	0x00064a02

00001e60 <USART_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_Int_Enable(void)
{
    USART0->ICR=0x7FF;									//clear USART INT status
    1e60:	026b      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    1e62:	024a      	lrw      	r2, 0x7ff	// 2134 <USARTReceive+0x3a>
    1e64:	9360      	ld.w      	r3, (r3, 0x0)
    1e66:	b348      	st.w      	r2, (r3, 0x20)
	INTC_ISER_WRITE(USART0_INT);							//INT Vector Enable USART Interrupt
    1e68:	3280      	movi      	r2, 128
    1e6a:	026b      	lrw      	r3, 0x20000078	// 2138 <USARTReceive+0x3e>
    1e6c:	4246      	lsli      	r2, r2, 6
    1e6e:	9360      	ld.w      	r3, (r3, 0x0)
    1e70:	23ff      	addi      	r3, 256
    1e72:	b340      	st.w      	r2, (r3, 0x0)
}
    1e74:	783c      	jmp      	r15

00001e76 <USART_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_Int_Disable(void)
{
	INTC_ICER_WRITE(USART0_INT);							//INT Vector Enable USART Interrupt
    1e76:	026e      	lrw      	r3, 0x20000078	// 2138 <USARTReceive+0x3e>
    1e78:	32c0      	movi      	r2, 192
    1e7a:	9360      	ld.w      	r3, (r3, 0x0)
    1e7c:	4241      	lsli      	r2, r2, 1
    1e7e:	60c8      	addu      	r3, r2
    1e80:	3280      	movi      	r2, 128
    1e82:	4246      	lsli      	r2, r2, 6
    1e84:	b340      	st.w      	r2, (r3, 0x0)
}
    1e86:	783c      	jmp      	r15

00001e88 <USART_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(USART0_INT);    
    1e88:	0273      	lrw      	r3, 0x20000078	// 2138 <USARTReceive+0x3e>
    1e8a:	3280      	movi      	r2, 128
    1e8c:	9360      	ld.w      	r3, (r3, 0x0)
    1e8e:	23ff      	addi      	r3, 256
    1e90:	4246      	lsli      	r2, r2, 6
    1e92:	b350      	st.w      	r2, (r3, 0x40)
}
    1e94:	783c      	jmp      	r15

00001e96 <USART_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(USART0_INT);    
    1e96:	0276      	lrw      	r3, 0x20000078	// 2138 <USARTReceive+0x3e>
    1e98:	32e0      	movi      	r2, 224
    1e9a:	9360      	ld.w      	r3, (r3, 0x0)
    1e9c:	4241      	lsli      	r2, r2, 1
    1e9e:	60c8      	addu      	r3, r2
    1ea0:	3280      	movi      	r2, 128
    1ea2:	4246      	lsli      	r2, r2, 6
    1ea4:	b340      	st.w      	r2, (r3, 0x0)
}
    1ea6:	783c      	jmp      	r15

00001ea8 <USART_IO_Init>:
//USART_IO_G:0 1
//ReturnValue:NONE
/*************************************************************/
void USART_IO_Init(USART_NUM_TypeDef IO_USART_NUM , U8_T USART_IO_G)
{
    if (IO_USART_NUM==IO_USART0)
    1ea8:	3840      	cmpnei      	r0, 0
    1eaa:	0823      	bt      	0x1ef0	// 1ef0 <USART_IO_Init+0x48>
    {
		if(USART_IO_G==0)
    1eac:	3940      	cmpnei      	r1, 0
    1eae:	0810      	bt      	0x1ece	// 1ece <USART_IO_Init+0x26>
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000400;      //PA0.2->RXD0, PB0.2->TXD0  
    1eb0:	027c      	lrw      	r3, 0x20000014	// 213c <USARTReceive+0x42>
    1eb2:	32f0      	movi      	r2, 240
    1eb4:	9320      	ld.w      	r1, (r3, 0x0)
    1eb6:	9160      	ld.w      	r3, (r1, 0x0)
    1eb8:	4244      	lsli      	r2, r2, 4
    1eba:	68c9      	andn      	r3, r2
    1ebc:	3baa      	bseti      	r3, 10
    1ebe:	b160      	st.w      	r3, (r1, 0x0)
            GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000400;    
    1ec0:	027f      	lrw      	r3, 0x2000000c	// 2140 <USARTReceive+0x46>
    1ec2:	9320      	ld.w      	r1, (r3, 0x0)
    1ec4:	9160      	ld.w      	r3, (r1, 0x0)
    1ec6:	68c9      	andn      	r3, r2
    1ec8:	3baa      	bseti      	r3, 10
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000400;      //PA0.2->RXD0, PA1.5->TXD0   
            GPIOA1->CONLR = (GPIOA1->CONLR&0XFF0FFFFF)  | 0x00400000; 
		}
		else if(USART_IO_G==4)
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF)  | 0x00055000;       //PA0.3->RXD0, PA0.4->TXD0
    1eca:	b160      	st.w      	r3, (r1, 0x0)
		}
		
    }
}
    1ecc:	0412      	br      	0x1ef0	// 1ef0 <USART_IO_Init+0x48>
		else if(USART_IO_G==1)
    1ece:	3941      	cmpnei      	r1, 1
    1ed0:	0811      	bt      	0x1ef2	// 1ef2 <USART_IO_Init+0x4a>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000400;      //PA0.2->RXD0, PC0.1->TXD0 
    1ed2:	0364      	lrw      	r3, 0x20000014	// 213c <USARTReceive+0x42>
    1ed4:	32f0      	movi      	r2, 240
    1ed6:	9320      	ld.w      	r1, (r3, 0x0)
    1ed8:	9160      	ld.w      	r3, (r1, 0x0)
    1eda:	4244      	lsli      	r2, r2, 4
    1edc:	68c9      	andn      	r3, r2
    1ede:	3baa      	bseti      	r3, 10
    1ee0:	b160      	st.w      	r3, (r1, 0x0)
            GPIOC0->CONLR = (GPIOC0->CONLR&0XFFFFFF0F)  | 0x00000040;   
    1ee2:	31f0      	movi      	r1, 240
    1ee4:	0367      	lrw      	r3, 0x20000008	// 2144 <USARTReceive+0x4a>
    1ee6:	9340      	ld.w      	r2, (r3, 0x0)
    1ee8:	9260      	ld.w      	r3, (r2, 0x0)
    1eea:	68c5      	andn      	r3, r1
    1eec:	3ba6      	bseti      	r3, 6
    1eee:	b260      	st.w      	r3, (r2, 0x0)
}
    1ef0:	783c      	jmp      	r15
		else if(USART_IO_G==2)
    1ef2:	3942      	cmpnei      	r1, 2
    1ef4:	0810      	bt      	0x1f14	// 1f14 <USART_IO_Init+0x6c>
			GPIOC0->CONLR = (GPIOC0->CONLR&0XFFFFFFF0)  | 0x00000004;      //PC0.0->RXD0, PA1.5->TXD0 
    1ef6:	036b      	lrw      	r3, 0x20000008	// 2144 <USARTReceive+0x4a>
    1ef8:	310f      	movi      	r1, 15
    1efa:	9340      	ld.w      	r2, (r3, 0x0)
    1efc:	9260      	ld.w      	r3, (r2, 0x0)
    1efe:	68c5      	andn      	r3, r1
    1f00:	3ba2      	bseti      	r3, 2
    1f02:	b260      	st.w      	r3, (r2, 0x0)
            GPIOA1->CONLR = (GPIOA1->CONLR&0XFF0FFFFF)  | 0x00400000; 
    1f04:	036e      	lrw      	r3, 0x20000010	// 2148 <USARTReceive+0x4e>
    1f06:	32f0      	movi      	r2, 240
    1f08:	9320      	ld.w      	r1, (r3, 0x0)
    1f0a:	9160      	ld.w      	r3, (r1, 0x0)
    1f0c:	4250      	lsli      	r2, r2, 16
    1f0e:	68c9      	andn      	r3, r2
    1f10:	3bb6      	bseti      	r3, 22
    1f12:	07dc      	br      	0x1eca	// 1eca <USART_IO_Init+0x22>
		else if(USART_IO_G==3)
    1f14:	3943      	cmpnei      	r1, 3
    1f16:	080a      	bt      	0x1f2a	// 1f2a <USART_IO_Init+0x82>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000400;      //PA0.2->RXD0, PA1.5->TXD0   
    1f18:	0376      	lrw      	r3, 0x20000014	// 213c <USARTReceive+0x42>
    1f1a:	32f0      	movi      	r2, 240
    1f1c:	9320      	ld.w      	r1, (r3, 0x0)
    1f1e:	9160      	ld.w      	r3, (r1, 0x0)
    1f20:	4244      	lsli      	r2, r2, 4
    1f22:	68c9      	andn      	r3, r2
    1f24:	3baa      	bseti      	r3, 10
    1f26:	b160      	st.w      	r3, (r1, 0x0)
    1f28:	07ee      	br      	0x1f04	// 1f04 <USART_IO_Init+0x5c>
		else if(USART_IO_G==4)
    1f2a:	3944      	cmpnei      	r1, 4
    1f2c:	0be2      	bt      	0x1ef0	// 1ef0 <USART_IO_Init+0x48>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF)  | 0x00055000;       //PA0.3->RXD0, PA0.4->TXD0
    1f2e:	037b      	lrw      	r3, 0x20000014	// 213c <USARTReceive+0x42>
    1f30:	32ff      	movi      	r2, 255
    1f32:	9320      	ld.w      	r1, (r3, 0x0)
    1f34:	424c      	lsli      	r2, r2, 12
    1f36:	9160      	ld.w      	r3, (r1, 0x0)
    1f38:	68c9      	andn      	r3, r2
    1f3a:	32aa      	movi      	r2, 170
    1f3c:	424b      	lsli      	r2, r2, 11
    1f3e:	6cc8      	or      	r3, r2
    1f40:	07c5      	br      	0x1eca	// 1eca <USART_IO_Init+0x22>

00001f42 <USART_CLKIO_Init>:
//USART_IO_G:0 1
//ReturnValue:NONE
/*************************************************************/
void USART_CLKIO_Init(USART_CLKNUM_TypeDef USART_CLKIO_G)
{
    if (USART_CLKIO_G==CLK_PB07)
    1f42:	3840      	cmpnei      	r0, 0
    1f44:	080a      	bt      	0x1f58	// 1f58 <USART_CLKIO_Init+0x16>
    {
		GPIOB0->CONLR = (GPIOB0->CONLR&0X0FFFFFFF)  | 0x60000000;       //PB0.7 AS USART CK OUT
    1f46:	137f      	lrw      	r3, 0x2000000c	// 2140 <USARTReceive+0x46>
    1f48:	9340      	ld.w      	r2, (r3, 0x0)
    1f4a:	9260      	ld.w      	r3, (r2, 0x0)
    1f4c:	4364      	lsli      	r3, r3, 4
    1f4e:	4b64      	lsri      	r3, r3, 4
    1f50:	3bbd      	bseti      	r3, 29
    1f52:	3bbe      	bseti      	r3, 30
    1f54:	b260      	st.w      	r3, (r2, 0x0)
    }
     if (USART_CLKIO_G==CLK_PA05)
    {
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00500000;       //PA0.5 AS USART CK OUT
    }
}
    1f56:	783c      	jmp      	r15
     if (USART_CLKIO_G==CLK_PA05)
    1f58:	3841      	cmpnei      	r0, 1
    1f5a:	0bfe      	bt      	0x1f56	// 1f56 <USART_CLKIO_Init+0x14>
		GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00500000;       //PA0.5 AS USART CK OUT
    1f5c:	1378      	lrw      	r3, 0x20000014	// 213c <USARTReceive+0x42>
    1f5e:	32f0      	movi      	r2, 240
    1f60:	9320      	ld.w      	r1, (r3, 0x0)
    1f62:	9160      	ld.w      	r3, (r1, 0x0)
    1f64:	4250      	lsli      	r2, r2, 16
    1f66:	68c9      	andn      	r3, r2
    1f68:	3bb4      	bseti      	r3, 20
    1f6a:	3bb6      	bseti      	r3, 22
    1f6c:	b160      	st.w      	r3, (r1, 0x0)
}
    1f6e:	07f4      	br      	0x1f56	// 1f56 <USART_CLKIO_Init+0x14>

00001f70 <USART_Software_Reset>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_Software_Reset(void)
{
	USART0->SRR =0x01;
    1f70:	1370      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    1f72:	3201      	movi      	r2, 1
    1f74:	9360      	ld.w      	r3, (r3, 0x0)
    1f76:	b342      	st.w      	r2, (r3, 0x8)
}
    1f78:	783c      	jmp      	r15

00001f7a <USART_CLK_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_CLK_Disable(void)
{
   USART0->CEDR |= 0; 							//Disable USART Clock 
    1f7a:	136e      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    1f7c:	9360      	ld.w      	r3, (r3, 0x0)
    1f7e:	9341      	ld.w      	r2, (r3, 0x4)
    1f80:	b341      	st.w      	r2, (r3, 0x4)
}
    1f82:	783c      	jmp      	r15

00001f84 <USART_CLK_Enable>:
//EntryParameter:INT_RegVal
//ReturnValue:NONE
/*************************************************************/
void USART_CLK_Enable(void)
{
   USART0->CEDR |= 1; 							//Disable USART Clock 
    1f84:	136b      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    1f86:	9340      	ld.w      	r2, (r3, 0x0)
    1f88:	9261      	ld.w      	r3, (r2, 0x4)
    1f8a:	3ba0      	bseti      	r3, 0
    1f8c:	b261      	st.w      	r3, (r2, 0x4)
}
    1f8e:	783c      	jmp      	r15

00001f90 <USART_INT_Config>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_INT_Config(USART_INT_TypeDef int_type,FunctionalStatus newState)
{
	CSP_USART_SET_ICR(USART0, 0xFFFFFFFF);			// Clear all interrupt
    1f90:	1368      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    1f92:	3200      	movi      	r2, 0
    1f94:	9360      	ld.w      	r3, (r3, 0x0)
    1f96:	2a00      	subi      	r2, 1
	if (newState != DISABLE)
    1f98:	3940      	cmpnei      	r1, 0
	CSP_USART_SET_ICR(USART0, 0xFFFFFFFF);			// Clear all interrupt
    1f9a:	b348      	st.w      	r2, (r3, 0x20)
	if (newState != DISABLE)
    1f9c:	0c07      	bf      	0x1faa	// 1faa <USART_INT_Config+0x1a>
	{
		USART0->IMSCR |=1<<int_type;					// Interrupt Enable
    1f9e:	3201      	movi      	r2, 1
    1fa0:	9325      	ld.w      	r1, (r3, 0x14)
    1fa2:	7080      	lsl      	r2, r0
    1fa4:	6c84      	or      	r2, r1
	}
	else
	{
		USART0->IMSCR |=0<<int_type;					// Interrupt Disable
    1fa6:	b345      	st.w      	r2, (r3, 0x14)
	}
}
    1fa8:	783c      	jmp      	r15
		USART0->IMSCR |=0<<int_type;					// Interrupt Disable
    1faa:	9345      	ld.w      	r2, (r3, 0x14)
    1fac:	07fd      	br      	0x1fa6	// 1fa6 <USART_INT_Config+0x16>

00001fae <USART_INT_RegConfig>:
//EntryParameter:INT_RegVal
//ReturnValue:NONE
/*************************************************************/
void USART_INT_RegConfig(U32_T INT_RegVal)
{
	CSP_USART_SET_ICR(USART0, 0xFFFFFFFF);
    1fae:	1361      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    1fb0:	9340      	ld.w      	r2, (r3, 0x0)
    1fb2:	3300      	movi      	r3, 0
    1fb4:	2b00      	subi      	r3, 1
    1fb6:	b268      	st.w      	r3, (r2, 0x20)
	CSP_USART_SET_IMSCR(USART0, INT_RegVal);
    1fb8:	b205      	st.w      	r0, (r2, 0x14)

}
    1fba:	783c      	jmp      	r15

00001fbc <USART_MODE_Config>:
//EntryParameter:INT_RegVal
//ReturnValue:NONE
/*************************************************************/
void USART_MODE_Config(USART_SENDTIME_TypeDef SENDTIME_DATA,USART_CLKS_TypeDef CLKS_DATA, USART_CHRL_TypeDef CHRL_DATA,
						USART_SYNC_TypeDef SYNC_DATA,USART_PAR_TypeDef PAR_DAT,USART_NBSTOP_TypeDef NBSTOP_DATA,USART_CHMODE_TypeDef CHMODE_DATA)
{
    1fbc:	14c4      	push      	r4-r7
    1fbe:	1421      	subi      	r14, r14, 4
    1fc0:	9885      	ld.w      	r4, (r14, 0x14)
    1fc2:	6dd3      	mov      	r7, r4
    1fc4:	9886      	ld.w      	r4, (r14, 0x18)
    1fc6:	b880      	st.w      	r4, (r14, 0x0)
    1fc8:	9887      	ld.w      	r4, (r14, 0x1c)
    1fca:	6d93      	mov      	r6, r4
	USART0->MR |= 0<<17;
    1fcc:	1299      	lrw      	r4, 0x2000002c	// 2130 <USARTReceive+0x36>
    1fce:	94a0      	ld.w      	r5, (r4, 0x0)
    1fd0:	9584      	ld.w      	r4, (r5, 0x10)
    1fd2:	b584      	st.w      	r4, (r5, 0x10)
	USART0->MR |= SENDTIME_DATA | CLKS_DATA | CHRL_DATA | SYNC_DATA | PAR_DAT| NBSTOP_DATA | CHMODE_DATA;
    1fd4:	9584      	ld.w      	r4, (r5, 0x10)
    1fd6:	6d18      	or      	r4, r6
    1fd8:	98c0      	ld.w      	r6, (r14, 0x0)
    1fda:	6d18      	or      	r4, r6
    1fdc:	6d1c      	or      	r4, r7
    1fde:	6cd0      	or      	r3, r4
    1fe0:	6c8c      	or      	r2, r3
    1fe2:	6c48      	or      	r1, r2
    1fe4:	6c04      	or      	r0, r1
    1fe6:	6d9f      	mov      	r6, r7
    1fe8:	b504      	st.w      	r0, (r5, 0x10)
}
    1fea:	1401      	addi      	r14, r14, 4
    1fec:	1484      	pop      	r4-r7

00001fee <USART_CTRL_Config>:
//EntryParameter:CTRL_DATA, ENABLE/DISABLE
//ReturnValue:NONE
/*************************************************************/
void USART_CTRL_Config(USART_CTRL_TypeDef CTRL_DATA,FunctionalStatus newState)
{
	if (newState!=DISABLE)
    1fee:	3940      	cmpnei      	r1, 0
    1ff0:	1270      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    1ff2:	0c08      	bf      	0x2002	// 2002 <USART_CTRL_Config+0x14>
	{
		USART0->CR  |= 1<<CTRL_DATA;
    1ff4:	9340      	ld.w      	r2, (r3, 0x0)
    1ff6:	3301      	movi      	r3, 1
    1ff8:	9223      	ld.w      	r1, (r2, 0xc)
    1ffa:	70c0      	lsl      	r3, r0
    1ffc:	6cc4      	or      	r3, r1
    1ffe:	b263      	st.w      	r3, (r2, 0xc)
	}
	else
	{
		USART0->CR  |= 0<<CTRL_DATA;
	}
}
    2000:	783c      	jmp      	r15
		USART0->CR  |= 0<<CTRL_DATA;
    2002:	9360      	ld.w      	r3, (r3, 0x0)
    2004:	9343      	ld.w      	r2, (r3, 0xc)
    2006:	b343      	st.w      	r2, (r3, 0xc)
}
    2008:	07fc      	br      	0x2000	// 2000 <USART_CTRL_Config+0x12>

0000200a <USART_FIFO_CMD>:
//USART_FIFO_CMD
//EntryParameter:FIFO1_RX(可配置接收FIFO中断触发点), ENABLE/DISABLE
//ReturnValue:NONE
/*************************************************************/
void USART_FIFO_CMD(USART_FIFO_TypeDef FIFO1_RX,FunctionalStatus newState)
{
    200a:	126a      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    200c:	400e      	lsli      	r0, r0, 14
	if (newState!=DISABLE)
	{
		USART0->CR  |= FIFO1_RX<<14;
    200e:	9360      	ld.w      	r3, (r3, 0x0)
    2010:	9343      	ld.w      	r2, (r3, 0xc)
    2012:	6c08      	or      	r0, r2
    2014:	b303      	st.w      	r0, (r3, 0xc)
	if (newState!=DISABLE)
    2016:	3940      	cmpnei      	r1, 0
		
		USART0->CR  |= 1<<FIFO_EN;
    2018:	9343      	ld.w      	r2, (r3, 0xc)
	if (newState!=DISABLE)
    201a:	0c04      	bf      	0x2022	// 2022 <USART_FIFO_CMD+0x18>
		USART0->CR  |= 1<<FIFO_EN;
    201c:	3aad      	bseti      	r2, 13
	}
	else
	{
		USART0->CR  |= FIFO1_RX<<14;
		
		USART0->CR  &= (~(1<<FIFO_EN));
    201e:	b343      	st.w      	r2, (r3, 0xc)
	}
}
    2020:	783c      	jmp      	r15
		USART0->CR  &= (~(1<<FIFO_EN));
    2022:	3a8d      	bclri      	r2, 13
    2024:	07fd      	br      	0x201e	// 201e <USART_FIFO_CMD+0x14>

00002026 <USART_DSB_Config>:
//EntryParameter:LSBtoMSB / MSBtoLSB
//ReturnValue:NONE
/*************************************************************/
void USART_DSB_Config(USART_DSB_TypeDef DSB_DATA)
{
	USART0->MR |= DSB_DATA;
    2026:	1263      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    2028:	9340      	ld.w      	r2, (r3, 0x0)
    202a:	9264      	ld.w      	r3, (r2, 0x10)
    202c:	6c0c      	or      	r0, r3
    202e:	b204      	st.w      	r0, (r2, 0x10)
}
    2030:	783c      	jmp      	r15

00002032 <USART_SAMRTCARD_Config>:
//EntryParameter:DISABLE/ENABLE
//ReturnValue:NONE
/*************************************************************/
void USART_SAMRTCARD_Config(FunctionalStatus newState)
{
	if (newState!=DISABLE)
    2032:	3840      	cmpnei      	r0, 0
    2034:	117f      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    2036:	0c06      	bf      	0x2042	// 2042 <USART_SAMRTCARD_Config+0x10>
	{
		USART0->MR |= 1<<16;
    2038:	9340      	ld.w      	r2, (r3, 0x0)
    203a:	9264      	ld.w      	r3, (r2, 0x10)
    203c:	3bb0      	bseti      	r3, 16
    203e:	b264      	st.w      	r3, (r2, 0x10)
	}
	else
	{
		USART0->MR |= 0<<16;
	}
}
    2040:	783c      	jmp      	r15
		USART0->MR |= 0<<16;
    2042:	9360      	ld.w      	r3, (r3, 0x0)
    2044:	9344      	ld.w      	r2, (r3, 0x10)
    2046:	b344      	st.w      	r2, (r3, 0x10)
}
    2048:	07fc      	br      	0x2040	// 2040 <USART_SAMRTCARD_Config+0xe>

0000204a <USART_CLKO_Config>:
//EntryParameter:DISABLE/ENABLE
//ReturnValue:NONE
/*************************************************************/
void USART_CLKO_Config(FunctionalStatus newState)
{
	if (newState!=DISABLE)
    204a:	3840      	cmpnei      	r0, 0
    204c:	1179      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    204e:	0c06      	bf      	0x205a	// 205a <USART_CLKO_Config+0x10>
	{
		USART0->MR |= (1<<18) | (0<<4) ;
    2050:	9340      	ld.w      	r2, (r3, 0x0)
    2052:	9264      	ld.w      	r3, (r2, 0x10)
    2054:	3bb2      	bseti      	r3, 18
    2056:	b264      	st.w      	r3, (r2, 0x10)
	}
	else
	{
		USART0->MR |= 0<<18;
	}
}
    2058:	783c      	jmp      	r15
		USART0->MR |= 0<<18;
    205a:	9360      	ld.w      	r3, (r3, 0x0)
    205c:	9344      	ld.w      	r2, (r3, 0x10)
    205e:	b344      	st.w      	r2, (r3, 0x10)
}
    2060:	07fc      	br      	0x2058	// 2058 <USART_CLKO_Config+0xe>

00002062 <USART_Baudrate_Cal>:
//USART baudrate calculate
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_Baudrate_Cal(unsigned int rate,unsigned int PCLK_Val,USART_CLKS_TypeDef CLKS_DATA,USART_SYNC_TypeDef SYNC_DATA)
{
    2062:	14d1      	push      	r4, r15
	unsigned int PCLK_Data=0;
	unsigned int BRGR_Data=0;
	if (CLKS_DATA==PCLK_DIV8)
    2064:	3a50      	cmpnei      	r2, 16
{
    2066:	6d03      	mov      	r4, r0
    2068:	6c07      	mov      	r0, r1
	if (CLKS_DATA==PCLK_DIV8)
    206a:	0802      	bt      	0x206e	// 206e <USART_Baudrate_Cal+0xc>
	{
		PCLK_Data=PCLK_Val/8;
    206c:	4903      	lsri      	r0, r1, 3
	}
	else PCLK_Data=PCLK_Val;
	if (SYNC_DATA==SYNC)
    206e:	3280      	movi      	r2, 128
    2070:	4241      	lsli      	r2, r2, 1
    2072:	648e      	cmpne      	r3, r2
    2074:	0809      	bt      	0x2086	// 2086 <USART_Baudrate_Cal+0x24>
	{
		BRGR_Data=PCLK_Data/rate;			//SYNC同步
	}
	else 
	{
		BRGR_Data=PCLK_Data/16/rate;				//ASYNC异步
    2076:	6c53      	mov      	r1, r4
    2078:	e0001420 	bsr      	0x48b8	// 48b8 <__udiv32>
	}
	USART0->BRGR = BRGR_Data<<4;
    207c:	116d      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    207e:	4004      	lsli      	r0, r0, 4
    2080:	9360      	ld.w      	r3, (r3, 0x0)
    2082:	b30c      	st.w      	r0, (r3, 0x30)
}
    2084:	1491      	pop      	r4, r15
		BRGR_Data=PCLK_Data/16/rate;				//ASYNC异步
    2086:	4804      	lsri      	r0, r0, 4
    2088:	07f7      	br      	0x2076	// 2076 <USART_Baudrate_Cal+0x14>

0000208a <USART_TGTO_Config>:
//EntryParameter:INT_RegVal
//ReturnValue:NONE
/*************************************************************/
void USART_TGTO_Config(U8_T timeOut_u8,U8_T timeGuard_u8)
{
    USART0->RTOR=timeOut_u8;					// Set Receiver Time Out
    208a:	116a      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    208c:	9360      	ld.w      	r3, (r3, 0x0)
    208e:	b30d      	st.w      	r0, (r3, 0x34)
    USART0->TTGR=timeGuard_u8;					// Set Transmitter Timer Guard
    2090:	b32e      	st.w      	r1, (r3, 0x38)
}
    2092:	783c      	jmp      	r15

00002094 <USART_TxByte>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART_TxByte(U16_T TXdata_u8)
{
	CSP_USART_SET_THR(USART0,TXdata_u8);		// Write the transmit buffer
    2094:	1167      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
	while ( (CSP_USART_GET_RISR(USART0) & USART_TXRDY) != USART_TXRDY ) {}	// Wait for the transmit done
    2096:	3102      	movi      	r1, 2
	CSP_USART_SET_THR(USART0,TXdata_u8);		// Write the transmit buffer
    2098:	9360      	ld.w      	r3, (r3, 0x0)
    209a:	b30b      	st.w      	r0, (r3, 0x2c)
	while ( (CSP_USART_GET_RISR(USART0) & USART_TXRDY) != USART_TXRDY ) {}	// Wait for the transmit done
    209c:	9346      	ld.w      	r2, (r3, 0x18)
    209e:	6884      	and      	r2, r1
    20a0:	3a40      	cmpnei      	r2, 0
    20a2:	0ffd      	bf      	0x209c	// 209c <USART_TxByte+0x8>
	CSP_USART_SET_ICR(USART0, USART_TXRDY);		// Clear status bit for the next transmit
    20a4:	b328      	st.w      	r1, (r3, 0x20)
}
    20a6:	783c      	jmp      	r15

000020a8 <USARTTransmit>:
//UART Transmit 
//EntryParameter:UART0,UART1,sourceAddress_u16,length_u16
//ReturnValue:NONE
/*************************************************************/
void USARTTransmit(U16_T *sourceAddress_u16,U16_T length_u16)
{
    20a8:	14c2      	push      	r4-r5
	unsigned int  DataJ;  //DataI,
	for(DataJ = 0;DataJ < length_u16 ;DataJ ++)
	{
		CSP_USART_SET_THR(USART0,*sourceAddress_u16++);
    20aa:	1162      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
		/*do{
			DataI = CSP_USART_GET_RHR(USART0);
			DataI = DataI & USART_TXRDY;
		}while(DataI == USART_TXRDY);    //Loop  when tx is full
		*/
		while ( (CSP_USART_GET_RISR(USART0) & USART_TXRDY) != USART_TXRDY ) {}	// Wait for the transmit done
    20ac:	3502      	movi      	r5, 2
		CSP_USART_SET_THR(USART0,*sourceAddress_u16++);
    20ae:	9340      	ld.w      	r2, (r3, 0x0)
	for(DataJ = 0;DataJ < length_u16 ;DataJ ++)
    20b0:	3300      	movi      	r3, 0
    20b2:	644c      	cmphs      	r3, r1
    20b4:	0c02      	bf      	0x20b8	// 20b8 <USARTTransmit+0x10>
		CSP_USART_SET_ICR(USART0, USART_TXRDY);		// Clear status bit for the next transmit
	}
}
    20b6:	1482      	pop      	r4-r5
		CSP_USART_SET_THR(USART0,*sourceAddress_u16++);
    20b8:	8880      	ld.h      	r4, (r0, 0x0)
    20ba:	b28b      	st.w      	r4, (r2, 0x2c)
		while ( (CSP_USART_GET_RISR(USART0) & USART_TXRDY) != USART_TXRDY ) {}	// Wait for the transmit done
    20bc:	9286      	ld.w      	r4, (r2, 0x18)
    20be:	6914      	and      	r4, r5
    20c0:	3c40      	cmpnei      	r4, 0
    20c2:	0ffd      	bf      	0x20bc	// 20bc <USARTTransmit+0x14>
		CSP_USART_SET_ICR(USART0, USART_TXRDY);		// Clear status bit for the next transmit
    20c4:	b2a8      	st.w      	r5, (r2, 0x20)
	for(DataJ = 0;DataJ < length_u16 ;DataJ ++)
    20c6:	2300      	addi      	r3, 1
    20c8:	2001      	addi      	r0, 2
    20ca:	07f4      	br      	0x20b2	// 20b2 <USARTTransmit+0xa>

000020cc <USARTRxByte>:
/*************************************************************/
U16_T USARTRxByte(CSP_UART_T *uart,U16_T *Rxdata_u16)
{
	unsigned int  DataI;

	DataI = CSP_USART_GET_RHR(USART0);
    20cc:	1079      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
	DataI = DataI & USART_RXRDY;
    20ce:	3001      	movi      	r0, 1
	DataI = CSP_USART_GET_RHR(USART0);
    20d0:	9340      	ld.w      	r2, (r3, 0x0)
    20d2:	926a      	ld.w      	r3, (r2, 0x28)
	DataI = DataI & USART_RXRDY;
    20d4:	68c0      	and      	r3, r0
	if(DataI != USART_RXRDY)    //Loop  when rx is not full
    20d6:	3b40      	cmpnei      	r3, 0
    20d8:	0c04      	bf      	0x20e0	// 20e0 <USARTRxByte+0x14>
		return FALSE;
	else
	{
		*Rxdata_u16 = CSP_USART_GET_RHR(USART0);
    20da:	926a      	ld.w      	r3, (r2, 0x28)
    20dc:	a960      	st.h      	r3, (r1, 0x0)
	    return TRUE;
	}
}
    20de:	783c      	jmp      	r15
		return FALSE;
    20e0:	3000      	movi      	r0, 0
    20e2:	07fe      	br      	0x20de	// 20de <USARTRxByte+0x12>

000020e4 <USART_ReturnRxByte>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
U16_T USART_ReturnRxByte(void)
{
	RxDataFlag = FALSE;
    20e4:	107a      	lrw      	r3, 0x2000007c	// 214c <USARTReceive+0x52>
    20e6:	3200      	movi      	r2, 0
    20e8:	a340      	st.b      	r2, (r3, 0x0)
	while(RxDataFlag != TRUE);
    20ea:	8340      	ld.b      	r2, (r3, 0x0)
    20ec:	3a41      	cmpnei      	r2, 1
    20ee:	0bfe      	bt      	0x20ea	// 20ea <USART_ReturnRxByte+0x6>
	return CSP_USART_GET_RHR(USART0);
    20f0:	1070      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
    20f2:	9360      	ld.w      	r3, (r3, 0x0)
    20f4:	930a      	ld.w      	r0, (r3, 0x28)
    20f6:	7401      	zexth      	r0, r0
}
    20f8:	783c      	jmp      	r15

000020fa <USARTReceive>:
//USART Receive 
//EntryParameter:destAddress_u16,length_u16
//ReturnValue:NONE
/*************************************************************/
U16_T USARTReceive(U16_T *destAddress_u16,U16_T length_u16)
{
    20fa:	14c4      	push      	r4-r7
	unsigned int  DataI,DataJ,LoopTime;

	DataJ = 0;
	LoopTime = 0;
	do{
		DataI = CSP_USART_GET_RHR(USART0);
    20fc:	106d      	lrw      	r3, 0x2000002c	// 2130 <USARTReceive+0x36>
	LoopTime = 0;
    20fe:	3400      	movi      	r4, 0
		DataI = CSP_USART_GET_RHR(USART0);
    2100:	93a0      	ld.w      	r5, (r3, 0x0)
		DataI = DataI & USART_RXRDY;
    2102:	3601      	movi      	r6, 1
	DataJ = 0;
    2104:	3300      	movi      	r3, 0
		{
			*destAddress_u16++ = CSP_USART_GET_RHR(USART0);
			DataJ++;
			LoopTime = 0;
		}
		if(LoopTime ++ >= 0xfff0)
    2106:	10f3      	lrw      	r7, 0xffef	// 2150 <USARTReceive+0x56>
		DataI = CSP_USART_GET_RHR(USART0);
    2108:	954a      	ld.w      	r2, (r5, 0x28)
		DataI = DataI & USART_RXRDY;
    210a:	6898      	and      	r2, r6
		if(DataI == USART_RXRDY)    //Loop  when rx is full
    210c:	3a40      	cmpnei      	r2, 0
    210e:	0c0d      	bf      	0x2128	// 2128 <USARTReceive+0x2e>
			*destAddress_u16++ = CSP_USART_GET_RHR(USART0);
    2110:	954a      	ld.w      	r2, (r5, 0x28)
    2112:	a840      	st.h      	r2, (r0, 0x0)
			DataJ++;
    2114:	2300      	addi      	r3, 1
			*destAddress_u16++ = CSP_USART_GET_RHR(USART0);
    2116:	2001      	addi      	r0, 2
			LoopTime = 0;
    2118:	3200      	movi      	r2, 0
		if(LoopTime ++ >= 0xfff0)
    211a:	649c      	cmphs      	r7, r2
    211c:	5a82      	addi      	r4, r2, 1
    211e:	0c07      	bf      	0x212c	// 212c <USARTReceive+0x32>
			return FALSE;
	}while(DataJ < length_u16);
    2120:	644c      	cmphs      	r3, r1
    2122:	0ff3      	bf      	0x2108	// 2108 <USARTReceive+0xe>
	return TRUE;
    2124:	3001      	movi      	r0, 1
}
    2126:	1484      	pop      	r4-r7
    2128:	6c93      	mov      	r2, r4
    212a:	07f8      	br      	0x211a	// 211a <USARTReceive+0x20>
			return FALSE;
    212c:	3000      	movi      	r0, 0
    212e:	07fc      	br      	0x2126	// 2126 <USARTReceive+0x2c>
    2130:	2000002c 	.long	0x2000002c
    2134:	000007ff 	.long	0x000007ff
    2138:	20000078 	.long	0x20000078
    213c:	20000014 	.long	0x20000014
    2140:	2000000c 	.long	0x2000000c
    2144:	20000008 	.long	0x20000008
    2148:	20000010 	.long	0x20000010
    214c:	2000007c 	.long	0x2000007c
    2150:	0000ffef 	.long	0x0000ffef

00002154 <CMP_RESET_VALUE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void CMP_RESET_VALUE(void)
{
		CMP->CEDR=CMP_CEDR_RST;     			/**< CMP_CEDR  reset value  */
    2154:	1070      	lrw      	r3, 0x20000024	// 2194 <CMP_RESET_VALUE+0x40>
    2156:	3200      	movi      	r2, 0
    2158:	9360      	ld.w      	r3, (r3, 0x0)
    215a:	b340      	st.w      	r2, (r3, 0x0)
		CMP->CR0=CMP_CR0_RST;     				/**< CMP_CR0  reset value  	*/
    215c:	b341      	st.w      	r2, (r3, 0x4)
		CMP->CR1=CMP_CR1_RST;					/**< CMP_CR1  reset value  	*/
    215e:	b342      	st.w      	r2, (r3, 0x8)
		CMP->CR2=CMP_CR2_RST;     				/**< CMP_CR2  reset value  	*/
    2160:	b343      	st.w      	r2, (r3, 0xc)
		CMP->CR3=CMP_CR3_RST;     				/**< CMP_CR3  reset value  	*/
    2162:	b344      	st.w      	r2, (r3, 0x10)
		CMP->CR4=CMP_CR4_RST;     				/**< CMP_CR4  reset value  	*/
    2164:	b345      	st.w      	r2, (r3, 0x14)
		CMP->CR5=CMP_CR5_RST;     				/**< CMP_CR5  reset value  	*/
    2166:	b346      	st.w      	r2, (r3, 0x18)
		CMP->FLTCR0=CMP_FLTCR0_RST;     		/**< CMP_FLTCR0  reset value*/
    2168:	b347      	st.w      	r2, (r3, 0x1c)
		CMP->FLTCR1=CMP_FLTCR1_RST;     		/**< CMP_FLTCR1  reset value*/
    216a:	b348      	st.w      	r2, (r3, 0x20)
		CMP->FLTCR2=CMP_FLTCR2_RST;     		/**< CMP_FLTCR2  reset value*/
    216c:	b349      	st.w      	r2, (r3, 0x24)
		CMP->FLTCR3=CMP_FLTCR3_RST;     		/**< CMP_FLTCR3  reset value*/
    216e:	b34a      	st.w      	r2, (r3, 0x28)
		CMP->FLTCR4=CMP_FLTCR4_RST;     		/**< CMP_FLTCR4  reset value*/
    2170:	b34b      	st.w      	r2, (r3, 0x2c)
		CMP->FLTCR5=CMP_FLTCR5_RST;     		/**< CMP_FLTCR5  reset value*/
    2172:	b34c      	st.w      	r2, (r3, 0x30)
		CMP->WCNT0=CMP_WCNT0_RST;				/**< CMP_WCNT0   reset value*/
    2174:	b34d      	st.w      	r2, (r3, 0x34)
		CMP->WCNT1=CMP_WCNT1_RST;				/**< CMP_WCNT1   reset value*/
    2176:	b34e      	st.w      	r2, (r3, 0x38)
		CMP->WCNT2=CMP_WCNT2_RST;				/**< CMP_WCNT2   reset value*/
    2178:	b34f      	st.w      	r2, (r3, 0x3c)
		CMP->INPCR0=CMP_INPCR0_RST;				/**< CMP_INPCR0  reset value*/
    217a:	b350      	st.w      	r2, (r3, 0x40)
		CMP->INPCR1=CMP_INPCR1_RST;				/**< CMP_INPCR1  reset value*/
    217c:	b351      	st.w      	r2, (r3, 0x44)
		CMP->INPCR2=CMP_INPCR2_RST;				/**< CMP_INPCR2  reset value*/
    217e:	b352      	st.w      	r2, (r3, 0x48)
		CMP->INPCR3=CMP_INPCR3_RST;				/**< CMP_INPCR3  reset value*/
    2180:	b353      	st.w      	r2, (r3, 0x4c)
		CMP->INPCR4=CMP_INPCR4_RST;				/**< CMP_INPCR4  reset value*/
    2182:	b354      	st.w      	r2, (r3, 0x50)
		CMP->INPCR5=CMP_INPCR5_RST;				/**< CMP_INPCR5  reset value*/
    2184:	b355      	st.w      	r2, (r3, 0x54)
		CMP->TRGCR=CMP_TRGCR_RST;				/**< CMP_TRGCR   reset value*/	
    2186:	b356      	st.w      	r2, (r3, 0x58)
		CMP->IMCR=CMP_IMCR_RST;					/**< CMP_IMCR    reset value*/	
    2188:	b357      	st.w      	r2, (r3, 0x5c)
		CMP->RISR=CMP_RISR_RST;					/**< CMP_RISR    reset value*/	
    218a:	b358      	st.w      	r2, (r3, 0x60)
		CMP->MISR=CMP_MISR_RST;					/**< CMP_MISR    reset value*/	
    218c:	b359      	st.w      	r2, (r3, 0x64)
		CMP->ICR=CMP_ICR_RST;					/**< CMP_ICR     reset value*/	
    218e:	b35a      	st.w      	r2, (r3, 0x68)
		CMP->VOLSEL = CMP_VOLSEL_RST;           /**< CMP_VOLSEL  reset value*/	
    2190:	b35b      	st.w      	r2, (r3, 0x6c)
}
    2192:	783c      	jmp      	r15
    2194:	20000024 	.long	0x20000024

00002198 <CMP_software_reset>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void CMP_software_reset(void)
{
	CMP->CEDR|=(0X01<<7);
    2198:	0261      	lrw      	r3, 0x20000024	// 2490 <CMP_INPCRX_Config+0x2a>
    219a:	9340      	ld.w      	r2, (r3, 0x0)
    219c:	9260      	ld.w      	r3, (r2, 0x0)
    219e:	3ba7      	bseti      	r3, 7
    21a0:	b260      	st.w      	r3, (r2, 0x0)
}
    21a2:	783c      	jmp      	r15

000021a4 <CMP_CLK_CMD>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/  
void CMP_CLK_CMD(CMPx_selecte_TypeDef CMPx_NUM , FunctionalStatus NewState)
{
	if(CMPx_NUM==CMP0_NUM)
    21a4:	3840      	cmpnei      	r0, 0
    21a6:	080b      	bt      	0x21bc	// 21bc <CMP_CLK_CMD+0x18>
    21a8:	0265      	lrw      	r3, 0x20000024	// 2490 <CMP_INPCRX_Config+0x2a>
	{
		if(NewState != DISABLE)
    21aa:	3940      	cmpnei      	r1, 0
		{
			CMP->CEDR|=0X01;
    21ac:	9340      	ld.w      	r2, (r3, 0x0)
    21ae:	9260      	ld.w      	r3, (r2, 0x0)
		if(NewState != DISABLE)
    21b0:	0c04      	bf      	0x21b8	// 21b8 <CMP_CLK_CMD+0x14>
			CMP->CEDR|=0X01;
    21b2:	3ba0      	bseti      	r3, 0
		{
			CMP->CEDR|=0X20;
		}
		else
		{
			CMP->CEDR&=0XFFFFFFDF;
    21b4:	b260      	st.w      	r3, (r2, 0x0)
		}
	}
}
    21b6:	783c      	jmp      	r15
			CMP->CEDR&=0XFFFFFFFE;
    21b8:	3b80      	bclri      	r3, 0
    21ba:	07fd      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
	else if(CMPx_NUM==CMP1_NUM)
    21bc:	3841      	cmpnei      	r0, 1
    21be:	080a      	bt      	0x21d2	// 21d2 <CMP_CLK_CMD+0x2e>
    21c0:	026b      	lrw      	r3, 0x20000024	// 2490 <CMP_INPCRX_Config+0x2a>
		if(NewState != DISABLE)
    21c2:	3940      	cmpnei      	r1, 0
			CMP->CEDR|=0X02;
    21c4:	9340      	ld.w      	r2, (r3, 0x0)
    21c6:	9260      	ld.w      	r3, (r2, 0x0)
		if(NewState != DISABLE)
    21c8:	0c03      	bf      	0x21ce	// 21ce <CMP_CLK_CMD+0x2a>
			CMP->CEDR|=0X02;
    21ca:	3ba1      	bseti      	r3, 1
    21cc:	07f4      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
			CMP->CEDR&=0XFFFFFFFD;
    21ce:	3b81      	bclri      	r3, 1
    21d0:	07f2      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
	else if(CMPx_NUM==CMP2_NUM)
    21d2:	3842      	cmpnei      	r0, 2
    21d4:	080a      	bt      	0x21e8	// 21e8 <CMP_CLK_CMD+0x44>
    21d6:	0270      	lrw      	r3, 0x20000024	// 2490 <CMP_INPCRX_Config+0x2a>
		if(NewState != DISABLE)
    21d8:	3940      	cmpnei      	r1, 0
			CMP->CEDR|=0X04;
    21da:	9340      	ld.w      	r2, (r3, 0x0)
    21dc:	9260      	ld.w      	r3, (r2, 0x0)
		if(NewState != DISABLE)
    21de:	0c03      	bf      	0x21e4	// 21e4 <CMP_CLK_CMD+0x40>
			CMP->CEDR|=0X04;
    21e0:	3ba2      	bseti      	r3, 2
    21e2:	07e9      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
			CMP->CEDR&=0XFFFFFFFB;
    21e4:	3b82      	bclri      	r3, 2
    21e6:	07e7      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
	else if(CMPx_NUM==CMP3_NUM)
    21e8:	3843      	cmpnei      	r0, 3
    21ea:	080a      	bt      	0x21fe	// 21fe <CMP_CLK_CMD+0x5a>
    21ec:	0276      	lrw      	r3, 0x20000024	// 2490 <CMP_INPCRX_Config+0x2a>
		if(NewState != DISABLE)
    21ee:	3940      	cmpnei      	r1, 0
			CMP->CEDR|=0X8;
    21f0:	9340      	ld.w      	r2, (r3, 0x0)
    21f2:	9260      	ld.w      	r3, (r2, 0x0)
		if(NewState != DISABLE)
    21f4:	0c03      	bf      	0x21fa	// 21fa <CMP_CLK_CMD+0x56>
			CMP->CEDR|=0X8;
    21f6:	3ba3      	bseti      	r3, 3
    21f8:	07de      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
			CMP->CEDR&=0XFFFFFFF7;
    21fa:	3b83      	bclri      	r3, 3
    21fc:	07dc      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
	else if(CMPx_NUM==CMP4_NUM)
    21fe:	3844      	cmpnei      	r0, 4
    2200:	080a      	bt      	0x2214	// 2214 <CMP_CLK_CMD+0x70>
    2202:	027b      	lrw      	r3, 0x20000024	// 2490 <CMP_INPCRX_Config+0x2a>
		if(NewState != DISABLE)
    2204:	3940      	cmpnei      	r1, 0
			CMP->CEDR|=0X10;
    2206:	9340      	ld.w      	r2, (r3, 0x0)
    2208:	9260      	ld.w      	r3, (r2, 0x0)
		if(NewState != DISABLE)
    220a:	0c03      	bf      	0x2210	// 2210 <CMP_CLK_CMD+0x6c>
			CMP->CEDR|=0X10;
    220c:	3ba4      	bseti      	r3, 4
    220e:	07d3      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
			CMP->CEDR&=0XFFFFFFEF;
    2210:	3b84      	bclri      	r3, 4
    2212:	07d1      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
	else if(CMPx_NUM==CMP5_NUM)
    2214:	3845      	cmpnei      	r0, 5
    2216:	0bd0      	bt      	0x21b6	// 21b6 <CMP_CLK_CMD+0x12>
    2218:	0361      	lrw      	r3, 0x20000024	// 2490 <CMP_INPCRX_Config+0x2a>
		if(NewState != DISABLE)
    221a:	3940      	cmpnei      	r1, 0
			CMP->CEDR|=0X20;
    221c:	9340      	ld.w      	r2, (r3, 0x0)
    221e:	9260      	ld.w      	r3, (r2, 0x0)
		if(NewState != DISABLE)
    2220:	0c03      	bf      	0x2226	// 2226 <CMP_CLK_CMD+0x82>
			CMP->CEDR|=0X20;
    2222:	3ba5      	bseti      	r3, 5
    2224:	07c8      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>
			CMP->CEDR&=0XFFFFFFDF;
    2226:	3b85      	bclri      	r3, 5
    2228:	07c6      	br      	0x21b4	// 21b4 <CMP_CLK_CMD+0x10>

0000222a <CMP_IO_Init>:
//CMP_IO_MODE_X:0~1
//ReturnValue:NONE
/*************************************************************/  
void CMP_IO_Init(CMP_IO_MODE_TypeDef  CMP_IO_MODE_X , U8_T CMP_IO_G )
{
	if(CMP_IO_MODE_X==CPINP0)
    222a:	3840      	cmpnei      	r0, 0
    222c:	080c      	bt      	0x2244	// 2244 <CMP_IO_Init+0x1a>
	{
		if(CMP_IO_G==0)
    222e:	3940      	cmpnei      	r1, 0
    2230:	0817      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
		{
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFF0FF)|0x00000A00;										//CPINP0(PA0.2->AF7)
    2232:	0366      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
	}
	else if(CMP_IO_MODE_X==CPINN0)
	{
		if(CMP_IO_G==0)
		{
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFF0FF)|0x00000A00;										//CPINN0(PB0.2->AF7)
    2234:	9320      	ld.w      	r1, (r3, 0x0)
    2236:	32f0      	movi      	r2, 240
    2238:	9160      	ld.w      	r3, (r1, 0x0)
    223a:	4244      	lsli      	r2, r2, 4
    223c:	68c9      	andn      	r3, r2
    223e:	3ba9      	bseti      	r3, 9
    2240:	3bab      	bseti      	r3, 11
    2242:	040d      	br      	0x225c	// 225c <CMP_IO_Init+0x32>
	else if(CMP_IO_MODE_X==CPINP1)
    2244:	3841      	cmpnei      	r0, 1
    2246:	080d      	bt      	0x2260	// 2260 <CMP_IO_Init+0x36>
		if(CMP_IO_G==0)
    2248:	3940      	cmpnei      	r1, 0
    224a:	080a      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFF0FFFFF)|0x00A00000;										//CPINP1(PA0.5->AF7)
    224c:	036d      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    224e:	9320      	ld.w      	r1, (r3, 0x0)
    2250:	32f0      	movi      	r2, 240
    2252:	9160      	ld.w      	r3, (r1, 0x0)
    2254:	4250      	lsli      	r2, r2, 16
    2256:	68c9      	andn      	r3, r2
    2258:	3bb5      	bseti      	r3, 21
    225a:	3bb7      	bseti      	r3, 23
    225c:	b160      	st.w      	r3, (r1, 0x0)
		if(CMP_IO_G==0)
		{
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x00000008;										//CP5_OUT(PA0.8->AF5)
		}
	}
}
    225e:	783c      	jmp      	r15
	else if(CMP_IO_MODE_X==CPINP2)
    2260:	3842      	cmpnei      	r0, 2
    2262:	080c      	bt      	0x227a	// 227a <CMP_IO_Init+0x50>
		if(CMP_IO_G==0)
    2264:	3940      	cmpnei      	r1, 0
    2266:	0bfc      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XF0FFFFFF)|0x0A000000;										//CPINP2(PA0.6->AF7)
    2268:	0374      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    226a:	32f0      	movi      	r2, 240
    226c:	9320      	ld.w      	r1, (r3, 0x0)
    226e:	9160      	ld.w      	r3, (r1, 0x0)
    2270:	4254      	lsli      	r2, r2, 20
    2272:	68c9      	andn      	r3, r2
    2274:	3bb9      	bseti      	r3, 25
    2276:	3bbb      	bseti      	r3, 27
    2278:	07f2      	br      	0x225c	// 225c <CMP_IO_Init+0x32>
	else if(CMP_IO_MODE_X==CPINP3)
    227a:	3843      	cmpnei      	r0, 3
    227c:	080c      	bt      	0x2294	// 2294 <CMP_IO_Init+0x6a>
		if(CMP_IO_G==0)
    227e:	3940      	cmpnei      	r1, 0
    2280:	0bef      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA0->CONLR=(GPIOA0->CONLR & 0X0FFFFFFF)|0xA0000000;										//CPINP3(PA0.7->AF7)
    2282:	037a      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    2284:	9340      	ld.w      	r2, (r3, 0x0)
    2286:	9260      	ld.w      	r3, (r2, 0x0)
    2288:	4364      	lsli      	r3, r3, 4
    228a:	4b64      	lsri      	r3, r3, 4
    228c:	3bbd      	bseti      	r3, 29
    228e:	3bbf      	bseti      	r3, 31
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFFFF0)|0x00000007;										//CP4_OUT(PC0.0->AF4)
    2290:	b260      	st.w      	r3, (r2, 0x0)
    2292:	07e6      	br      	0x225e	// 225e <CMP_IO_Init+0x34>
	else if(CMP_IO_MODE_X==CPINP4)
    2294:	3844      	cmpnei      	r0, 4
    2296:	080b      	bt      	0x22ac	// 22ac <CMP_IO_Init+0x82>
		if(CMP_IO_G==0)
    2298:	3940      	cmpnei      	r1, 0
    229a:	0be2      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x0000000A;										//CPINN2(PA0.8->AF7)
    229c:	137e      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    229e:	310f      	movi      	r1, 15
    22a0:	9340      	ld.w      	r2, (r3, 0x0)
    22a2:	9261      	ld.w      	r3, (r2, 0x4)
    22a4:	68c5      	andn      	r3, r1
    22a6:	3ba1      	bseti      	r3, 1
    22a8:	3ba3      	bseti      	r3, 3
    22aa:	040c      	br      	0x22c2	// 22c2 <CMP_IO_Init+0x98>
	else if(CMP_IO_MODE_X==CPINP5)
    22ac:	3845      	cmpnei      	r0, 5
    22ae:	080c      	bt      	0x22c6	// 22c6 <CMP_IO_Init+0x9c>
		if(CMP_IO_G==0)
    22b0:	3940      	cmpnei      	r1, 0
    22b2:	0bd6      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFF0F)|0x000000A0;										//CPINP5(PA0.09->AF7)
    22b4:	1378      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    22b6:	31f0      	movi      	r1, 240
    22b8:	9340      	ld.w      	r2, (r3, 0x0)
    22ba:	9261      	ld.w      	r3, (r2, 0x4)
    22bc:	68c5      	andn      	r3, r1
    22be:	3ba5      	bseti      	r3, 5
    22c0:	3ba7      	bseti      	r3, 7
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x00000008;										//CP5_OUT(PA0.8->AF5)
    22c2:	b261      	st.w      	r3, (r2, 0x4)
}
    22c4:	07cd      	br      	0x225e	// 225e <CMP_IO_Init+0x34>
	else if(CMP_IO_MODE_X==CPINP6)
    22c6:	3846      	cmpnei      	r0, 6
    22c8:	080b      	bt      	0x22de	// 22de <CMP_IO_Init+0xb4>
		if(CMP_IO_G==0)
    22ca:	3940      	cmpnei      	r1, 0
    22cc:	0bc9      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFF0F)|0x000000A0;										//CPINP6(PB0.1->AF7)
    22ce:	1373      	lrw      	r3, 0x2000000c	// 2498 <CMP_INPCRX_Config+0x32>
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFF0F)|0x000000A0;										//CPINP7(PA0.1->AF7)
    22d0:	9340      	ld.w      	r2, (r3, 0x0)
    22d2:	9260      	ld.w      	r3, (r2, 0x0)
    22d4:	31f0      	movi      	r1, 240
    22d6:	68c5      	andn      	r3, r1
    22d8:	3ba5      	bseti      	r3, 5
    22da:	3ba7      	bseti      	r3, 7
    22dc:	07da      	br      	0x2290	// 2290 <CMP_IO_Init+0x66>
	else if(CMP_IO_MODE_X==CPINP7)
    22de:	3847      	cmpnei      	r0, 7
    22e0:	0805      	bt      	0x22ea	// 22ea <CMP_IO_Init+0xc0>
		if(CMP_IO_G==0)
    22e2:	3940      	cmpnei      	r1, 0
    22e4:	0bbd      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFF0F)|0x000000A0;										//CPINP7(PA0.1->AF7)
    22e6:	136c      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    22e8:	07f4      	br      	0x22d0	// 22d0 <CMP_IO_Init+0xa6>
	else if(CMP_IO_MODE_X==CPINP8)
    22ea:	3848      	cmpnei      	r0, 8
    22ec:	080c      	bt      	0x2304	// 2304 <CMP_IO_Init+0xda>
		if(CMP_IO_G==0)
    22ee:	3940      	cmpnei      	r1, 0
    22f0:	0bb7      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x000A0000;										//CPINP8(PA1.4->AF7)
    22f2:	136b      	lrw      	r3, 0x20000010	// 249c <CMP_INPCRX_Config+0x36>
    22f4:	32f0      	movi      	r2, 240
    22f6:	9320      	ld.w      	r1, (r3, 0x0)
    22f8:	9160      	ld.w      	r3, (r1, 0x0)
    22fa:	424c      	lsli      	r2, r2, 12
    22fc:	68c9      	andn      	r3, r2
    22fe:	3bb1      	bseti      	r3, 17
    2300:	3bb3      	bseti      	r3, 19
    2302:	07ad      	br      	0x225c	// 225c <CMP_IO_Init+0x32>
	else if(CMP_IO_MODE_X==CPINP9)
    2304:	3849      	cmpnei      	r0, 9
    2306:	0805      	bt      	0x2310	// 2310 <CMP_IO_Init+0xe6>
		if(CMP_IO_G==0)
    2308:	3940      	cmpnei      	r1, 0
    230a:	0baa      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFF0FFFFF)|0x00A00000;										//CPINP9(PA1.5->AF7)
    230c:	1364      	lrw      	r3, 0x20000010	// 249c <CMP_INPCRX_Config+0x36>
    230e:	07a0      	br      	0x224e	// 224e <CMP_IO_Init+0x24>
	else if(CMP_IO_MODE_X==CPINN0)
    2310:	384a      	cmpnei      	r0, 10
    2312:	0805      	bt      	0x231c	// 231c <CMP_IO_Init+0xf2>
		if(CMP_IO_G==0)
    2314:	3940      	cmpnei      	r1, 0
    2316:	0ba4      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFF0FF)|0x00000A00;										//CPINN0(PB0.2->AF7)
    2318:	1360      	lrw      	r3, 0x2000000c	// 2498 <CMP_INPCRX_Config+0x32>
    231a:	078d      	br      	0x2234	// 2234 <CMP_IO_Init+0xa>
	else if(CMP_IO_MODE_X==CPINN1)
    231c:	384b      	cmpnei      	r0, 11
    231e:	080c      	bt      	0x2336	// 2336 <CMP_IO_Init+0x10c>
		if(CMP_IO_G==0)
    2320:	3940      	cmpnei      	r1, 0
    2322:	0b9e      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFF0FFF)|0x0000A000;										//CPINN1(PB0.3->AF7)
    2324:	127d      	lrw      	r3, 0x2000000c	// 2498 <CMP_INPCRX_Config+0x32>
    2326:	32f0      	movi      	r2, 240
    2328:	9320      	ld.w      	r1, (r3, 0x0)
    232a:	9160      	ld.w      	r3, (r1, 0x0)
    232c:	4248      	lsli      	r2, r2, 8
    232e:	68c9      	andn      	r3, r2
    2330:	3bad      	bseti      	r3, 13
    2332:	3baf      	bseti      	r3, 15
    2334:	0794      	br      	0x225c	// 225c <CMP_IO_Init+0x32>
	else if(CMP_IO_MODE_X==CPINN2)
    2336:	384c      	cmpnei      	r0, 12
    2338:	0fb0      	bf      	0x2298	// 2298 <CMP_IO_Init+0x6e>
	else if(CMP_IO_MODE_X==CPINN3)
    233a:	384d      	cmpnei      	r0, 13
    233c:	080d      	bt      	0x2356	// 2356 <CMP_IO_Init+0x12c>
		if(CMP_IO_G==0)
    233e:	3940      	cmpnei      	r1, 0
    2340:	0b8f      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFF0FF)|0x00000A00;										//CPINN3(PA0.10->AF7)
    2342:	1275      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    2344:	32f0      	movi      	r2, 240
    2346:	9320      	ld.w      	r1, (r3, 0x0)
    2348:	9161      	ld.w      	r3, (r1, 0x4)
    234a:	4244      	lsli      	r2, r2, 4
    234c:	68c9      	andn      	r3, r2
    234e:	3ba9      	bseti      	r3, 9
    2350:	3bab      	bseti      	r3, 11
    2352:	b161      	st.w      	r3, (r1, 0x4)
    2354:	0785      	br      	0x225e	// 225e <CMP_IO_Init+0x34>
	else if(CMP_IO_MODE_X==CPINN4)
    2356:	384e      	cmpnei      	r0, 14
    2358:	080b      	bt      	0x236e	// 236e <CMP_IO_Init+0x144>
		if(CMP_IO_G==0)
    235a:	3940      	cmpnei      	r1, 0
    235c:	0b81      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFFF0)|0x0000000A;										//CPINN4(PA0.0->AF7)
    235e:	126e      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    2360:	310f      	movi      	r1, 15
    2362:	9340      	ld.w      	r2, (r3, 0x0)
    2364:	9260      	ld.w      	r3, (r2, 0x0)
    2366:	68c5      	andn      	r3, r1
    2368:	3ba1      	bseti      	r3, 1
    236a:	3ba3      	bseti      	r3, 3
    236c:	0792      	br      	0x2290	// 2290 <CMP_IO_Init+0x66>
	else if(CMP_IO_MODE_X==CP0_OUT)
    236e:	384f      	cmpnei      	r0, 15
    2370:	0820      	bt      	0x23b0	// 23b0 <CMP_IO_Init+0x186>
		if(CMP_IO_G==0)
    2372:	3940      	cmpnei      	r1, 0
    2374:	0807      	bt      	0x2382	// 2382 <CMP_IO_Init+0x158>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFFF0)|0x00000008;										//CP0_OUT(PA1.0->AF5)
    2376:	126a      	lrw      	r3, 0x20000010	// 249c <CMP_INPCRX_Config+0x36>
    2378:	9340      	ld.w      	r2, (r3, 0x0)
    237a:	9260      	ld.w      	r3, (r2, 0x0)
    237c:	68c1      	andn      	r3, r0
    237e:	3ba3      	bseti      	r3, 3
    2380:	0788      	br      	0x2290	// 2290 <CMP_IO_Init+0x66>
		else if(CMP_IO_G==1)
    2382:	3941      	cmpnei      	r1, 1
    2384:	080b      	bt      	0x239a	// 239a <CMP_IO_Init+0x170>
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFF0FFF)|0x00007000;										//CP0_OUT(PB0.3->AF4)
    2386:	1265      	lrw      	r3, 0x2000000c	// 2498 <CMP_INPCRX_Config+0x32>
    2388:	32f0      	movi      	r2, 240
    238a:	9320      	ld.w      	r1, (r3, 0x0)
    238c:	4248      	lsli      	r2, r2, 8
    238e:	9160      	ld.w      	r3, (r1, 0x0)
    2390:	68c9      	andn      	r3, r2
    2392:	32e0      	movi      	r2, 224
    2394:	4247      	lsli      	r2, r2, 7
			GPIOA0->CONLR=(GPIOA0->CONLR & 0X0FFFFFFF)|0x70000000;										//CP4_OUT(PA0.7->AF4)
    2396:	6cc8      	or      	r3, r2
    2398:	0762      	br      	0x225c	// 225c <CMP_IO_Init+0x32>
		else if(CMP_IO_G==2)
    239a:	3942      	cmpnei      	r1, 2
    239c:	0b61      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XF0FFFFFF)|0x06000000;										//CP0_OUT(PB0.6->AF3)
    239e:	117f      	lrw      	r3, 0x2000000c	// 2498 <CMP_INPCRX_Config+0x32>
    23a0:	32f0      	movi      	r2, 240
    23a2:	9320      	ld.w      	r1, (r3, 0x0)
    23a4:	9160      	ld.w      	r3, (r1, 0x0)
    23a6:	4254      	lsli      	r2, r2, 20
    23a8:	68c9      	andn      	r3, r2
    23aa:	3bb9      	bseti      	r3, 25
    23ac:	3bba      	bseti      	r3, 26
    23ae:	0757      	br      	0x225c	// 225c <CMP_IO_Init+0x32>
	else if(CMP_IO_MODE_X==CP1_OUT)
    23b0:	3850      	cmpnei      	r0, 16
    23b2:	0815      	bt      	0x23dc	// 23dc <CMP_IO_Init+0x1b2>
		if(CMP_IO_G==0)
    23b4:	3940      	cmpnei      	r1, 0
    23b6:	0808      	bt      	0x23c6	// 23c6 <CMP_IO_Init+0x19c>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFF0F)|0x00000080;										//CP1_OUT(PA1.1->AF5)
    23b8:	1179      	lrw      	r3, 0x20000010	// 249c <CMP_INPCRX_Config+0x36>
    23ba:	31f0      	movi      	r1, 240
    23bc:	9340      	ld.w      	r2, (r3, 0x0)
    23be:	9260      	ld.w      	r3, (r2, 0x0)
    23c0:	68c5      	andn      	r3, r1
    23c2:	3ba7      	bseti      	r3, 7
    23c4:	0766      	br      	0x2290	// 2290 <CMP_IO_Init+0x66>
		else if(CMP_IO_G==1)
    23c6:	3941      	cmpnei      	r1, 1
    23c8:	0b4b      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XF0FFFFFF)|0x07000000;										//CP1_OUT(PB0.6->AF4)
    23ca:	1174      	lrw      	r3, 0x2000000c	// 2498 <CMP_INPCRX_Config+0x32>
    23cc:	32f0      	movi      	r2, 240
    23ce:	9320      	ld.w      	r1, (r3, 0x0)
    23d0:	4254      	lsli      	r2, r2, 20
    23d2:	9160      	ld.w      	r3, (r1, 0x0)
    23d4:	68c9      	andn      	r3, r2
    23d6:	32e0      	movi      	r2, 224
    23d8:	4253      	lsli      	r2, r2, 19
    23da:	07de      	br      	0x2396	// 2396 <CMP_IO_Init+0x16c>
	else if(CMP_IO_MODE_X==CP2_OUT)
    23dc:	3851      	cmpnei      	r0, 17
    23de:	0816      	bt      	0x240a	// 240a <CMP_IO_Init+0x1e0>
		if(CMP_IO_G==0)
    23e0:	3940      	cmpnei      	r1, 0
    23e2:	0809      	bt      	0x23f4	// 23f4 <CMP_IO_Init+0x1ca>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFF0FF)|0x00000800;										//CP2_OUT(PA1.2->AF5)
    23e4:	116e      	lrw      	r3, 0x20000010	// 249c <CMP_INPCRX_Config+0x36>
    23e6:	32f0      	movi      	r2, 240
    23e8:	9320      	ld.w      	r1, (r3, 0x0)
    23ea:	9160      	ld.w      	r3, (r1, 0x0)
    23ec:	4244      	lsli      	r2, r2, 4
    23ee:	68c9      	andn      	r3, r2
    23f0:	3bab      	bseti      	r3, 11
    23f2:	0735      	br      	0x225c	// 225c <CMP_IO_Init+0x32>
		else if(CMP_IO_G==1)
    23f4:	3941      	cmpnei      	r1, 1
    23f6:	0b34      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOB0->CONLR=(GPIOB0->CONLR & 0XFF0FFFFF)|0x00700000;										//CP2_OUT(PB0.5->AF4)
    23f8:	1168      	lrw      	r3, 0x2000000c	// 2498 <CMP_INPCRX_Config+0x32>
    23fa:	32f0      	movi      	r2, 240
    23fc:	9320      	ld.w      	r1, (r3, 0x0)
    23fe:	4250      	lsli      	r2, r2, 16
    2400:	9160      	ld.w      	r3, (r1, 0x0)
    2402:	68c9      	andn      	r3, r2
    2404:	32e0      	movi      	r2, 224
    2406:	424f      	lsli      	r2, r2, 15
    2408:	07c7      	br      	0x2396	// 2396 <CMP_IO_Init+0x16c>
	else if(CMP_IO_MODE_X==CP3_OUT)
    240a:	3852      	cmpnei      	r0, 18
    240c:	080c      	bt      	0x2424	// 2424 <CMP_IO_Init+0x1fa>
		if(CMP_IO_G==0)
    240e:	3940      	cmpnei      	r1, 0
    2410:	0b27      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x00060000;										//CP3_OUT(PA1.4->AF3)
    2412:	1163      	lrw      	r3, 0x20000010	// 249c <CMP_INPCRX_Config+0x36>
    2414:	32f0      	movi      	r2, 240
    2416:	9320      	ld.w      	r1, (r3, 0x0)
    2418:	9160      	ld.w      	r3, (r1, 0x0)
    241a:	424c      	lsli      	r2, r2, 12
    241c:	68c9      	andn      	r3, r2
    241e:	3bb1      	bseti      	r3, 17
    2420:	3bb2      	bseti      	r3, 18
    2422:	071d      	br      	0x225c	// 225c <CMP_IO_Init+0x32>
	else if(CMP_IO_MODE_X==CP4_OUT)
    2424:	3853      	cmpnei      	r0, 19
    2426:	0815      	bt      	0x2450	// 2450 <CMP_IO_Init+0x226>
		if(CMP_IO_G==0)
    2428:	3940      	cmpnei      	r1, 0
    242a:	0809      	bt      	0x243c	// 243c <CMP_IO_Init+0x212>
			GPIOA0->CONLR=(GPIOA0->CONLR & 0X0FFFFFFF)|0x70000000;										//CP4_OUT(PA0.7->AF4)
    242c:	107a      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    242e:	32e0      	movi      	r2, 224
    2430:	9320      	ld.w      	r1, (r3, 0x0)
    2432:	9160      	ld.w      	r3, (r1, 0x0)
    2434:	4364      	lsli      	r3, r3, 4
    2436:	4b64      	lsri      	r3, r3, 4
    2438:	4257      	lsli      	r2, r2, 23
    243a:	07ae      	br      	0x2396	// 2396 <CMP_IO_Init+0x16c>
		else if(CMP_IO_G==1)
    243c:	3941      	cmpnei      	r1, 1
    243e:	0b10      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOC0->CONLR=(GPIOC0->CONLR & 0XFFFFFFF0)|0x00000007;										//CP4_OUT(PC0.0->AF4)
    2440:	1078      	lrw      	r3, 0x20000008	// 24a0 <CMP_INPCRX_Config+0x3a>
    2442:	310f      	movi      	r1, 15
    2444:	9340      	ld.w      	r2, (r3, 0x0)
    2446:	9260      	ld.w      	r3, (r2, 0x0)
    2448:	68c5      	andn      	r3, r1
    244a:	3107      	movi      	r1, 7
    244c:	6cc4      	or      	r3, r1
    244e:	0721      	br      	0x2290	// 2290 <CMP_IO_Init+0x66>
	else if(CMP_IO_MODE_X==CP5_OUT)
    2450:	3854      	cmpnei      	r0, 20
    2452:	0b06      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
		if(CMP_IO_G==0)
    2454:	3940      	cmpnei      	r1, 0
    2456:	0b04      	bt      	0x225e	// 225e <CMP_IO_Init+0x34>
			GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x00000008;										//CP5_OUT(PA0.8->AF5)
    2458:	106f      	lrw      	r3, 0x20000014	// 2494 <CMP_INPCRX_Config+0x2e>
    245a:	310f      	movi      	r1, 15
    245c:	9340      	ld.w      	r2, (r3, 0x0)
    245e:	9261      	ld.w      	r3, (r2, 0x4)
    2460:	68c5      	andn      	r3, r1
    2462:	3ba3      	bseti      	r3, 3
    2464:	072f      	br      	0x22c2	// 22c2 <CMP_IO_Init+0x98>

00002466 <CMP_INPCRX_Config>:
//9:CPINP9
//13:OPA1X
//14:OPA0X
//-------------------------------------
void CMP_INPCRX_Config(CMPx_selecte_TypeDef CMPx_NUM , U8_T CMPX_NSEL , U8_T CMPX_PSEL )
{
    2466:	14c1      	push      	r4
	if(CMPx_NUM==CMP0_NUM)
    2468:	3840      	cmpnei      	r0, 0
    246a:	080d      	bt      	0x2484	// 2484 <CMP_INPCRX_Config+0x1e>
	{
		CMP->INPCR0&=0xfffff000;
    246c:	1069      	lrw      	r3, 0x20000024	// 2490 <CMP_INPCRX_Config+0x2a>
    246e:	108e      	lrw      	r4, 0xfff	// 24a4 <CMP_INPCRX_Config+0x3e>
    2470:	9360      	ld.w      	r3, (r3, 0x0)
    2472:	9310      	ld.w      	r0, (r3, 0x40)
    2474:	6811      	andn      	r0, r4
    2476:	b310      	st.w      	r0, (r3, 0x40)
		CMP->INPCR0|=CMPX_NSEL|(CMPX_PSEL<<8);   //INPCR0 CMPX_NSEL Select
    2478:	4248      	lsli      	r2, r2, 8
    247a:	9310      	ld.w      	r0, (r3, 0x40)
    247c:	6c84      	or      	r2, r1
    247e:	6c80      	or      	r2, r0
    2480:	b350      	st.w      	r2, (r3, 0x40)
	else if(CMPx_NUM==CMP5_NUM)
	{
		CMP->INPCR5&=0xfffff000;
		CMP->INPCR5|=CMPX_NSEL|(CMPX_PSEL<<8);
	}
}
    2482:	1481      	pop      	r4
	else if(CMPx_NUM==CMP1_NUM)
    2484:	3841      	cmpnei      	r0, 1
    2486:	081a      	bt      	0x24ba	// 24ba <CMP_INPCRX_Config+0x54>
		CMP->INPCR1&=0xfffff000;
    2488:	1062      	lrw      	r3, 0x20000024	// 2490 <CMP_INPCRX_Config+0x2a>
    248a:	1087      	lrw      	r4, 0xfff	// 24a4 <CMP_INPCRX_Config+0x3e>
    248c:	9360      	ld.w      	r3, (r3, 0x0)
    248e:	040d      	br      	0x24a8	// 24a8 <CMP_INPCRX_Config+0x42>
    2490:	20000024 	.long	0x20000024
    2494:	20000014 	.long	0x20000014
    2498:	2000000c 	.long	0x2000000c
    249c:	20000010 	.long	0x20000010
    24a0:	20000008 	.long	0x20000008
    24a4:	00000fff 	.long	0x00000fff
    24a8:	9311      	ld.w      	r0, (r3, 0x44)
    24aa:	6811      	andn      	r0, r4
    24ac:	b311      	st.w      	r0, (r3, 0x44)
		CMP->INPCR1|=CMPX_NSEL|(CMPX_PSEL<<8);
    24ae:	4248      	lsli      	r2, r2, 8
    24b0:	9311      	ld.w      	r0, (r3, 0x44)
    24b2:	6c84      	or      	r2, r1
    24b4:	6c80      	or      	r2, r0
    24b6:	b351      	st.w      	r2, (r3, 0x44)
    24b8:	07e5      	br      	0x2482	// 2482 <CMP_INPCRX_Config+0x1c>
	else if(CMPx_NUM==CMP2_NUM)
    24ba:	3842      	cmpnei      	r0, 2
    24bc:	080d      	bt      	0x24d6	// 24d6 <CMP_INPCRX_Config+0x70>
		CMP->INPCR2&=0xfffff000;
    24be:	026c      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    24c0:	028c      	lrw      	r4, 0xfff	// 278c <CMPX_FLTCR_Config+0x86>
    24c2:	9360      	ld.w      	r3, (r3, 0x0)
    24c4:	9312      	ld.w      	r0, (r3, 0x48)
    24c6:	6811      	andn      	r0, r4
    24c8:	b312      	st.w      	r0, (r3, 0x48)
		CMP->INPCR2|=CMPX_NSEL|(CMPX_PSEL<<8);
    24ca:	4248      	lsli      	r2, r2, 8
    24cc:	9312      	ld.w      	r0, (r3, 0x48)
    24ce:	6c84      	or      	r2, r1
    24d0:	6c80      	or      	r2, r0
    24d2:	b352      	st.w      	r2, (r3, 0x48)
    24d4:	07d7      	br      	0x2482	// 2482 <CMP_INPCRX_Config+0x1c>
	else if(CMPx_NUM==CMP3_NUM)
    24d6:	3843      	cmpnei      	r0, 3
    24d8:	080d      	bt      	0x24f2	// 24f2 <CMP_INPCRX_Config+0x8c>
		CMP->INPCR3&=0xfffff000;
    24da:	0273      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    24dc:	0293      	lrw      	r4, 0xfff	// 278c <CMPX_FLTCR_Config+0x86>
    24de:	9360      	ld.w      	r3, (r3, 0x0)
    24e0:	9313      	ld.w      	r0, (r3, 0x4c)
    24e2:	6811      	andn      	r0, r4
    24e4:	b313      	st.w      	r0, (r3, 0x4c)
		CMP->INPCR3|=CMPX_NSEL|(CMPX_PSEL<<8);
    24e6:	4248      	lsli      	r2, r2, 8
    24e8:	9313      	ld.w      	r0, (r3, 0x4c)
    24ea:	6c84      	or      	r2, r1
    24ec:	6c80      	or      	r2, r0
    24ee:	b353      	st.w      	r2, (r3, 0x4c)
    24f0:	07c9      	br      	0x2482	// 2482 <CMP_INPCRX_Config+0x1c>
	else if(CMPx_NUM==CMP4_NUM)
    24f2:	3844      	cmpnei      	r0, 4
    24f4:	080d      	bt      	0x250e	// 250e <CMP_INPCRX_Config+0xa8>
		CMP->INPCR4&=0xfffff000;
    24f6:	027a      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    24f8:	029a      	lrw      	r4, 0xfff	// 278c <CMPX_FLTCR_Config+0x86>
    24fa:	9360      	ld.w      	r3, (r3, 0x0)
    24fc:	9314      	ld.w      	r0, (r3, 0x50)
    24fe:	6811      	andn      	r0, r4
    2500:	b314      	st.w      	r0, (r3, 0x50)
		CMP->INPCR4|=CMPX_NSEL|(CMPX_PSEL<<8);
    2502:	4248      	lsli      	r2, r2, 8
    2504:	9314      	ld.w      	r0, (r3, 0x50)
    2506:	6c84      	or      	r2, r1
    2508:	6c80      	or      	r2, r0
    250a:	b354      	st.w      	r2, (r3, 0x50)
    250c:	07bb      	br      	0x2482	// 2482 <CMP_INPCRX_Config+0x1c>
	else if(CMPx_NUM==CMP5_NUM)
    250e:	3845      	cmpnei      	r0, 5
    2510:	0bb9      	bt      	0x2482	// 2482 <CMP_INPCRX_Config+0x1c>
		CMP->INPCR5&=0xfffff000;
    2512:	0361      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    2514:	0381      	lrw      	r4, 0xfff	// 278c <CMPX_FLTCR_Config+0x86>
    2516:	9360      	ld.w      	r3, (r3, 0x0)
    2518:	9315      	ld.w      	r0, (r3, 0x54)
    251a:	6811      	andn      	r0, r4
    251c:	b315      	st.w      	r0, (r3, 0x54)
		CMP->INPCR5|=CMPX_NSEL|(CMPX_PSEL<<8);
    251e:	4248      	lsli      	r2, r2, 8
    2520:	9315      	ld.w      	r0, (r3, 0x54)
    2522:	6c84      	or      	r2, r1
    2524:	6c80      	or      	r2, r0
    2526:	b355      	st.w      	r2, (r3, 0x54)
}
    2528:	07ad      	br      	0x2482	// 2482 <CMP_INPCRX_Config+0x1c>

0000252a <CMP_VOL_REF_Select>:
//EntryParameter:VOL_REF_0_7V,VOL_REF_1V
//ReturnValue:NONE
/*************************************************************/ 
void CMP_VOL_REF_Select(CMP_VOL_REF_TypeDef VOL_REF)
{
	 if(VOL_REF==VOL_REF_0_7V)
    252a:	3840      	cmpnei      	r0, 0
    252c:	0807      	bt      	0x253a	// 253a <CMP_VOL_REF_Select+0x10>
	 {
		CMP->VOLSEL &= 0xfffffffe; 
    252e:	0368      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    2530:	9340      	ld.w      	r2, (r3, 0x0)
    2532:	927b      	ld.w      	r3, (r2, 0x6c)
    2534:	3b80      	bclri      	r3, 0
    2536:	b27b      	st.w      	r3, (r2, 0x6c)
	 }
	 else if(VOL_REF==VOL_REF_1V)
	 {
		CMP->VOLSEL |= 0x00000001; 		 
	 }
}
    2538:	783c      	jmp      	r15
	 else if(VOL_REF==VOL_REF_1V)
    253a:	3841      	cmpnei      	r0, 1
    253c:	0bfe      	bt      	0x2538	// 2538 <CMP_VOL_REF_Select+0xe>
		CMP->VOLSEL |= 0x00000001; 		 
    253e:	036c      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    2540:	9340      	ld.w      	r2, (r3, 0x0)
    2542:	927b      	ld.w      	r3, (r2, 0x6c)
    2544:	6c0c      	or      	r0, r3
    2546:	b21b      	st.w      	r0, (r2, 0x6c)
}
    2548:	07f8      	br      	0x2538	// 2538 <CMP_VOL_REF_Select+0xe>

0000254a <CMPOutput_Read>:
//EntryParameter:CMPx_NUM
//ReturnValue:NONE
/*************************************************************/ 
void CMPOutput_Read(void)
{
	CMPOUTPUT_DATE=CMP->CR0&0XFC000000;
    254a:	036f      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    254c:	034e      	lrw      	r2, 0x20000080	// 2790 <CMPX_FLTCR_Config+0x8a>
    254e:	9360      	ld.w      	r3, (r3, 0x0)
    2550:	9361      	ld.w      	r3, (r3, 0x4)
    2552:	4b7a      	lsri      	r3, r3, 26
    2554:	437a      	lsli      	r3, r3, 26
    2556:	b260      	st.w      	r3, (r2, 0x0)
	CMPOUTPUT_DATE=CMPOUTPUT_DATE>>26;
    2558:	9260      	ld.w      	r3, (r2, 0x0)
    255a:	4b7a      	lsri      	r3, r3, 26
    255c:	b260      	st.w      	r3, (r2, 0x0)
}
    255e:	783c      	jmp      	r15

00002560 <CMP_CR_Config>:
//CPOS_X:CPOS_0,CPOS_1
//ReturnValue:NONE
/*************************************************************/ 
void CMP_CR_Config(CMPx_selecte_TypeDef CMPx_NUM , CMPx_NHYST_TypeDef NHYST_Xmv , CMPx_PHYST_TypeDef PHYST_Xmv , 
						CMPx_POLARITY_TypeDef POLARITY_X , CMPx_EVE_SEL_TypeDef EVE_SEL_X , CMPx_FLTEN_TypeDef X_FLTEN , CMPx_CPOS_TypeDef CPOS_X)
{
    2560:	14c4      	push      	r4-r7
    2562:	1421      	subi      	r14, r14, 4
    2564:	9885      	ld.w      	r4, (r14, 0x14)
	if(CMPx_NUM==CMP0_NUM)
    2566:	3840      	cmpnei      	r0, 0
{
    2568:	b880      	st.w      	r4, (r14, 0x0)
    256a:	98a6      	ld.w      	r5, (r14, 0x18)
    256c:	9887      	ld.w      	r4, (r14, 0x1c)
	if(CMPx_NUM==CMP0_NUM)
    256e:	0812      	bt      	0x2592	// 2592 <CMP_CR_Config+0x32>
	{
		CMP->CR0&=0xffff7801;
    2570:	0319      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    2572:	03f6      	lrw      	r7, 0x87fe	// 2794 <CMPX_FLTCR_Config+0x8e>
    2574:	9000      	ld.w      	r0, (r0, 0x0)
    2576:	90c1      	ld.w      	r6, (r0, 0x4)
    2578:	699d      	andn      	r6, r7
    257a:	b0c1      	st.w      	r6, (r0, 0x4)
		CMP->CR0|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
    257c:	90c1      	ld.w      	r6, (r0, 0x4)
    257e:	6d18      	or      	r4, r6
    2580:	6d50      	or      	r5, r4
    2582:	9880      	ld.w      	r4, (r14, 0x0)
    2584:	6d50      	or      	r5, r4
    2586:	6cd4      	or      	r3, r5
    2588:	6c8c      	or      	r2, r3
    258a:	6c48      	or      	r1, r2
    258c:	b021      	st.w      	r1, (r0, 0x4)
	else if(CMPx_NUM==CMP5_NUM)
	{
		CMP->CR5&=0xffff7801;
		CMP->CR5|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
	}
}
    258e:	1401      	addi      	r14, r14, 4
    2590:	1484      	pop      	r4-r7
	else if(CMPx_NUM==CMP1_NUM)
    2592:	3841      	cmpnei      	r0, 1
    2594:	0811      	bt      	0x25b6	// 25b6 <CMP_CR_Config+0x56>
		CMP->CR1&=0xffff7801;
    2596:	131d      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    2598:	13ff      	lrw      	r7, 0x87fe	// 2794 <CMPX_FLTCR_Config+0x8e>
    259a:	9000      	ld.w      	r0, (r0, 0x0)
    259c:	90c2      	ld.w      	r6, (r0, 0x8)
    259e:	699d      	andn      	r6, r7
    25a0:	b0c2      	st.w      	r6, (r0, 0x8)
		CMP->CR1|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
    25a2:	90c2      	ld.w      	r6, (r0, 0x8)
    25a4:	6d18      	or      	r4, r6
    25a6:	6d50      	or      	r5, r4
    25a8:	9880      	ld.w      	r4, (r14, 0x0)
    25aa:	6d50      	or      	r5, r4
    25ac:	6cd4      	or      	r3, r5
    25ae:	6c8c      	or      	r2, r3
    25b0:	6c48      	or      	r1, r2
    25b2:	b022      	st.w      	r1, (r0, 0x8)
    25b4:	07ed      	br      	0x258e	// 258e <CMP_CR_Config+0x2e>
	else if(CMPx_NUM==CMP2_NUM)
    25b6:	3842      	cmpnei      	r0, 2
    25b8:	0811      	bt      	0x25da	// 25da <CMP_CR_Config+0x7a>
		CMP->CR2&=0xffff7801;
    25ba:	1314      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    25bc:	13f6      	lrw      	r7, 0x87fe	// 2794 <CMPX_FLTCR_Config+0x8e>
    25be:	9000      	ld.w      	r0, (r0, 0x0)
    25c0:	90c3      	ld.w      	r6, (r0, 0xc)
    25c2:	699d      	andn      	r6, r7
    25c4:	b0c3      	st.w      	r6, (r0, 0xc)
		CMP->CR2|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
    25c6:	90c3      	ld.w      	r6, (r0, 0xc)
    25c8:	6d18      	or      	r4, r6
    25ca:	6d50      	or      	r5, r4
    25cc:	9880      	ld.w      	r4, (r14, 0x0)
    25ce:	6d50      	or      	r5, r4
    25d0:	6cd4      	or      	r3, r5
    25d2:	6c8c      	or      	r2, r3
    25d4:	6c48      	or      	r1, r2
    25d6:	b023      	st.w      	r1, (r0, 0xc)
    25d8:	07db      	br      	0x258e	// 258e <CMP_CR_Config+0x2e>
	else if(CMPx_NUM==CMP3_NUM)
    25da:	3843      	cmpnei      	r0, 3
    25dc:	0811      	bt      	0x25fe	// 25fe <CMP_CR_Config+0x9e>
		CMP->CR3&=0xffff7801;
    25de:	130b      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    25e0:	13ed      	lrw      	r7, 0x87fe	// 2794 <CMPX_FLTCR_Config+0x8e>
    25e2:	9000      	ld.w      	r0, (r0, 0x0)
    25e4:	90c4      	ld.w      	r6, (r0, 0x10)
    25e6:	699d      	andn      	r6, r7
    25e8:	b0c4      	st.w      	r6, (r0, 0x10)
		CMP->CR3|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
    25ea:	90c4      	ld.w      	r6, (r0, 0x10)
    25ec:	6d18      	or      	r4, r6
    25ee:	6d50      	or      	r5, r4
    25f0:	9880      	ld.w      	r4, (r14, 0x0)
    25f2:	6d50      	or      	r5, r4
    25f4:	6cd4      	or      	r3, r5
    25f6:	6c8c      	or      	r2, r3
    25f8:	6c48      	or      	r1, r2
    25fa:	b024      	st.w      	r1, (r0, 0x10)
    25fc:	07c9      	br      	0x258e	// 258e <CMP_CR_Config+0x2e>
	else if(CMPx_NUM==CMP4_NUM)
    25fe:	3844      	cmpnei      	r0, 4
    2600:	0811      	bt      	0x2622	// 2622 <CMP_CR_Config+0xc2>
		CMP->CR4&=0xffff7801;
    2602:	1302      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    2604:	13e4      	lrw      	r7, 0x87fe	// 2794 <CMPX_FLTCR_Config+0x8e>
    2606:	9000      	ld.w      	r0, (r0, 0x0)
    2608:	90c5      	ld.w      	r6, (r0, 0x14)
    260a:	699d      	andn      	r6, r7
    260c:	b0c5      	st.w      	r6, (r0, 0x14)
		CMP->CR4|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
    260e:	90c5      	ld.w      	r6, (r0, 0x14)
    2610:	6d18      	or      	r4, r6
    2612:	6d50      	or      	r5, r4
    2614:	9880      	ld.w      	r4, (r14, 0x0)
    2616:	6d50      	or      	r5, r4
    2618:	6cd4      	or      	r3, r5
    261a:	6c8c      	or      	r2, r3
    261c:	6c48      	or      	r1, r2
    261e:	b025      	st.w      	r1, (r0, 0x14)
    2620:	07b7      	br      	0x258e	// 258e <CMP_CR_Config+0x2e>
	else if(CMPx_NUM==CMP5_NUM)
    2622:	3845      	cmpnei      	r0, 5
    2624:	0bb5      	bt      	0x258e	// 258e <CMP_CR_Config+0x2e>
		CMP->CR5&=0xffff7801;
    2626:	1219      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    2628:	12fb      	lrw      	r7, 0x87fe	// 2794 <CMPX_FLTCR_Config+0x8e>
    262a:	9000      	ld.w      	r0, (r0, 0x0)
    262c:	90c6      	ld.w      	r6, (r0, 0x18)
    262e:	699d      	andn      	r6, r7
    2630:	b0c6      	st.w      	r6, (r0, 0x18)
		CMP->CR5|=NHYST_Xmv|PHYST_Xmv|POLARITY_X|EVE_SEL_X|X_FLTEN|CPOS_X;
    2632:	90c6      	ld.w      	r6, (r0, 0x18)
    2634:	6d18      	or      	r4, r6
    2636:	6d50      	or      	r5, r4
    2638:	9880      	ld.w      	r4, (r14, 0x0)
    263a:	6d50      	or      	r5, r4
    263c:	6cd4      	or      	r3, r5
    263e:	6c8c      	or      	r2, r3
    2640:	6c48      	or      	r1, r2
    2642:	b026      	st.w      	r1, (r0, 0x18)
}
    2644:	07a5      	br      	0x258e	// 258e <CMP_CR_Config+0x2e>

00002646 <CMP_Open>:
//CMPx_selecte:CMP0_NUM,CMP1_NUM,CMP2_NUM,CMP3_NUM,CMP4_NUM,CMP5_NUM
//ReturnValue:NONE
/*************************************************************/ 
void CMP_Open(CMPx_selecte_TypeDef CMPx_selecte)
{
	if(CMPx_selecte==CMP0_NUM)
    2646:	3840      	cmpnei      	r0, 0
    2648:	0807      	bt      	0x2656	// 2656 <CMP_Open+0x10>
	{
		CMP->CR0|=0x01;									//比较器0打开
    264a:	1270      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    264c:	9340      	ld.w      	r2, (r3, 0x0)
    264e:	9261      	ld.w      	r3, (r2, 0x4)
    2650:	3ba0      	bseti      	r3, 0
    2652:	b261      	st.w      	r3, (r2, 0x4)
	}
	else if(CMPx_selecte==CMP5_NUM)
	{
		CMP->CR5|=0x01;									//比较器5打开
	}
}
    2654:	783c      	jmp      	r15
	else if(CMPx_selecte==CMP1_NUM)
    2656:	3841      	cmpnei      	r0, 1
    2658:	0807      	bt      	0x2666	// 2666 <CMP_Open+0x20>
		CMP->CR1|=0x01;									//比较器1打开
    265a:	126c      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    265c:	9340      	ld.w      	r2, (r3, 0x0)
    265e:	9262      	ld.w      	r3, (r2, 0x8)
    2660:	6c0c      	or      	r0, r3
    2662:	b202      	st.w      	r0, (r2, 0x8)
    2664:	07f8      	br      	0x2654	// 2654 <CMP_Open+0xe>
	else if(CMPx_selecte==CMP2_NUM)
    2666:	3842      	cmpnei      	r0, 2
    2668:	0807      	bt      	0x2676	// 2676 <CMP_Open+0x30>
		CMP->CR2|=0x01;									//比较器2打开
    266a:	1268      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    266c:	9340      	ld.w      	r2, (r3, 0x0)
    266e:	9263      	ld.w      	r3, (r2, 0xc)
    2670:	3ba0      	bseti      	r3, 0
    2672:	b263      	st.w      	r3, (r2, 0xc)
    2674:	07f0      	br      	0x2654	// 2654 <CMP_Open+0xe>
	else if(CMPx_selecte==CMP3_NUM)
    2676:	3843      	cmpnei      	r0, 3
    2678:	0807      	bt      	0x2686	// 2686 <CMP_Open+0x40>
		CMP->CR3|=0x01;									//比较器3打开
    267a:	1264      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    267c:	9340      	ld.w      	r2, (r3, 0x0)
    267e:	9264      	ld.w      	r3, (r2, 0x10)
    2680:	3ba0      	bseti      	r3, 0
    2682:	b264      	st.w      	r3, (r2, 0x10)
    2684:	07e8      	br      	0x2654	// 2654 <CMP_Open+0xe>
	else if(CMPx_selecte==CMP4_NUM)
    2686:	3844      	cmpnei      	r0, 4
    2688:	0807      	bt      	0x2696	// 2696 <CMP_Open+0x50>
		CMP->CR4|=0x01;									//比较器4打开
    268a:	1260      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    268c:	9340      	ld.w      	r2, (r3, 0x0)
    268e:	9265      	ld.w      	r3, (r2, 0x14)
    2690:	3ba0      	bseti      	r3, 0
    2692:	b265      	st.w      	r3, (r2, 0x14)
    2694:	07e0      	br      	0x2654	// 2654 <CMP_Open+0xe>
	else if(CMPx_selecte==CMP5_NUM)
    2696:	3845      	cmpnei      	r0, 5
    2698:	0bde      	bt      	0x2654	// 2654 <CMP_Open+0xe>
		CMP->CR5|=0x01;									//比较器5打开
    269a:	117c      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    269c:	9340      	ld.w      	r2, (r3, 0x0)
    269e:	9266      	ld.w      	r3, (r2, 0x18)
    26a0:	3ba0      	bseti      	r3, 0
    26a2:	b266      	st.w      	r3, (r2, 0x18)
}
    26a4:	07d8      	br      	0x2654	// 2654 <CMP_Open+0xe>

000026a6 <CMP_Close>:
//CMPx_selecte:CMP0_NUM,CMP1_NUM,CMP2_NUM,CMP3_NUM,CMP4_NUM
//ReturnValue:NONE
/*************************************************************/ 
void CMP_Close(CMPx_selecte_TypeDef CMPx_selecte)
{
	if(CMPx_selecte==CMP0_NUM)
    26a6:	3840      	cmpnei      	r0, 0
    26a8:	0807      	bt      	0x26b6	// 26b6 <CMP_Close+0x10>
	{
		CMP->CR0&=0xfffffffe;									//比较器0关闭
    26aa:	1178      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    26ac:	9340      	ld.w      	r2, (r3, 0x0)
    26ae:	9261      	ld.w      	r3, (r2, 0x4)
    26b0:	3b80      	bclri      	r3, 0
    26b2:	b261      	st.w      	r3, (r2, 0x4)
	}
	else if(CMPx_selecte==CMP5_NUM)
	{
		CMP->CR5&=0xfffffffe;									//比较器5关闭
	}
}
    26b4:	783c      	jmp      	r15
	else if(CMPx_selecte==CMP1_NUM)
    26b6:	3841      	cmpnei      	r0, 1
    26b8:	0807      	bt      	0x26c6	// 26c6 <CMP_Close+0x20>
		CMP->CR1&=0xfffffffe;									//比较器1关闭
    26ba:	1174      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    26bc:	9340      	ld.w      	r2, (r3, 0x0)
    26be:	9262      	ld.w      	r3, (r2, 0x8)
    26c0:	3b80      	bclri      	r3, 0
    26c2:	b262      	st.w      	r3, (r2, 0x8)
    26c4:	07f8      	br      	0x26b4	// 26b4 <CMP_Close+0xe>
	else if(CMPx_selecte==CMP2_NUM)
    26c6:	3842      	cmpnei      	r0, 2
    26c8:	0807      	bt      	0x26d6	// 26d6 <CMP_Close+0x30>
		CMP->CR2&=0xfffffffe;									//比较器2关闭
    26ca:	1170      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    26cc:	9340      	ld.w      	r2, (r3, 0x0)
    26ce:	9263      	ld.w      	r3, (r2, 0xc)
    26d0:	3b80      	bclri      	r3, 0
    26d2:	b263      	st.w      	r3, (r2, 0xc)
    26d4:	07f0      	br      	0x26b4	// 26b4 <CMP_Close+0xe>
	else if(CMPx_selecte==CMP3_NUM)
    26d6:	3843      	cmpnei      	r0, 3
    26d8:	0807      	bt      	0x26e6	// 26e6 <CMP_Close+0x40>
		CMP->CR3&=0xfffffffe;									//比较器3关闭
    26da:	116c      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    26dc:	9340      	ld.w      	r2, (r3, 0x0)
    26de:	9264      	ld.w      	r3, (r2, 0x10)
    26e0:	3b80      	bclri      	r3, 0
    26e2:	b264      	st.w      	r3, (r2, 0x10)
    26e4:	07e8      	br      	0x26b4	// 26b4 <CMP_Close+0xe>
	else if(CMPx_selecte==CMP4_NUM)
    26e6:	3844      	cmpnei      	r0, 4
    26e8:	0807      	bt      	0x26f6	// 26f6 <CMP_Close+0x50>
		CMP->CR4&=0xfffffffe;									//比较器4关闭
    26ea:	1168      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    26ec:	9340      	ld.w      	r2, (r3, 0x0)
    26ee:	9265      	ld.w      	r3, (r2, 0x14)
    26f0:	3b80      	bclri      	r3, 0
    26f2:	b265      	st.w      	r3, (r2, 0x14)
    26f4:	07e0      	br      	0x26b4	// 26b4 <CMP_Close+0xe>
	else if(CMPx_selecte==CMP5_NUM)
    26f6:	3845      	cmpnei      	r0, 5
    26f8:	0bde      	bt      	0x26b4	// 26b4 <CMP_Close+0xe>
		CMP->CR5&=0xfffffffe;									//比较器5关闭
    26fa:	1164      	lrw      	r3, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
    26fc:	9340      	ld.w      	r2, (r3, 0x0)
    26fe:	9266      	ld.w      	r3, (r2, 0x18)
    2700:	3b80      	bclri      	r3, 0
    2702:	b266      	st.w      	r3, (r2, 0x18)
}
    2704:	07d8      	br      	0x26b4	// 26b4 <CMP_Close+0xe>

00002706 <CMPX_FLTCR_Config>:
//CMPX_DIVM:0~255
//ReturnValue:NONE
/*************************************************************/ 
//FLT_CK = PCLK/(CMPX_DIVM+1)/2^CMPX_DIVN
void CMPX_FLTCR_Config(CMPx_selecte_TypeDef CMPx_NUM , CMPX_CLK_Selecte_TypeDef CMPX_CLK_Selecte_x , U8_T CMPX_DIVN , U8_T CMPX_DIVM)
{
    2706:	14c1      	push      	r4
	if(CMPx_NUM==CMP0_NUM)
    2708:	3840      	cmpnei      	r0, 0
    270a:	080f      	bt      	0x2728	// 2728 <CMPX_FLTCR_Config+0x22>
	{
		CMP->FLTCR0&=0xffff0000;
    270c:	101f      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
		CMP->FLTCR0|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    270e:	4368      	lsli      	r3, r3, 8
		CMP->FLTCR0&=0xffff0000;
    2710:	9080      	ld.w      	r4, (r0, 0x0)
    2712:	9407      	ld.w      	r0, (r4, 0x1c)
    2714:	4810      	lsri      	r0, r0, 16
    2716:	4010      	lsli      	r0, r0, 16
    2718:	b407      	st.w      	r0, (r4, 0x1c)
		CMP->FLTCR0|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    271a:	9407      	ld.w      	r0, (r4, 0x1c)
    271c:	6c40      	or      	r1, r0
    271e:	6c4c      	or      	r1, r3
    2720:	4243      	lsli      	r2, r2, 3
    2722:	6c84      	or      	r2, r1
    2724:	b447      	st.w      	r2, (r4, 0x1c)
	else if(CMPx_NUM==CMP5_NUM)
	{
		CMP->FLTCR5&=0xffff0000;
		CMP->FLTCR5|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
	}
}
    2726:	1481      	pop      	r4
	else if(CMPx_NUM==CMP1_NUM)
    2728:	3841      	cmpnei      	r0, 1
    272a:	080f      	bt      	0x2748	// 2748 <CMPX_FLTCR_Config+0x42>
		CMP->FLTCR1&=0xffff0000;
    272c:	1017      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
		CMP->FLTCR1|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    272e:	4368      	lsli      	r3, r3, 8
		CMP->FLTCR1&=0xffff0000;
    2730:	9080      	ld.w      	r4, (r0, 0x0)
    2732:	9408      	ld.w      	r0, (r4, 0x20)
    2734:	4810      	lsri      	r0, r0, 16
    2736:	4010      	lsli      	r0, r0, 16
    2738:	b408      	st.w      	r0, (r4, 0x20)
		CMP->FLTCR1|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    273a:	9408      	ld.w      	r0, (r4, 0x20)
    273c:	6c40      	or      	r1, r0
    273e:	6c4c      	or      	r1, r3
    2740:	4243      	lsli      	r2, r2, 3
    2742:	6c84      	or      	r2, r1
    2744:	b448      	st.w      	r2, (r4, 0x20)
    2746:	07f0      	br      	0x2726	// 2726 <CMPX_FLTCR_Config+0x20>
	else if(CMPx_NUM==CMP2_NUM)
    2748:	3842      	cmpnei      	r0, 2
    274a:	080f      	bt      	0x2768	// 2768 <CMPX_FLTCR_Config+0x62>
		CMP->FLTCR2&=0xffff0000;
    274c:	100f      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
		CMP->FLTCR2|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    274e:	4368      	lsli      	r3, r3, 8
		CMP->FLTCR2&=0xffff0000;
    2750:	9080      	ld.w      	r4, (r0, 0x0)
    2752:	9409      	ld.w      	r0, (r4, 0x24)
    2754:	4810      	lsri      	r0, r0, 16
    2756:	4010      	lsli      	r0, r0, 16
    2758:	b409      	st.w      	r0, (r4, 0x24)
		CMP->FLTCR2|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    275a:	9409      	ld.w      	r0, (r4, 0x24)
    275c:	6c40      	or      	r1, r0
    275e:	6c4c      	or      	r1, r3
    2760:	4243      	lsli      	r2, r2, 3
    2762:	6c84      	or      	r2, r1
    2764:	b449      	st.w      	r2, (r4, 0x24)
    2766:	07e0      	br      	0x2726	// 2726 <CMPX_FLTCR_Config+0x20>
	else if(CMPx_NUM==CMP3_NUM)
    2768:	3843      	cmpnei      	r0, 3
    276a:	0818      	bt      	0x279a	// 279a <CMPX_FLTCR_Config+0x94>
		CMP->FLTCR3&=0xffff0000;
    276c:	1007      	lrw      	r0, 0x20000024	// 2788 <CMPX_FLTCR_Config+0x82>
		CMP->FLTCR3|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    276e:	4368      	lsli      	r3, r3, 8
		CMP->FLTCR3&=0xffff0000;
    2770:	9080      	ld.w      	r4, (r0, 0x0)
    2772:	940a      	ld.w      	r0, (r4, 0x28)
    2774:	4810      	lsri      	r0, r0, 16
    2776:	4010      	lsli      	r0, r0, 16
    2778:	b40a      	st.w      	r0, (r4, 0x28)
		CMP->FLTCR3|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    277a:	940a      	ld.w      	r0, (r4, 0x28)
    277c:	6c40      	or      	r1, r0
    277e:	6c4c      	or      	r1, r3
    2780:	4243      	lsli      	r2, r2, 3
    2782:	6c84      	or      	r2, r1
    2784:	b44a      	st.w      	r2, (r4, 0x28)
    2786:	0409      	br      	0x2798	// 2798 <CMPX_FLTCR_Config+0x92>
    2788:	20000024 	.long	0x20000024
    278c:	00000fff 	.long	0x00000fff
    2790:	20000080 	.long	0x20000080
    2794:	000087fe 	.long	0x000087fe
    2798:	07c7      	br      	0x2726	// 2726 <CMPX_FLTCR_Config+0x20>
	else if(CMPx_NUM==CMP4_NUM)
    279a:	3844      	cmpnei      	r0, 4
    279c:	080f      	bt      	0x27ba	// 27ba <CMPX_FLTCR_Config+0xb4>
		CMP->FLTCR4&=0xffff0000;
    279e:	0202      	lrw      	r0, 0x20000024	// 2a90 <CMP5_Wakeup_Disable+0x14>
		CMP->FLTCR4|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    27a0:	4368      	lsli      	r3, r3, 8
		CMP->FLTCR4&=0xffff0000;
    27a2:	9080      	ld.w      	r4, (r0, 0x0)
    27a4:	940b      	ld.w      	r0, (r4, 0x2c)
    27a6:	4810      	lsri      	r0, r0, 16
    27a8:	4010      	lsli      	r0, r0, 16
    27aa:	b40b      	st.w      	r0, (r4, 0x2c)
		CMP->FLTCR4|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    27ac:	940b      	ld.w      	r0, (r4, 0x2c)
    27ae:	6c40      	or      	r1, r0
    27b0:	6c4c      	or      	r1, r3
    27b2:	4243      	lsli      	r2, r2, 3
    27b4:	6c84      	or      	r2, r1
    27b6:	b44b      	st.w      	r2, (r4, 0x2c)
    27b8:	07b7      	br      	0x2726	// 2726 <CMPX_FLTCR_Config+0x20>
	else if(CMPx_NUM==CMP5_NUM)
    27ba:	3845      	cmpnei      	r0, 5
    27bc:	0bb5      	bt      	0x2726	// 2726 <CMPX_FLTCR_Config+0x20>
		CMP->FLTCR5&=0xffff0000;
    27be:	020a      	lrw      	r0, 0x20000024	// 2a90 <CMP5_Wakeup_Disable+0x14>
		CMP->FLTCR5|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    27c0:	4368      	lsli      	r3, r3, 8
		CMP->FLTCR5&=0xffff0000;
    27c2:	9000      	ld.w      	r0, (r0, 0x0)
    27c4:	908c      	ld.w      	r4, (r0, 0x30)
    27c6:	4c90      	lsri      	r4, r4, 16
    27c8:	4490      	lsli      	r4, r4, 16
    27ca:	b08c      	st.w      	r4, (r0, 0x30)
		CMP->FLTCR5|=CMPX_CLK_Selecte_x|(CMPX_DIVN<<3)|(CMPX_DIVM<<8);
    27cc:	908c      	ld.w      	r4, (r0, 0x30)
    27ce:	6c50      	or      	r1, r4
    27d0:	6cc4      	or      	r3, r1
    27d2:	4243      	lsli      	r2, r2, 3
    27d4:	6cc8      	or      	r3, r2
    27d6:	b06c      	st.w      	r3, (r0, 0x30)
}
    27d8:	07a7      	br      	0x2726	// 2726 <CMPX_FLTCR_Config+0x20>

000027da <CMP_WCNT_Config>:
/*************************************************************/  
//捕捉宽度时间:(CMP_WCNT+1)*PCLK/CLKDIV
//延时宽度时间:(CMP_DCNT+1)*PCLK/CLKDIV,如果CMP_DCNT=0，延时时间=0
void CMP_WCNT_Config(CMPx_selecte_TypeDef CMPx_NUM , CMPX_First_output_startue_TypeDef HLS_X , CMPX_Trgsel_selecte_TypeDef CMPX_Trgsel_X , 
				     CMPX_MSKMOD_Control_TypeDef CMPX_MSKMOD_X , CMPX_CLKDIV_TypeDef CMPX_CLKDIV_X , U8_T CMP_DCNT , U16_T CMP_WCNT)
{
    27da:	14c4      	push      	r4-r7
	if(CMPx_NUM==CMP2_NUM)
    27dc:	3842      	cmpnei      	r0, 2
{
    27de:	98c4      	ld.w      	r6, (r14, 0x10)
    27e0:	d8ae0014 	ld.b      	r5, (r14, 0x14)
    27e4:	d88e100c 	ld.h      	r4, (r14, 0x18)
	if(CMPx_NUM==CMP2_NUM)
    27e8:	080f      	bt      	0x2806	// 2806 <CMP_WCNT_Config+0x2c>
	{
		CMP->WCNT0&=0x0;
    27ea:	0215      	lrw      	r0, 0x20000024	// 2a90 <CMP5_Wakeup_Disable+0x14>
    27ec:	9000      	ld.w      	r0, (r0, 0x0)
    27ee:	90ed      	ld.w      	r7, (r0, 0x34)
    27f0:	3700      	movi      	r7, 0
    27f2:	b0ed      	st.w      	r7, (r0, 0x34)
		CMP->WCNT0|=HLS_X|CMPX_Trgsel_X|CMPX_MSKMOD_X|CMPX_CLKDIV_X|CMP_DCNT|CMP_WCNT;
    27f4:	90ed      	ld.w      	r7, (r0, 0x34)
    27f6:	6d1c      	or      	r4, r7
    27f8:	6d18      	or      	r4, r6
    27fa:	6d14      	or      	r4, r5
    27fc:	6cd0      	or      	r3, r4
    27fe:	6c8c      	or      	r2, r3
    2800:	6c48      	or      	r1, r2
    2802:	b02d      	st.w      	r1, (r0, 0x34)
	else if(CMPx_NUM==CMP4_NUM)
	{
		CMP->WCNT2=0x0;
		CMP->WCNT2|=HLS_X|CMPX_Trgsel_X|CMPX_MSKMOD_X|CMPX_CLKDIV_X|CMP_DCNT|CMP_WCNT;
	}
}
    2804:	1484      	pop      	r4-r7
	else if(CMPx_NUM==CMP3_NUM)
    2806:	3843      	cmpnei      	r0, 3
    2808:	080f      	bt      	0x2826	// 2826 <CMP_WCNT_Config+0x4c>
		CMP->WCNT1&=0x0;
    280a:	021d      	lrw      	r0, 0x20000024	// 2a90 <CMP5_Wakeup_Disable+0x14>
    280c:	9000      	ld.w      	r0, (r0, 0x0)
    280e:	90ee      	ld.w      	r7, (r0, 0x38)
    2810:	3700      	movi      	r7, 0
    2812:	b0ee      	st.w      	r7, (r0, 0x38)
		CMP->WCNT1|=HLS_X|CMPX_Trgsel_X|CMPX_MSKMOD_X|CMPX_CLKDIV_X|CMP_DCNT|CMP_WCNT;
    2814:	90ee      	ld.w      	r7, (r0, 0x38)
    2816:	6d1c      	or      	r4, r7
    2818:	6d18      	or      	r4, r6
    281a:	6d14      	or      	r4, r5
    281c:	6cd0      	or      	r3, r4
    281e:	6c8c      	or      	r2, r3
    2820:	6c48      	or      	r1, r2
    2822:	b02e      	st.w      	r1, (r0, 0x38)
    2824:	07f0      	br      	0x2804	// 2804 <CMP_WCNT_Config+0x2a>
	else if(CMPx_NUM==CMP4_NUM)
    2826:	3844      	cmpnei      	r0, 4
    2828:	0bee      	bt      	0x2804	// 2804 <CMP_WCNT_Config+0x2a>
		CMP->WCNT2=0x0;
    282a:	0305      	lrw      	r0, 0x20000024	// 2a90 <CMP5_Wakeup_Disable+0x14>
    282c:	3700      	movi      	r7, 0
    282e:	9000      	ld.w      	r0, (r0, 0x0)
    2830:	b0ef      	st.w      	r7, (r0, 0x3c)
		CMP->WCNT2|=HLS_X|CMPX_Trgsel_X|CMPX_MSKMOD_X|CMPX_CLKDIV_X|CMP_DCNT|CMP_WCNT;
    2832:	90ef      	ld.w      	r7, (r0, 0x3c)
    2834:	6d1c      	or      	r4, r7
    2836:	6d18      	or      	r4, r6
    2838:	6d14      	or      	r4, r5
    283a:	6cd0      	or      	r3, r4
    283c:	6c8c      	or      	r2, r3
    283e:	6c48      	or      	r1, r2
    2840:	b02f      	st.w      	r1, (r0, 0x3c)
}
    2842:	07e1      	br      	0x2804	// 2804 <CMP_WCNT_Config+0x2a>

00002844 <CMP_TRGCR_Config>:
//CMP_TC_CIN_X:CMP_TC_CIN_Enable,CMP_TC_CIN_Disable
//CMP_AD_TRG_X:CMP_AD_TRG_Enable,CMP_AD_TRG2_Disable
//ReturnValue:NONE
/*************************************************************/  
void CMP_TRGCR_Config(CMPx_selecte_TypeDef CMPx_NUM , CMP_TC_TRG_TypeDef CMP_TC_TRG_X , CMP_TC_CIN_CMD_TypeDef CMP_TC_CIN_X , CMP_AD_TRG_CMD_TypeDef CMP_AD_TRG_X)
{
    2844:	14c3      	push      	r4-r6
	CMP->TRGCR&=0xfffffff8;
    2846:	038c      	lrw      	r4, 0x20000024	// 2a90 <CMP5_Wakeup_Disable+0x14>
    2848:	3607      	movi      	r6, 7
    284a:	9480      	ld.w      	r4, (r4, 0x0)
    284c:	94b6      	ld.w      	r5, (r4, 0x58)
    284e:	6959      	andn      	r5, r6
    2850:	b4b6      	st.w      	r5, (r4, 0x58)
	CMP->TRGCR|=CMP_TC_TRG_X;										//TC1启动触发
    2852:	94b6      	ld.w      	r5, (r4, 0x58)
    2854:	6c54      	or      	r1, r5
	if(CMPx_NUM==CMP0_NUM)
    2856:	3840      	cmpnei      	r0, 0
	CMP->TRGCR|=CMP_TC_TRG_X;										//TC1启动触发
    2858:	b436      	st.w      	r1, (r4, 0x58)
	if(CMPx_NUM==CMP0_NUM)
    285a:	080e      	bt      	0x2876	// 2876 <CMP_TRGCR_Config+0x32>
	{
		CMP->TRGCR&=0xfffffdf7;
    285c:	9436      	ld.w      	r1, (r4, 0x58)
    285e:	3983      	bclri      	r1, 3
    2860:	3989      	bclri      	r1, 9
    2862:	b436      	st.w      	r1, (r4, 0x58)
		CMP->TRGCR|=CMP_TC_CIN_X<<3;								//CMP0输出作为TC1的Capture/CLK输入
    2864:	9436      	ld.w      	r1, (r4, 0x58)
    2866:	4243      	lsli      	r2, r2, 3
    2868:	6c84      	or      	r2, r1
    286a:	b456      	st.w      	r2, (r4, 0x58)
		CMP->TRGCR|=CMP_AD_TRG_X<<9;								//CMP0启动ADC触发
    286c:	9456      	ld.w      	r2, (r4, 0x58)
    286e:	4369      	lsli      	r3, r3, 9
	}
	else if(CMPx_NUM==CMP5_NUM)
	{
		CMP->TRGCR&=0xffffbeff;
		CMP->TRGCR|=CMP_TC_CIN_X<<8;								//CMP5输出作为TC1的Capture/CLK输入
		CMP->TRGCR|=CMP_AD_TRG_X<<14;								//CMP5启动ADC触发
    2870:	6cc8      	or      	r3, r2
    2872:	b476      	st.w      	r3, (r4, 0x58)
	}
}
    2874:	1483      	pop      	r4-r6
	else if(CMPx_NUM==CMP1_NUM)
    2876:	3841      	cmpnei      	r0, 1
    2878:	080c      	bt      	0x2890	// 2890 <CMP_TRGCR_Config+0x4c>
		CMP->TRGCR&=0xfffffbef;
    287a:	9436      	ld.w      	r1, (r4, 0x58)
    287c:	3984      	bclri      	r1, 4
    287e:	398a      	bclri      	r1, 10
    2880:	b436      	st.w      	r1, (r4, 0x58)
		CMP->TRGCR|=CMP_TC_CIN_X<<4;								//CMP1输出作为TC1的Capture/CLK输入
    2882:	9436      	ld.w      	r1, (r4, 0x58)
    2884:	4244      	lsli      	r2, r2, 4
    2886:	6c84      	or      	r2, r1
    2888:	b456      	st.w      	r2, (r4, 0x58)
		CMP->TRGCR|=CMP_AD_TRG_X<<10;								//CMP1启动ADC触发
    288a:	9456      	ld.w      	r2, (r4, 0x58)
    288c:	436a      	lsli      	r3, r3, 10
    288e:	07f1      	br      	0x2870	// 2870 <CMP_TRGCR_Config+0x2c>
	else if(CMPx_NUM==CMP2_NUM)
    2890:	3842      	cmpnei      	r0, 2
    2892:	080c      	bt      	0x28aa	// 28aa <CMP_TRGCR_Config+0x66>
		CMP->TRGCR&=0xfffff7df;
    2894:	9436      	ld.w      	r1, (r4, 0x58)
    2896:	3985      	bclri      	r1, 5
    2898:	398b      	bclri      	r1, 11
    289a:	b436      	st.w      	r1, (r4, 0x58)
		CMP->TRGCR|=CMP_TC_CIN_X<<5;								//CMP2输出作为TC1的Capture/CLK输入
    289c:	9436      	ld.w      	r1, (r4, 0x58)
    289e:	4245      	lsli      	r2, r2, 5
    28a0:	6c84      	or      	r2, r1
    28a2:	b456      	st.w      	r2, (r4, 0x58)
		CMP->TRGCR|=CMP_AD_TRG_X<<11;								//CMP2启动ADC触发
    28a4:	9456      	ld.w      	r2, (r4, 0x58)
    28a6:	436b      	lsli      	r3, r3, 11
    28a8:	07e4      	br      	0x2870	// 2870 <CMP_TRGCR_Config+0x2c>
	else if(CMPx_NUM==CMP3_NUM)
    28aa:	3843      	cmpnei      	r0, 3
    28ac:	080c      	bt      	0x28c4	// 28c4 <CMP_TRGCR_Config+0x80>
		CMP->TRGCR&=0xffffefbf;
    28ae:	9436      	ld.w      	r1, (r4, 0x58)
    28b0:	3986      	bclri      	r1, 6
    28b2:	398c      	bclri      	r1, 12
    28b4:	b436      	st.w      	r1, (r4, 0x58)
		CMP->TRGCR|=CMP_TC_CIN_X<<6;								//CMP3输出作为TC1的Capture/CLK输入
    28b6:	9436      	ld.w      	r1, (r4, 0x58)
    28b8:	4246      	lsli      	r2, r2, 6
    28ba:	6c84      	or      	r2, r1
    28bc:	b456      	st.w      	r2, (r4, 0x58)
		CMP->TRGCR|=CMP_AD_TRG_X<<12;								//CMP3启动ADC触发
    28be:	9456      	ld.w      	r2, (r4, 0x58)
    28c0:	436c      	lsli      	r3, r3, 12
    28c2:	07d7      	br      	0x2870	// 2870 <CMP_TRGCR_Config+0x2c>
	else if(CMPx_NUM==CMP4_NUM)
    28c4:	3844      	cmpnei      	r0, 4
    28c6:	080c      	bt      	0x28de	// 28de <CMP_TRGCR_Config+0x9a>
		CMP->TRGCR&=0xffffdf7f;
    28c8:	9436      	ld.w      	r1, (r4, 0x58)
    28ca:	3987      	bclri      	r1, 7
    28cc:	398d      	bclri      	r1, 13
    28ce:	b436      	st.w      	r1, (r4, 0x58)
		CMP->TRGCR|=CMP_TC_CIN_X<<7;								//CMP4输出作为TC1的Capture/CLK输入
    28d0:	9436      	ld.w      	r1, (r4, 0x58)
    28d2:	4247      	lsli      	r2, r2, 7
    28d4:	6c84      	or      	r2, r1
    28d6:	b456      	st.w      	r2, (r4, 0x58)
		CMP->TRGCR|=CMP_AD_TRG_X<<13;								//CMP4启动ADC触发
    28d8:	9456      	ld.w      	r2, (r4, 0x58)
    28da:	436d      	lsli      	r3, r3, 13
    28dc:	07ca      	br      	0x2870	// 2870 <CMP_TRGCR_Config+0x2c>
	else if(CMPx_NUM==CMP5_NUM)
    28de:	3845      	cmpnei      	r0, 5
    28e0:	0bca      	bt      	0x2874	// 2874 <CMP_TRGCR_Config+0x30>
		CMP->TRGCR&=0xffffbeff;
    28e2:	9436      	ld.w      	r1, (r4, 0x58)
    28e4:	3988      	bclri      	r1, 8
    28e6:	398e      	bclri      	r1, 14
    28e8:	b436      	st.w      	r1, (r4, 0x58)
		CMP->TRGCR|=CMP_TC_CIN_X<<8;								//CMP5输出作为TC1的Capture/CLK输入
    28ea:	9436      	ld.w      	r1, (r4, 0x58)
    28ec:	4248      	lsli      	r2, r2, 8
    28ee:	6c84      	or      	r2, r1
    28f0:	b456      	st.w      	r2, (r4, 0x58)
		CMP->TRGCR|=CMP_AD_TRG_X<<14;								//CMP5启动ADC触发
    28f2:	9456      	ld.w      	r2, (r4, 0x58)
    28f4:	436e      	lsli      	r3, r3, 14
    28f6:	07bd      	br      	0x2870	// 2870 <CMP_TRGCR_Config+0x2c>

000028f8 <CMP_ConfigInterrupt_CMD>:
//CMP_INT_X:EDGEDET0,EDGEDET1,EDGEDET2,EDGEDET3,EDGEDET4,EDGEDET5
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void CMP_ConfigInterrupt_CMD(CMP_INT_TypeDef CMP_INT_X , FunctionalStatus NewState)
{
    28f8:	1366      	lrw      	r3, 0x20000024	// 2a90 <CMP5_Wakeup_Disable+0x14>
	if (NewState != DISABLE)
    28fa:	3940      	cmpnei      	r1, 0
	{
		CMP->IMCR  |= CMP_INT_X;						//SET
    28fc:	9340      	ld.w      	r2, (r3, 0x0)
    28fe:	9277      	ld.w      	r3, (r2, 0x5c)
	if (NewState != DISABLE)
    2900:	0c04      	bf      	0x2908	// 2908 <CMP_ConfigInterrupt_CMD+0x10>
		CMP->IMCR  |= CMP_INT_X;						//SET
    2902:	6c0c      	or      	r0, r3
    2904:	b217      	st.w      	r0, (r2, 0x5c)
	}
	else
	{
		CMP->IMCR  &= ~CMP_INT_X;						//CLR
	}
}
    2906:	783c      	jmp      	r15
		CMP->IMCR  &= ~CMP_INT_X;						//CLR
    2908:	68c1      	andn      	r3, r0
    290a:	b277      	st.w      	r3, (r2, 0x5c)
}
    290c:	07fd      	br      	0x2906	// 2906 <CMP_ConfigInterrupt_CMD+0xe>

0000290e <CMP0_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP0_INT);    
    290e:	1362      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2910:	3280      	movi      	r2, 128
    2912:	9360      	ld.w      	r3, (r3, 0x0)
    2914:	23ff      	addi      	r3, 256
    2916:	4255      	lsli      	r2, r2, 21
    2918:	b340      	st.w      	r2, (r3, 0x0)
}
    291a:	783c      	jmp      	r15

0000291c <CMP0_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP0_INT);    
    291c:	127e      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    291e:	32c0      	movi      	r2, 192
    2920:	9360      	ld.w      	r3, (r3, 0x0)
    2922:	4241      	lsli      	r2, r2, 1
    2924:	60c8      	addu      	r3, r2
    2926:	3280      	movi      	r2, 128
    2928:	4255      	lsli      	r2, r2, 21
    292a:	b340      	st.w      	r2, (r3, 0x0)
}
    292c:	783c      	jmp      	r15

0000292e <CMP0_Wakeup_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP0_INT);    
    292e:	127a      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2930:	3280      	movi      	r2, 128
    2932:	9360      	ld.w      	r3, (r3, 0x0)
    2934:	23ff      	addi      	r3, 256
    2936:	4255      	lsli      	r2, r2, 21
    2938:	b350      	st.w      	r2, (r3, 0x40)
}
    293a:	783c      	jmp      	r15

0000293c <CMP0_Wakeup_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP0_INT);    
    293c:	1276      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    293e:	32e0      	movi      	r2, 224
    2940:	9360      	ld.w      	r3, (r3, 0x0)
    2942:	4241      	lsli      	r2, r2, 1
    2944:	60c8      	addu      	r3, r2
    2946:	3280      	movi      	r2, 128
    2948:	4255      	lsli      	r2, r2, 21
    294a:	b340      	st.w      	r2, (r3, 0x0)
}
    294c:	783c      	jmp      	r15

0000294e <CMP1_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP1_INT);    
    294e:	1272      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2950:	3280      	movi      	r2, 128
    2952:	9360      	ld.w      	r3, (r3, 0x0)
    2954:	23ff      	addi      	r3, 256
    2956:	4256      	lsli      	r2, r2, 22
    2958:	b340      	st.w      	r2, (r3, 0x0)
}
    295a:	783c      	jmp      	r15

0000295c <CMP1_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP1_INT);    
    295c:	126e      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    295e:	32c0      	movi      	r2, 192
    2960:	9360      	ld.w      	r3, (r3, 0x0)
    2962:	4241      	lsli      	r2, r2, 1
    2964:	60c8      	addu      	r3, r2
    2966:	3280      	movi      	r2, 128
    2968:	4256      	lsli      	r2, r2, 22
    296a:	b340      	st.w      	r2, (r3, 0x0)
}
    296c:	783c      	jmp      	r15

0000296e <CMP1_Wakeup_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP1_INT);    
    296e:	126a      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2970:	3280      	movi      	r2, 128
    2972:	9360      	ld.w      	r3, (r3, 0x0)
    2974:	23ff      	addi      	r3, 256
    2976:	4256      	lsli      	r2, r2, 22
    2978:	b350      	st.w      	r2, (r3, 0x40)
}
    297a:	783c      	jmp      	r15

0000297c <CMP1_Wakeup_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP1_INT);    
    297c:	1266      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    297e:	32e0      	movi      	r2, 224
    2980:	9360      	ld.w      	r3, (r3, 0x0)
    2982:	4241      	lsli      	r2, r2, 1
    2984:	60c8      	addu      	r3, r2
    2986:	3280      	movi      	r2, 128
    2988:	4256      	lsli      	r2, r2, 22
    298a:	b340      	st.w      	r2, (r3, 0x0)
}
    298c:	783c      	jmp      	r15

0000298e <CMP2_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP2_INT);    
    298e:	1262      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2990:	3280      	movi      	r2, 128
    2992:	9360      	ld.w      	r3, (r3, 0x0)
    2994:	23ff      	addi      	r3, 256
    2996:	4257      	lsli      	r2, r2, 23
    2998:	b340      	st.w      	r2, (r3, 0x0)
}
    299a:	783c      	jmp      	r15

0000299c <CMP2_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP2_INT);    
    299c:	117e      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    299e:	32c0      	movi      	r2, 192
    29a0:	9360      	ld.w      	r3, (r3, 0x0)
    29a2:	4241      	lsli      	r2, r2, 1
    29a4:	60c8      	addu      	r3, r2
    29a6:	3280      	movi      	r2, 128
    29a8:	4257      	lsli      	r2, r2, 23
    29aa:	b340      	st.w      	r2, (r3, 0x0)
}
    29ac:	783c      	jmp      	r15

000029ae <CMP2_Wakeup_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP2_INT);    
    29ae:	117a      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    29b0:	3280      	movi      	r2, 128
    29b2:	9360      	ld.w      	r3, (r3, 0x0)
    29b4:	23ff      	addi      	r3, 256
    29b6:	4257      	lsli      	r2, r2, 23
    29b8:	b350      	st.w      	r2, (r3, 0x40)
}
    29ba:	783c      	jmp      	r15

000029bc <CMP2_Wakeup_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP2_INT);    
    29bc:	1176      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    29be:	32e0      	movi      	r2, 224
    29c0:	9360      	ld.w      	r3, (r3, 0x0)
    29c2:	4241      	lsli      	r2, r2, 1
    29c4:	60c8      	addu      	r3, r2
    29c6:	3280      	movi      	r2, 128
    29c8:	4257      	lsli      	r2, r2, 23
    29ca:	b340      	st.w      	r2, (r3, 0x0)
}
    29cc:	783c      	jmp      	r15

000029ce <CMP3_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP3_INT);    
    29ce:	1172      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    29d0:	3280      	movi      	r2, 128
    29d2:	9360      	ld.w      	r3, (r3, 0x0)
    29d4:	23ff      	addi      	r3, 256
    29d6:	4258      	lsli      	r2, r2, 24
    29d8:	b340      	st.w      	r2, (r3, 0x0)
}
    29da:	783c      	jmp      	r15

000029dc <CMP3_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP3_INT);    
    29dc:	116e      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    29de:	32c0      	movi      	r2, 192
    29e0:	9360      	ld.w      	r3, (r3, 0x0)
    29e2:	4241      	lsli      	r2, r2, 1
    29e4:	60c8      	addu      	r3, r2
    29e6:	3280      	movi      	r2, 128
    29e8:	4258      	lsli      	r2, r2, 24
    29ea:	b340      	st.w      	r2, (r3, 0x0)
}
    29ec:	783c      	jmp      	r15

000029ee <CMP3_Wakeup_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP3_INT);    
    29ee:	116a      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    29f0:	3280      	movi      	r2, 128
    29f2:	9360      	ld.w      	r3, (r3, 0x0)
    29f4:	23ff      	addi      	r3, 256
    29f6:	4258      	lsli      	r2, r2, 24
    29f8:	b350      	st.w      	r2, (r3, 0x40)
}
    29fa:	783c      	jmp      	r15

000029fc <CMP3_Wakeup_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP3_INT);    
    29fc:	1166      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    29fe:	32e0      	movi      	r2, 224
    2a00:	9360      	ld.w      	r3, (r3, 0x0)
    2a02:	4241      	lsli      	r2, r2, 1
    2a04:	60c8      	addu      	r3, r2
    2a06:	3280      	movi      	r2, 128
    2a08:	4258      	lsli      	r2, r2, 24
    2a0a:	b340      	st.w      	r2, (r3, 0x0)
}
    2a0c:	783c      	jmp      	r15

00002a0e <CMP4_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP4_INT);    
    2a0e:	1162      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2a10:	3280      	movi      	r2, 128
    2a12:	9360      	ld.w      	r3, (r3, 0x0)
    2a14:	23ff      	addi      	r3, 256
    2a16:	4254      	lsli      	r2, r2, 20
    2a18:	b340      	st.w      	r2, (r3, 0x0)
}
    2a1a:	783c      	jmp      	r15

00002a1c <CMP4_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP4_INT);    
    2a1c:	107e      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2a1e:	32c0      	movi      	r2, 192
    2a20:	9360      	ld.w      	r3, (r3, 0x0)
    2a22:	4241      	lsli      	r2, r2, 1
    2a24:	60c8      	addu      	r3, r2
    2a26:	3280      	movi      	r2, 128
    2a28:	4254      	lsli      	r2, r2, 20
    2a2a:	b340      	st.w      	r2, (r3, 0x0)
}
    2a2c:	783c      	jmp      	r15

00002a2e <CMP4_Wakeup_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP4_INT);    
    2a2e:	107a      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2a30:	3280      	movi      	r2, 128
    2a32:	9360      	ld.w      	r3, (r3, 0x0)
    2a34:	23ff      	addi      	r3, 256
    2a36:	4254      	lsli      	r2, r2, 20
    2a38:	b350      	st.w      	r2, (r3, 0x40)
}
    2a3a:	783c      	jmp      	r15

00002a3c <CMP4_Wakeup_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP4_INT);    
    2a3c:	1076      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2a3e:	32e0      	movi      	r2, 224
    2a40:	9360      	ld.w      	r3, (r3, 0x0)
    2a42:	4241      	lsli      	r2, r2, 1
    2a44:	60c8      	addu      	r3, r2
    2a46:	3280      	movi      	r2, 128
    2a48:	4254      	lsli      	r2, r2, 20
    2a4a:	b340      	st.w      	r2, (r3, 0x0)
}
    2a4c:	783c      	jmp      	r15

00002a4e <CMP5_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5_Int_Enable(void)
{
    INTC_ISER_WRITE(CMP5_INT);    
    2a4e:	1072      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2a50:	3280      	movi      	r2, 128
    2a52:	9360      	ld.w      	r3, (r3, 0x0)
    2a54:	23ff      	addi      	r3, 256
    2a56:	424d      	lsli      	r2, r2, 13
    2a58:	b340      	st.w      	r2, (r3, 0x0)
}
    2a5a:	783c      	jmp      	r15

00002a5c <CMP5_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5_Int_Disable(void)
{
    INTC_ICER_WRITE(CMP5_INT);    
    2a5c:	106e      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2a5e:	32c0      	movi      	r2, 192
    2a60:	9360      	ld.w      	r3, (r3, 0x0)
    2a62:	4241      	lsli      	r2, r2, 1
    2a64:	60c8      	addu      	r3, r2
    2a66:	3280      	movi      	r2, 128
    2a68:	424d      	lsli      	r2, r2, 13
    2a6a:	b340      	st.w      	r2, (r3, 0x0)
}
    2a6c:	783c      	jmp      	r15

00002a6e <CMP5_Wakeup_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5_Wakeup_Enable(void)
{
    INTC_IWER_WRITE(CMP5_INT);    
    2a6e:	106a      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2a70:	3280      	movi      	r2, 128
    2a72:	9360      	ld.w      	r3, (r3, 0x0)
    2a74:	23ff      	addi      	r3, 256
    2a76:	424d      	lsli      	r2, r2, 13
    2a78:	b350      	st.w      	r2, (r3, 0x40)
}
    2a7a:	783c      	jmp      	r15

00002a7c <CMP5_Wakeup_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5_Wakeup_Disable(void)
{
    INTC_IWDR_WRITE(CMP5_INT);    
    2a7c:	1066      	lrw      	r3, 0x20000078	// 2a94 <CMP5_Wakeup_Disable+0x18>
    2a7e:	32e0      	movi      	r2, 224
    2a80:	9360      	ld.w      	r3, (r3, 0x0)
    2a82:	4241      	lsli      	r2, r2, 1
    2a84:	60c8      	addu      	r3, r2
    2a86:	3280      	movi      	r2, 128
    2a88:	424d      	lsli      	r2, r2, 13
    2a8a:	b340      	st.w      	r2, (r3, 0x0)
}
    2a8c:	783c      	jmp      	r15
    2a8e:	0000      	bkpt
    2a90:	20000024 	.long	0x20000024
    2a94:	20000078 	.long	0x20000078

00002a98 <CORET_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void CORET_DeInit(void)
{
	CK802->CORET_CSR=CORET_CSR_RST;
    2a98:	1064      	lrw      	r3, 0x20000078	// 2aa8 <CORET_DeInit+0x10>
    2a9a:	3204      	movi      	r2, 4
    2a9c:	9360      	ld.w      	r3, (r3, 0x0)
    2a9e:	b344      	st.w      	r2, (r3, 0x10)
	CK802->CORET_RVR=CORET_RVR_RST;
    2aa0:	3200      	movi      	r2, 0
    2aa2:	b345      	st.w      	r2, (r3, 0x14)
	CK802->CORET_CVR=CORET_CVR_RST;
    2aa4:	b346      	st.w      	r2, (r3, 0x18)
}
    2aa6:	783c      	jmp      	r15
    2aa8:	20000078 	.long	0x20000078

00002aac <CORET_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_Int_Enable(void)
{
    CK802->CORET_CVR = 0x0;							// Clear counter and flag
    2aac:	1164      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2aae:	3200      	movi      	r2, 0
    2ab0:	9360      	ld.w      	r3, (r3, 0x0)
    2ab2:	b346      	st.w      	r2, (r3, 0x18)
	INTC_ISER_WRITE(CORET_INT);    
    2ab4:	23ff      	addi      	r3, 256
    2ab6:	3201      	movi      	r2, 1
    2ab8:	b340      	st.w      	r2, (r3, 0x0)
}
    2aba:	783c      	jmp      	r15

00002abc <CORET_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_Int_Disable(void)
{
    INTC_ICER_WRITE(CORET_INT);    
    2abc:	1160      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2abe:	32c0      	movi      	r2, 192
    2ac0:	9360      	ld.w      	r3, (r3, 0x0)
    2ac2:	4241      	lsli      	r2, r2, 1
    2ac4:	60c8      	addu      	r3, r2
    2ac6:	3201      	movi      	r2, 1
    2ac8:	b340      	st.w      	r2, (r3, 0x0)
}
    2aca:	783c      	jmp      	r15

00002acc <CORET_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void  CORET_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(CORET_INT);    
    2acc:	107c      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2ace:	3201      	movi      	r2, 1
    2ad0:	9360      	ld.w      	r3, (r3, 0x0)
    2ad2:	23ff      	addi      	r3, 256
    2ad4:	b350      	st.w      	r2, (r3, 0x40)
}
    2ad6:	783c      	jmp      	r15

00002ad8 <CORET_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void  CORET_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(CORET_INT);    
    2ad8:	1079      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2ada:	32e0      	movi      	r2, 224
    2adc:	9360      	ld.w      	r3, (r3, 0x0)
    2ade:	4241      	lsli      	r2, r2, 1
    2ae0:	60c8      	addu      	r3, r2
    2ae2:	3201      	movi      	r2, 1
    2ae4:	b340      	st.w      	r2, (r3, 0x0)
}
    2ae6:	783c      	jmp      	r15

00002ae8 <CORET_start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_start(void)
{
	CK802->CORET_CSR|=0x01;
    2ae8:	1075      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2aea:	9340      	ld.w      	r2, (r3, 0x0)
    2aec:	9264      	ld.w      	r3, (r2, 0x10)
    2aee:	3ba0      	bseti      	r3, 0
    2af0:	b264      	st.w      	r3, (r2, 0x10)
}
    2af2:	783c      	jmp      	r15

00002af4 <CORET_stop>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_stop(void)
{
	CK802->CORET_CSR&=0Xfffffffe;
    2af4:	1072      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2af6:	9340      	ld.w      	r2, (r3, 0x0)
    2af8:	9264      	ld.w      	r3, (r2, 0x10)
    2afa:	3b80      	bclri      	r3, 0
    2afc:	b264      	st.w      	r3, (r2, 0x10)
}
    2afe:	783c      	jmp      	r15

00002b00 <CORET_CLKSOURCE_EX>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_CLKSOURCE_EX(void)
{
	CK802->CORET_CSR&=0Xfffffffb;
    2b00:	106f      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2b02:	9340      	ld.w      	r2, (r3, 0x0)
    2b04:	9264      	ld.w      	r3, (r2, 0x10)
    2b06:	3b82      	bclri      	r3, 2
    2b08:	b264      	st.w      	r3, (r2, 0x10)
}
    2b0a:	783c      	jmp      	r15

00002b0c <CORET_CLKSOURCE_IN>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_CLKSOURCE_IN(void)
{
	CK802->CORET_CSR|=0x04;
    2b0c:	106c      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2b0e:	9340      	ld.w      	r2, (r3, 0x0)
    2b10:	9264      	ld.w      	r3, (r2, 0x10)
    2b12:	3ba2      	bseti      	r3, 2
    2b14:	b264      	st.w      	r3, (r2, 0x10)
}
    2b16:	783c      	jmp      	r15

00002b18 <CORET_TICKINT_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_TICKINT_Enable(void)
{
    CK802->CORET_CSR|=0x02;
    2b18:	1069      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2b1a:	9340      	ld.w      	r2, (r3, 0x0)
    2b1c:	9264      	ld.w      	r3, (r2, 0x10)
    2b1e:	3ba1      	bseti      	r3, 1
    2b20:	b264      	st.w      	r3, (r2, 0x10)
}
    2b22:	783c      	jmp      	r15

00002b24 <CORET_TICKINT_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_TICKINT_Disable(void)
{
   CK802->CORET_CSR&=0Xfffffffd;
    2b24:	1066      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2b26:	9340      	ld.w      	r2, (r3, 0x0)
    2b28:	9264      	ld.w      	r3, (r2, 0x10)
    2b2a:	3b81      	bclri      	r3, 1
    2b2c:	b264      	st.w      	r3, (r2, 0x10)
}
    2b2e:	783c      	jmp      	r15

00002b30 <CORET_reload>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORET_reload(void)
{
	CK802->CORET_CVR = 0x0;							// Clear counter and flag
    2b30:	1063      	lrw      	r3, 0x20000078	// 2b3c <CORET_reload+0xc>
    2b32:	3200      	movi      	r2, 0
    2b34:	9360      	ld.w      	r3, (r3, 0x0)
    2b36:	b346      	st.w      	r2, (r3, 0x18)
}
    2b38:	783c      	jmp      	r15
    2b3a:	0000      	bkpt
    2b3c:	20000078 	.long	0x20000078

00002b40 <GPIO_DeInit>:
//IO RESET CLEAR ALL REGISTER
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void GPIO_DeInit(void)
{
    2b40:	14c2      	push      	r4-r5
    GPIOA0->CONLR &= 0x000FF000;                     
    2b42:	1165      	lrw      	r3, 0x20000014	// 2bd4 <GPIO_DeInit+0x94>
    2b44:	31ff      	movi      	r1, 255
    2b46:	9340      	ld.w      	r2, (r3, 0x0)
    2b48:	9260      	ld.w      	r3, (r2, 0x0)
    2b4a:	412c      	lsli      	r1, r1, 12
    2b4c:	68c4      	and      	r3, r1
    GPIOA0->CONHR = GPIO_RESET_VALUE;
	GPIOA1->CONLR = GPIO_RESET_VALUE;                     
    2b4e:	1123      	lrw      	r1, 0x20000010	// 2bd8 <GPIO_DeInit+0x98>
	GPIOA0->PSDR  =	GPIO_RESET_VALUE;
	GPIOA1->PSDR  =	GPIO_RESET_VALUE;
	GPIOB0->PSDR  =	GPIO_RESET_VALUE;
	GPIOC0->PSDR  =	GPIO_RESET_VALUE;
	
	GPIOA0->FLTEN = 0x0fff;
    2b50:	11a3      	lrw      	r5, 0xfff	// 2bdc <GPIO_DeInit+0x9c>
	GPIOA1->CONLR = GPIO_RESET_VALUE;                     
    2b52:	9180      	ld.w      	r4, (r1, 0x0)
    GPIOA0->CONLR &= 0x000FF000;                     
    2b54:	b260      	st.w      	r3, (r2, 0x0)
    GPIOA0->CONHR = GPIO_RESET_VALUE;
    2b56:	3300      	movi      	r3, 0
    GPIOB0->CONLR = GPIO_RESET_VALUE;                     
    2b58:	1122      	lrw      	r1, 0x2000000c	// 2be0 <GPIO_DeInit+0xa0>
    2b5a:	9100      	ld.w      	r0, (r1, 0x0)
    GPIOA0->CONHR = GPIO_RESET_VALUE;
    2b5c:	b261      	st.w      	r3, (r2, 0x4)
	GPIOA1->CONLR = GPIO_RESET_VALUE;                     
    2b5e:	b460      	st.w      	r3, (r4, 0x0)
    GPIOA1->CONHR = GPIO_RESET_VALUE;
    2b60:	b461      	st.w      	r3, (r4, 0x4)
    GPIOB0->CONLR = GPIO_RESET_VALUE;                     
    2b62:	b060      	st.w      	r3, (r0, 0x0)
    GPIOB0->CONHR = GPIO_RESET_VALUE;
    2b64:	b061      	st.w      	r3, (r0, 0x4)
	GPIOC0->CONLR = GPIO_RESET_VALUE;                     
    2b66:	1120      	lrw      	r1, 0x20000008	// 2be4 <GPIO_DeInit+0xa4>
    2b68:	9120      	ld.w      	r1, (r1, 0x0)
    2b6a:	b160      	st.w      	r3, (r1, 0x0)
    GPIOC0->CONHR = GPIO_RESET_VALUE;
    2b6c:	b161      	st.w      	r3, (r1, 0x4)
    GPIOA0->WODR  = GPIO_RESET_VALUE; 
    2b6e:	b262      	st.w      	r3, (r2, 0x8)
	GPIOA1->WODR  = GPIO_RESET_VALUE;
    2b70:	b462      	st.w      	r3, (r4, 0x8)
    GPIOB0->WODR  = GPIO_RESET_VALUE;
    2b72:	b062      	st.w      	r3, (r0, 0x8)
	GPIOC0->WODR  = GPIO_RESET_VALUE;
    2b74:	b162      	st.w      	r3, (r1, 0x8)
    GPIOA0->SODR  = GPIO_RESET_VALUE;
    2b76:	b263      	st.w      	r3, (r2, 0xc)
    GPIOA1->SODR  = GPIO_RESET_VALUE; 
    2b78:	b463      	st.w      	r3, (r4, 0xc)
    GPIOB0->SODR  = GPIO_RESET_VALUE;
    2b7a:	b063      	st.w      	r3, (r0, 0xc)
	GPIOC0->SODR  = GPIO_RESET_VALUE;
    2b7c:	b163      	st.w      	r3, (r1, 0xc)
    GPIOA0->CODR  = GPIO_RESET_VALUE; 
    2b7e:	b264      	st.w      	r3, (r2, 0x10)
	GPIOA1->CODR  = GPIO_RESET_VALUE;
    2b80:	b464      	st.w      	r3, (r4, 0x10)
    GPIOB0->CODR  = GPIO_RESET_VALUE;
    2b82:	b064      	st.w      	r3, (r0, 0x10)
	GPIOC0->CODR  = GPIO_RESET_VALUE;
    2b84:	b164      	st.w      	r3, (r1, 0x10)
	GPIOA0->ODSR  =	GPIO_RESET_VALUE;
    2b86:	b265      	st.w      	r3, (r2, 0x14)
	GPIOA1->ODSR  =	GPIO_RESET_VALUE;
    2b88:	b465      	st.w      	r3, (r4, 0x14)
	GPIOB0->ODSR  =	GPIO_RESET_VALUE;
    2b8a:	b065      	st.w      	r3, (r0, 0x14)
	GPIOC0->ODSR  =	GPIO_RESET_VALUE;
    2b8c:	b165      	st.w      	r3, (r1, 0x14)
	GPIOA0->PSDR  =	GPIO_RESET_VALUE;
    2b8e:	b266      	st.w      	r3, (r2, 0x18)
	GPIOA1->PSDR  =	GPIO_RESET_VALUE;
    2b90:	b466      	st.w      	r3, (r4, 0x18)
	GPIOB0->PSDR  =	GPIO_RESET_VALUE;
    2b92:	b066      	st.w      	r3, (r0, 0x18)
	GPIOC0->PSDR  =	GPIO_RESET_VALUE;
    2b94:	b166      	st.w      	r3, (r1, 0x18)
	GPIOA0->FLTEN = 0x0fff;
    2b96:	b2a7      	st.w      	r5, (r2, 0x1c)
	GPIOA1->FLTEN = 0x3f;
    2b98:	353f      	movi      	r5, 63
    2b9a:	b4a7      	st.w      	r5, (r4, 0x1c)
	GPIOB0->FLTEN = 0xff;
    2b9c:	35ff      	movi      	r5, 255
    2b9e:	b0a7      	st.w      	r5, (r0, 0x1c)
	GPIOC0->FLTEN = 0x0f;
    2ba0:	350f      	movi      	r5, 15
    2ba2:	b1a7      	st.w      	r5, (r1, 0x1c)
	
    GPIOA0->PUDR  = GPIO_RESET_VALUE; 
    2ba4:	b268      	st.w      	r3, (r2, 0x20)
	GPIOA1->PUDR  = GPIO_RESET_VALUE;
    2ba6:	b468      	st.w      	r3, (r4, 0x20)
    GPIOB0->PUDR  = GPIO_RESET_VALUE;
    2ba8:	b068      	st.w      	r3, (r0, 0x20)
	GPIOC0->PUDR  = GPIO_RESET_VALUE;
    2baa:	b168      	st.w      	r3, (r1, 0x20)
	
    GPIOA0->DSCR  = GPIO_RESET_VALUE;
    2bac:	b269      	st.w      	r3, (r2, 0x24)
	GPIOA1->DSCR  = GPIO_RESET_VALUE;
    2bae:	b469      	st.w      	r3, (r4, 0x24)
    GPIOB0->DSCR  = GPIO_RESET_VALUE;
    2bb0:	b069      	st.w      	r3, (r0, 0x24)
	GPIOC0->DSCR  = GPIO_RESET_VALUE;
    2bb2:	b169      	st.w      	r3, (r1, 0x24)
	
	GPIOA0->OMCR  = GPIO_RESET_VALUE;
    2bb4:	b26a      	st.w      	r3, (r2, 0x28)
	GPIOA1->OMCR  = GPIO_RESET_VALUE;
    2bb6:	b46a      	st.w      	r3, (r4, 0x28)
    GPIOB0->OMCR  = GPIO_RESET_VALUE;
    2bb8:	b06a      	st.w      	r3, (r0, 0x28)
	GPIOC0->OMCR  = GPIO_RESET_VALUE;
    2bba:	b16a      	st.w      	r3, (r1, 0x28)
	
    GPIOA0->IECR  = GPIO_RESET_VALUE;
    2bbc:	b26b      	st.w      	r3, (r2, 0x2c)
	GPIOA1->IECR  = GPIO_RESET_VALUE;
    2bbe:	b46b      	st.w      	r3, (r4, 0x2c)
    GPIOB0->IECR  = GPIO_RESET_VALUE;
    2bc0:	b06b      	st.w      	r3, (r0, 0x2c)
	GPIOC0->IECR  = GPIO_RESET_VALUE;
    2bc2:	b16b      	st.w      	r3, (r1, 0x2c)
	
    GPIOGRP->IGRPL  = GPIO_RESET_VALUE;
    2bc4:	1049      	lrw      	r2, 0x20000000	// 2be8 <GPIO_DeInit+0xa8>
    2bc6:	9240      	ld.w      	r2, (r2, 0x0)
    2bc8:	b260      	st.w      	r3, (r2, 0x0)
	GPIOGRP->IGRPH  = GPIO_RESET_VALUE;
    2bca:	b261      	st.w      	r3, (r2, 0x4)
	GPIOGRP->IGREX  = GPIO_RESET_VALUE;
    2bcc:	b262      	st.w      	r3, (r2, 0x8)
	GPIOGRP->CLKEN = 0x17;
    2bce:	3317      	movi      	r3, 23
    2bd0:	b263      	st.w      	r3, (r2, 0xc)
}  
    2bd2:	1482      	pop      	r4-r5
    2bd4:	20000014 	.long	0x20000014
    2bd8:	20000010 	.long	0x20000010
    2bdc:	00000fff 	.long	0x00000fff
    2be0:	2000000c 	.long	0x2000000c
    2be4:	20000008 	.long	0x20000008
    2be8:	20000000 	.long	0x20000000

00002bec <GPIO_Init2>:
//val=0x22222222 all IO as output
//ReturnValue:NONE
/*************************************************************/  
void GPIO_Init2(CSP_GPIO_T *GPIOx,GPIO_byte_TypeDef byte,uint32_t val)
{
    if (byte==0)
    2bec:	3940      	cmpnei      	r1, 0
    2bee:	0803      	bt      	0x2bf4	// 2bf4 <GPIO_Init2+0x8>
    {
        (GPIOx)->CONLR=val;
    2bf0:	b040      	st.w      	r2, (r0, 0x0)
    }
    else if(byte==1)
    {
        (GPIOx)->CONHR=val;
    }
}
    2bf2:	783c      	jmp      	r15
    else if(byte==1)
    2bf4:	3941      	cmpnei      	r1, 1
    2bf6:	0bfe      	bt      	0x2bf2	// 2bf2 <GPIO_Init2+0x6>
        (GPIOx)->CONHR=val;
    2bf8:	b041      	st.w      	r2, (r0, 0x4)
}
    2bfa:	07fc      	br      	0x2bf2	// 2bf2 <GPIO_Init2+0x6>

00002bfc <GPIO_Init>:
//byte:Lowbyte(PIN_0~7),Highbyte(PIN_8~15)
//Dir:0:output 1:input
//ReturnValue:NONE
/*************************************************************/  
void GPIO_Init(CSP_GPIO_T *GPIOx,uint8_t PinNum,GPIO_Dir_TypeDef Dir)
{
    2bfc:	14d1      	push      	r4, r15
    uint32_t data_temp;
    uint8_t GPIO_Pin;
    if(PinNum<8)
    2bfe:	3907      	cmphsi      	r1, 8
{
    2c00:	6d03      	mov      	r4, r0
    if(PinNum<8)
    2c02:	0830      	bt      	0x2c62	// 2c62 <GPIO_Init+0x66>
    {
    switch (PinNum)
    2c04:	5903      	subi      	r0, r1, 1
    2c06:	3806      	cmphsi      	r0, 7
    2c08:	0827      	bt      	0x2c56	// 2c56 <GPIO_Init+0x5a>
    2c0a:	e0000e85 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    2c0e:	1004      	.short	0x1004
    2c10:	1d1a1613 	.long	0x1d1a1613
    2c14:	0021      	.short	0x0021
    {
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
        case 1:data_temp=0xffffff0f;GPIO_Pin=4;break;
    2c16:	3300      	movi      	r3, 0
    2c18:	3104      	movi      	r1, 4
    2c1a:	2bf0      	subi      	r3, 241
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
    }
        if (Dir)
    2c1c:	3a40      	cmpnei      	r2, 0
        {
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
    2c1e:	9440      	ld.w      	r2, (r4, 0x0)
    2c20:	68c8      	and      	r3, r2
        if (Dir)
    2c22:	0c1e      	bf      	0x2c5e	// 2c5e <GPIO_Init+0x62>
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
    2c24:	3201      	movi      	r2, 1
        }
        else
        {
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
    2c26:	7084      	lsl      	r2, r1
    2c28:	6cc8      	or      	r3, r2
    2c2a:	b460      	st.w      	r3, (r4, 0x0)
        else
        {
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
        }
    }
}
    2c2c:	1491      	pop      	r4, r15
        case 2:data_temp=0xfffff0ff;GPIO_Pin=8;break;
    2c2e:	3108      	movi      	r1, 8
    2c30:	017d      	lrw      	r3, 0xfffff0ff	// 2f38 <GPIOA0_EXI_Init+0x18>
    2c32:	07f5      	br      	0x2c1c	// 2c1c <GPIO_Init+0x20>
        case 3:data_temp=0xffff0fff;GPIO_Pin=12;break;
    2c34:	310c      	movi      	r1, 12
    2c36:	017d      	lrw      	r3, 0xffff0fff	// 2f3c <GPIOA0_EXI_Init+0x1c>
    2c38:	07f2      	br      	0x2c1c	// 2c1c <GPIO_Init+0x20>
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
    2c3a:	3110      	movi      	r1, 16
    2c3c:	017e      	lrw      	r3, 0xfff10000	// 2f40 <GPIOA0_EXI_Init+0x20>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    2c3e:	2b00      	subi      	r3, 1
    2c40:	07ee      	br      	0x2c1c	// 2c1c <GPIO_Init+0x20>
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
    2c42:	3114      	movi      	r1, 20
    2c44:	017f      	lrw      	r3, 0xff100000	// 2f44 <GPIOA0_EXI_Init+0x24>
    2c46:	07fc      	br      	0x2c3e	// 2c3e <GPIO_Init+0x42>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    2c48:	33f1      	movi      	r3, 241
    2c4a:	3118      	movi      	r1, 24
    2c4c:	4378      	lsli      	r3, r3, 24
    2c4e:	07f8      	br      	0x2c3e	// 2c3e <GPIO_Init+0x42>
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
    2c50:	311c      	movi      	r1, 28
    2c52:	0261      	lrw      	r3, 0xfffffff	// 2f48 <GPIOA0_EXI_Init+0x28>
    2c54:	07e4      	br      	0x2c1c	// 2c1c <GPIO_Init+0x20>
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
    2c56:	3300      	movi      	r3, 0
    2c58:	3100      	movi      	r1, 0
    2c5a:	2b0f      	subi      	r3, 16
    2c5c:	07e0      	br      	0x2c1c	// 2c1c <GPIO_Init+0x20>
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
    2c5e:	3202      	movi      	r2, 2
    2c60:	07e3      	br      	0x2c26	// 2c26 <GPIO_Init+0x2a>
    else if (PinNum<16)
    2c62:	390f      	cmphsi      	r1, 16
    2c64:	0be4      	bt      	0x2c2c	// 2c2c <GPIO_Init+0x30>
        switch (PinNum)
    2c66:	2908      	subi      	r1, 9
    2c68:	3906      	cmphsi      	r1, 7
    2c6a:	6c07      	mov      	r0, r1
    2c6c:	0827      	bt      	0x2cba	// 2cba <GPIO_Init+0xbe>
    2c6e:	e0000e53 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    2c72:	1004      	.short	0x1004
    2c74:	1d1a1613 	.long	0x1d1a1613
    2c78:	0021      	.short	0x0021
        case 9:data_temp=0xffffff0f;GPIO_Pin=4;break;
    2c7a:	3300      	movi      	r3, 0
    2c7c:	3104      	movi      	r1, 4
    2c7e:	2bf0      	subi      	r3, 241
      if (Dir)
    2c80:	3a40      	cmpnei      	r2, 0
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
    2c82:	9441      	ld.w      	r2, (r4, 0x4)
    2c84:	68c8      	and      	r3, r2
      if (Dir)
    2c86:	0c1e      	bf      	0x2cc2	// 2cc2 <GPIO_Init+0xc6>
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
    2c88:	3201      	movi      	r2, 1
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
    2c8a:	7084      	lsl      	r2, r1
    2c8c:	6cc8      	or      	r3, r2
    2c8e:	b461      	st.w      	r3, (r4, 0x4)
}
    2c90:	07ce      	br      	0x2c2c	// 2c2c <GPIO_Init+0x30>
        case 10:data_temp=0xfffff0ff;GPIO_Pin=8;break;
    2c92:	3108      	movi      	r1, 8
    2c94:	0276      	lrw      	r3, 0xfffff0ff	// 2f38 <GPIOA0_EXI_Init+0x18>
    2c96:	07f5      	br      	0x2c80	// 2c80 <GPIO_Init+0x84>
        case 11:data_temp=0xffff0fff;GPIO_Pin=12;break;
    2c98:	310c      	movi      	r1, 12
    2c9a:	0276      	lrw      	r3, 0xffff0fff	// 2f3c <GPIOA0_EXI_Init+0x1c>
    2c9c:	07f2      	br      	0x2c80	// 2c80 <GPIO_Init+0x84>
        case 12:data_temp=0xfff0ffff;GPIO_Pin=16;break;
    2c9e:	3110      	movi      	r1, 16
    2ca0:	0277      	lrw      	r3, 0xfff10000	// 2f40 <GPIOA0_EXI_Init+0x20>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    2ca2:	2b00      	subi      	r3, 1
    2ca4:	07ee      	br      	0x2c80	// 2c80 <GPIO_Init+0x84>
        case 13:data_temp=0xff0fffff;GPIO_Pin=20;break;
    2ca6:	3114      	movi      	r1, 20
    2ca8:	0278      	lrw      	r3, 0xff100000	// 2f44 <GPIOA0_EXI_Init+0x24>
    2caa:	07fc      	br      	0x2ca2	// 2ca2 <GPIO_Init+0xa6>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
    2cac:	33f1      	movi      	r3, 241
    2cae:	3118      	movi      	r1, 24
    2cb0:	4378      	lsli      	r3, r3, 24
    2cb2:	07f8      	br      	0x2ca2	// 2ca2 <GPIO_Init+0xa6>
        case 15:data_temp=0x0fffffff;GPIO_Pin=28;break;
    2cb4:	311c      	movi      	r1, 28
    2cb6:	027a      	lrw      	r3, 0xfffffff	// 2f48 <GPIOA0_EXI_Init+0x28>
    2cb8:	07e4      	br      	0x2c80	// 2c80 <GPIO_Init+0x84>
        case 8:data_temp=0xfffffff0;GPIO_Pin=0;break;
    2cba:	3300      	movi      	r3, 0
    2cbc:	3100      	movi      	r1, 0
    2cbe:	2b0f      	subi      	r3, 16
    2cc0:	07e0      	br      	0x2c80	// 2c80 <GPIO_Init+0x84>
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
    2cc2:	3202      	movi      	r2, 2
    2cc4:	07e3      	br      	0x2c8a	// 2c8a <GPIO_Init+0x8e>

00002cc6 <GPIO_InPutOutPut_Disable>:
//GPIO_Pin:PIN_0~15
//byte:Lowbyte(PIN_0~7),Highbyte(PIN_8~15)
//ReturnValue:NONE
/*************************************************************/  
void GPIO_InPutOutPut_Disable(CSP_GPIO_T *GPIOx,uint8_t PinNum)
{
    2cc6:	14d0      	push      	r15
    uint32_t data_temp;
    if(PinNum<8)
    2cc8:	3907      	cmphsi      	r1, 8
{
    2cca:	6c83      	mov      	r2, r0
    if(PinNum<8)
    2ccc:	0821      	bt      	0x2d0e	// 2d0e <GPIO_InPutOutPut_Disable+0x48>
    {
    switch (PinNum)
    2cce:	5903      	subi      	r0, r1, 1
    2cd0:	3806      	cmphsi      	r0, 7
    2cd2:	081b      	bt      	0x2d08	// 2d08 <GPIO_InPutOutPut_Disable+0x42>
    2cd4:	e0000e20 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    2cd8:	0e0c0a04 	.long	0x0e0c0a04
    2cdc:	00161311 	.long	0x00161311
    {
        case 0:data_temp=0xfffffff0;break;
        case 1:data_temp=0xffffff0f;break;
    2ce0:	3300      	movi      	r3, 0
    2ce2:	2bf0      	subi      	r3, 241
        case 4:data_temp=0xfff0ffff;break;
        case 5:data_temp=0xff0fffff;break;
        case 6:data_temp=0xf0ffffff;break;
        case 7:data_temp=0x0fffffff;break;
    }
         (GPIOx)->CONLR = (GPIOx)->CONLR & data_temp;
    2ce4:	9220      	ld.w      	r1, (r2, 0x0)
    2ce6:	68c4      	and      	r3, r1
    2ce8:	b260      	st.w      	r3, (r2, 0x0)
        case 14:data_temp=0xf0ffffff;break;
        case 15:data_temp=0x0fffffff;break;
    } 
         (GPIOx)->CONHR = (GPIOx)->CONHR & data_temp;    
    }
}
    2cea:	1490      	pop      	r15
        case 2:data_temp=0xfffff0ff;break;
    2cec:	036c      	lrw      	r3, 0xfffff0ff	// 2f38 <GPIOA0_EXI_Init+0x18>
    2cee:	07fb      	br      	0x2ce4	// 2ce4 <GPIO_InPutOutPut_Disable+0x1e>
        case 3:data_temp=0xffff0fff;break;
    2cf0:	036c      	lrw      	r3, 0xffff0fff	// 2f3c <GPIOA0_EXI_Init+0x1c>
    2cf2:	07f9      	br      	0x2ce4	// 2ce4 <GPIO_InPutOutPut_Disable+0x1e>
        case 4:data_temp=0xfff0ffff;break;
    2cf4:	036c      	lrw      	r3, 0xfff10000	// 2f40 <GPIOA0_EXI_Init+0x20>
        case 6:data_temp=0xf0ffffff;break;
    2cf6:	2b00      	subi      	r3, 1
    2cf8:	07f6      	br      	0x2ce4	// 2ce4 <GPIO_InPutOutPut_Disable+0x1e>
        case 5:data_temp=0xff0fffff;break;
    2cfa:	036c      	lrw      	r3, 0xff100000	// 2f44 <GPIOA0_EXI_Init+0x24>
    2cfc:	07fd      	br      	0x2cf6	// 2cf6 <GPIO_InPutOutPut_Disable+0x30>
        case 6:data_temp=0xf0ffffff;break;
    2cfe:	33f1      	movi      	r3, 241
    2d00:	4378      	lsli      	r3, r3, 24
    2d02:	07fa      	br      	0x2cf6	// 2cf6 <GPIO_InPutOutPut_Disable+0x30>
        case 7:data_temp=0x0fffffff;break;
    2d04:	036e      	lrw      	r3, 0xfffffff	// 2f48 <GPIOA0_EXI_Init+0x28>
    2d06:	07ef      	br      	0x2ce4	// 2ce4 <GPIO_InPutOutPut_Disable+0x1e>
        case 0:data_temp=0xfffffff0;break;
    2d08:	3300      	movi      	r3, 0
    2d0a:	2b0f      	subi      	r3, 16
    2d0c:	07ec      	br      	0x2ce4	// 2ce4 <GPIO_InPutOutPut_Disable+0x1e>
    else if (PinNum<16)
    2d0e:	390f      	cmphsi      	r1, 16
    2d10:	0bed      	bt      	0x2cea	// 2cea <GPIO_InPutOutPut_Disable+0x24>
        switch (PinNum)
    2d12:	2908      	subi      	r1, 9
    2d14:	3906      	cmphsi      	r1, 7
    2d16:	6c07      	mov      	r0, r1
    2d18:	081b      	bt      	0x2d4e	// 2d4e <GPIO_InPutOutPut_Disable+0x88>
    2d1a:	e0000dfd 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    2d1e:	0a04      	.short	0x0a04
    2d20:	13110e0c 	.long	0x13110e0c
    2d24:	0016      	.short	0x0016
        case 9:data_temp=0xffffff0f;break;
    2d26:	3300      	movi      	r3, 0
    2d28:	2bf0      	subi      	r3, 241
         (GPIOx)->CONHR = (GPIOx)->CONHR & data_temp;    
    2d2a:	9221      	ld.w      	r1, (r2, 0x4)
    2d2c:	68c4      	and      	r3, r1
    2d2e:	b261      	st.w      	r3, (r2, 0x4)
}
    2d30:	07dd      	br      	0x2cea	// 2cea <GPIO_InPutOutPut_Disable+0x24>
        case 10:data_temp=0xfffff0ff;break;
    2d32:	037d      	lrw      	r3, 0xfffff0ff	// 2f38 <GPIOA0_EXI_Init+0x18>
    2d34:	07fb      	br      	0x2d2a	// 2d2a <GPIO_InPutOutPut_Disable+0x64>
        case 11:data_temp=0xffff0fff;break;
    2d36:	037d      	lrw      	r3, 0xffff0fff	// 2f3c <GPIOA0_EXI_Init+0x1c>
    2d38:	07f9      	br      	0x2d2a	// 2d2a <GPIO_InPutOutPut_Disable+0x64>
        case 12:data_temp=0xfff0ffff;break;
    2d3a:	037d      	lrw      	r3, 0xfff10000	// 2f40 <GPIOA0_EXI_Init+0x20>
        case 14:data_temp=0xf0ffffff;break;
    2d3c:	2b00      	subi      	r3, 1
    2d3e:	07f6      	br      	0x2d2a	// 2d2a <GPIO_InPutOutPut_Disable+0x64>
        case 13:data_temp=0xff0fffff;break;
    2d40:	037e      	lrw      	r3, 0xff100000	// 2f44 <GPIOA0_EXI_Init+0x24>
    2d42:	07fd      	br      	0x2d3c	// 2d3c <GPIO_InPutOutPut_Disable+0x76>
        case 14:data_temp=0xf0ffffff;break;
    2d44:	33f1      	movi      	r3, 241
    2d46:	4378      	lsli      	r3, r3, 24
    2d48:	07fa      	br      	0x2d3c	// 2d3c <GPIO_InPutOutPut_Disable+0x76>
        case 15:data_temp=0x0fffffff;break;
    2d4a:	037f      	lrw      	r3, 0xfffffff	// 2f48 <GPIOA0_EXI_Init+0x28>
    2d4c:	07ef      	br      	0x2d2a	// 2d2a <GPIO_InPutOutPut_Disable+0x64>
        case 8:data_temp=0xfffffff0;break;
    2d4e:	3300      	movi      	r3, 0
    2d50:	2b0f      	subi      	r3, 16
    2d52:	07ec      	br      	0x2d2a	// 2d2a <GPIO_InPutOutPut_Disable+0x64>

00002d54 <GPIO_MODE_Init>:
//IO_MODE:OMCR(OUTPUT MODE SET)
//IO_MODE:IECR(IO INT ENABLE)
//ReturnValue:NONE
/*************************************************************/  
void GPIO_MODE_Init(CSP_GPIO_T *GPIOx,GPIO_Mode_TypeDef IO_MODE,uint32_t val)
{
    2d54:	14d0      	push      	r15
        switch (IO_MODE)
    2d56:	3903      	cmphsi      	r1, 4
{
    2d58:	6cc3      	mov      	r3, r0
        switch (IO_MODE)
    2d5a:	0807      	bt      	0x2d68	// 2d68 <GPIO_MODE_Init+0x14>
    2d5c:	6c07      	mov      	r0, r1
    2d5e:	e0000ddb 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    2d62:	0402      	.short	0x0402
    2d64:	0806      	.short	0x0806
        {
            case PUDR:(GPIOx)->PUDR  = val;break;               
    2d66:	b348      	st.w      	r2, (r3, 0x20)
            case DSCR:(GPIOx)->DSCR  = val;break;
            case OMCR:(GPIOx)->OMCR  = val;break;
            case IECR:(GPIOx)->IECR  = val;break;
        }
}
    2d68:	1490      	pop      	r15
            case DSCR:(GPIOx)->DSCR  = val;break;
    2d6a:	b349      	st.w      	r2, (r3, 0x24)
    2d6c:	07fe      	br      	0x2d68	// 2d68 <GPIO_MODE_Init+0x14>
            case OMCR:(GPIOx)->OMCR  = val;break;
    2d6e:	b34a      	st.w      	r2, (r3, 0x28)
    2d70:	07fc      	br      	0x2d68	// 2d68 <GPIO_MODE_Init+0x14>
            case IECR:(GPIOx)->IECR  = val;break;
    2d72:	b34b      	st.w      	r2, (r3, 0x2c)
}
    2d74:	07fa      	br      	0x2d68	// 2d68 <GPIO_MODE_Init+0x14>

00002d76 <GPIO_PullHigh_Init>:
//bit:0~15
//ReturnValue:VALUE
/*************************************************************/
void GPIO_PullHigh_Init(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->PUDR  = (((GPIOx)->PUDR) & ~(0x03<<(bit*2))) | (0x01<<(bit*2));
    2d76:	4121      	lsli      	r1, r1, 1
    2d78:	3203      	movi      	r2, 3
    2d7a:	9068      	ld.w      	r3, (r0, 0x20)
    2d7c:	7084      	lsl      	r2, r1
    2d7e:	68c9      	andn      	r3, r2
    2d80:	3201      	movi      	r2, 1
    2d82:	7084      	lsl      	r2, r1
    2d84:	6cc8      	or      	r3, r2
    2d86:	b068      	st.w      	r3, (r0, 0x20)
}
    2d88:	783c      	jmp      	r15

00002d8a <GPIO_PullLow_Init>:
void GPIO_PullLow_Init(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->PUDR  = (((GPIOx)->PUDR) & ~(0x03<<(bit*2))) | (0x02<<(bit*2));
    2d8a:	4121      	lsli      	r1, r1, 1
    2d8c:	3203      	movi      	r2, 3
    2d8e:	9068      	ld.w      	r3, (r0, 0x20)
    2d90:	7084      	lsl      	r2, r1
    2d92:	68c9      	andn      	r3, r2
    2d94:	3202      	movi      	r2, 2
    2d96:	7084      	lsl      	r2, r1
    2d98:	6cc8      	or      	r3, r2
    2d9a:	b068      	st.w      	r3, (r0, 0x20)
}
    2d9c:	783c      	jmp      	r15

00002d9e <GPIO_PullHighLow_DIS>:
void GPIO_PullHighLow_DIS(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->PUDR  = ((GPIOx)->PUDR) & ~(0x03<<(bit*2));
    2d9e:	4121      	lsli      	r1, r1, 1
    2da0:	3203      	movi      	r2, 3
    2da2:	9068      	ld.w      	r3, (r0, 0x20)
    2da4:	7084      	lsl      	r2, r1
    2da6:	68c9      	andn      	r3, r2
    2da8:	b068      	st.w      	r3, (r0, 0x20)
}
    2daa:	783c      	jmp      	r15

00002dac <GPIO_OpenDrain_EN>:
//bit:0~15
//ReturnValue:VALUE
/*************************************************************/
void GPIO_OpenDrain_EN(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->OMCR  = ((GPIOx)->OMCR) | (0x01<<bit);
    2dac:	3301      	movi      	r3, 1
    2dae:	904a      	ld.w      	r2, (r0, 0x28)
    2db0:	70c4      	lsl      	r3, r1
    2db2:	6cc8      	or      	r3, r2
    2db4:	b06a      	st.w      	r3, (r0, 0x28)
}
    2db6:	783c      	jmp      	r15

00002db8 <GPIO_OpenDrain_DIS>:
void GPIO_OpenDrain_DIS(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->OMCR  = ((GPIOx)->OMCR) & ~(0x01<<bit);
    2db8:	3300      	movi      	r3, 0
    2dba:	2b01      	subi      	r3, 2
    2dbc:	904a      	ld.w      	r2, (r0, 0x28)
    2dbe:	70c7      	rotl      	r3, r1
    2dc0:	68c8      	and      	r3, r2
    2dc2:	b06a      	st.w      	r3, (r0, 0x28)
}
    2dc4:	783c      	jmp      	r15

00002dc6 <GPIO_TTL_COSM_Selecte>:
//INPUT_MODE_SETECTED_X:INPUT_MODE_TTL1,INPUT_MODE_SETECTED_TTL2,INPUT_MODE_SETECTED_CMOSS
//ReturnValue:VALUE
/*************************************************************/
//默认cmos口
void GPIO_TTL_COSM_Selecte(CSP_GPIO_T *GPIOx,uint8_t bit,INPUT_MODE_SETECTED_TypeDef INPUT_MODE_SETECTED_X)
{
    2dc6:	14c3      	push      	r4-r6
	if(INPUT_MODE_SETECTED_X==INPUT_MODE_SETECTED_CMOS)
    2dc8:	3a40      	cmpnei      	r2, 0
    2dca:	4181      	lsli      	r4, r1, 1
    2dcc:	0809      	bt      	0x2dde	// 2dde <GPIO_TTL_COSM_Selecte+0x18>
	{
		(GPIOx)->DSCR  = ((GPIOx)->DSCR) & ~(0x01<<(bit*2+1));
    2dce:	3300      	movi      	r3, 0
    2dd0:	2400      	addi      	r4, 1
    2dd2:	2b01      	subi      	r3, 2
    2dd4:	9049      	ld.w      	r2, (r0, 0x24)
    2dd6:	70d3      	rotl      	r3, r4
    2dd8:	68c8      	and      	r3, r2
    2dda:	b069      	st.w      	r3, (r0, 0x24)
		else if(INPUT_MODE_SETECTED_X==INPUT_MODE_SETECTED_TTL2)
		{
			(GPIOx)->OMCR  = ((GPIOx)->OMCR) & ~(0x01<<(bit+16));
		}
	}
}
    2ddc:	1483      	pop      	r4-r6
		(GPIOx)->DSCR  = ((GPIOx)->DSCR) | (0x01<<(bit*2+1));
    2dde:	3301      	movi      	r3, 1
    2de0:	2400      	addi      	r4, 1
    2de2:	6d8f      	mov      	r6, r3
    2de4:	7190      	lsl      	r6, r4
    2de6:	90a9      	ld.w      	r5, (r0, 0x24)
    2de8:	6d1b      	mov      	r4, r6
    2dea:	6d14      	or      	r4, r5
		if(INPUT_MODE_SETECTED_X==INPUT_MODE_SETECTED_TTL1)
    2dec:	3a41      	cmpnei      	r2, 1
		(GPIOx)->DSCR  = ((GPIOx)->DSCR) | (0x01<<(bit*2+1));
    2dee:	b089      	st.w      	r4, (r0, 0x24)
		if(INPUT_MODE_SETECTED_X==INPUT_MODE_SETECTED_TTL1)
    2df0:	0807      	bt      	0x2dfe	// 2dfe <GPIO_TTL_COSM_Selecte+0x38>
			(GPIOx)->OMCR  = ((GPIOx)->OMCR) | (0x01<<(bit+16));
    2df2:	210f      	addi      	r1, 16
    2df4:	906a      	ld.w      	r3, (r0, 0x28)
    2df6:	7084      	lsl      	r2, r1
    2df8:	6c8c      	or      	r2, r3
    2dfa:	b04a      	st.w      	r2, (r0, 0x28)
    2dfc:	07f0      	br      	0x2ddc	// 2ddc <GPIO_TTL_COSM_Selecte+0x16>
		else if(INPUT_MODE_SETECTED_X==INPUT_MODE_SETECTED_TTL2)
    2dfe:	3a42      	cmpnei      	r2, 2
    2e00:	0bee      	bt      	0x2ddc	// 2ddc <GPIO_TTL_COSM_Selecte+0x16>
			(GPIOx)->OMCR  = ((GPIOx)->OMCR) & ~(0x01<<(bit+16));
    2e02:	210f      	addi      	r1, 16
    2e04:	904a      	ld.w      	r2, (r0, 0x28)
    2e06:	70c4      	lsl      	r3, r1
    2e08:	688d      	andn      	r2, r3
    2e0a:	b04a      	st.w      	r2, (r0, 0x28)
}
    2e0c:	07e8      	br      	0x2ddc	// 2ddc <GPIO_TTL_COSM_Selecte+0x16>

00002e0e <GPIO_DriveStrength_EN>:
//bit:0~15
//ReturnValue:VALUE
/*************************************************************/
void GPIO_DriveStrength_EN(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->DSCR  = ((GPIOx)->DSCR) | (0x01<<(bit*2));
    2e0e:	4121      	lsli      	r1, r1, 1
    2e10:	3301      	movi      	r3, 1
    2e12:	9049      	ld.w      	r2, (r0, 0x24)
    2e14:	70c4      	lsl      	r3, r1
    2e16:	6cc8      	or      	r3, r2
    2e18:	b069      	st.w      	r3, (r0, 0x24)
}
    2e1a:	783c      	jmp      	r15

00002e1c <GPIO_DriveStrength_DIS>:
void GPIO_DriveStrength_DIS(CSP_GPIO_T *GPIOx,uint8_t bit)
{
	(GPIOx)->DSCR  = ((GPIOx)->DSCR) & ~(0x01<<(bit*2));
    2e1c:	3300      	movi      	r3, 0
    2e1e:	4121      	lsli      	r1, r1, 1
    2e20:	2b01      	subi      	r3, 2
    2e22:	9049      	ld.w      	r2, (r0, 0x24)
    2e24:	70c7      	rotl      	r3, r1
    2e26:	68c8      	and      	r3, r2
    2e28:	b069      	st.w      	r3, (r0, 0x24)
}
    2e2a:	783c      	jmp      	r15

00002e2c <GPIO_IntGroup_Set>:
//EXI16~EXI17:GPIOA0.0~GPIOA0.7 + GPIOB0.0~GPIOB0.3 + GPIOC0.0~GPIOC0.3
//EXI18~EXI19:GPIOB0.0~GPIOB0.3 + GPIOC0.0~GPIOC0.3
//ReturnValue:NONE
/*************************************************************/  
void GPIO_IntGroup_Set(GPIO_Group_TypeDef IO_MODE , uint8_t PinNum , GPIO_EXIPIN_TypeDef Selete_EXI_x)
{
    2e2c:	14c1      	push      	r4
    2e2e:	1422      	subi      	r14, r14, 8
	volatile unsigned int  R_data_temp;
    volatile unsigned char R_GPIO_Pin;
	if(Selete_EXI_x<16)
    2e30:	3a0f      	cmphsi      	r2, 16
    2e32:	084f      	bt      	0x2ed0	// 2ed0 <GPIO_IntGroup_Set+0xa4>
	{
		if((Selete_EXI_x==0)||(Selete_EXI_x==8))
    2e34:	6ccb      	mov      	r3, r2
    2e36:	3b83      	bclri      	r3, 3
    2e38:	3b40      	cmpnei      	r3, 0
    2e3a:	0813      	bt      	0x2e60	// 2e60 <GPIO_IntGroup_Set+0x34>
		{
			R_data_temp=0xfffffff0;
    2e3c:	2b0f      	subi      	r3, 16
    2e3e:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=0;
    2e40:	3300      	movi      	r3, 0
		else if((Selete_EXI_x==7)||(Selete_EXI_x==15))
		{
			R_data_temp=0x0fffffff;
			R_GPIO_Pin=28;
		}
		if(Selete_EXI_x<8)
    2e42:	3a07      	cmphsi      	r2, 8
			R_GPIO_Pin=28;
    2e44:	dc6e0003 	st.b      	r3, (r14, 0x3)
    2e48:	1261      	lrw      	r3, 0x20000000	// 2f4c <GPIOA0_EXI_Init+0x2c>
		if(Selete_EXI_x<8)
    2e4a:	0c38      	bf      	0x2eba	// 2eba <GPIO_IntGroup_Set+0x8e>
		{
			GPIOGRP->IGRPL =(GPIOGRP->IGRPL & R_data_temp) | (IO_MODE<<R_GPIO_Pin);
		}
		else if((Selete_EXI_x<16)&&(Selete_EXI_x>=8))
		{
			GPIOGRP->IGRPH =(GPIOGRP->IGRPH & R_data_temp) | (IO_MODE<<R_GPIO_Pin);    
    2e4c:	9340      	ld.w      	r2, (r3, 0x0)
    2e4e:	9261      	ld.w      	r3, (r2, 0x4)
    2e50:	9881      	ld.w      	r4, (r14, 0x4)
    2e52:	d82e0003 	ld.b      	r1, (r14, 0x3)
    2e56:	68d0      	and      	r3, r4
    2e58:	7004      	lsl      	r0, r1
    2e5a:	6c0c      	or      	r0, r3
    2e5c:	b201      	st.w      	r0, (r2, 0x4)
    2e5e:	0437      	br      	0x2ecc	// 2ecc <GPIO_IntGroup_Set+0xa0>
		else if((Selete_EXI_x==1)||(Selete_EXI_x==9))
    2e60:	3b41      	cmpnei      	r3, 1
    2e62:	0806      	bt      	0x2e6e	// 2e6e <GPIO_IntGroup_Set+0x42>
			R_data_temp=0xffffff0f;
    2e64:	3300      	movi      	r3, 0
    2e66:	2bf0      	subi      	r3, 241
    2e68:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=4;
    2e6a:	3304      	movi      	r3, 4
    2e6c:	07eb      	br      	0x2e42	// 2e42 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==2)||(Selete_EXI_x==10))
    2e6e:	3b42      	cmpnei      	r3, 2
    2e70:	0805      	bt      	0x2e7a	// 2e7a <GPIO_IntGroup_Set+0x4e>
			R_data_temp=0xfffff0ff;
    2e72:	1172      	lrw      	r3, 0xfffff0ff	// 2f38 <GPIOA0_EXI_Init+0x18>
    2e74:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=8;
    2e76:	3308      	movi      	r3, 8
    2e78:	07e5      	br      	0x2e42	// 2e42 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==3)||(Selete_EXI_x==11))
    2e7a:	3b43      	cmpnei      	r3, 3
    2e7c:	0805      	bt      	0x2e86	// 2e86 <GPIO_IntGroup_Set+0x5a>
			R_data_temp=0xffff0fff;
    2e7e:	1170      	lrw      	r3, 0xffff0fff	// 2f3c <GPIOA0_EXI_Init+0x1c>
    2e80:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=12;
    2e82:	330c      	movi      	r3, 12
    2e84:	07df      	br      	0x2e42	// 2e42 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==4)||(Selete_EXI_x==12))
    2e86:	3b44      	cmpnei      	r3, 4
    2e88:	0806      	bt      	0x2e94	// 2e94 <GPIO_IntGroup_Set+0x68>
			R_data_temp=0xfff0ffff;
    2e8a:	116e      	lrw      	r3, 0xfff10000	// 2f40 <GPIOA0_EXI_Init+0x20>
    2e8c:	2b00      	subi      	r3, 1
    2e8e:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=16;
    2e90:	3310      	movi      	r3, 16
    2e92:	07d8      	br      	0x2e42	// 2e42 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==5)||(Selete_EXI_x==13))
    2e94:	3b45      	cmpnei      	r3, 5
    2e96:	0806      	bt      	0x2ea2	// 2ea2 <GPIO_IntGroup_Set+0x76>
			R_data_temp=0xff0fffff;
    2e98:	116b      	lrw      	r3, 0xff100000	// 2f44 <GPIOA0_EXI_Init+0x24>
    2e9a:	2b00      	subi      	r3, 1
    2e9c:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=20;
    2e9e:	3314      	movi      	r3, 20
    2ea0:	07d1      	br      	0x2e42	// 2e42 <GPIO_IntGroup_Set+0x16>
		else if((Selete_EXI_x==6)||(Selete_EXI_x==14))
    2ea2:	3b46      	cmpnei      	r3, 6
    2ea4:	0807      	bt      	0x2eb2	// 2eb2 <GPIO_IntGroup_Set+0x86>
			R_data_temp=0xf0ffffff;
    2ea6:	33f1      	movi      	r3, 241
    2ea8:	4378      	lsli      	r3, r3, 24
    2eaa:	2b00      	subi      	r3, 1
    2eac:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=24;
    2eae:	3318      	movi      	r3, 24
    2eb0:	07c9      	br      	0x2e42	// 2e42 <GPIO_IntGroup_Set+0x16>
			R_data_temp=0x0fffffff;
    2eb2:	1166      	lrw      	r3, 0xfffffff	// 2f48 <GPIOA0_EXI_Init+0x28>
    2eb4:	b861      	st.w      	r3, (r14, 0x4)
			R_GPIO_Pin=28;
    2eb6:	331c      	movi      	r3, 28
    2eb8:	07c5      	br      	0x2e42	// 2e42 <GPIO_IntGroup_Set+0x16>
			GPIOGRP->IGRPL =(GPIOGRP->IGRPL & R_data_temp) | (IO_MODE<<R_GPIO_Pin);
    2eba:	9340      	ld.w      	r2, (r3, 0x0)
    2ebc:	9260      	ld.w      	r3, (r2, 0x0)
    2ebe:	9881      	ld.w      	r4, (r14, 0x4)
    2ec0:	d82e0003 	ld.b      	r1, (r14, 0x3)
    2ec4:	68d0      	and      	r3, r4
    2ec6:	7004      	lsl      	r0, r1
    2ec8:	6c0c      	or      	r0, r3
    2eca:	b200      	st.w      	r0, (r2, 0x0)
			{
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<12);
			}
		}
	}
}
    2ecc:	1402      	addi      	r14, r14, 8
    2ece:	1481      	pop      	r4
	else if(Selete_EXI_x<20)
    2ed0:	3a13      	cmphsi      	r2, 20
    2ed2:	0bfd      	bt      	0x2ecc	// 2ecc <GPIO_IntGroup_Set+0xa0>
		if(((IO_MODE==0)||(IO_MODE==2)||(IO_MODE==4))&&((Selete_EXI_x==16)||((Selete_EXI_x==17))))						//PA0.0~PA0.7 + PB0.0~PB0.3 + PC0.0~PC0.3  
    2ed4:	6cc3      	mov      	r3, r0
    2ed6:	3b81      	bclri      	r3, 1
    2ed8:	3b40      	cmpnei      	r3, 0
    2eda:	0c03      	bf      	0x2ee0	// 2ee0 <GPIO_IntGroup_Set+0xb4>
    2edc:	3844      	cmpnei      	r0, 4
    2ede:	0bf7      	bt      	0x2ecc	// 2ecc <GPIO_IntGroup_Set+0xa0>
    2ee0:	3300      	movi      	r3, 0
    2ee2:	2b0f      	subi      	r3, 16
    2ee4:	60c8      	addu      	r3, r2
    2ee6:	3b01      	cmphsi      	r3, 2
    2ee8:	080f      	bt      	0x2f06	// 2f06 <GPIO_IntGroup_Set+0xda>
			if(Selete_EXI_x==16)
    2eea:	3a50      	cmpnei      	r2, 16
    2eec:	1078      	lrw      	r3, 0x20000000	// 2f4c <GPIOA0_EXI_Init+0x2c>
    2eee:	0806      	bt      	0x2efa	// 2efa <GPIO_IntGroup_Set+0xce>
				GPIOGRP->IGREX =(GPIOGRP->IGREX)|PinNum;
    2ef0:	9340      	ld.w      	r2, (r3, 0x0)
    2ef2:	9262      	ld.w      	r3, (r2, 0x8)
    2ef4:	6c4c      	or      	r1, r3
    2ef6:	b222      	st.w      	r1, (r2, 0x8)
    2ef8:	07ea      	br      	0x2ecc	// 2ecc <GPIO_IntGroup_Set+0xa0>
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<4);
    2efa:	9360      	ld.w      	r3, (r3, 0x0)
    2efc:	9342      	ld.w      	r2, (r3, 0x8)
    2efe:	4124      	lsli      	r1, r1, 4
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<12);
    2f00:	6c48      	or      	r1, r2
    2f02:	b322      	st.w      	r1, (r3, 0x8)
}
    2f04:	07e4      	br      	0x2ecc	// 2ecc <GPIO_IntGroup_Set+0xa0>
		else if(((IO_MODE==2)||(IO_MODE==4))&&((Selete_EXI_x==18)||(Selete_EXI_x==19)))					    //PB0.0~PB0.3 + PC0.0~PC0.3
    2f06:	3842      	cmpnei      	r0, 2
    2f08:	0c03      	bf      	0x2f0e	// 2f0e <GPIO_IntGroup_Set+0xe2>
    2f0a:	3844      	cmpnei      	r0, 4
    2f0c:	0be0      	bt      	0x2ecc	// 2ecc <GPIO_IntGroup_Set+0xa0>
    2f0e:	1070      	lrw      	r3, 0x20000000	// 2f4c <GPIOA0_EXI_Init+0x2c>
			if(Selete_EXI_x==18)
    2f10:	3a52      	cmpnei      	r2, 18
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<8);
    2f12:	9360      	ld.w      	r3, (r3, 0x0)
    2f14:	9342      	ld.w      	r2, (r3, 0x8)
			if(Selete_EXI_x==18)
    2f16:	0803      	bt      	0x2f1c	// 2f1c <GPIO_IntGroup_Set+0xf0>
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<8);
    2f18:	4128      	lsli      	r1, r1, 8
    2f1a:	07f3      	br      	0x2f00	// 2f00 <GPIO_IntGroup_Set+0xd4>
				GPIOGRP->IGREX=(GPIOGRP->IGREX)|(PinNum<<12);
    2f1c:	412c      	lsli      	r1, r1, 12
    2f1e:	07f1      	br      	0x2f00	// 2f00 <GPIO_IntGroup_Set+0xd4>

00002f20 <GPIOA0_EXI_Init>:
//IO EXI SET 
//EntryParameter:EXI_IO(EXI0~EXI15)
//ReturnValue:NONE
/*************************************************************/  
void GPIOA0_EXI_Init(GPIO_EXI_TypeDef EXI_IO)
{
    2f20:	14d0      	push      	r15
    switch (EXI_IO)
    2f22:	380b      	cmphsi      	r0, 12
    2f24:	081e      	bt      	0x2f60	// 2f60 <GPIOA0_EXI_Init+0x40>
    2f26:	106b      	lrw      	r3, 0x20000014	// 2f50 <GPIOA0_EXI_Init+0x30>
    2f28:	e0000cf6 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    2f2c:	29211b14 	.long	0x29211b14
    2f30:	453e3730 	.long	0x453e3730
    2f34:	6058524b 	.long	0x6058524b
    2f38:	fffff0ff 	.long	0xfffff0ff
    2f3c:	ffff0fff 	.long	0xffff0fff
    2f40:	fff10000 	.long	0xfff10000
    2f44:	ff100000 	.long	0xff100000
    2f48:	0fffffff 	.long	0x0fffffff
    2f4c:	20000000 	.long	0x20000000
    2f50:	20000014 	.long	0x20000014
    {
        case 0:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0) | 0X00000001;break;
    2f54:	9340      	ld.w      	r2, (r3, 0x0)
    2f56:	9260      	ld.w      	r3, (r2, 0x0)
    2f58:	310f      	movi      	r1, 15
    2f5a:	68c5      	andn      	r3, r1
    2f5c:	3ba0      	bseti      	r3, 0
        case 1:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F) | 0X00000010;break;
    2f5e:	b260      	st.w      	r3, (r2, 0x0)
        case 9:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F) | 0X00000010;break;
        case 10:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF) | 0X00000100;break;
        case 11:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF) | 0X00001000;break;
        default:break;
    }
}
    2f60:	1490      	pop      	r15
        case 1:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F) | 0X00000010;break;
    2f62:	9340      	ld.w      	r2, (r3, 0x0)
    2f64:	9260      	ld.w      	r3, (r2, 0x0)
    2f66:	31f0      	movi      	r1, 240
    2f68:	68c5      	andn      	r3, r1
    2f6a:	3ba4      	bseti      	r3, 4
    2f6c:	07f9      	br      	0x2f5e	// 2f5e <GPIOA0_EXI_Init+0x3e>
        case 2:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF) | 0X00000100;break;
    2f6e:	9320      	ld.w      	r1, (r3, 0x0)
    2f70:	32f0      	movi      	r2, 240
    2f72:	9160      	ld.w      	r3, (r1, 0x0)
    2f74:	4244      	lsli      	r2, r2, 4
    2f76:	68c9      	andn      	r3, r2
    2f78:	3ba8      	bseti      	r3, 8
        case 6:GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF) | 0X01000000;break;
    2f7a:	b160      	st.w      	r3, (r1, 0x0)
    2f7c:	07f2      	br      	0x2f60	// 2f60 <GPIOA0_EXI_Init+0x40>
        case 3:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF) | 0X00001000;break;
    2f7e:	9320      	ld.w      	r1, (r3, 0x0)
    2f80:	32f0      	movi      	r2, 240
    2f82:	9160      	ld.w      	r3, (r1, 0x0)
    2f84:	4248      	lsli      	r2, r2, 8
    2f86:	68c9      	andn      	r3, r2
    2f88:	3bac      	bseti      	r3, 12
    2f8a:	07f8      	br      	0x2f7a	// 2f7a <GPIOA0_EXI_Init+0x5a>
        case 4:GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF0FFFF) | 0X00010000;break;
    2f8c:	9320      	ld.w      	r1, (r3, 0x0)
    2f8e:	32f0      	movi      	r2, 240
    2f90:	9160      	ld.w      	r3, (r1, 0x0)
    2f92:	424c      	lsli      	r2, r2, 12
    2f94:	68c9      	andn      	r3, r2
    2f96:	3bb0      	bseti      	r3, 16
    2f98:	07f1      	br      	0x2f7a	// 2f7a <GPIOA0_EXI_Init+0x5a>
        case 5:GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF) | 0X00100000;break;
    2f9a:	9320      	ld.w      	r1, (r3, 0x0)
    2f9c:	32f0      	movi      	r2, 240
    2f9e:	9160      	ld.w      	r3, (r1, 0x0)
    2fa0:	4250      	lsli      	r2, r2, 16
    2fa2:	68c9      	andn      	r3, r2
    2fa4:	3bb4      	bseti      	r3, 20
    2fa6:	07ea      	br      	0x2f7a	// 2f7a <GPIOA0_EXI_Init+0x5a>
        case 6:GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF) | 0X01000000;break;
    2fa8:	9320      	ld.w      	r1, (r3, 0x0)
    2faa:	32f0      	movi      	r2, 240
    2fac:	9160      	ld.w      	r3, (r1, 0x0)
    2fae:	4254      	lsli      	r2, r2, 20
    2fb0:	68c9      	andn      	r3, r2
    2fb2:	3bb8      	bseti      	r3, 24
    2fb4:	07e3      	br      	0x2f7a	// 2f7a <GPIOA0_EXI_Init+0x5a>
        case 7:GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF) | 0X10000000;break;
    2fb6:	9340      	ld.w      	r2, (r3, 0x0)
    2fb8:	9260      	ld.w      	r3, (r2, 0x0)
    2fba:	4364      	lsli      	r3, r3, 4
    2fbc:	4b64      	lsri      	r3, r3, 4
    2fbe:	3bbc      	bseti      	r3, 28
    2fc0:	07cf      	br      	0x2f5e	// 2f5e <GPIOA0_EXI_Init+0x3e>
        case 8:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0) | 0X00000001;break;
    2fc2:	9340      	ld.w      	r2, (r3, 0x0)
    2fc4:	9261      	ld.w      	r3, (r2, 0x4)
    2fc6:	310f      	movi      	r1, 15
    2fc8:	68c5      	andn      	r3, r1
    2fca:	3ba0      	bseti      	r3, 0
        case 9:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F) | 0X00000010;break;
    2fcc:	b261      	st.w      	r3, (r2, 0x4)
    2fce:	07c9      	br      	0x2f60	// 2f60 <GPIOA0_EXI_Init+0x40>
    2fd0:	9340      	ld.w      	r2, (r3, 0x0)
    2fd2:	9261      	ld.w      	r3, (r2, 0x4)
    2fd4:	31f0      	movi      	r1, 240
    2fd6:	68c5      	andn      	r3, r1
    2fd8:	3ba4      	bseti      	r3, 4
    2fda:	07f9      	br      	0x2fcc	// 2fcc <GPIOA0_EXI_Init+0xac>
        case 10:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF) | 0X00000100;break;
    2fdc:	9320      	ld.w      	r1, (r3, 0x0)
    2fde:	32f0      	movi      	r2, 240
    2fe0:	9161      	ld.w      	r3, (r1, 0x4)
    2fe2:	4244      	lsli      	r2, r2, 4
    2fe4:	68c9      	andn      	r3, r2
    2fe6:	3ba8      	bseti      	r3, 8
        case 11:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF) | 0X00001000;break;
    2fe8:	b161      	st.w      	r3, (r1, 0x4)
}
    2fea:	07bb      	br      	0x2f60	// 2f60 <GPIOA0_EXI_Init+0x40>
        case 11:GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF) | 0X00001000;break;
    2fec:	9320      	ld.w      	r1, (r3, 0x0)
    2fee:	32f0      	movi      	r2, 240
    2ff0:	9161      	ld.w      	r3, (r1, 0x4)
    2ff2:	4248      	lsli      	r2, r2, 8
    2ff4:	68c9      	andn      	r3, r2
    2ff6:	3bac      	bseti      	r3, 12
    2ff8:	07f8      	br      	0x2fe8	// 2fe8 <GPIOA0_EXI_Init+0xc8>

00002ffa <GPIOA1_EXI_Init>:
void GPIOA1_EXI_Init(GPIO_EXI_TypeDef EXI_IO)
{
    2ffa:	14d0      	push      	r15
    switch (EXI_IO)
    2ffc:	3805      	cmphsi      	r0, 6
    2ffe:	080f      	bt      	0x301c	// 301c <GPIOA1_EXI_Init+0x22>
    3000:	134d      	lrw      	r2, 0x20000010	// 31b4 <GPIO_Read_Output+0x12>
    3002:	136e      	lrw      	r3, 0x20000014	// 31b8 <GPIO_Read_Output+0x16>
    3004:	e0000c88 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    3008:	1b120b03 	.long	0x1b120b03
    300c:	2b23      	.short	0x2b23
    {
        case 0:GPIOA1->CONLR = (GPIOA0->CONLR&0XFFFFFFF0) | 0X00000001;break;
    300e:	9360      	ld.w      	r3, (r3, 0x0)
    3010:	9360      	ld.w      	r3, (r3, 0x0)
    3012:	310f      	movi      	r1, 15
    3014:	68c5      	andn      	r3, r1
    3016:	9240      	ld.w      	r2, (r2, 0x0)
    3018:	3ba0      	bseti      	r3, 0
        case 1:GPIOA1->CONLR = (GPIOA0->CONLR&0XFFFFFF0F) | 0X00000010;break;
    301a:	b260      	st.w      	r3, (r2, 0x0)
        case 4:GPIOA1->CONLR = (GPIOA0->CONLR&0XFFF0FFFF) | 0X00010000;break;
        case 5:GPIOA1->CONLR = (GPIOA0->CONLR&0XFF0FFFFF) | 0X00100000;break;

		default:break;
    }
}
    301c:	1490      	pop      	r15
        case 1:GPIOA1->CONLR = (GPIOA0->CONLR&0XFFFFFF0F) | 0X00000010;break;
    301e:	9360      	ld.w      	r3, (r3, 0x0)
    3020:	9360      	ld.w      	r3, (r3, 0x0)
    3022:	31f0      	movi      	r1, 240
    3024:	68c5      	andn      	r3, r1
    3026:	9240      	ld.w      	r2, (r2, 0x0)
    3028:	3ba4      	bseti      	r3, 4
    302a:	07f8      	br      	0x301a	// 301a <GPIOA1_EXI_Init+0x20>
        case 2:GPIOA1->CONLR = (GPIOA0->CONLR&0XFFFFF0FF) | 0X00000100;break;
    302c:	9220      	ld.w      	r1, (r2, 0x0)
    302e:	9360      	ld.w      	r3, (r3, 0x0)
    3030:	32f0      	movi      	r2, 240
    3032:	9360      	ld.w      	r3, (r3, 0x0)
    3034:	4244      	lsli      	r2, r2, 4
    3036:	68c9      	andn      	r3, r2
    3038:	3ba8      	bseti      	r3, 8
        case 5:GPIOA1->CONLR = (GPIOA0->CONLR&0XFF0FFFFF) | 0X00100000;break;
    303a:	b160      	st.w      	r3, (r1, 0x0)
}
    303c:	07f0      	br      	0x301c	// 301c <GPIOA1_EXI_Init+0x22>
        case 3:GPIOA1->CONLR = (GPIOA0->CONLR&0XFFFF0FFF) | 0X00001000;break;
    303e:	9220      	ld.w      	r1, (r2, 0x0)
    3040:	9360      	ld.w      	r3, (r3, 0x0)
    3042:	32f0      	movi      	r2, 240
    3044:	9360      	ld.w      	r3, (r3, 0x0)
    3046:	4248      	lsli      	r2, r2, 8
    3048:	68c9      	andn      	r3, r2
    304a:	3bac      	bseti      	r3, 12
    304c:	07f7      	br      	0x303a	// 303a <GPIOA1_EXI_Init+0x40>
        case 4:GPIOA1->CONLR = (GPIOA0->CONLR&0XFFF0FFFF) | 0X00010000;break;
    304e:	9220      	ld.w      	r1, (r2, 0x0)
    3050:	9360      	ld.w      	r3, (r3, 0x0)
    3052:	32f0      	movi      	r2, 240
    3054:	9360      	ld.w      	r3, (r3, 0x0)
    3056:	424c      	lsli      	r2, r2, 12
    3058:	68c9      	andn      	r3, r2
    305a:	3bb0      	bseti      	r3, 16
    305c:	07ef      	br      	0x303a	// 303a <GPIOA1_EXI_Init+0x40>
        case 5:GPIOA1->CONLR = (GPIOA0->CONLR&0XFF0FFFFF) | 0X00100000;break;
    305e:	9220      	ld.w      	r1, (r2, 0x0)
    3060:	9360      	ld.w      	r3, (r3, 0x0)
    3062:	32f0      	movi      	r2, 240
    3064:	9360      	ld.w      	r3, (r3, 0x0)
    3066:	4250      	lsli      	r2, r2, 16
    3068:	68c9      	andn      	r3, r2
    306a:	3bb4      	bseti      	r3, 20
    306c:	07e7      	br      	0x303a	// 303a <GPIOA1_EXI_Init+0x40>

0000306e <GPIOB0_EXI_Init>:


void GPIOB0_EXI_Init(GPIO_EXI_TypeDef EXI_IO)
{
    306e:	14d0      	push      	r15
    switch (EXI_IO)
    3070:	3807      	cmphsi      	r0, 8
    3072:	081c      	bt      	0x30aa	// 30aa <GPIOB0_EXI_Init+0x3c>
    3074:	1272      	lrw      	r3, 0x2000000c	// 31bc <GPIO_Read_Output+0x1a>
    3076:	e0000c4f 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    307a:	0b04      	.short	0x0b04
    307c:	27201911 	.long	0x27201911
    3080:	372e      	.short	0x372e
    {
        case 0:GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0) | 0X00000001;break;
    3082:	9340      	ld.w      	r2, (r3, 0x0)
    3084:	9260      	ld.w      	r3, (r2, 0x0)
    3086:	310f      	movi      	r1, 15
    3088:	68c5      	andn      	r3, r1
    308a:	3ba0      	bseti      	r3, 0
        case 2:GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF) | 0X00000100;break;
        case 3:GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF) | 0X00001000;break;
		case 4:GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF) | 0X00010000;break;
		case 5:GPIOB0->CONLR = (GPIOB0->CONLR&0XFF0FFFFF) | 0X00100000;break;
		case 6:GPIOB0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF) | 0X01000000;break;
        case 7:GPIOB0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF) | 0X10000000;break;
    308c:	b260      	st.w      	r3, (r2, 0x0)
        default:break;
    }
}
    308e:	040e      	br      	0x30aa	// 30aa <GPIOB0_EXI_Init+0x3c>
        case 1:GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFF0F) | 0X00000010;break;
    3090:	9340      	ld.w      	r2, (r3, 0x0)
    3092:	9260      	ld.w      	r3, (r2, 0x0)
    3094:	31f0      	movi      	r1, 240
    3096:	68c5      	andn      	r3, r1
    3098:	3ba4      	bseti      	r3, 4
    309a:	07f9      	br      	0x308c	// 308c <GPIOB0_EXI_Init+0x1e>
        case 2:GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF) | 0X00000100;break;
    309c:	9320      	ld.w      	r1, (r3, 0x0)
    309e:	32f0      	movi      	r2, 240
    30a0:	9160      	ld.w      	r3, (r1, 0x0)
    30a2:	4244      	lsli      	r2, r2, 4
    30a4:	68c9      	andn      	r3, r2
    30a6:	3ba8      	bseti      	r3, 8
		case 6:GPIOB0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF) | 0X01000000;break;
    30a8:	b160      	st.w      	r3, (r1, 0x0)
}
    30aa:	1490      	pop      	r15
        case 3:GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF) | 0X00001000;break;
    30ac:	9320      	ld.w      	r1, (r3, 0x0)
    30ae:	32f0      	movi      	r2, 240
    30b0:	9160      	ld.w      	r3, (r1, 0x0)
    30b2:	4248      	lsli      	r2, r2, 8
    30b4:	68c9      	andn      	r3, r2
    30b6:	3bac      	bseti      	r3, 12
    30b8:	07f8      	br      	0x30a8	// 30a8 <GPIOB0_EXI_Init+0x3a>
		case 4:GPIOB0->CONLR = (GPIOB0->CONLR&0XFFF0FFFF) | 0X00010000;break;
    30ba:	9320      	ld.w      	r1, (r3, 0x0)
    30bc:	32f0      	movi      	r2, 240
    30be:	9160      	ld.w      	r3, (r1, 0x0)
    30c0:	424c      	lsli      	r2, r2, 12
    30c2:	68c9      	andn      	r3, r2
    30c4:	3bb0      	bseti      	r3, 16
    30c6:	07f1      	br      	0x30a8	// 30a8 <GPIOB0_EXI_Init+0x3a>
		case 5:GPIOB0->CONLR = (GPIOB0->CONLR&0XFF0FFFFF) | 0X00100000;break;
    30c8:	9320      	ld.w      	r1, (r3, 0x0)
    30ca:	32f0      	movi      	r2, 240
    30cc:	9160      	ld.w      	r3, (r1, 0x0)
    30ce:	4250      	lsli      	r2, r2, 16
    30d0:	68c9      	andn      	r3, r2
    30d2:	3bb4      	bseti      	r3, 20
    30d4:	07ea      	br      	0x30a8	// 30a8 <GPIOB0_EXI_Init+0x3a>
		case 6:GPIOB0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF) | 0X01000000;break;
    30d6:	9320      	ld.w      	r1, (r3, 0x0)
    30d8:	32f0      	movi      	r2, 240
    30da:	1178      	lrw      	r3, 0x20000014	// 31b8 <GPIO_Read_Output+0x16>
    30dc:	4254      	lsli      	r2, r2, 20
    30de:	9360      	ld.w      	r3, (r3, 0x0)
    30e0:	9360      	ld.w      	r3, (r3, 0x0)
    30e2:	68c9      	andn      	r3, r2
    30e4:	3bb8      	bseti      	r3, 24
    30e6:	07e1      	br      	0x30a8	// 30a8 <GPIOB0_EXI_Init+0x3a>
        case 7:GPIOB0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF) | 0X10000000;break;
    30e8:	9340      	ld.w      	r2, (r3, 0x0)
    30ea:	1174      	lrw      	r3, 0x20000014	// 31b8 <GPIO_Read_Output+0x16>
    30ec:	9360      	ld.w      	r3, (r3, 0x0)
    30ee:	9360      	ld.w      	r3, (r3, 0x0)
    30f0:	4364      	lsli      	r3, r3, 4
    30f2:	4b64      	lsri      	r3, r3, 4
    30f4:	3bbc      	bseti      	r3, 28
    30f6:	07cb      	br      	0x308c	// 308c <GPIOB0_EXI_Init+0x1e>

000030f8 <GPIOC0_EXI_Init>:

void GPIOC0_EXI_Init(GPIO_EXI_TypeDef EXI_IO)
{
    30f8:	14d0      	push      	r15
    switch (EXI_IO)
    30fa:	3803      	cmphsi      	r0, 4
    30fc:	080e      	bt      	0x3118	// 3118 <GPIOC0_EXI_Init+0x20>
    30fe:	1151      	lrw      	r2, 0x20000008	// 31c0 <GPIO_Read_Output+0x1e>
    3100:	116f      	lrw      	r3, 0x2000000c	// 31bc <GPIO_Read_Output+0x1a>
    3102:	e0000c09 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    3106:	0a02      	.short	0x0a02
    3108:	1a11      	.short	0x1a11
    {
        case 0:GPIOC0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0) | 0X00000001;break;
    310a:	9360      	ld.w      	r3, (r3, 0x0)
    310c:	9360      	ld.w      	r3, (r3, 0x0)
    310e:	310f      	movi      	r1, 15
    3110:	68c5      	andn      	r3, r1
    3112:	9240      	ld.w      	r2, (r2, 0x0)
    3114:	3ba0      	bseti      	r3, 0
        case 1:GPIOC0->CONLR = (GPIOB0->CONLR&0XFFFFFF0F) | 0X00000010;break;
    3116:	b260      	st.w      	r3, (r2, 0x0)
        case 2:GPIOC0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF) | 0X00000100;break;
        case 3:GPIOC0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF) | 0X00001000;break;
        default:break;
    }
}
    3118:	1490      	pop      	r15
        case 1:GPIOC0->CONLR = (GPIOB0->CONLR&0XFFFFFF0F) | 0X00000010;break;
    311a:	9360      	ld.w      	r3, (r3, 0x0)
    311c:	9360      	ld.w      	r3, (r3, 0x0)
    311e:	31f0      	movi      	r1, 240
    3120:	68c5      	andn      	r3, r1
    3122:	9240      	ld.w      	r2, (r2, 0x0)
    3124:	3ba4      	bseti      	r3, 4
    3126:	07f8      	br      	0x3116	// 3116 <GPIOC0_EXI_Init+0x1e>
        case 2:GPIOC0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF) | 0X00000100;break;
    3128:	9220      	ld.w      	r1, (r2, 0x0)
    312a:	9360      	ld.w      	r3, (r3, 0x0)
    312c:	32f0      	movi      	r2, 240
    312e:	9360      	ld.w      	r3, (r3, 0x0)
    3130:	4244      	lsli      	r2, r2, 4
    3132:	68c9      	andn      	r3, r2
    3134:	3ba8      	bseti      	r3, 8
        case 3:GPIOC0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF) | 0X00001000;break;
    3136:	b160      	st.w      	r3, (r1, 0x0)
}
    3138:	07f0      	br      	0x3118	// 3118 <GPIOC0_EXI_Init+0x20>
        case 3:GPIOC0->CONLR = (GPIOB0->CONLR&0XFFFF0FFF) | 0X00001000;break;
    313a:	9220      	ld.w      	r1, (r2, 0x0)
    313c:	9360      	ld.w      	r3, (r3, 0x0)
    313e:	32f0      	movi      	r2, 240
    3140:	9360      	ld.w      	r3, (r3, 0x0)
    3142:	4248      	lsli      	r2, r2, 8
    3144:	68c9      	andn      	r3, r2
    3146:	3bac      	bseti      	r3, 12
    3148:	07f7      	br      	0x3136	// 3136 <GPIOC0_EXI_Init+0x3e>

0000314a <GPIO_EXI_EN>:

void GPIO_EXI_EN(CSP_GPIO_T *GPIOx,GPIO_EXI_TypeDef EXI_IO)
{
    (GPIOx)->IECR  |= 1<<EXI_IO;
    314a:	3301      	movi      	r3, 1
    314c:	904b      	ld.w      	r2, (r0, 0x2c)
    314e:	70c4      	lsl      	r3, r1
    3150:	6cc8      	or      	r3, r2
    3152:	b06b      	st.w      	r3, (r0, 0x2c)
}
    3154:	783c      	jmp      	r15

00003156 <GPIO_Write_High>:
//bit:0~15
//ReturnValue:VALUE
/*************************************************************/
void GPIO_Write_High(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->SODR = (1ul<<bit);
    3156:	3301      	movi      	r3, 1
    3158:	70c4      	lsl      	r3, r1
    315a:	b063      	st.w      	r3, (r0, 0xc)
}
    315c:	783c      	jmp      	r15

0000315e <GPIO_Write_Low>:
void GPIO_Write_Low(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->CODR = (1ul<<bit);
    315e:	3301      	movi      	r3, 1
    3160:	70c4      	lsl      	r3, r1
    3162:	b064      	st.w      	r3, (r0, 0x10)
}
    3164:	783c      	jmp      	r15

00003166 <GPIO_Set_Value>:
//bitposi:0~15 bitval:0~1 0=low 1=high
//ReturnValue:VALUE
/*************************************************************/
void GPIO_Set_Value(CSP_GPIO_T *GPIOx,uint8_t bitposi,uint8_t bitval)
{
    if (bitval==1)
    3166:	3a41      	cmpnei      	r2, 1
    3168:	0804      	bt      	0x3170	// 3170 <GPIO_Set_Value+0xa>
    {
        (GPIOx)->SODR = (1ul<<bitposi);
    316a:	7084      	lsl      	r2, r1
    316c:	b043      	st.w      	r2, (r0, 0xc)
    }
    else if ((bitval==0))
    {
        (GPIOx)->CODR = (1ul<<bitposi);
    }
}
    316e:	783c      	jmp      	r15
    else if ((bitval==0))
    3170:	3a40      	cmpnei      	r2, 0
    3172:	0bfe      	bt      	0x316e	// 316e <GPIO_Set_Value+0x8>
        (GPIOx)->CODR = (1ul<<bitposi);
    3174:	3301      	movi      	r3, 1
    3176:	70c4      	lsl      	r3, r1
    3178:	b064      	st.w      	r3, (r0, 0x10)
}
    317a:	07fa      	br      	0x316e	// 316e <GPIO_Set_Value+0x8>

0000317c <GPIO_Reverse>:
//ReturnValue:VALUE
/*************************************************************/
void GPIO_Reverse(CSP_GPIO_T *GPIOx,uint8_t bit)
{
     uint32_t dat = 0;
     dat=((GPIOx)->ODSR>>bit)&1ul;
    317c:	9045      	ld.w      	r2, (r0, 0x14)
    317e:	3301      	movi      	r3, 1
    3180:	7085      	lsr      	r2, r1
    3182:	688c      	and      	r2, r3
     {
       if (dat==1)  
    3184:	3a40      	cmpnei      	r2, 0
    3186:	70c4      	lsl      	r3, r1
    3188:	0c03      	bf      	0x318e	// 318e <GPIO_Reverse+0x12>
       {
           (GPIOx)->CODR = (1ul<<bit);
    318a:	b064      	st.w      	r3, (r0, 0x10)
       {
           (GPIOx)->SODR = (1ul<<bit);
           return;
       }
     }
}
    318c:	783c      	jmp      	r15
           (GPIOx)->SODR = (1ul<<bit);
    318e:	b063      	st.w      	r3, (r0, 0xc)
           return;
    3190:	07fe      	br      	0x318c	// 318c <GPIO_Reverse+0x10>

00003192 <GPIO_Read_Status>:
/*************************************************************/
uint8_t GPIO_Read_Status(CSP_GPIO_T *GPIOx,uint8_t bit)
{
    uint8_t value = 0;
    uint32_t dat = 0;
    dat=((GPIOx)->PSDR)&(1<<bit);
    3192:	3301      	movi      	r3, 1
    3194:	9046      	ld.w      	r2, (r0, 0x18)
    3196:	70c4      	lsl      	r3, r1
    3198:	688c      	and      	r2, r3
    if (dat == (1<<bit))								
    319a:	64ca      	cmpne      	r2, r3
    319c:	6403      	mvcv      	r0
	{
	    value = 1;
	} 
    return value;
    319e:	7400      	zextb      	r0, r0
}
    31a0:	783c      	jmp      	r15

000031a2 <GPIO_Read_Output>:
/*************************************************************/
uint8_t GPIO_Read_Output(CSP_GPIO_T *GPIOx,uint8_t bit)
{
    uint8_t value = 0;
    uint32_t dat = 0;
    dat=((GPIOx)->ODSR)&(1<<bit);
    31a2:	3301      	movi      	r3, 1
    31a4:	9045      	ld.w      	r2, (r0, 0x14)
    31a6:	70c4      	lsl      	r3, r1
    31a8:	688c      	and      	r2, r3
    if (dat == (1<<bit))								
    31aa:	64ca      	cmpne      	r2, r3
    31ac:	6403      	mvcv      	r0
	{
	    value = 1;
	} 
    return value;
    31ae:	7400      	zextb      	r0, r0
}
    31b0:	783c      	jmp      	r15
    31b2:	0000      	bkpt
    31b4:	20000010 	.long	0x20000010
    31b8:	20000014 	.long	0x20000014
    31bc:	2000000c 	.long	0x2000000c
    31c0:	20000008 	.long	0x20000008

000031c4 <OPA0_RESET_VALUE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void OPA0_RESET_VALUE(void)
{
		OAMP0->CR=OPA_CR_RST;     					/**< OPA0_CR  reset value   */
    31c4:	1063      	lrw      	r3, 0x20000020	// 31d0 <OPA0_RESET_VALUE+0xc>
    31c6:	3200      	movi      	r2, 0
    31c8:	9360      	ld.w      	r3, (r3, 0x0)
    31ca:	b340      	st.w      	r2, (r3, 0x0)
}
    31cc:	783c      	jmp      	r15
    31ce:	0000      	bkpt
    31d0:	20000020 	.long	0x20000020

000031d4 <OPA1_RESET_VALUE>:
void OPA1_RESET_VALUE(void)
{
		OAMP1->CR=OPA_CR_RST;     					/**< OPA0_CR  reset value   */
    31d4:	1273      	lrw      	r3, 0x2000001c	// 3320 <OPA_Config_Prg+0x7a>
    31d6:	3200      	movi      	r2, 0
    31d8:	9360      	ld.w      	r3, (r3, 0x0)
    31da:	b340      	st.w      	r2, (r3, 0x0)
}
    31dc:	783c      	jmp      	r15

000031de <OPA_IO_Init>:
//OPA1P(0->PA1.0(AF7))),OPA1N(0->PA1.2(AF7))),OPA1X(0->PA1.1(AF7)))
//ReturnValue:NONE
/*************************************************************/  
void OPA_IO_Init(OPA_IO_MODE_TypeDef  OPA_IO_MODE_X , U8_T OPA_IO_G )
{
	if(OPA_IO_MODE_X==OPA0P)
    31de:	3841      	cmpnei      	r0, 1
    31e0:	080d      	bt      	0x31fa	// 31fa <OPA_IO_Init+0x1c>
	{
		if(OPA_IO_G==0)
    31e2:	3940      	cmpnei      	r1, 0
    31e4:	080a      	bt      	0x31f8	// 31f8 <OPA_IO_Init+0x1a>
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFF0FFFF)|0x000A0000;										//OPA0P(PA1.4->AF7)
    31e6:	1270      	lrw      	r3, 0x20000010	// 3324 <OPA_Config_Prg+0x7e>
    31e8:	32f0      	movi      	r2, 240
    31ea:	9320      	ld.w      	r1, (r3, 0x0)
    31ec:	9160      	ld.w      	r3, (r1, 0x0)
    31ee:	424c      	lsli      	r2, r2, 12
    31f0:	68c9      	andn      	r3, r2
    31f2:	3bb1      	bseti      	r3, 17
    31f4:	3bb3      	bseti      	r3, 19
	}
	else if(OPA_IO_MODE_X==OPA0N)
	{
		if(OPA_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFF0FFFFF)|0x00A00000;										//OPA0N(PA1.5->AF7)
    31f6:	b160      	st.w      	r3, (r1, 0x0)
		if(OPA_IO_G==0)
		{
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFF0F)|0x000000A0;										//OPA1X(PA1.1->AF7)
		}
	}
}
    31f8:	783c      	jmp      	r15
	else if(OPA_IO_MODE_X==OPA0N)
    31fa:	3842      	cmpnei      	r0, 2
    31fc:	080c      	bt      	0x3214	// 3214 <OPA_IO_Init+0x36>
		if(OPA_IO_G==0)
    31fe:	3940      	cmpnei      	r1, 0
    3200:	0bfc      	bt      	0x31f8	// 31f8 <OPA_IO_Init+0x1a>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFF0FFFFF)|0x00A00000;										//OPA0N(PA1.5->AF7)
    3202:	1269      	lrw      	r3, 0x20000010	// 3324 <OPA_Config_Prg+0x7e>
    3204:	32f0      	movi      	r2, 240
    3206:	9320      	ld.w      	r1, (r3, 0x0)
    3208:	9160      	ld.w      	r3, (r1, 0x0)
    320a:	4250      	lsli      	r2, r2, 16
    320c:	68c9      	andn      	r3, r2
    320e:	3bb5      	bseti      	r3, 21
    3210:	3bb7      	bseti      	r3, 23
    3212:	07f2      	br      	0x31f6	// 31f6 <OPA_IO_Init+0x18>
	else if(OPA_IO_MODE_X==OPA0X)
    3214:	3843      	cmpnei      	r0, 3
    3216:	080c      	bt      	0x322e	// 322e <OPA_IO_Init+0x50>
		if(OPA_IO_G==0)
    3218:	3940      	cmpnei      	r1, 0
    321a:	0bef      	bt      	0x31f8	// 31f8 <OPA_IO_Init+0x1a>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFF0FFF)|0x0000A000;										//OPA0X(PA1.3->AF7)
    321c:	1262      	lrw      	r3, 0x20000010	// 3324 <OPA_Config_Prg+0x7e>
    321e:	32f0      	movi      	r2, 240
    3220:	9320      	ld.w      	r1, (r3, 0x0)
    3222:	9160      	ld.w      	r3, (r1, 0x0)
    3224:	4248      	lsli      	r2, r2, 8
    3226:	68c9      	andn      	r3, r2
    3228:	3bad      	bseti      	r3, 13
    322a:	3baf      	bseti      	r3, 15
    322c:	07e5      	br      	0x31f6	// 31f6 <OPA_IO_Init+0x18>
	else if(OPA_IO_MODE_X==OPA1P)
    322e:	3844      	cmpnei      	r0, 4
    3230:	080c      	bt      	0x3248	// 3248 <OPA_IO_Init+0x6a>
		if(OPA_IO_G==0)
    3232:	3940      	cmpnei      	r1, 0
    3234:	0be2      	bt      	0x31f8	// 31f8 <OPA_IO_Init+0x1a>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFFF0)|0x0000000A;										//OPA1P(PA1.0->AF7)
    3236:	117c      	lrw      	r3, 0x20000010	// 3324 <OPA_Config_Prg+0x7e>
    3238:	310f      	movi      	r1, 15
    323a:	9340      	ld.w      	r2, (r3, 0x0)
    323c:	9260      	ld.w      	r3, (r2, 0x0)
    323e:	68c5      	andn      	r3, r1
    3240:	3ba1      	bseti      	r3, 1
    3242:	3ba3      	bseti      	r3, 3
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFF0F)|0x000000A0;										//OPA1X(PA1.1->AF7)
    3244:	b260      	st.w      	r3, (r2, 0x0)
}
    3246:	07d9      	br      	0x31f8	// 31f8 <OPA_IO_Init+0x1a>
	else if(OPA_IO_MODE_X==OPA1N)
    3248:	3845      	cmpnei      	r0, 5
    324a:	080c      	bt      	0x3262	// 3262 <OPA_IO_Init+0x84>
		if(OPA_IO_G==0)
    324c:	3940      	cmpnei      	r1, 0
    324e:	0bd5      	bt      	0x31f8	// 31f8 <OPA_IO_Init+0x1a>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFF0FF)|0x00000A00;										//OPA1N(PA1.2->AF7)
    3250:	1175      	lrw      	r3, 0x20000010	// 3324 <OPA_Config_Prg+0x7e>
    3252:	32f0      	movi      	r2, 240
    3254:	9320      	ld.w      	r1, (r3, 0x0)
    3256:	9160      	ld.w      	r3, (r1, 0x0)
    3258:	4244      	lsli      	r2, r2, 4
    325a:	68c9      	andn      	r3, r2
    325c:	3ba9      	bseti      	r3, 9
    325e:	3bab      	bseti      	r3, 11
    3260:	07cb      	br      	0x31f6	// 31f6 <OPA_IO_Init+0x18>
	else if(OPA_IO_MODE_X==OPA1X)
    3262:	3846      	cmpnei      	r0, 6
    3264:	0bca      	bt      	0x31f8	// 31f8 <OPA_IO_Init+0x1a>
		if(OPA_IO_G==0)
    3266:	3940      	cmpnei      	r1, 0
    3268:	0bc8      	bt      	0x31f8	// 31f8 <OPA_IO_Init+0x1a>
			GPIOA1->CONLR=(GPIOA1->CONLR & 0XFFFFFF0F)|0x000000A0;										//OPA1X(PA1.1->AF7)
    326a:	116f      	lrw      	r3, 0x20000010	// 3324 <OPA_Config_Prg+0x7e>
    326c:	31f0      	movi      	r1, 240
    326e:	9340      	ld.w      	r2, (r3, 0x0)
    3270:	9260      	ld.w      	r3, (r2, 0x0)
    3272:	68c5      	andn      	r3, r1
    3274:	3ba5      	bseti      	r3, 5
    3276:	3ba7      	bseti      	r3, 7
    3278:	07e6      	br      	0x3244	// 3244 <OPA_IO_Init+0x66>

0000327a <OPA_EN_CMD>:
//OPAx_NUM:OPA0_NUM,OPA1_NUM,
//
/*************************************************************/  
void OPA_EN_CMD(OPAx_selecte_TypeDef OPAx_NUM , FunctionalStatus NewState)
{
	if(OPAx_NUM==OPA0_NUM)
    327a:	3840      	cmpnei      	r0, 0
    327c:	0809      	bt      	0x328e	// 328e <OPA_EN_CMD+0x14>
    327e:	116b      	lrw      	r3, 0x20000020	// 3328 <OPA_Config_Prg+0x82>
	{
		if (NewState != DISABLE)
    3280:	3940      	cmpnei      	r1, 0
		{
			OAMP0->CR|=0X01;								//Enable
    3282:	9340      	ld.w      	r2, (r3, 0x0)
    3284:	9260      	ld.w      	r3, (r2, 0x0)
		if (NewState != DISABLE)
    3286:	0c0e      	bf      	0x32a2	// 32a2 <OPA_EN_CMD+0x28>
			OAMP0->CR|=0X01;								//Enable
    3288:	3ba0      	bseti      	r3, 0
		{
			OAMP1->CR|=0X01;								//Enable
		}
		else
		{
			OAMP1->CR&=0XFFFFFFFE;						//Disablev
    328a:	b260      	st.w      	r3, (r2, 0x0)
		}
	}
}
    328c:	040a      	br      	0x32a0	// 32a0 <OPA_EN_CMD+0x26>
	else if(OPAx_NUM==OPA1_NUM)
    328e:	3841      	cmpnei      	r0, 1
    3290:	0808      	bt      	0x32a0	// 32a0 <OPA_EN_CMD+0x26>
    3292:	1164      	lrw      	r3, 0x2000001c	// 3320 <OPA_Config_Prg+0x7a>
		if (NewState != DISABLE)
    3294:	3940      	cmpnei      	r1, 0
			OAMP1->CR|=0X01;								//Enable
    3296:	9340      	ld.w      	r2, (r3, 0x0)
    3298:	9260      	ld.w      	r3, (r2, 0x0)
		if (NewState != DISABLE)
    329a:	0c04      	bf      	0x32a2	// 32a2 <OPA_EN_CMD+0x28>
			OAMP1->CR|=0X01;								//Enable
    329c:	6c0c      	or      	r0, r3
    329e:	b200      	st.w      	r0, (r2, 0x0)
}
    32a0:	783c      	jmp      	r15
			OAMP1->CR&=0XFFFFFFFE;						//Disablev
    32a2:	3b80      	bclri      	r3, 0
    32a4:	07f3      	br      	0x328a	// 328a <OPA_EN_CMD+0x10>

000032a6 <OPA_Config_Prg>:
//BUFFER_EN:0:非buffer模式，1：内部增益使用buffer模式
//PGAC_Set:0~7 OPA0/1(0->x4,1->x5,2->x6,3->x7,4->x24,5->x30,6->x35,7->x40); 
//ReturnValue:NONE
/*************************************************************/  
void OPA_Config_Prg(OPAx_selecte_TypeDef OPAx_NUM , PGAEN_CMD_TypeDef PGAEN_CMD_x , Op_ExtPinConnect_TypeDef Op_ExtPinConnect_X  , BUFFEREN_CMD_TypeDef BUFFER_EN , U8_T PGAC_Set )
{
    32a6:	14c2      	push      	r4-r5
	if(OPAx_NUM==OPA0_NUM)
    32a8:	3840      	cmpnei      	r0, 0
{
    32aa:	6d47      	mov      	r5, r1
    32ac:	d88e0008 	ld.b      	r4, (r14, 0x8)
	if(OPAx_NUM==OPA0_NUM)
    32b0:	081a      	bt      	0x32e4	// 32e4 <OPA_Config_Prg+0x3e>
	{
		if(Op_ExtPinConnect_X==Op_ExtPinConnect_EN)
    32b2:	3a41      	cmpnei      	r2, 1
    32b4:	103d      	lrw      	r1, 0x20000020	// 3328 <OPA_Config_Prg+0x82>
    32b6:	0811      	bt      	0x32d8	// 32d8 <OPA_Config_Prg+0x32>
		{
			OAMP0->CR |= 0x00000100;
    32b8:	9100      	ld.w      	r0, (r1, 0x0)
    32ba:	9040      	ld.w      	r2, (r0, 0x0)
    32bc:	3aa8      	bseti      	r2, 8
		}
		if(Op_ExtPinConnect_X==Op_ExtPinConnect_DIS)
		{
			OAMP0->CR &= (~0x00000100);
    32be:	b040      	st.w      	r2, (r0, 0x0)
		}
		OAMP0->CR=(OAMP0->CR & 0XFFFFFDE1)|(PGAEN_CMD_x<<1)|(BUFFER_EN<<9)|(PGAC_Set<<2);
    32c0:	9140      	ld.w      	r2, (r1, 0x0)
    32c2:	9220      	ld.w      	r1, (r2, 0x0)
    32c4:	101a      	lrw      	r0, 0x21e	// 332c <OPA_Config_Prg+0x86>
    32c6:	6841      	andn      	r1, r0
    32c8:	4369      	lsli      	r3, r3, 9
    32ca:	6cc4      	or      	r3, r1
    32cc:	4521      	lsli      	r1, r5, 1
    32ce:	6c4c      	or      	r1, r3
    32d0:	4482      	lsli      	r4, r4, 2
    32d2:	6c50      	or      	r1, r4
    32d4:	b220      	st.w      	r1, (r2, 0x0)
		{
			OAMP1->CR &= (~0x00000100);
		}
		OAMP1->CR=(OAMP0->CR & 0XFFFFFDE1)|(PGAEN_CMD_x<<1)|(BUFFER_EN<<9)|(PGAC_Set<<2);
	}
}
    32d6:	1482      	pop      	r4-r5
		if(Op_ExtPinConnect_X==Op_ExtPinConnect_DIS)
    32d8:	3a40      	cmpnei      	r2, 0
    32da:	0bf3      	bt      	0x32c0	// 32c0 <OPA_Config_Prg+0x1a>
			OAMP0->CR &= (~0x00000100);
    32dc:	9100      	ld.w      	r0, (r1, 0x0)
    32de:	9040      	ld.w      	r2, (r0, 0x0)
    32e0:	3a88      	bclri      	r2, 8
    32e2:	07ee      	br      	0x32be	// 32be <OPA_Config_Prg+0x18>
	else if(OPAx_NUM==OPA1_NUM)
    32e4:	3841      	cmpnei      	r0, 1
    32e6:	0bf8      	bt      	0x32d6	// 32d6 <OPA_Config_Prg+0x30>
		if(Op_ExtPinConnect_X==Op_ExtPinConnect_EN)
    32e8:	3a41      	cmpnei      	r2, 1
    32ea:	102e      	lrw      	r1, 0x2000001c	// 3320 <OPA_Config_Prg+0x7a>
    32ec:	0813      	bt      	0x3312	// 3312 <OPA_Config_Prg+0x6c>
			OAMP1->CR |= 0x00000100;
    32ee:	9100      	ld.w      	r0, (r1, 0x0)
    32f0:	9040      	ld.w      	r2, (r0, 0x0)
    32f2:	3aa8      	bseti      	r2, 8
			OAMP1->CR &= (~0x00000100);
    32f4:	b040      	st.w      	r2, (r0, 0x0)
		OAMP1->CR=(OAMP0->CR & 0XFFFFFDE1)|(PGAEN_CMD_x<<1)|(BUFFER_EN<<9)|(PGAC_Set<<2);
    32f6:	104d      	lrw      	r2, 0x20000020	// 3328 <OPA_Config_Prg+0x82>
    32f8:	4369      	lsli      	r3, r3, 9
    32fa:	9240      	ld.w      	r2, (r2, 0x0)
    32fc:	9100      	ld.w      	r0, (r1, 0x0)
    32fe:	9240      	ld.w      	r2, (r2, 0x0)
    3300:	102b      	lrw      	r1, 0x21e	// 332c <OPA_Config_Prg+0x86>
    3302:	6885      	andn      	r2, r1
    3304:	6cc8      	or      	r3, r2
    3306:	4521      	lsli      	r1, r5, 1
    3308:	6c4c      	or      	r1, r3
    330a:	4482      	lsli      	r4, r4, 2
    330c:	6c50      	or      	r1, r4
    330e:	b020      	st.w      	r1, (r0, 0x0)
}
    3310:	07e3      	br      	0x32d6	// 32d6 <OPA_Config_Prg+0x30>
		if(Op_ExtPinConnect_X==Op_ExtPinConnect_DIS)
    3312:	3a40      	cmpnei      	r2, 0
    3314:	0bf1      	bt      	0x32f6	// 32f6 <OPA_Config_Prg+0x50>
			OAMP1->CR &= (~0x00000100);
    3316:	9100      	ld.w      	r0, (r1, 0x0)
    3318:	9040      	ld.w      	r2, (r0, 0x0)
    331a:	3a88      	bclri      	r2, 8
    331c:	07ec      	br      	0x32f4	// 32f4 <OPA_Config_Prg+0x4e>
    331e:	0000      	bkpt
    3320:	2000001c 	.long	0x2000001c
    3324:	20000010 	.long	0x20000010
    3328:	20000020 	.long	0x20000020
    332c:	0000021e 	.long	0x0000021e

00003330 <ADC12_RESET_VALUE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void ADC12_RESET_VALUE(void)
{
	 ADC0->ECR	=	ADC_ECR_RST;     				/**< ECR  reset value  */
    3330:	1077      	lrw      	r3, 0x20000068	// 338c <ADC12_RESET_VALUE+0x5c>
    3332:	3200      	movi      	r2, 0
    3334:	9360      	ld.w      	r3, (r3, 0x0)
    3336:	b340      	st.w      	r2, (r3, 0x0)
	 ADC0->DCR	=	ADC_DCR_RST;                  	/**< DCR  reset value  */
    3338:	b341      	st.w      	r2, (r3, 0x4)
	 ADC0->PMSR	= 	ADC_PMSR_RST;       		  	/**< PMSR reset value  */
    333a:	b342      	st.w      	r2, (r3, 0x8)
	 //ADC0->CR	=	ADC_CR_RST;             		/**< CR   reset value  */
	 ADC0->MR	=   ADC_MR_RST;                  	/**< MR   reset value  */
    333c:	b345      	st.w      	r2, (r3, 0x14)
	 ADC0->CSR	=   ADC_CSR_RST;                  	/**< CSR  reset value  */
    333e:	b347      	st.w      	r2, (r3, 0x1c)
	 ADC0->SR 	=	ADC_SR_RST;                   	/**< SR   reset value  */
    3340:	b348      	st.w      	r2, (r3, 0x20)
	 ADC0->IER 	=	ADC_IER_RST;                	/**< IER  reset value  */
    3342:	b349      	st.w      	r2, (r3, 0x24)
	 ADC0->IDR 	=	ADC_IDR_RST;              		/**< IDR  reset value  */
    3344:	b34a      	st.w      	r2, (r3, 0x28)
	 ADC0->IMR  =	ADC_IMR_RST;               		/**< IMR  reset value  */
    3346:	b34b      	st.w      	r2, (r3, 0x2c)
	 ADC0->SEQ[0]=	ADC_SEQx_RST;             		/**< SEQ0  reset value */
    3348:	b34c      	st.w      	r2, (r3, 0x30)
	 ADC0->SEQ[1]=	ADC_SEQx_RST;             		/**< SEQ1  reset value */
    334a:	b34d      	st.w      	r2, (r3, 0x34)
	 ADC0->SEQ[2]=	ADC_SEQx_RST;             		/**< SEQ2  reset value */
    334c:	b34e      	st.w      	r2, (r3, 0x38)
	 ADC0->SEQ[3]=	ADC_SEQx_RST;             		/**< SEQ3  reset value */
    334e:	b34f      	st.w      	r2, (r3, 0x3c)
	 ADC0->SEQ[4]=	ADC_SEQx_RST;             		/**< SEQ4  reset value */
    3350:	b350      	st.w      	r2, (r3, 0x40)
	 ADC0->SEQ[5]=	ADC_SEQx_RST;             		/**< SEQ5  reset value */
    3352:	b351      	st.w      	r2, (r3, 0x44)
	 ADC0->SEQ[6]=	ADC_SEQx_RST;             		/**< SEQ6  reset value */
    3354:	b352      	st.w      	r2, (r3, 0x48)
	 ADC0->SEQ[7]=	ADC_SEQx_RST;             		/**< SEQ7  reset value */
    3356:	b353      	st.w      	r2, (r3, 0x4c)
	 ADC0->SEQ[8]=	ADC_SEQx_RST;             		/**< SEQ8  reset value */
    3358:	b354      	st.w      	r2, (r3, 0x50)
	 ADC0->SEQ[9]=	ADC_SEQx_RST;             		/**< SEQ9  reset value */
    335a:	b355      	st.w      	r2, (r3, 0x54)
	 ADC0->SEQ[10]=	ADC_SEQx_RST;             		/**< SEQ10  reset value */
    335c:	b356      	st.w      	r2, (r3, 0x58)
	 ADC0->SEQ[11]=	ADC_SEQx_RST;             		/**< SEQ11  reset value */
    335e:	b357      	st.w      	r2, (r3, 0x5c)
	 ADC0->SEQ[12]=	ADC_SEQx_RST;             		/**< SEQ12  reset value */
    3360:	b358      	st.w      	r2, (r3, 0x60)
	 ADC0->SEQ[13]=	ADC_SEQx_RST;             		/**< SEQ13  reset value */
    3362:	b359      	st.w      	r2, (r3, 0x64)
	 ADC0->SEQ[14]=	ADC_SEQx_RST;             		/**< SEQ14  reset value */
    3364:	b35a      	st.w      	r2, (r3, 0x68)
//	 ADC0->SEQ[15]=	ADC_SEQx_RST;             		/**< SEQ15  reset value */
	 ADC0->DR[0]  =	ADC_DR_RST;                		/**< DR   reset value  */
    3366:	23ff      	addi      	r3, 256
    3368:	b340      	st.w      	r2, (r3, 0x0)
	 ADC0->DR[1]  =	ADC_DR_RST;                		/**< DR   reset value  */
    336a:	b341      	st.w      	r2, (r3, 0x4)
	 ADC0->DR[2]  =	ADC_DR_RST;                		/**< DR   reset value  */
    336c:	b342      	st.w      	r2, (r3, 0x8)
	 ADC0->DR[3]  =	ADC_DR_RST;                		/**< DR   reset value  */
    336e:	b343      	st.w      	r2, (r3, 0xc)
	 ADC0->DR[4]  =	ADC_DR_RST;                		/**< DR   reset value  */
    3370:	b344      	st.w      	r2, (r3, 0x10)
	 ADC0->DR[5]  =	ADC_DR_RST;                		/**< DR   reset value  */
    3372:	b345      	st.w      	r2, (r3, 0x14)
	 ADC0->DR[6]  =	ADC_DR_RST;                		/**< DR   reset value  */
    3374:	b346      	st.w      	r2, (r3, 0x18)
	 ADC0->DR[7]  =	ADC_DR_RST;                		/**< DR   reset value  */
    3376:	b347      	st.w      	r2, (r3, 0x1c)
	 ADC0->DR[8]  =	ADC_DR_RST;                		/**< DR   reset value  */
    3378:	b348      	st.w      	r2, (r3, 0x20)
	 ADC0->DR[9]  =	ADC_DR_RST;                		/**< DR   reset value  */
    337a:	b349      	st.w      	r2, (r3, 0x24)
	 ADC0->DR[10]  =	ADC_DR_RST;                		/**< DR   reset value  */
    337c:	b34a      	st.w      	r2, (r3, 0x28)
	 ADC0->DR[11]  =	ADC_DR_RST;                		/**< DR   reset value  */
    337e:	b34b      	st.w      	r2, (r3, 0x2c)
	 ADC0->DR[12]  =	ADC_DR_RST;                		/**< DR   reset value  */
    3380:	b34c      	st.w      	r2, (r3, 0x30)
	 ADC0->DR[13]  =	ADC_DR_RST;                		/**< DR   reset value  */
    3382:	b34d      	st.w      	r2, (r3, 0x34)
	 ADC0->DR[14]  =	ADC_DR_RST;                		/**< DR   reset value  */
    3384:	b34e      	st.w      	r2, (r3, 0x38)
//	 ADC0->DR[15]  =	ADC_DR_RST;                		/**< DR   reset value  */
	 ADC0->CMP0   =	ADC_CMP0_RST;               	/**< CMP1 reset value  */
    3386:	b350      	st.w      	r2, (r3, 0x40)
	 ADC0->CMP1   =	ADC_CMP1_RST;                	/**< CMP2 reset value  */
    3388:	b351      	st.w      	r2, (r3, 0x44)
}  
    338a:	783c      	jmp      	r15
    338c:	20000068 	.long	0x20000068

00003390 <ADC12_Control>:
//ReturnValue:NONE
/*************************************************************/  
  //control:ADC enable/disable ,start/stop,swrst
void ADC12_Control(ADC12_Control_TypeDef ADC12_Control_x )
{
	ADC0->CR |= ADC12_Control_x;							// 
    3390:	0175      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3392:	9340      	ld.w      	r2, (r3, 0x0)
    3394:	9264      	ld.w      	r3, (r2, 0x10)
    3396:	6c0c      	or      	r0, r3
    3398:	b204      	st.w      	r0, (r2, 0x10)
}
    339a:	783c      	jmp      	r15

0000339c <ADC12_CMD.part.0>:
//ADC12 ENABLE
//EntryParameter:NewState
//NewState:ENABLE , DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void ADC12_CMD(FunctionalStatus NewState)
    339c:	14d0      	push      	r15
{
	if (NewState != DISABLE)
	{
		ADC12_Control(ADC12_ADCEN);						//ADC12 ENABLE
    339e:	3002      	movi      	r0, 2
    33a0:	e3fffff8 	bsr      	0x3390	// 3390 <ADC12_Control>
		while(!(ADC0->SR &ADC12_ADCENS));
    33a4:	017a      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    33a6:	3280      	movi      	r2, 128
    33a8:	9320      	ld.w      	r1, (r3, 0x0)
    33aa:	4241      	lsli      	r2, r2, 1
    33ac:	9168      	ld.w      	r3, (r1, 0x20)
    33ae:	68c8      	and      	r3, r2
    33b0:	3b40      	cmpnei      	r3, 0
    33b2:	0ffd      	bf      	0x33ac	// 33ac <ADC12_CMD.part.0+0x10>
	else
	{
		ADC12_Control(ADC12_ADCDIS);					//ADC12 DISABLE
		while(ADC0->SR&ADC12_ADCENS);
	}
}
    33b4:	1490      	pop      	r15

000033b6 <ADC12_ConfigInterrupt_CMD>:
	if (NewState != DISABLE)
    33b6:	3940      	cmpnei      	r1, 0
    33b8:	017f      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    33ba:	0c06      	bf      	0x33c6	// 33c6 <ADC12_ConfigInterrupt_CMD+0x10>
		ADC0->IER  |= ADC_IMR_X;						//SET
    33bc:	9340      	ld.w      	r2, (r3, 0x0)
    33be:	9269      	ld.w      	r3, (r2, 0x24)
    33c0:	6c0c      	or      	r0, r3
    33c2:	b209      	st.w      	r0, (r2, 0x24)
} 
    33c4:	783c      	jmp      	r15
		ADC0->IDR  |= ADC_IMR_X;						//CLR
    33c6:	9360      	ld.w      	r3, (r3, 0x0)
    33c8:	934a      	ld.w      	r2, (r3, 0x28)
    33ca:	6c08      	or      	r0, r2
    33cc:	b30a      	st.w      	r0, (r3, 0x28)
} 
    33ce:	07fb      	br      	0x33c4	// 33c4 <ADC12_ConfigInterrupt_CMD+0xe>

000033d0 <ADC12_Read_IntEnStatus>:
    dat= ADC0->IMR&EnStatus_bit;
    33d0:	0265      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    33d2:	9360      	ld.w      	r3, (r3, 0x0)
    33d4:	936b      	ld.w      	r3, (r3, 0x2c)
    33d6:	68c0      	and      	r3, r0
    if (dat == EnStatus_bit)								
    33d8:	640e      	cmpne      	r3, r0
    33da:	6403      	mvcv      	r0
    return value;
    33dc:	7400      	zextb      	r0, r0
}
    33de:	783c      	jmp      	r15

000033e0 <ADC12_CLK_CMD>:
	if (NewState != DISABLE)
    33e0:	3940      	cmpnei      	r1, 0
    33e2:	0269      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
		ADC0->ECR  |= ADC_CLK_CMD;						//ENABLE
    33e4:	9340      	ld.w      	r2, (r3, 0x0)
	if (NewState != DISABLE)
    33e6:	0c09      	bf      	0x33f8	// 33f8 <ADC12_CLK_CMD+0x18>
		ADC0->ECR  |= ADC_CLK_CMD;						//ENABLE
    33e8:	9260      	ld.w      	r3, (r2, 0x0)
    33ea:	6cc0      	or      	r3, r0
    33ec:	b260      	st.w      	r3, (r2, 0x0)
		while(!(ADC0->PMSR&ADC_CLK_CMD));
    33ee:	9262      	ld.w      	r3, (r2, 0x8)
    33f0:	68c0      	and      	r3, r0
    33f2:	3b40      	cmpnei      	r3, 0
    33f4:	0ffd      	bf      	0x33ee	// 33ee <ADC12_CLK_CMD+0xe>
}
    33f6:	783c      	jmp      	r15
		ADC0->DCR  |= ADC_CLK_CMD;						//DISABLE
    33f8:	9261      	ld.w      	r3, (r2, 0x4)
    33fa:	6cc0      	or      	r3, r0
    33fc:	b261      	st.w      	r3, (r2, 0x4)
		while(ADC0->PMSR&ADC_CLK_CMD);
    33fe:	9262      	ld.w      	r3, (r2, 0x8)
    3400:	68c0      	and      	r3, r0
    3402:	3b40      	cmpnei      	r3, 0
    3404:	0bfd      	bt      	0x33fe	// 33fe <ADC12_CLK_CMD+0x1e>
    3406:	07f8      	br      	0x33f6	// 33f6 <ADC12_CLK_CMD+0x16>

00003408 <ADC12_Software_Reset>:
{
    3408:	14d0      	push      	r15
	ADC12_Control(ADC12_SWRST);
    340a:	3001      	movi      	r0, 1
    340c:	e3ffffc2 	bsr      	0x3390	// 3390 <ADC12_Control>
}
    3410:	1490      	pop      	r15

00003412 <ADC12_CMD>:
{
    3412:	14d0      	push      	r15
	if (NewState != DISABLE)
    3414:	3840      	cmpnei      	r0, 0
    3416:	0c04      	bf      	0x341e	// 341e <ADC12_CMD+0xc>
    3418:	e3ffffc2 	bsr      	0x339c	// 339c <ADC12_CMD.part.0>
}
    341c:	1490      	pop      	r15
		ADC12_Control(ADC12_ADCDIS);					//ADC12 DISABLE
    341e:	3004      	movi      	r0, 4
    3420:	e3ffffb8 	bsr      	0x3390	// 3390 <ADC12_Control>
		while(ADC0->SR&ADC12_ADCENS);
    3424:	027a      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3426:	3280      	movi      	r2, 128
    3428:	9320      	ld.w      	r1, (r3, 0x0)
    342a:	4241      	lsli      	r2, r2, 1
    342c:	9168      	ld.w      	r3, (r1, 0x20)
    342e:	68c8      	and      	r3, r2
    3430:	3b40      	cmpnei      	r3, 0
    3432:	0bfd      	bt      	0x342c	// 342c <ADC12_CMD+0x1a>
    3434:	07f4      	br      	0x341c	// 341c <ADC12_CMD+0xa>

00003436 <ADC12_ready_wait>:
//EntryParameter:NONE
//ReturnValue:ADC12 READ FLAG
/*************************************************************/ 
void ADC12_ready_wait(void)  
{
	while(!(ADC0->SR&ADC12_READY));   					// Waiting for ADC0 Ready
    3436:	027e      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3438:	3202      	movi      	r2, 2
    343a:	9320      	ld.w      	r1, (r3, 0x0)
    343c:	9168      	ld.w      	r3, (r1, 0x20)
    343e:	68c8      	and      	r3, r2
    3440:	3b40      	cmpnei      	r3, 0
    3442:	0ffd      	bf      	0x343c	// 343c <ADC12_ready_wait+0x6>
}
    3444:	783c      	jmp      	r15

00003446 <ADC12_EOC_wait>:
//EntryParameter:NONE
//ReturnValue:ADC12 EOC
/*************************************************************/ 
void ADC12_EOC_wait(void)
{
	while(!(ADC0->SR & ADC12_EOC));			// EOC wait
    3446:	0362      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3448:	3201      	movi      	r2, 1
    344a:	9320      	ld.w      	r1, (r3, 0x0)
    344c:	9168      	ld.w      	r3, (r1, 0x20)
    344e:	68c8      	and      	r3, r2
    3450:	3b40      	cmpnei      	r3, 0
    3452:	0ffd      	bf      	0x344c	// 344c <ADC12_EOC_wait+0x6>
}
    3454:	783c      	jmp      	r15

00003456 <ADC12_SEQEND_wait>:
//EntryParameter:NONE
//ReturnValue:ADC12 EOC
/*************************************************************/ 
void ADC12_SEQEND_wait(U8_T val)
{
	while(!(ADC0->SR & (0x01ul << (16+val))));			// EOC wait
    3456:	200f      	addi      	r0, 16
    3458:	0367      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    345a:	3201      	movi      	r2, 1
    345c:	9320      	ld.w      	r1, (r3, 0x0)
    345e:	7080      	lsl      	r2, r0
    3460:	9168      	ld.w      	r3, (r1, 0x20)
    3462:	68c8      	and      	r3, r2
    3464:	3b40      	cmpnei      	r3, 0
    3466:	0ffd      	bf      	0x3460	// 3460 <ADC12_SEQEND_wait+0xa>
}  
    3468:	783c      	jmp      	r15

0000346a <ADC12_DATA_OUPUT>:
//EntryParameter:NONE
//ReturnValue:ADC12 DR
/*************************************************************/ 
U16_T ADC12_DATA_OUPUT(U16_T Data_index )
{
	return(ADC0->DR[Data_index]);
    346a:	203f      	addi      	r0, 64
    346c:	036c      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    346e:	4002      	lsli      	r0, r0, 2
    3470:	9360      	ld.w      	r3, (r3, 0x0)
    3472:	600c      	addu      	r0, r3
    3474:	9000      	ld.w      	r0, (r0, 0x0)
    3476:	7401      	zexth      	r0, r0
} 
    3478:	783c      	jmp      	r15

0000347a <ADC12_Configure_Mode>:
  //10BIT or 12BIT adc ;
  //ADC12_BIT_SELECTED:ADC12_12BIT/ADC12_10BIT;
  //ADC12_ConverMode:One_shot_mode/Continuous_mode;
  //adc date output=last number of Conversions;
void  ADC12_Configure_Mode(ADC12_10bitor12bit_TypeDef ADC12_BIT_SELECTED  , ADC12_ConverMode_TypeDef  ADC12_ConverMode  , U8_T ADC12_PRI, U8_T adc12_SHR , U8_T ADC12_DIV , U8_T NumConver ) 
{
    347a:	14d4      	push      	r4-r7, r15
    347c:	1422      	subi      	r14, r14, 8
    347e:	1c08      	addi      	r4, r14, 32
    3480:	84a0      	ld.b      	r5, (r4, 0x0)
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    3482:	2d00      	subi      	r5, 1
{
    3484:	6dc3      	mov      	r7, r0
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    3486:	03d2      	lrw      	r6, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
{
    3488:	d80e001c 	ld.b      	r0, (r14, 0x1c)
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    348c:	45aa      	lsli      	r5, r5, 10
    348e:	9680      	ld.w      	r4, (r6, 0x0)
    3490:	6d40      	or      	r5, r0
	if(ADC12_ConverMode==One_shot_mode)
    3492:	3940      	cmpnei      	r1, 0
	ADC0->MR=ADC12_DIV|((NumConver-1)<<10);
    3494:	b4a5      	st.w      	r5, (r4, 0x14)
	if(ADC12_ConverMode==One_shot_mode)
    3496:	081c      	bt      	0x34ce	// 34ce <ADC12_Configure_Mode+0x54>
	{
		ADC0->MR&=~CONTCV;								//one short mode
    3498:	9425      	ld.w      	r1, (r4, 0x14)
    349a:	4121      	lsli      	r1, r1, 1
    349c:	4921      	lsri      	r1, r1, 1
		while(ADC0->SR&ADC12_CTCVS);							
    349e:	3080      	movi      	r0, 128
		ADC0->MR&=~CONTCV;								//one short mode
    34a0:	b425      	st.w      	r1, (r4, 0x14)
		while(ADC0->SR&ADC12_CTCVS);							
    34a2:	4002      	lsli      	r0, r0, 2
    34a4:	9428      	ld.w      	r1, (r4, 0x20)
    34a6:	6840      	and      	r1, r0
    34a8:	3940      	cmpnei      	r1, 0
    34aa:	0bfd      	bt      	0x34a4	// 34a4 <ADC12_Configure_Mode+0x2a>
    34ac:	b861      	st.w      	r3, (r14, 0x4)
    34ae:	b840      	st.w      	r2, (r14, 0x0)
    34b0:	e3ffff76 	bsr      	0x339c	// 339c <ADC12_CMD.part.0>
	{
		ADC0->MR|=CONTCV;								//Continuous mode
		while(!(ADC0->SR&ADC12_CTCVS));							
	}
	ADC12_CMD(ENABLE);									//ADC0 enable
	if(ADC12_BIT_SELECTED)
    34b4:	3f40      	cmpnei      	r7, 0
    34b6:	9840      	ld.w      	r2, (r14, 0x0)
    34b8:	9861      	ld.w      	r3, (r14, 0x4)
    34ba:	0c16      	bf      	0x34e6	// 34e6 <ADC12_Configure_Mode+0x6c>
	{
		ADC0->CR|=ADC12_10BITor12BIT;
    34bc:	9600      	ld.w      	r0, (r6, 0x0)
    34be:	9024      	ld.w      	r1, (r0, 0x10)
    34c0:	39bf      	bseti      	r1, 31
	}
	else
	{
		ADC0->CR&=~ADC12_10BITor12BIT;
    34c2:	b024      	st.w      	r1, (r0, 0x10)
	}
	//ADC0->CR|=ADC12_VREF_VDD | ADC12_FVR_DIS;
	ADC0->PRI=ADC12_PRI;
    34c4:	9620      	ld.w      	r1, (r6, 0x0)
    34c6:	b15c      	st.w      	r2, (r1, 0x70)
	ADC0->SHR=adc12_SHR;								//adc Sampling & Holding cycles
    34c8:	b166      	st.w      	r3, (r1, 0x18)
} 
    34ca:	1402      	addi      	r14, r14, 8
    34cc:	1494      	pop      	r4-r7, r15
	else if(ADC12_ConverMode==Continuous_mode)
    34ce:	3941      	cmpnei      	r1, 1
    34d0:	0bee      	bt      	0x34ac	// 34ac <ADC12_Configure_Mode+0x32>
		ADC0->MR|=CONTCV;								//Continuous mode
    34d2:	9425      	ld.w      	r1, (r4, 0x14)
    34d4:	39bf      	bseti      	r1, 31
		while(!(ADC0->SR&ADC12_CTCVS));							
    34d6:	3080      	movi      	r0, 128
		ADC0->MR|=CONTCV;								//Continuous mode
    34d8:	b425      	st.w      	r1, (r4, 0x14)
		while(!(ADC0->SR&ADC12_CTCVS));							
    34da:	4002      	lsli      	r0, r0, 2
    34dc:	9428      	ld.w      	r1, (r4, 0x20)
    34de:	6840      	and      	r1, r0
    34e0:	3940      	cmpnei      	r1, 0
    34e2:	0ffd      	bf      	0x34dc	// 34dc <ADC12_Configure_Mode+0x62>
    34e4:	07e4      	br      	0x34ac	// 34ac <ADC12_Configure_Mode+0x32>
		ADC0->CR&=~ADC12_10BITor12BIT;
    34e6:	9600      	ld.w      	r0, (r6, 0x0)
    34e8:	9024      	ld.w      	r1, (r0, 0x10)
    34ea:	4121      	lsli      	r1, r1, 1
    34ec:	4921      	lsri      	r1, r1, 1
    34ee:	07ea      	br      	0x34c2	// 34c2 <ADC12_Configure_Mode+0x48>

000034f0 <ADC12_Configure_VREF_Selecte>:
//EntryParameter:NONE
//ReturnValue:None
/*************************************************************/ 
void ADC12_Configure_VREF_Selecte(ADC12_VREFP_VREFN_Selected_TypeDef ADC12_VREFP_X_VREFN_X )
{
	if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_VDD_VREFN_VSS)
    34f0:	3840      	cmpnei      	r0, 0
    34f2:	0808      	bt      	0x3502	// 3502 <ADC12_Configure_VREF_Selecte+0x12>
	{
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x00<<6);
    34f4:	1371      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    34f6:	1332      	lrw      	r1, 0x103c0	// 36bc <ADC12_ConversionChannel_Config+0x30>
    34f8:	9340      	ld.w      	r2, (r3, 0x0)
    34fa:	9264      	ld.w      	r3, (r2, 0x10)
    34fc:	68c5      	andn      	r3, r1
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0B<<6)|(0X01<<24)|(0X01<<25);	
	}
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_EXIT)
	{
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000A00;	//PA0.10					
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    34fe:	b264      	st.w      	r3, (r2, 0x10)
	}
}
    3500:	783c      	jmp      	r15
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_EXIT_VREFN_VSS)
    3502:	3841      	cmpnei      	r0, 1
    3504:	0812      	bt      	0x3528	// 3528 <ADC12_Configure_VREF_Selecte+0x38>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00007000;	//PA0.11						
    3506:	136f      	lrw      	r3, 0x20000014	// 36c0 <ADC12_ConversionChannel_Config+0x34>
    3508:	32f0      	movi      	r2, 240
    350a:	9320      	ld.w      	r1, (r3, 0x0)
    350c:	9161      	ld.w      	r3, (r1, 0x4)
    350e:	4248      	lsli      	r2, r2, 8
    3510:	68c9      	andn      	r3, r2
    3512:	32e0      	movi      	r2, 224
    3514:	4247      	lsli      	r2, r2, 7
    3516:	6cc8      	or      	r3, r2
    3518:	b161      	st.w      	r3, (r1, 0x4)
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x01<<6);
    351a:	1329      	lrw      	r1, 0x103c0	// 36bc <ADC12_ConversionChannel_Config+0x30>
    351c:	1367      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    351e:	9340      	ld.w      	r2, (r3, 0x0)
    3520:	9264      	ld.w      	r3, (r2, 0x10)
    3522:	68c5      	andn      	r3, r1
    3524:	3ba6      	bseti      	r3, 6
    3526:	07ec      	br      	0x34fe	// 34fe <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR2048_VREFN_VSS)
    3528:	3842      	cmpnei      	r0, 2
    352a:	0813      	bt      	0x3550	// 3550 <ADC12_Configure_VREF_Selecte+0x60>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00007000;	//PA0.11							
    352c:	1365      	lrw      	r3, 0x20000014	// 36c0 <ADC12_ConversionChannel_Config+0x34>
    352e:	32f0      	movi      	r2, 240
    3530:	9320      	ld.w      	r1, (r3, 0x0)
    3532:	9161      	ld.w      	r3, (r1, 0x4)
    3534:	4248      	lsli      	r2, r2, 8
    3536:	68c9      	andn      	r3, r2
    3538:	32e0      	movi      	r2, 224
    353a:	4247      	lsli      	r2, r2, 7
    353c:	6cc8      	or      	r3, r2
    353e:	b161      	st.w      	r3, (r1, 0x4)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x02<<6)|(0X01<<24)|(0X00<<25);
    3540:	1321      	lrw      	r1, 0x30103c0	// 36c4 <ADC12_ConversionChannel_Config+0x38>
    3542:	127e      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3544:	9340      	ld.w      	r2, (r3, 0x0)
    3546:	9264      	ld.w      	r3, (r2, 0x10)
    3548:	68c5      	andn      	r3, r1
    354a:	3ba7      	bseti      	r3, 7
    354c:	3bb8      	bseti      	r3, 24
    354e:	07d8      	br      	0x34fe	// 34fe <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR4096_VREFN_VSS)
    3550:	3843      	cmpnei      	r0, 3
    3552:	0813      	bt      	0x3578	// 3578 <ADC12_Configure_VREF_Selecte+0x88>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00007000;	//PA0.11							
    3554:	127b      	lrw      	r3, 0x20000014	// 36c0 <ADC12_ConversionChannel_Config+0x34>
    3556:	32f0      	movi      	r2, 240
    3558:	9320      	ld.w      	r1, (r3, 0x0)
    355a:	9161      	ld.w      	r3, (r1, 0x4)
    355c:	4248      	lsli      	r2, r2, 8
    355e:	68c9      	andn      	r3, r2
    3560:	32e0      	movi      	r2, 224
    3562:	4247      	lsli      	r2, r2, 7
    3564:	6cc8      	or      	r3, r2
    3566:	b161      	st.w      	r3, (r1, 0x4)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x03<<6)|(0X01<<24)|(0X01<<25);
    3568:	1237      	lrw      	r1, 0x30103c0	// 36c4 <ADC12_ConversionChannel_Config+0x38>
    356a:	1274      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    356c:	9340      	ld.w      	r2, (r3, 0x0)
    356e:	9264      	ld.w      	r3, (r2, 0x10)
    3570:	68c5      	andn      	r3, r1
    3572:	1236      	lrw      	r1, 0x30000c0	// 36c8 <ADC12_ConversionChannel_Config+0x3c>
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    3574:	6cc4      	or      	r3, r1
    3576:	07c4      	br      	0x34fe	// 34fe <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_VSS)
    3578:	3845      	cmpnei      	r0, 5
    357a:	0809      	bt      	0x358c	// 358c <ADC12_Configure_VREF_Selecte+0x9c>
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x04<<6)|(0X00<<16)|(0X02<<17);
    357c:	126f      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    357e:	1234      	lrw      	r1, 0x503c0	// 36cc <ADC12_ConversionChannel_Config+0x40>
    3580:	9340      	ld.w      	r2, (r3, 0x0)
    3582:	9264      	ld.w      	r3, (r2, 0x10)
    3584:	68c5      	andn      	r3, r1
    3586:	3ba8      	bseti      	r3, 8
    3588:	3bb2      	bseti      	r3, 18
    358a:	07ba      	br      	0x34fe	// 34fe <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_VDD_VREFN_EXIT)
    358c:	3846      	cmpnei      	r0, 6
    358e:	0811      	bt      	0x35b0	// 35b0 <ADC12_Configure_VREF_Selecte+0xc0>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000A00;	//PA0.10
    3590:	126c      	lrw      	r3, 0x20000014	// 36c0 <ADC12_ConversionChannel_Config+0x34>
    3592:	32f0      	movi      	r2, 240
    3594:	9320      	ld.w      	r1, (r3, 0x0)
    3596:	9161      	ld.w      	r3, (r1, 0x4)
    3598:	4244      	lsli      	r2, r2, 4
    359a:	68c9      	andn      	r3, r2
    359c:	3ba9      	bseti      	r3, 9
    359e:	3bab      	bseti      	r3, 11
    35a0:	b161      	st.w      	r3, (r1, 0x4)
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x08<<6);
    35a2:	1227      	lrw      	r1, 0x103c0	// 36bc <ADC12_ConversionChannel_Config+0x30>
    35a4:	1265      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    35a6:	9340      	ld.w      	r2, (r3, 0x0)
    35a8:	9264      	ld.w      	r3, (r2, 0x10)
    35aa:	68c5      	andn      	r3, r1
    35ac:	3ba9      	bseti      	r3, 9
    35ae:	07a8      	br      	0x34fe	// 34fe <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_EXIT_VREFN_EXIT)
    35b0:	3847      	cmpnei      	r0, 7
    35b2:	081a      	bt      	0x35e6	// 35e6 <ADC12_Configure_VREF_Selecte+0xf6>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000A00;	//PA0.10
    35b4:	1263      	lrw      	r3, 0x20000014	// 36c0 <ADC12_ConversionChannel_Config+0x34>
    35b6:	31f0      	movi      	r1, 240
    35b8:	9340      	ld.w      	r2, (r3, 0x0)
    35ba:	9261      	ld.w      	r3, (r2, 0x4)
    35bc:	4124      	lsli      	r1, r1, 4
    35be:	68c5      	andn      	r3, r1
    35c0:	3ba9      	bseti      	r3, 9
    35c2:	3bab      	bseti      	r3, 11
    35c4:	b261      	st.w      	r3, (r2, 0x4)
        GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00007000;	//PA0.11			
    35c6:	31f0      	movi      	r1, 240
    35c8:	9261      	ld.w      	r3, (r2, 0x4)
    35ca:	4128      	lsli      	r1, r1, 8
    35cc:	68c5      	andn      	r3, r1
    35ce:	31e0      	movi      	r1, 224
    35d0:	4127      	lsli      	r1, r1, 7
    35d2:	6cc4      	or      	r3, r1
    35d4:	b261      	st.w      	r3, (r2, 0x4)
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x09<<6);
    35d6:	113a      	lrw      	r1, 0x103c0	// 36bc <ADC12_ConversionChannel_Config+0x30>
    35d8:	1178      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    35da:	9340      	ld.w      	r2, (r3, 0x0)
    35dc:	9264      	ld.w      	r3, (r2, 0x10)
    35de:	68c5      	andn      	r3, r1
    35e0:	3ba6      	bseti      	r3, 6
    35e2:	3ba9      	bseti      	r3, 9
    35e4:	078d      	br      	0x34fe	// 34fe <ADC12_Configure_VREF_Selecte+0xe>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR2048_VREFN_EXIT)
    35e6:	3848      	cmpnei      	r0, 8
    35e8:	0819      	bt      	0x361a	// 361a <ADC12_Configure_VREF_Selecte+0x12a>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000A00;	//PA0.10
    35ea:	1176      	lrw      	r3, 0x20000014	// 36c0 <ADC12_ConversionChannel_Config+0x34>
    35ec:	31f0      	movi      	r1, 240
    35ee:	9340      	ld.w      	r2, (r3, 0x0)
    35f0:	9261      	ld.w      	r3, (r2, 0x4)
    35f2:	4124      	lsli      	r1, r1, 4
    35f4:	68c5      	andn      	r3, r1
    35f6:	3ba9      	bseti      	r3, 9
    35f8:	3bab      	bseti      	r3, 11
    35fa:	b261      	st.w      	r3, (r2, 0x4)
        GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00007000;	//PA0.11
    35fc:	31f0      	movi      	r1, 240
    35fe:	9261      	ld.w      	r3, (r2, 0x4)
    3600:	4128      	lsli      	r1, r1, 8
    3602:	68c5      	andn      	r3, r1
    3604:	31e0      	movi      	r1, 224
    3606:	4127      	lsli      	r1, r1, 7
    3608:	6cc4      	or      	r3, r1
    360a:	b261      	st.w      	r3, (r2, 0x4)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0A<<6)|(0X01<<24)|(0X00<<25);			
    360c:	112e      	lrw      	r1, 0x30103c0	// 36c4 <ADC12_ConversionChannel_Config+0x38>
    360e:	116b      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3610:	9340      	ld.w      	r2, (r3, 0x0)
    3612:	9264      	ld.w      	r3, (r2, 0x10)
    3614:	68c5      	andn      	r3, r1
    3616:	112f      	lrw      	r1, 0x1000280	// 36d0 <ADC12_ConversionChannel_Config+0x44>
    3618:	07ae      	br      	0x3574	// 3574 <ADC12_Configure_VREF_Selecte+0x84>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_FVR4096_VREFN_EXIT)
    361a:	3849      	cmpnei      	r0, 9
    361c:	0819      	bt      	0x364e	// 364e <ADC12_Configure_VREF_Selecte+0x15e>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000A00;	//PA0.10
    361e:	1169      	lrw      	r3, 0x20000014	// 36c0 <ADC12_ConversionChannel_Config+0x34>
    3620:	31f0      	movi      	r1, 240
    3622:	9340      	ld.w      	r2, (r3, 0x0)
    3624:	9261      	ld.w      	r3, (r2, 0x4)
    3626:	4124      	lsli      	r1, r1, 4
    3628:	68c5      	andn      	r3, r1
    362a:	3ba9      	bseti      	r3, 9
    362c:	3bab      	bseti      	r3, 11
    362e:	b261      	st.w      	r3, (r2, 0x4)
        GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00007000;	//PA0.11
    3630:	31f0      	movi      	r1, 240
    3632:	9261      	ld.w      	r3, (r2, 0x4)
    3634:	4128      	lsli      	r1, r1, 8
    3636:	68c5      	andn      	r3, r1
    3638:	31e0      	movi      	r1, 224
    363a:	4127      	lsli      	r1, r1, 7
    363c:	6cc4      	or      	r3, r1
    363e:	b261      	st.w      	r3, (r2, 0x4)
		ADC0->CR=(ADC0->CR&0xfcfefc3f)|(0x0B<<6)|(0X01<<24)|(0X01<<25);	
    3640:	1121      	lrw      	r1, 0x30103c0	// 36c4 <ADC12_ConversionChannel_Config+0x38>
    3642:	107e      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3644:	9340      	ld.w      	r2, (r3, 0x0)
    3646:	9264      	ld.w      	r3, (r2, 0x10)
    3648:	68c5      	andn      	r3, r1
    364a:	1123      	lrw      	r1, 0x30002c0	// 36d4 <ADC12_ConversionChannel_Config+0x48>
    364c:	0794      	br      	0x3574	// 3574 <ADC12_Configure_VREF_Selecte+0x84>
	else if(ADC12_VREFP_X_VREFN_X==ADC12_VREFP_INTVREF1000_VREFN_EXIT)
    364e:	384b      	cmpnei      	r0, 11
    3650:	0b58      	bt      	0x3500	// 3500 <ADC12_Configure_VREF_Selecte+0x10>
		GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000A00;	//PA0.10					
    3652:	107c      	lrw      	r3, 0x20000014	// 36c0 <ADC12_ConversionChannel_Config+0x34>
    3654:	32f0      	movi      	r2, 240
    3656:	9320      	ld.w      	r1, (r3, 0x0)
    3658:	9161      	ld.w      	r3, (r1, 0x4)
    365a:	4244      	lsli      	r2, r2, 4
    365c:	68c9      	andn      	r3, r2
    365e:	3ba9      	bseti      	r3, 9
    3660:	3bab      	bseti      	r3, 11
    3662:	b161      	st.w      	r3, (r1, 0x4)
		ADC0->CR=(ADC0->CR&0xfffefc3f)|(0x0C<<6)|(0X00<<16)|(0X02<<17);	
    3664:	103a      	lrw      	r1, 0x503c0	// 36cc <ADC12_ConversionChannel_Config+0x40>
    3666:	1075      	lrw      	r3, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3668:	9340      	ld.w      	r2, (r3, 0x0)
    366a:	9264      	ld.w      	r3, (r2, 0x10)
    366c:	68c5      	andn      	r3, r1
    366e:	103b      	lrw      	r1, 0x40300	// 36d8 <ADC12_ConversionChannel_Config+0x4c>
    3670:	0782      	br      	0x3574	// 3574 <ADC12_Configure_VREF_Selecte+0x84>

00003672 <ADC12_CompareFunction_set>:
  //ADC will generate a CMPxH/CMPxL interrupt when result of this number of conversion is higher/lower than data set in ADC_CMPx register.
  //ConverNum_CM1Number of Conversions for Compare Function
  //ADC will generate a CMP1H/CMP1L interrupt when result of this number of conversion is greater/less than data set in ADC_CMP1 register.
  
void ADC12_CompareFunction_set(U8_T ConverNum_CM0 , U8_T ConverNum_CM1 , U16_T CMP0_data , U16_T CMP1_data ) 
{
    3672:	14c2      	push      	r4-r5
	ADC0->MR|=((ConverNum_CM0-0)<<16)|((ConverNum_CM1-0)<<22);
    3674:	1091      	lrw      	r4, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3676:	4136      	lsli      	r1, r1, 22
    3678:	9480      	ld.w      	r4, (r4, 0x0)
    367a:	4010      	lsli      	r0, r0, 16
    367c:	94a5      	ld.w      	r5, (r4, 0x14)
    367e:	6c04      	or      	r0, r1
    3680:	6c14      	or      	r0, r5
    3682:	b405      	st.w      	r0, (r4, 0x14)
	ADC0->CMP0=CMP0_data;
    3684:	24ff      	addi      	r4, 256
    3686:	b450      	st.w      	r2, (r4, 0x40)
	ADC0->CMP1=CMP1_data;
    3688:	b471      	st.w      	r3, (r4, 0x44)
}
    368a:	1482      	pop      	r4-r5

0000368c <ADC12_ConversionChannel_Config>:
//ADC12_ADCINX:ADC12_ADCIN0~ADC12_ADCIN14,ADC12_INTVREF,ADC12_DIV4_VDD,ADC12_VSS
//ReturnValue:NONE
/*************************************************************/ 
void ADC12_ConversionChannel_Config(ADC12_InputSet_TypeDef ADC12_ADCINX ,
						ADC12_CV_RepeatNum_TypeDef CV_RepeatTime, ADC12_Control_TypeDef AVG_Set, U8_T SEQx)
{
    368c:	14d4      	push      	r4-r7, r15
    368e:	1421      	subi      	r14, r14, 4
    3690:	b840      	st.w      	r2, (r14, 0x0)
    3692:	6d43      	mov      	r5, r0
	U8_T i;
	for(i=0;i<15;i++)
	{
		ADC0->SEQ[i] &=~(0x01<<7);
    3694:	1049      	lrw      	r2, 0x20000068	// 36b8 <ADC12_ConversionChannel_Config+0x2c>
    3696:	92c0      	ld.w      	r6, (r2, 0x0)
    3698:	3200      	movi      	r2, 0
    369a:	4202      	lsli      	r0, r2, 2
    369c:	6018      	addu      	r0, r6
    369e:	908c      	ld.w      	r4, (r0, 0x30)
    36a0:	2200      	addi      	r2, 1
    36a2:	3c87      	bclri      	r4, 7
	for(i=0;i<15;i++)
    36a4:	3a4f      	cmpnei      	r2, 15
		ADC0->SEQ[i] &=~(0x01<<7);
    36a6:	b08c      	st.w      	r4, (r0, 0x30)
	for(i=0;i<15;i++)
    36a8:	0bf9      	bt      	0x369a	// 369a <ADC12_ConversionChannel_Config+0xe>
	}
	switch(ADC12_ADCINX)
    36aa:	3d0e      	cmphsi      	r5, 15
    36ac:	0841      	bt      	0x372e	// 372e <ADC12_ConversionChannel_Config+0xa2>
    36ae:	6c17      	mov      	r0, r5
    36b0:	1044      	lrw      	r2, 0x20000014	// 36c0 <ADC12_ConversionChannel_Config+0x34>
    36b2:	108b      	lrw      	r4, 0x20000010	// 36dc <ADC12_ConversionChannel_Config+0x50>
    36b4:	0416      	br      	0x36e0	// 36e0 <ADC12_ConversionChannel_Config+0x54>
    36b6:	0000      	bkpt
    36b8:	20000068 	.long	0x20000068
    36bc:	000103c0 	.long	0x000103c0
    36c0:	20000014 	.long	0x20000014
    36c4:	030103c0 	.long	0x030103c0
    36c8:	030000c0 	.long	0x030000c0
    36cc:	000503c0 	.long	0x000503c0
    36d0:	01000280 	.long	0x01000280
    36d4:	030002c0 	.long	0x030002c0
    36d8:	00040300 	.long	0x00040300
    36dc:	20000010 	.long	0x20000010
    36e0:	e000091a 	bsr      	0x4914	// 4914 <___gnu_csky_case_uqi>
    36e4:	321a1408 	.long	0x321a1408
    36e8:	6155493d 	.long	0x6155493d
    36ec:	827b746d 	.long	0x827b746d
    36f0:	00989088 	.long	0x00989088
	{
		case 0:	
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0)  | 0x00000001;							//ADC0 PA0.0
    36f4:	9200      	ld.w      	r0, (r2, 0x0)
    36f6:	9040      	ld.w      	r2, (r0, 0x0)
    36f8:	370f      	movi      	r7, 15
    36fa:	689d      	andn      	r2, r7
    36fc:	3aa0      	bseti      	r2, 0
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFFFFF)  | 0x00000000;

			break;
		case 11:
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x10000000;							//ADC11 PA0.7
    36fe:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    3700:	9041      	ld.w      	r2, (r0, 0x4)
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFFFFF)  | 0x00000000;
	
			break;
		case 14:
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC14 PA0.10	
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000100;	
    3702:	b041      	st.w      	r2, (r0, 0x4)
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFFFFF)  | 0x00000000;
    3704:	9440      	ld.w      	r2, (r4, 0x0)
    3706:	9200      	ld.w      	r0, (r2, 0x0)
    3708:	b200      	st.w      	r0, (r2, 0x0)
		
			break;
    370a:	0412      	br      	0x372e	// 372e <ADC12_ConversionChannel_Config+0xa2>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)  | 0x00000010;							//ADC1 PA0.1
    370c:	9200      	ld.w      	r0, (r2, 0x0)
    370e:	9040      	ld.w      	r2, (r0, 0x0)
    3710:	37f0      	movi      	r7, 240
    3712:	689d      	andn      	r2, r7
    3714:	3aa4      	bseti      	r2, 4
    3716:	07f4      	br      	0x36fe	// 36fe <ADC12_ConversionChannel_Config+0x72>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC2 PA1.0
    3718:	9240      	ld.w      	r2, (r2, 0x0)
    371a:	9200      	ld.w      	r0, (r2, 0x0)
    371c:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    371e:	9201      	ld.w      	r0, (r2, 0x4)
    3720:	b201      	st.w      	r0, (r2, 0x4)
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFFFF0)  | 0x00000001;
    3722:	9400      	ld.w      	r0, (r4, 0x0)
    3724:	9040      	ld.w      	r2, (r0, 0x0)
    3726:	340f      	movi      	r4, 15
    3728:	6891      	andn      	r2, r4
    372a:	3aa0      	bseti      	r2, 0
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFF0FFFFF)  | 0x00100000;
    372c:	b040      	st.w      	r2, (r0, 0x0)
    372e:	4362      	lsli      	r3, r3, 2
    3730:	618c      	addu      	r6, r3
		//case 27: break;
		case 0x1Cul: break;
		case 0x1Dul: break;
		case 0x1Eul: break;
	}
	ADC0->SEQ[SEQx] = ADC0->SEQ[SEQx] & 0;
    3732:	966c      	ld.w      	r3, (r6, 0x30)
    3734:	3300      	movi      	r3, 0
    3736:	b66c      	st.w      	r3, (r6, 0x30)
	ADC0->SEQ[SEQx] = ADC0->SEQ[SEQx] | ADC12_ADCINX  | CV_RepeatTime | AVG_Set;
    3738:	9860      	ld.w      	r3, (r14, 0x0)
    373a:	6c4c      	or      	r1, r3
    373c:	964c      	ld.w      	r2, (r6, 0x30)
    373e:	6d44      	or      	r5, r1
    3740:	6d48      	or      	r5, r2
    3742:	b6ac      	st.w      	r5, (r6, 0x30)
}
    3744:	1401      	addi      	r14, r14, 4
    3746:	1494      	pop      	r4-r7, r15
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC3 PA1.1
    3748:	9240      	ld.w      	r2, (r2, 0x0)
    374a:	9200      	ld.w      	r0, (r2, 0x0)
    374c:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    374e:	9201      	ld.w      	r0, (r2, 0x4)
    3750:	b201      	st.w      	r0, (r2, 0x4)
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFFF0F)  | 0x00000010;
    3752:	9400      	ld.w      	r0, (r4, 0x0)
    3754:	9040      	ld.w      	r2, (r0, 0x0)
    3756:	34f0      	movi      	r4, 240
    3758:	6891      	andn      	r2, r4
    375a:	3aa4      	bseti      	r2, 4
    375c:	07e8      	br      	0x372c	// 372c <ADC12_ConversionChannel_Config+0xa0>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC4 PA1.2
    375e:	9240      	ld.w      	r2, (r2, 0x0)
    3760:	9200      	ld.w      	r0, (r2, 0x0)
    3762:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    3764:	9201      	ld.w      	r0, (r2, 0x4)
    3766:	b201      	st.w      	r0, (r2, 0x4)
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFF0FF)  | 0x00000100;
    3768:	9400      	ld.w      	r0, (r4, 0x0)
    376a:	34f0      	movi      	r4, 240
    376c:	9040      	ld.w      	r2, (r0, 0x0)
    376e:	4484      	lsli      	r4, r4, 4
    3770:	6891      	andn      	r2, r4
    3772:	3aa8      	bseti      	r2, 8
    3774:	07dc      	br      	0x372c	// 372c <ADC12_ConversionChannel_Config+0xa0>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC5 PA1.3
    3776:	9240      	ld.w      	r2, (r2, 0x0)
    3778:	9200      	ld.w      	r0, (r2, 0x0)
    377a:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    377c:	9201      	ld.w      	r0, (r2, 0x4)
    377e:	b201      	st.w      	r0, (r2, 0x4)
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFF0FFF)  | 0x00001000;
    3780:	9400      	ld.w      	r0, (r4, 0x0)
    3782:	34f0      	movi      	r4, 240
    3784:	9040      	ld.w      	r2, (r0, 0x0)
    3786:	4488      	lsli      	r4, r4, 8
    3788:	6891      	andn      	r2, r4
    378a:	3aac      	bseti      	r2, 12
    378c:	07d0      	br      	0x372c	// 372c <ADC12_ConversionChannel_Config+0xa0>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC6 PA1.4
    378e:	9240      	ld.w      	r2, (r2, 0x0)
    3790:	9200      	ld.w      	r0, (r2, 0x0)
    3792:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    3794:	9201      	ld.w      	r0, (r2, 0x4)
    3796:	b201      	st.w      	r0, (r2, 0x4)
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFF0FFFF)  | 0x00010000;
    3798:	9400      	ld.w      	r0, (r4, 0x0)
    379a:	34f0      	movi      	r4, 240
    379c:	9040      	ld.w      	r2, (r0, 0x0)
    379e:	448c      	lsli      	r4, r4, 12
    37a0:	6891      	andn      	r2, r4
    37a2:	3ab0      	bseti      	r2, 16
    37a4:	07c4      	br      	0x372c	// 372c <ADC12_ConversionChannel_Config+0xa0>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC7 PA1.5
    37a6:	9240      	ld.w      	r2, (r2, 0x0)
    37a8:	9200      	ld.w      	r0, (r2, 0x0)
    37aa:	b200      	st.w      	r0, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFFF)  | 0x00000000;	
    37ac:	9201      	ld.w      	r0, (r2, 0x4)
    37ae:	b201      	st.w      	r0, (r2, 0x4)
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFF0FFFFF)  | 0x00100000;
    37b0:	9400      	ld.w      	r0, (r4, 0x0)
    37b2:	34f0      	movi      	r4, 240
    37b4:	9040      	ld.w      	r2, (r0, 0x0)
    37b6:	4490      	lsli      	r4, r4, 16
    37b8:	6891      	andn      	r2, r4
    37ba:	3ab4      	bseti      	r2, 20
    37bc:	07b8      	br      	0x372c	// 372c <ADC12_ConversionChannel_Config+0xa0>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFF0FF)  | 0x00000100;							//ADC8 PA0.2
    37be:	9200      	ld.w      	r0, (r2, 0x0)
    37c0:	37f0      	movi      	r7, 240
    37c2:	9040      	ld.w      	r2, (r0, 0x0)
    37c4:	47e4      	lsli      	r7, r7, 4
    37c6:	689d      	andn      	r2, r7
    37c8:	3aa8      	bseti      	r2, 8
    37ca:	079a      	br      	0x36fe	// 36fe <ADC12_ConversionChannel_Config+0x72>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00100000;							//ADC9 PA0.5
    37cc:	9200      	ld.w      	r0, (r2, 0x0)
    37ce:	37f0      	movi      	r7, 240
    37d0:	9040      	ld.w      	r2, (r0, 0x0)
    37d2:	47f0      	lsli      	r7, r7, 16
    37d4:	689d      	andn      	r2, r7
    37d6:	3ab4      	bseti      	r2, 20
    37d8:	0793      	br      	0x36fe	// 36fe <ADC12_ConversionChannel_Config+0x72>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF)  | 0x01000000;							//ADC10 PA0.6
    37da:	9200      	ld.w      	r0, (r2, 0x0)
    37dc:	37f0      	movi      	r7, 240
    37de:	9040      	ld.w      	r2, (r0, 0x0)
    37e0:	47f4      	lsli      	r7, r7, 20
    37e2:	689d      	andn      	r2, r7
    37e4:	3ab8      	bseti      	r2, 24
    37e6:	078c      	br      	0x36fe	// 36fe <ADC12_ConversionChannel_Config+0x72>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x10000000;							//ADC11 PA0.7
    37e8:	9200      	ld.w      	r0, (r2, 0x0)
    37ea:	9040      	ld.w      	r2, (r0, 0x0)
    37ec:	4244      	lsli      	r2, r2, 4
    37ee:	4a44      	lsri      	r2, r2, 4
    37f0:	3abc      	bseti      	r2, 28
    37f2:	0786      	br      	0x36fe	// 36fe <ADC12_ConversionChannel_Config+0x72>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC12 PA0.8
    37f4:	9200      	ld.w      	r0, (r2, 0x0)
    37f6:	9040      	ld.w      	r2, (r0, 0x0)
    37f8:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFFF0)  | 0x00000001;	
    37fa:	9041      	ld.w      	r2, (r0, 0x4)
    37fc:	370f      	movi      	r7, 15
    37fe:	689d      	andn      	r2, r7
    3800:	3aa0      	bseti      	r2, 0
    3802:	0780      	br      	0x3702	// 3702 <ADC12_ConversionChannel_Config+0x76>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC13 PA0.9
    3804:	9200      	ld.w      	r0, (r2, 0x0)
    3806:	9040      	ld.w      	r2, (r0, 0x0)
    3808:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFFF0F)  | 0x00000010;	
    380a:	9041      	ld.w      	r2, (r0, 0x4)
    380c:	37f0      	movi      	r7, 240
    380e:	689d      	andn      	r2, r7
    3810:	3aa4      	bseti      	r2, 4
    3812:	0778      	br      	0x3702	// 3702 <ADC12_ConversionChannel_Config+0x76>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFFF)  | 0x00000000;							//ADC14 PA0.10	
    3814:	9200      	ld.w      	r0, (r2, 0x0)
    3816:	9040      	ld.w      	r2, (r0, 0x0)
    3818:	b040      	st.w      	r2, (r0, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF0FF)  | 0x00000100;	
    381a:	37f0      	movi      	r7, 240
    381c:	9041      	ld.w      	r2, (r0, 0x4)
    381e:	47e4      	lsli      	r7, r7, 4
    3820:	689d      	andn      	r2, r7
    3822:	3aa8      	bseti      	r2, 8
    3824:	076f      	br      	0x3702	// 3702 <ADC12_ConversionChannel_Config+0x76>

00003826 <ADC12_Compare_statue>:
//NBRCMPX_L_TypeDef:NBRCMPX_L_TypeDef,NBRCMPX_H_TypeDef
//ReturnValue:ADC12 Compare result flag
/*************************************************************/ 
  //output statue:ADC-SR(ADC12_CMP0H/ADC12_CMP0L/ADC12_CMP1H/ADC12_CMP1L)
U8_T ADC12_Compare_statue(ADC12_NBRCMPx_TypeDef ADC12_NBRCMPx, ADC12_NBRCMPx_HorL_TypeDef ADC12_NBRCMPx_HorL)
{
    3826:	1074      	lrw      	r3, 0x20000068	// 3874 <ADC_Int_Disable+0x10>
	if(ADC12_NBRCMPx==NBRCMP0_TypeDef)
    3828:	3840      	cmpnei      	r0, 0
	{
		if(ADC12_NBRCMPx_HorL==NBRCMPX_L_TypeDef)
		{
			return((ADC0->SR)&ADC12_CMP0L);
    382a:	9360      	ld.w      	r3, (r3, 0x0)
    382c:	9308      	ld.w      	r0, (r3, 0x20)
	if(ADC12_NBRCMPx==NBRCMP0_TypeDef)
    382e:	0808      	bt      	0x383e	// 383e <ADC12_Compare_statue+0x18>
		if(ADC12_NBRCMPx_HorL==NBRCMPX_L_TypeDef)
    3830:	3940      	cmpnei      	r1, 0
    3832:	0804      	bt      	0x383a	// 383a <ADC12_Compare_statue+0x14>
			return((ADC0->SR)&ADC12_CMP0L);
    3834:	3320      	movi      	r3, 32
		{
			return((ADC0->SR)&ADC12_CMP1L);
		}
		else
		{
			return((ADC0->SR)&ADC12_CMP1H);
    3836:	680c      	and      	r0, r3
    3838:	0407      	br      	0x3846	// 3846 <ADC12_Compare_statue+0x20>
			return((ADC0->SR)&ADC12_CMP0H);
    383a:	3310      	movi      	r3, 16
    383c:	07fd      	br      	0x3836	// 3836 <ADC12_Compare_statue+0x10>
		if(ADC12_NBRCMPx_HorL==NBRCMPX_L_TypeDef)
    383e:	3940      	cmpnei      	r1, 0
    3840:	0805      	bt      	0x384a	// 384a <ADC12_Compare_statue+0x24>
			return((ADC0->SR)&ADC12_CMP1L);
    3842:	337f      	movi      	r3, 127
    3844:	680d      	andn      	r0, r3
			return((ADC0->SR)&ADC12_CMP1H);
    3846:	7400      	zextb      	r0, r0
		}
	}
}
    3848:	783c      	jmp      	r15
			return((ADC0->SR)&ADC12_CMP1H);
    384a:	3340      	movi      	r3, 64
    384c:	07f5      	br      	0x3836	// 3836 <ADC12_Compare_statue+0x10>

0000384e <ADC_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void ADC_Int_Enable(void)
{
    ADC0->CSR=0xFFFFFFFF;
    384e:	106a      	lrw      	r3, 0x20000068	// 3874 <ADC_Int_Disable+0x10>
    3850:	9340      	ld.w      	r2, (r3, 0x0)
    3852:	3300      	movi      	r3, 0
    3854:	2b00      	subi      	r3, 1
    3856:	b267      	st.w      	r3, (r2, 0x1c)
	INTC_ISER_WRITE(ADC_INT);    
    3858:	3208      	movi      	r2, 8
    385a:	1068      	lrw      	r3, 0x20000078	// 3878 <ADC_Int_Disable+0x14>
    385c:	9360      	ld.w      	r3, (r3, 0x0)
    385e:	23ff      	addi      	r3, 256
    3860:	b340      	st.w      	r2, (r3, 0x0)
}
    3862:	783c      	jmp      	r15

00003864 <ADC_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void ADC_Int_Disable(void)
{
    INTC_ICER_WRITE(ADC_INT);    
    3864:	1065      	lrw      	r3, 0x20000078	// 3878 <ADC_Int_Disable+0x14>
    3866:	32c0      	movi      	r2, 192
    3868:	9360      	ld.w      	r3, (r3, 0x0)
    386a:	4241      	lsli      	r2, r2, 1
    386c:	60c8      	addu      	r3, r2
    386e:	3208      	movi      	r2, 8
    3870:	b340      	st.w      	r2, (r3, 0x0)
    3872:	783c      	jmp      	r15
    3874:	20000068 	.long	0x20000068
    3878:	20000078 	.long	0x20000078

0000387c <UART0_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_DeInit(void)
{
    UART0->DATA = UART_RESET_VALUE;
    387c:	1067      	lrw      	r3, 0x20000028	// 3898 <UART0_DeInit+0x1c>
    387e:	3200      	movi      	r2, 0
    3880:	9360      	ld.w      	r3, (r3, 0x0)
    UART0->SR   = UART_RESET_VALUE;
    UART0->CTRL = UART_RESET_VALUE;
    UART0->ISR  = UART_RESET_VALUE;
    UART0->BRDIV = UART_RESET_VALUE;
	UART0->RTOR = 0x0000FFFF;
    3882:	1027      	lrw      	r1, 0xffff	// 389c <UART0_DeInit+0x20>
    UART0->DATA = UART_RESET_VALUE;
    3884:	b340      	st.w      	r2, (r3, 0x0)
    UART0->SR   = UART_RESET_VALUE;
    3886:	b341      	st.w      	r2, (r3, 0x4)
    UART0->CTRL = UART_RESET_VALUE;
    3888:	b342      	st.w      	r2, (r3, 0x8)
    UART0->ISR  = UART_RESET_VALUE;
    388a:	b343      	st.w      	r2, (r3, 0xc)
    UART0->BRDIV = UART_RESET_VALUE;
    388c:	b344      	st.w      	r2, (r3, 0x10)
	UART0->RTOR = 0x0000FFFF;
    388e:	b326      	st.w      	r1, (r3, 0x18)
	UART0->TTGR = UART_RESET_VALUE;
    3890:	b347      	st.w      	r2, (r3, 0x1c)
	UART0->SRR  = UART_RESET_VALUE;
    3892:	b348      	st.w      	r2, (r3, 0x20)
}
    3894:	783c      	jmp      	r15
    3896:	0000      	bkpt
    3898:	20000028 	.long	0x20000028
    389c:	0000ffff 	.long	0x0000ffff

000038a0 <UART0_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_Int_Enable(void)
{
    UART0->ISR=0x0F;									//clear UART0 INT status
    38a0:	0378      	lrw      	r3, 0x20000028	// 3abc <UARTReceive+0x34>
    38a2:	320f      	movi      	r2, 15
    38a4:	9360      	ld.w      	r3, (r3, 0x0)
    38a6:	b343      	st.w      	r2, (r3, 0xc)
	INTC_ISER_WRITE(UART0_INT);							//INT Vector Enable UART0/1 Interrupt in CK802
    38a8:	3280      	movi      	r2, 128
    38aa:	0379      	lrw      	r3, 0x20000078	// 3ac0 <UARTReceive+0x38>
    38ac:	4251      	lsli      	r2, r2, 17
    38ae:	9360      	ld.w      	r3, (r3, 0x0)
    38b0:	23ff      	addi      	r3, 256
    38b2:	b340      	st.w      	r2, (r3, 0x0)
}
    38b4:	783c      	jmp      	r15

000038b6 <UART0_Int_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_Int_Disable(void)
{
	INTC_ICER_WRITE(UART0_INT);							//INT Vector Enable UART0/1 Interrupt in CK802
    38b6:	037c      	lrw      	r3, 0x20000078	// 3ac0 <UARTReceive+0x38>
    38b8:	32c0      	movi      	r2, 192
    38ba:	9360      	ld.w      	r3, (r3, 0x0)
    38bc:	4241      	lsli      	r2, r2, 1
    38be:	60c8      	addu      	r3, r2
    38c0:	3280      	movi      	r2, 128
    38c2:	4251      	lsli      	r2, r2, 17
    38c4:	b340      	st.w      	r2, (r3, 0x0)
}
    38c6:	783c      	jmp      	r15

000038c8 <UART0_WakeUp_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_WakeUp_Enable(void)
{
    INTC_IWER_WRITE(UART0_INT);    
    38c8:	137e      	lrw      	r3, 0x20000078	// 3ac0 <UARTReceive+0x38>
    38ca:	3280      	movi      	r2, 128
    38cc:	9360      	ld.w      	r3, (r3, 0x0)
    38ce:	23ff      	addi      	r3, 256
    38d0:	4251      	lsli      	r2, r2, 17
    38d2:	b350      	st.w      	r2, (r3, 0x40)
}
    38d4:	783c      	jmp      	r15

000038d6 <UART0_WakeUp_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0_WakeUp_Disable(void)
{
    INTC_IWDR_WRITE(UART0_INT);    
    38d6:	137b      	lrw      	r3, 0x20000078	// 3ac0 <UARTReceive+0x38>
    38d8:	32e0      	movi      	r2, 224
    38da:	9360      	ld.w      	r3, (r3, 0x0)
    38dc:	4241      	lsli      	r2, r2, 1
    38de:	60c8      	addu      	r3, r2
    38e0:	3280      	movi      	r2, 128
    38e2:	4251      	lsli      	r2, r2, 17
    38e4:	b340      	st.w      	r2, (r3, 0x0)
}
    38e6:	783c      	jmp      	r15

000038e8 <UART_IO_Init>:
//UART_IO_G:0 1
//ReturnValue:NONE
/*************************************************************/
void UART_IO_Init(UART_NUM_TypeDef IO_UART_NUM , U8_T UART_IO_G)
{
    if (IO_UART_NUM==IO_UART0)
    38e8:	3840      	cmpnei      	r0, 0
    38ea:	080d      	bt      	0x3904	// 3904 <UART_IO_Init+0x1c>
    {
		if(UART_IO_G==0)
    38ec:	3940      	cmpnei      	r1, 0
    38ee:	080c      	bt      	0x3906	// 3906 <UART_IO_Init+0x1e>
		{
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFFF00F)  | 0x00000770;      //PA0.10->RXD0, PA0.9->TXD0 
    38f0:	1375      	lrw      	r3, 0x20000014	// 3ac4 <UARTReceive+0x3c>
    38f2:	32ff      	movi      	r2, 255
    38f4:	9320      	ld.w      	r1, (r3, 0x0)
    38f6:	9161      	ld.w      	r3, (r1, 0x4)
    38f8:	4244      	lsli      	r2, r2, 4
    38fa:	68c9      	andn      	r3, r2
    38fc:	32ee      	movi      	r2, 238
    38fe:	4243      	lsli      	r2, r2, 3
    3900:	6cc8      	or      	r3, r2
    3902:	b161      	st.w      	r3, (r1, 0x4)
		else if(UART_IO_G==3)
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF)  | 0x00088000;       //PA0.3->RXD0, PA0.4->TXD0  //SWD口，需解锁，谨慎使用
		}
    }
}
    3904:	783c      	jmp      	r15
		else if(UART_IO_G==1)
    3906:	3941      	cmpnei      	r1, 1
    3908:	080c      	bt      	0x3920	// 3920 <UART_IO_Init+0x38>
			GPIOA1->CONLR = (GPIOA1->CONLR&0XFFFFF00F)  | 0x00000660;      //PA1.2->RXD0, PA1.1->TXD0      
    390a:	1370      	lrw      	r3, 0x20000010	// 3ac8 <UARTReceive+0x40>
    390c:	32ff      	movi      	r2, 255
    390e:	9320      	ld.w      	r1, (r3, 0x0)
    3910:	4244      	lsli      	r2, r2, 4
    3912:	9160      	ld.w      	r3, (r1, 0x0)
    3914:	68c9      	andn      	r3, r2
    3916:	32cc      	movi      	r2, 204
    3918:	4243      	lsli      	r2, r2, 3
    391a:	6cc8      	or      	r3, r2
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF)  | 0x00088000;       //PA0.3->RXD0, PA0.4->TXD0  //SWD口，需解锁，谨慎使用
    391c:	b160      	st.w      	r3, (r1, 0x0)
}
    391e:	07f3      	br      	0x3904	// 3904 <UART_IO_Init+0x1c>
		else if(UART_IO_G==2)
    3920:	3942      	cmpnei      	r1, 2
    3922:	0813      	bt      	0x3948	// 3948 <UART_IO_Init+0x60>
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFFF0FFF)  | 0x00005000;      //PA0.11->RXD0, PC0.2->TXD0   
    3924:	1368      	lrw      	r3, 0x20000014	// 3ac4 <UARTReceive+0x3c>
    3926:	32f0      	movi      	r2, 240
    3928:	9320      	ld.w      	r1, (r3, 0x0)
    392a:	9161      	ld.w      	r3, (r1, 0x4)
    392c:	4248      	lsli      	r2, r2, 8
    392e:	68c9      	andn      	r3, r2
    3930:	3bac      	bseti      	r3, 12
    3932:	3bae      	bseti      	r3, 14
    3934:	b161      	st.w      	r3, (r1, 0x4)
            GPIOC0->CONLR = (GPIOC0->CONLR&0XFFFFF0FF)  | 0x00000500;   
    3936:	32f0      	movi      	r2, 240
    3938:	1365      	lrw      	r3, 0x20000008	// 3acc <UARTReceive+0x44>
    393a:	4244      	lsli      	r2, r2, 4
    393c:	9320      	ld.w      	r1, (r3, 0x0)
    393e:	9160      	ld.w      	r3, (r1, 0x0)
    3940:	68c9      	andn      	r3, r2
    3942:	3ba8      	bseti      	r3, 8
    3944:	3baa      	bseti      	r3, 10
    3946:	07eb      	br      	0x391c	// 391c <UART_IO_Init+0x34>
		else if(UART_IO_G==3)
    3948:	3943      	cmpnei      	r1, 3
    394a:	0bdd      	bt      	0x3904	// 3904 <UART_IO_Init+0x1c>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF)  | 0x00088000;       //PA0.3->RXD0, PA0.4->TXD0  //SWD口，需解锁，谨慎使用
    394c:	127e      	lrw      	r3, 0x20000014	// 3ac4 <UARTReceive+0x3c>
    394e:	32ff      	movi      	r2, 255
    3950:	9320      	ld.w      	r1, (r3, 0x0)
    3952:	9160      	ld.w      	r3, (r1, 0x0)
    3954:	424c      	lsli      	r2, r2, 12
    3956:	68c9      	andn      	r3, r2
    3958:	3baf      	bseti      	r3, 15
    395a:	3bb3      	bseti      	r3, 19
    395c:	07e0      	br      	0x391c	// 391c <UART_IO_Init+0x34>

0000395e <UARTInit>:
//ReturnValue:NONE
/*************************************************************/
void UARTInit(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   uart->CTRL|=PAR_DAT;
    395e:	9062      	ld.w      	r3, (r0, 0x8)
    3960:	6c8c      	or      	r2, r3
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX);
    3962:	3303      	movi      	r3, 3
   uart->CTRL|=PAR_DAT;
    3964:	b042      	st.w      	r2, (r0, 0x8)
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX);
    3966:	b062      	st.w      	r3, (r0, 0x8)
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
    3968:	b024      	st.w      	r1, (r0, 0x10)
}
    396a:	783c      	jmp      	r15

0000396c <UARTInitRxTxIntEn>:
//ReturnValue:NONE
/*************************************************************/
void UARTInitRxTxIntEn(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   uart->CTRL|=PAR_DAT;
    396c:	9062      	ld.w      	r3, (r0, 0x8)
    396e:	6c8c      	or      	r2, r3
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT | UART_TX_INT);
    3970:	330f      	movi      	r3, 15
   uart->CTRL|=PAR_DAT;
    3972:	b042      	st.w      	r2, (r0, 0x8)
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT | UART_TX_INT);
    3974:	b062      	st.w      	r3, (r0, 0x8)
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
    3976:	b024      	st.w      	r1, (r0, 0x10)
}
    3978:	783c      	jmp      	r15

0000397a <UARTInitRxIntEn>:
//ReturnValue:NONE
/*************************************************************/
void UARTInitRxIntEn(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   uart->CTRL|=PAR_DAT;
    397a:	9062      	ld.w      	r3, (r0, 0x8)
    397c:	6c8c      	or      	r2, r3
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT);
    397e:	330b      	movi      	r3, 11
   uart->CTRL|=PAR_DAT;
    3980:	b042      	st.w      	r2, (r0, 0x8)
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT);
    3982:	b062      	st.w      	r3, (r0, 0x8)
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
    3984:	b024      	st.w      	r1, (r0, 0x10)
   
}
    3986:	783c      	jmp      	r15

00003988 <UART_Timeout_Rx_CMD>:
//EntryParameter:NewState: DISABLE , ENABLE
//ReturnValue:NONE
/*************************************************************/
void UART_Timeout_Rx_CMD(CSP_UART_T *uart,FunctionalStatus NewState,U16_T TIMEOUT)    //cl
{
	 if (NewState != DISABLE)
    3988:	3940      	cmpnei      	r1, 0
	 {
	     uart->CTRL |= (1<<20);
    398a:	9062      	ld.w      	r3, (r0, 0x8)
	 if (NewState != DISABLE)
    398c:	0c05      	bf      	0x3996	// 3996 <UART_Timeout_Rx_CMD+0xe>
	     uart->CTRL |= (1<<20);
    398e:	3bb4      	bseti      	r3, 20
    3990:	b062      	st.w      	r3, (r0, 0x8)
		 uart->RTOR = TIMEOUT;
    3992:	b046      	st.w      	r2, (r0, 0x18)
	 else
	 {
		 uart->CTRL &= (~(1<<20));
		 uart->RTOR = 0x0000FFFF;
	 }
}
    3994:	783c      	jmp      	r15
		 uart->CTRL &= (~(1<<20));
    3996:	3b94      	bclri      	r3, 20
    3998:	b062      	st.w      	r3, (r0, 0x8)
		 uart->RTOR = 0x0000FFFF;
    399a:	126e      	lrw      	r3, 0xffff	// 3ad0 <UARTReceive+0x48>
    399c:	b066      	st.w      	r3, (r0, 0x18)
}
    399e:	07fb      	br      	0x3994	// 3994 <UART_Timeout_Rx_CMD+0xc>

000039a0 <UART_FIFO_CMD>:
//UART_FIFO_CMD
//EntryParameter:FIFO1_X, ENABLE/DISABLE
//ReturnValue:NONE
/*************************************************************/
void UART_FIFO_CMD(UART_FIFO_TypeDef FIFO1_X,FunctionalStatus newState)
{
    39a0:	1267      	lrw      	r3, 0x20000028	// 3abc <UARTReceive+0x34>
    39a2:	400e      	lsli      	r0, r0, 14
	if (newState!=DISABLE)
	{
		UART0->CTRL |= FIFO1_X<<14;
    39a4:	9360      	ld.w      	r3, (r3, 0x0)
    39a6:	9342      	ld.w      	r2, (r3, 0x8)
    39a8:	6c08      	or      	r0, r2
    39aa:	b302      	st.w      	r0, (r3, 0x8)
	if (newState!=DISABLE)
    39ac:	3940      	cmpnei      	r1, 0
		
		UART0->CTRL  |= 1<<11;
    39ae:	9342      	ld.w      	r2, (r3, 0x8)
	if (newState!=DISABLE)
    39b0:	0c04      	bf      	0x39b8	// 39b8 <UART_FIFO_CMD+0x18>
		UART0->CTRL  |= 1<<11;
    39b2:	3aab      	bseti      	r2, 11
	}
	else
	{
		UART0->CTRL  |= FIFO1_X<<14;
		
		UART0->CTRL  &= (~(1<<11));
    39b4:	b342      	st.w      	r2, (r3, 0x8)
	}
}
    39b6:	783c      	jmp      	r15
		UART0->CTRL  &= (~(1<<11));
    39b8:	3a8b      	bclri      	r2, 11
    39ba:	07fd      	br      	0x39b4	// 39b4 <UART_FIFO_CMD+0x14>

000039bc <UART_Tx_Break_CMD>:
//EntryParameter:NewState: DISABLE , ENABLE
//ReturnValue:NONE
/*************************************************************/
void UART_Tx_Break_CMD(CSP_UART_T *uart,FunctionalStatus NewState)
{
	if (NewState != DISABLE)
    39bc:	3940      	cmpnei      	r1, 0
	{
	     uart->CTRL |= (1<<23);
    39be:	9062      	ld.w      	r3, (r0, 0x8)
	if (NewState != DISABLE)
    39c0:	0c04      	bf      	0x39c8	// 39c8 <UART_Tx_Break_CMD+0xc>
	     uart->CTRL |= (1<<23);
    39c2:	3bb7      	bseti      	r3, 23
	}
	else
	{
		 
		 uart->CTRL |= (1<<24);
    39c4:	b062      	st.w      	r3, (r0, 0x8)
	}
}
    39c6:	783c      	jmp      	r15
		 uart->CTRL |= (1<<24);
    39c8:	3bb8      	bseti      	r3, 24
    39ca:	07fd      	br      	0x39c4	// 39c4 <UART_Tx_Break_CMD+0x8>

000039cc <UART_Tx_TTGR_TIME>:
//EntryParameter:TIME_GUARD
//ReturnValue:NONE
/*************************************************************/
void UART_Tx_TTGR_TIME(CSP_UART_T *uart,U8_T TIME_GUARD)
{
     uart->TTGR = TIME_GUARD; 
    39cc:	b027      	st.w      	r1, (r0, 0x1c)
}
    39ce:	783c      	jmp      	r15

000039d0 <UART_Software_Reset>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void UART_Software_Reset(CSP_UART_T *uart)
{
     uart->SRR = 0X01; 
    39d0:	3301      	movi      	r3, 1
    39d2:	b068      	st.w      	r3, (r0, 0x20)
}
    39d4:	783c      	jmp      	r15

000039d6 <UARTClose>:
//ReturnValue:NONE
/*************************************************************/
void UARTClose(CSP_UART_T *uart)
{
	// Set Transmitter Disable
	CSP_UART_SET_CTRL(uart, 0x00);
    39d6:	3300      	movi      	r3, 0
    39d8:	b062      	st.w      	r3, (r0, 0x8)
}
    39da:	783c      	jmp      	r15

000039dc <UARTTxByte>:
/*************************************************************/
void UARTTxByte(CSP_UART_T *uart,U8_T txdata_u8)
{
	unsigned int  DataI;
	// Write the transmit buffer
	CSP_UART_SET_DATA(uart,txdata_u8);
    39dc:	b020      	st.w      	r1, (r0, 0x0)
	do
	{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_TX_FULL;
    39de:	3201      	movi      	r2, 1
		DataI = CSP_UART_GET_SR(uart);
    39e0:	9061      	ld.w      	r3, (r0, 0x4)
		DataI = DataI & UART_TX_FULL;
    39e2:	68c8      	and      	r3, r2
	}
	while(DataI == UART_TX_FULL);    //Loop  when tx is full
    39e4:	3b40      	cmpnei      	r3, 0
    39e6:	0bfd      	bt      	0x39e0	// 39e0 <UARTTxByte+0x4>
}
    39e8:	783c      	jmp      	r15

000039ea <UARTTransmit>:
//UART Transmit 
//EntryParameter:UART0,sourceAddress_u16,length_u16
//ReturnValue:NONE
/*************************************************************/
void UARTTransmit(CSP_UART_T *uart,U8_T *sourceAddress_u16,U16_T length_u16)
{
    39ea:	14c2      	push      	r4-r5
	unsigned int  DataI,DataJ;
	for(DataJ = 0;DataJ < length_u16 ;DataJ ++)
    39ec:	6cc7      	mov      	r3, r1
	{
		CSP_UART_SET_DATA(uart,*sourceAddress_u16++);
		do{
			DataI = CSP_UART_GET_SR(uart);
			DataI = DataI & UART_TX_FULL;
    39ee:	3501      	movi      	r5, 1
	for(DataJ = 0;DataJ < length_u16 ;DataJ ++)
    39f0:	5b85      	subu      	r4, r3, r1
    39f2:	6490      	cmphs      	r4, r2
    39f4:	0c02      	bf      	0x39f8	// 39f8 <UARTTransmit+0xe>
		}while(DataI == UART_TX_FULL);    //Loop  when tx is full
	}
}
    39f6:	1482      	pop      	r4-r5
		CSP_UART_SET_DATA(uart,*sourceAddress_u16++);
    39f8:	8380      	ld.b      	r4, (r3, 0x0)
    39fa:	b080      	st.w      	r4, (r0, 0x0)
			DataI = CSP_UART_GET_SR(uart);
    39fc:	9081      	ld.w      	r4, (r0, 0x4)
			DataI = DataI & UART_TX_FULL;
    39fe:	6914      	and      	r4, r5
		}while(DataI == UART_TX_FULL);    //Loop  when tx is full
    3a00:	3c40      	cmpnei      	r4, 0
    3a02:	0bfd      	bt      	0x39fc	// 39fc <UARTTransmit+0x12>
    3a04:	2300      	addi      	r3, 1
    3a06:	07f5      	br      	0x39f0	// 39f0 <UARTTransmit+0x6>

00003a08 <UARTTTransmit_data_set>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void UARTTTransmit_data_set(CSP_UART_T *uart )
{
	if(!f_Uart_send_Complete)
    3a08:	1173      	lrw      	r3, 0x200000a6	// 3ad4 <UARTReceive+0x4c>
    3a0a:	8340      	ld.b      	r2, (r3, 0x0)
    3a0c:	3a40      	cmpnei      	r2, 0
    3a0e:	080c      	bt      	0x3a26	// 3a26 <UARTTTransmit_data_set+0x1e>
	{
		f_Uart_send_Complete=1;
    3a10:	3201      	movi      	r2, 1
    3a12:	a340      	st.b      	r2, (r3, 0x0)
		Uart_send_Length_temp++;
    3a14:	1151      	lrw      	r2, 0x200000a4	// 3ad8 <UARTReceive+0x50>
    3a16:	8a60      	ld.h      	r3, (r2, 0x0)
    3a18:	2300      	addi      	r3, 1
    3a1a:	74cd      	zexth      	r3, r3
    3a1c:	aa60      	st.h      	r3, (r2, 0x0)
		CSP_UART_SET_DATA(uart,Uart_buffer[0]);
    3a1e:	1170      	lrw      	r3, 0x20000084	// 3adc <UARTReceive+0x54>
    3a20:	8360      	ld.b      	r3, (r3, 0x0)
    3a22:	74cc      	zextb      	r3, r3
    3a24:	b060      	st.w      	r3, (r0, 0x0)
	}
}
    3a26:	783c      	jmp      	r15

00003a28 <UARTTransmit_INT_Send>:
void UARTTransmit_INT_Send(CSP_UART_T *uart )
{
    3a28:	14c1      	push      	r4
	if(f_Uart_send_Complete)
    3a2a:	112b      	lrw      	r1, 0x200000a6	// 3ad4 <UARTReceive+0x4c>
    3a2c:	8160      	ld.b      	r3, (r1, 0x0)
    3a2e:	3b40      	cmpnei      	r3, 0
    3a30:	0c0c      	bf      	0x3a48	// 3a48 <UARTTransmit_INT_Send+0x20>
	{
		if(Uart_send_Length_temp>=Uart_send_Length)
    3a32:	116c      	lrw      	r3, 0x200000a7	// 3ae0 <UARTReceive+0x58>
    3a34:	1149      	lrw      	r2, 0x200000a4	// 3ad8 <UARTReceive+0x50>
    3a36:	8380      	ld.b      	r4, (r3, 0x0)
    3a38:	8a60      	ld.h      	r3, (r2, 0x0)
    3a3a:	74cd      	zexth      	r3, r3
    3a3c:	650c      	cmphs      	r3, r4
    3a3e:	0c06      	bf      	0x3a4a	// 3a4a <UARTTransmit_INT_Send+0x22>
		{
			f_Uart_send_Complete=0;
    3a40:	3300      	movi      	r3, 0
    3a42:	a160      	st.b      	r3, (r1, 0x0)
			Uart_send_Length_temp=0;
    3a44:	3300      	movi      	r3, 0
    3a46:	aa60      	st.h      	r3, (r2, 0x0)
		else
		{
			CSP_UART_SET_DATA(uart,Uart_buffer[Uart_send_Length_temp++]);
		}
	}	
}
    3a48:	1481      	pop      	r4
			CSP_UART_SET_DATA(uart,Uart_buffer[Uart_send_Length_temp++]);
    3a4a:	8a60      	ld.h      	r3, (r2, 0x0)
    3a4c:	74cd      	zexth      	r3, r3
    3a4e:	5b22      	addi      	r1, r3, 1
    3a50:	7445      	zexth      	r1, r1
    3a52:	aa20      	st.h      	r1, (r2, 0x0)
    3a54:	1142      	lrw      	r2, 0x20000084	// 3adc <UARTReceive+0x54>
    3a56:	60c8      	addu      	r3, r2
    3a58:	8360      	ld.b      	r3, (r3, 0x0)
    3a5a:	74cc      	zextb      	r3, r3
    3a5c:	b060      	st.w      	r3, (r0, 0x0)
}
    3a5e:	07f5      	br      	0x3a48	// 3a48 <UARTTransmit_INT_Send+0x20>

00003a60 <UARTRxByte>:
/*************************************************************/
U16_T UARTRxByte(CSP_UART_T *uart,U8_T *Rxdata_u16)
{
	unsigned int  DataI;

	DataI = CSP_UART_GET_SR(uart);
    3a60:	9061      	ld.w      	r3, (r0, 0x4)
	DataI = DataI & UART_RX_FULL;
    3a62:	3202      	movi      	r2, 2
    3a64:	68c8      	and      	r3, r2
	if(DataI != UART_RX_FULL)    //Loop  when rx is not full
    3a66:	3b40      	cmpnei      	r3, 0
    3a68:	0c05      	bf      	0x3a72	// 3a72 <UARTRxByte+0x12>
		return FALSE;
	else
	{
		*Rxdata_u16 = CSP_UART_GET_DATA(uart);
    3a6a:	9060      	ld.w      	r3, (r0, 0x0)
    3a6c:	a160      	st.b      	r3, (r1, 0x0)
	    return TRUE;
    3a6e:	3001      	movi      	r0, 1
	}
}
    3a70:	783c      	jmp      	r15
		return FALSE;
    3a72:	3000      	movi      	r0, 0
    3a74:	07fe      	br      	0x3a70	// 3a70 <UARTRxByte+0x10>

00003a76 <UART_ReturnRxByte>:
//EntryParameter:UART0,UART1,UART2
//ReturnValue:(uart)->DATA
/*************************************************************/
U8_T UART_ReturnRxByte(CSP_UART_T *uart)
{
	RxDataFlag = FALSE;
    3a76:	107c      	lrw      	r3, 0x2000007c	// 3ae4 <UARTReceive+0x5c>
    3a78:	3200      	movi      	r2, 0
    3a7a:	a340      	st.b      	r2, (r3, 0x0)
	while(RxDataFlag != TRUE);
    3a7c:	8340      	ld.b      	r2, (r3, 0x0)
    3a7e:	3a41      	cmpnei      	r2, 1
    3a80:	0bfe      	bt      	0x3a7c	// 3a7c <UART_ReturnRxByte+0x6>
	return CSP_UART_GET_DATA(uart);
    3a82:	9000      	ld.w      	r0, (r0, 0x0)
    3a84:	7400      	zextb      	r0, r0
}
    3a86:	783c      	jmp      	r15

00003a88 <UARTReceive>:
//UART Receive
//EntryParameter:UART0,UART1,UART2，destAddress_u16，length_u16
//ReturnValue:FALSE/TRUE
/*************************************************************/
U16_T UARTReceive(CSP_UART_T *uart,U8_T *destAddress_u16,U16_T length_u16)
{
    3a88:	14c4      	push      	r4-r7
	unsigned int  DataI,DataJ,LoopTime;

	DataJ = 0;
	LoopTime = 0;
    3a8a:	3500      	movi      	r5, 0
	DataJ = 0;
    3a8c:	3300      	movi      	r3, 0
	do{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_RX_FULL;
    3a8e:	3602      	movi      	r6, 2
		{
			*destAddress_u16++ = CSP_UART_GET_DATA(uart);
			DataJ++;
			LoopTime = 0;
		}
		if(LoopTime ++ >= 0xfff0)
    3a90:	10f6      	lrw      	r7, 0xffef	// 3ae8 <UARTReceive+0x60>
		DataI = CSP_UART_GET_SR(uart);
    3a92:	9081      	ld.w      	r4, (r0, 0x4)
		DataI = DataI & UART_RX_FULL;
    3a94:	6918      	and      	r4, r6
		if(DataI == UART_RX_FULL)    //Loop  when rx is full
    3a96:	3c40      	cmpnei      	r4, 0
    3a98:	0c0d      	bf      	0x3ab2	// 3ab2 <UARTReceive+0x2a>
			*destAddress_u16++ = CSP_UART_GET_DATA(uart);
    3a9a:	9080      	ld.w      	r4, (r0, 0x0)
    3a9c:	a180      	st.b      	r4, (r1, 0x0)
			DataJ++;
    3a9e:	2300      	addi      	r3, 1
			*destAddress_u16++ = CSP_UART_GET_DATA(uart);
    3aa0:	2100      	addi      	r1, 1
			LoopTime = 0;
    3aa2:	3400      	movi      	r4, 0
		if(LoopTime ++ >= 0xfff0)
    3aa4:	651c      	cmphs      	r7, r4
    3aa6:	5ca2      	addi      	r5, r4, 1
    3aa8:	0c07      	bf      	0x3ab6	// 3ab6 <UARTReceive+0x2e>
			return FALSE;
	}while(DataJ < length_u16);
    3aaa:	648c      	cmphs      	r3, r2
    3aac:	0ff3      	bf      	0x3a92	// 3a92 <UARTReceive+0xa>
	return TRUE;
    3aae:	3001      	movi      	r0, 1
}
    3ab0:	1484      	pop      	r4-r7
    3ab2:	6d17      	mov      	r4, r5
    3ab4:	07f8      	br      	0x3aa4	// 3aa4 <UARTReceive+0x1c>
			return FALSE;
    3ab6:	3000      	movi      	r0, 0
    3ab8:	07fc      	br      	0x3ab0	// 3ab0 <UARTReceive+0x28>
    3aba:	0000      	bkpt
    3abc:	20000028 	.long	0x20000028
    3ac0:	20000078 	.long	0x20000078
    3ac4:	20000014 	.long	0x20000014
    3ac8:	20000010 	.long	0x20000010
    3acc:	20000008 	.long	0x20000008
    3ad0:	0000ffff 	.long	0x0000ffff
    3ad4:	200000a6 	.long	0x200000a6
    3ad8:	200000a4 	.long	0x200000a4
    3adc:	20000084 	.long	0x20000084
    3ae0:	200000a7 	.long	0x200000a7
    3ae4:	2000007c 	.long	0x2000007c
    3ae8:	0000ffef 	.long	0x0000ffef

00003aec <CORETHandler>:
//CORET Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORETHandler(void) 
{
    3aec:	1460      	nie
    3aee:	1462      	ipush
    // ISR content ...
	
	CK802->CORET_CVR = 0;							// Coret CVR 清除
    3af0:	1063      	lrw      	r3, 0x20000078	// 3afc <CORETHandler+0x10>
    3af2:	3200      	movi      	r2, 0
    3af4:	9360      	ld.w      	r3, (r3, 0x0)
    3af6:	b346      	st.w      	r2, (r3, 0x18)
}
    3af8:	1463      	ipop
    3afa:	1461      	nir
    3afc:	20000078 	.long	0x20000078

00003b00 <SYSCONIntHandler>:
//SYSCON Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCONIntHandler(void) 
{
    3b00:	1460      	nie
    3b02:	1462      	ipush
    // ISR content ...
	if((SYSCON->MISR&ISOSC_ST)==ISOSC_ST)				//ISOSC stable interrupt
    3b04:	0166      	lrw      	r3, 0x20000070	// 3e68 <EPTIntHandler+0x1c>
    3b06:	3280      	movi      	r2, 128
    3b08:	9360      	ld.w      	r3, (r3, 0x0)
    3b0a:	60c8      	addu      	r3, r2
    3b0c:	9323      	ld.w      	r1, (r3, 0xc)
    3b0e:	3001      	movi      	r0, 1
    3b10:	6840      	and      	r1, r0
    3b12:	3940      	cmpnei      	r1, 0
    3b14:	0c04      	bf      	0x3b1c	// 3b1c <SYSCONIntHandler+0x1c>
	{
		SYSCON->ICR = EMOSC_ST;
	} 
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)			//HFOSC stable interrupt
	{
		SYSCON->ICR = HFOSC_ST;
    3b16:	b301      	st.w      	r0, (r3, 0x4)
	}
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)		//Command error interrupt
	{
		SYSCON->ICR = CMD_ERR_ST;
	}
}
    3b18:	1463      	ipop
    3b1a:	1461      	nir
	else if((SYSCON->MISR&IMOSC_ST)==IMOSC_ST)			//IMOSC stable interrupt
    3b1c:	9323      	ld.w      	r1, (r3, 0xc)
    3b1e:	3002      	movi      	r0, 2
    3b20:	6840      	and      	r1, r0
    3b22:	3940      	cmpnei      	r1, 0
    3b24:	0bf9      	bt      	0x3b16	// 3b16 <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&EMOSC_ST)==EMOSC_ST)			//EMOSC stable interrupt
    3b26:	9323      	ld.w      	r1, (r3, 0xc)
    3b28:	3008      	movi      	r0, 8
    3b2a:	6840      	and      	r1, r0
    3b2c:	3940      	cmpnei      	r1, 0
    3b2e:	0bf4      	bt      	0x3b16	// 3b16 <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)			//HFOSC stable interrupt
    3b30:	9323      	ld.w      	r1, (r3, 0xc)
    3b32:	3010      	movi      	r0, 16
    3b34:	6840      	and      	r1, r0
    3b36:	3940      	cmpnei      	r1, 0
    3b38:	0bef      	bt      	0x3b16	// 3b16 <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&SYSCLK_ST)==SYSCLK_ST)		//SYSCLK change end & stable interrupt
    3b3a:	9323      	ld.w      	r1, (r3, 0xc)
    3b3c:	6848      	and      	r1, r2
    3b3e:	3940      	cmpnei      	r1, 0
    3b40:	0c03      	bf      	0x3b46	// 3b46 <SYSCONIntHandler+0x46>
		SYSCON->ICR = CMD_ERR_ST;
    3b42:	b341      	st.w      	r2, (r3, 0x4)
}
    3b44:	07ea      	br      	0x3b18	// 3b18 <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&IWDT_INT_ST)==IWDT_INT_ST)	//IWDT alarm window interrupt
    3b46:	3280      	movi      	r2, 128
    3b48:	9323      	ld.w      	r1, (r3, 0xc)
    3b4a:	4241      	lsli      	r2, r2, 1
    3b4c:	6848      	and      	r1, r2
    3b4e:	3940      	cmpnei      	r1, 0
    3b50:	0bf9      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&WKI_INT_ST)==WKI_INT_ST)
    3b52:	3280      	movi      	r2, 128
    3b54:	9323      	ld.w      	r1, (r3, 0xc)
    3b56:	4242      	lsli      	r2, r2, 2
    3b58:	6848      	and      	r1, r2
    3b5a:	3940      	cmpnei      	r1, 0
    3b5c:	0bf3      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&RAMERRINT_ST)==RAMERRINT_ST)	//SRAM check fail interrupt
    3b5e:	3280      	movi      	r2, 128
    3b60:	9323      	ld.w      	r1, (r3, 0xc)
    3b62:	4243      	lsli      	r2, r2, 3
    3b64:	6848      	and      	r1, r2
    3b66:	3940      	cmpnei      	r1, 0
    3b68:	0bed      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&LVD_INT_ST)==LVD_INT_ST)		//LVD threshold interrupt
    3b6a:	3280      	movi      	r2, 128
    3b6c:	9323      	ld.w      	r1, (r3, 0xc)
    3b6e:	4244      	lsli      	r2, r2, 4
    3b70:	6848      	and      	r1, r2
    3b72:	3940      	cmpnei      	r1, 0
    3b74:	0be7      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&HWD_ERR_ST)==HWD_ERR_ST)		//Hardware Divider divisor = 0 interrupt
    3b76:	3280      	movi      	r2, 128
    3b78:	9323      	ld.w      	r1, (r3, 0xc)
    3b7a:	4245      	lsli      	r2, r2, 5
    3b7c:	6848      	and      	r1, r2
    3b7e:	3940      	cmpnei      	r1, 0
    3b80:	0be1      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EFL_ERR_ST)==EFL_ERR_ST)		//Flash check fail interrupt
    3b82:	3280      	movi      	r2, 128
    3b84:	9323      	ld.w      	r1, (r3, 0xc)
    3b86:	4246      	lsli      	r2, r2, 6
    3b88:	6848      	and      	r1, r2
    3b8a:	3940      	cmpnei      	r1, 0
    3b8c:	0bdb      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&OPTERR_INT)==OPTERR_INT)		//Option load fail interrupt
    3b8e:	3280      	movi      	r2, 128
    3b90:	9323      	ld.w      	r1, (r3, 0xc)
    3b92:	4247      	lsli      	r2, r2, 7
    3b94:	6848      	and      	r1, r2
    3b96:	3940      	cmpnei      	r1, 0
    3b98:	0bd5      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_CMLST_ST)==EM_CMLST_ST)	//EMOSC clock monitor fail interrupt
    3b9a:	3280      	movi      	r2, 128
    3b9c:	9323      	ld.w      	r1, (r3, 0xc)
    3b9e:	424b      	lsli      	r2, r2, 11
    3ba0:	6848      	and      	r1, r2
    3ba2:	3940      	cmpnei      	r1, 0
    3ba4:	0bcf      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG0_ST)==EM_EVTRG0_ST)	//Event Trigger Channel 0 Interrupt
    3ba6:	3280      	movi      	r2, 128
    3ba8:	9323      	ld.w      	r1, (r3, 0xc)
    3baa:	424c      	lsli      	r2, r2, 12
    3bac:	6848      	and      	r1, r2
    3bae:	3940      	cmpnei      	r1, 0
    3bb0:	0bc9      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG1_ST)==EM_EVTRG1_ST)	//Event Trigger Channel 1 Interrupt
    3bb2:	3280      	movi      	r2, 128
    3bb4:	9323      	ld.w      	r1, (r3, 0xc)
    3bb6:	424d      	lsli      	r2, r2, 13
    3bb8:	6848      	and      	r1, r2
    3bba:	3940      	cmpnei      	r1, 0
    3bbc:	0bc3      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG2_ST)==EM_EVTRG2_ST)	//Event Trigger Channel 2 Interrupt
    3bbe:	3280      	movi      	r2, 128
    3bc0:	9323      	ld.w      	r1, (r3, 0xc)
    3bc2:	424e      	lsli      	r2, r2, 14
    3bc4:	6848      	and      	r1, r2
    3bc6:	3940      	cmpnei      	r1, 0
    3bc8:	0bbd      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG3_ST)==EM_EVTRG3_ST)	//Event Trigger Channel 3 Interrupt
    3bca:	3280      	movi      	r2, 128
    3bcc:	9323      	ld.w      	r1, (r3, 0xc)
    3bce:	424f      	lsli      	r2, r2, 15
    3bd0:	6848      	and      	r1, r2
    3bd2:	3940      	cmpnei      	r1, 0
    3bd4:	0bb7      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)		//Command error interrupt
    3bd6:	3280      	movi      	r2, 128
    3bd8:	9323      	ld.w      	r1, (r3, 0xc)
    3bda:	4256      	lsli      	r2, r2, 22
    3bdc:	6848      	and      	r1, r2
    3bde:	3940      	cmpnei      	r1, 0
    3be0:	0bb1      	bt      	0x3b42	// 3b42 <SYSCONIntHandler+0x42>
    3be2:	079b      	br      	0x3b18	// 3b18 <SYSCONIntHandler+0x18>

00003be4 <IFCIntHandler>:
//IFC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void IFCIntHandler(void) 
{
    3be4:	1460      	nie
    3be6:	1462      	ipush
    // ISR content ...
	if(IFC->MISR&ERS_END_INT)			
    3be8:	027e      	lrw      	r3, 0x20000074	// 3e6c <EPTIntHandler+0x20>
    3bea:	3101      	movi      	r1, 1
    3bec:	9360      	ld.w      	r3, (r3, 0x0)
    3bee:	934b      	ld.w      	r2, (r3, 0x2c)
    3bf0:	6884      	and      	r2, r1
    3bf2:	3a40      	cmpnei      	r2, 0
    3bf4:	0c04      	bf      	0x3bfc	// 3bfc <IFCIntHandler+0x18>
	{
		IFC->ICR=RGM_END_INT;
	}
	else if(IFC->MISR&PEP_END_INT)		
	{
		IFC->ICR=PEP_END_INT;
    3bf6:	b32c      	st.w      	r1, (r3, 0x30)
	}
	else if(IFC->MISR&OVW_ERR_INT)		
	{
		IFC->ICR=OVW_ERR_INT;
	}
}
    3bf8:	1463      	ipop
    3bfa:	1461      	nir
	else if(IFC->MISR&RGM_END_INT)		
    3bfc:	934b      	ld.w      	r2, (r3, 0x2c)
    3bfe:	3102      	movi      	r1, 2
    3c00:	6884      	and      	r2, r1
    3c02:	3a40      	cmpnei      	r2, 0
    3c04:	0bf9      	bt      	0x3bf6	// 3bf6 <IFCIntHandler+0x12>
	else if(IFC->MISR&PEP_END_INT)		
    3c06:	934b      	ld.w      	r2, (r3, 0x2c)
    3c08:	3104      	movi      	r1, 4
    3c0a:	6884      	and      	r2, r1
    3c0c:	3a40      	cmpnei      	r2, 0
    3c0e:	0bf4      	bt      	0x3bf6	// 3bf6 <IFCIntHandler+0x12>
	else if(IFC->MISR&PROT_ERR_INT)		
    3c10:	3280      	movi      	r2, 128
    3c12:	932b      	ld.w      	r1, (r3, 0x2c)
    3c14:	4245      	lsli      	r2, r2, 5
    3c16:	6848      	and      	r1, r2
    3c18:	3940      	cmpnei      	r1, 0
    3c1a:	0c03      	bf      	0x3c20	// 3c20 <IFCIntHandler+0x3c>
		IFC->ICR=OVW_ERR_INT;
    3c1c:	b34c      	st.w      	r2, (r3, 0x30)
}
    3c1e:	07ed      	br      	0x3bf8	// 3bf8 <IFCIntHandler+0x14>
	else if(IFC->MISR&UDEF_ERR_INT)		
    3c20:	3280      	movi      	r2, 128
    3c22:	932b      	ld.w      	r1, (r3, 0x2c)
    3c24:	4246      	lsli      	r2, r2, 6
    3c26:	6848      	and      	r1, r2
    3c28:	3940      	cmpnei      	r1, 0
    3c2a:	0bf9      	bt      	0x3c1c	// 3c1c <IFCIntHandler+0x38>
	else if(IFC->MISR&ADDR_ERR_INT)		
    3c2c:	3280      	movi      	r2, 128
    3c2e:	932b      	ld.w      	r1, (r3, 0x2c)
    3c30:	4247      	lsli      	r2, r2, 7
    3c32:	6848      	and      	r1, r2
    3c34:	3940      	cmpnei      	r1, 0
    3c36:	0bf3      	bt      	0x3c1c	// 3c1c <IFCIntHandler+0x38>
	else if(IFC->MISR&OVW_ERR_INT)		
    3c38:	3280      	movi      	r2, 128
    3c3a:	932b      	ld.w      	r1, (r3, 0x2c)
    3c3c:	4248      	lsli      	r2, r2, 8
    3c3e:	6848      	and      	r1, r2
    3c40:	3940      	cmpnei      	r1, 0
    3c42:	0bed      	bt      	0x3c1c	// 3c1c <IFCIntHandler+0x38>
    3c44:	07da      	br      	0x3bf8	// 3bf8 <IFCIntHandler+0x14>

00003c46 <ADCIntHandler>:
//ADC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void ADCIntHandler(void) 
{
    3c46:	1460      	nie
    3c48:	1462      	ipush
    // ISR content ...
	if((ADC0->SR&ADC12_EOC)==ADC12_EOC)
    3c4a:	0375      	lrw      	r3, 0x20000068	// 3e70 <EPTIntHandler+0x24>
    3c4c:	3101      	movi      	r1, 1
    3c4e:	9360      	ld.w      	r3, (r3, 0x0)
    3c50:	9348      	ld.w      	r2, (r3, 0x20)
    3c52:	6884      	and      	r2, r1
    3c54:	3a40      	cmpnei      	r2, 0
    3c56:	0c03      	bf      	0x3c5c	// 3c5c <ADCIntHandler+0x16>
	{
		ADC0->CSR = ADC12_CMP1H;
	}
	else if((ADC0->SR&ADC12_CMP1L)==ADC12_CMP1L)
	{
		ADC0->CSR = ADC12_CMP1L;
    3c58:	b327      	st.w      	r1, (r3, 0x1c)
	}
}
    3c5a:	041f      	br      	0x3c98	// 3c98 <ADCIntHandler+0x52>
	else if((ADC0->SR&ADC12_READY)==ADC12_READY)
    3c5c:	9348      	ld.w      	r2, (r3, 0x20)
    3c5e:	3102      	movi      	r1, 2
    3c60:	6884      	and      	r2, r1
    3c62:	3a40      	cmpnei      	r2, 0
    3c64:	0bfa      	bt      	0x3c58	// 3c58 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_OVR)==ADC12_OVR)
    3c66:	9348      	ld.w      	r2, (r3, 0x20)
    3c68:	3104      	movi      	r1, 4
    3c6a:	6884      	and      	r2, r1
    3c6c:	3a40      	cmpnei      	r2, 0
    3c6e:	0bf5      	bt      	0x3c58	// 3c58 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP0H)==ADC12_CMP0H)
    3c70:	9348      	ld.w      	r2, (r3, 0x20)
    3c72:	3110      	movi      	r1, 16
    3c74:	6884      	and      	r2, r1
    3c76:	3a40      	cmpnei      	r2, 0
    3c78:	0bf0      	bt      	0x3c58	// 3c58 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP0L)==ADC12_CMP0L)
    3c7a:	9348      	ld.w      	r2, (r3, 0x20)
    3c7c:	3120      	movi      	r1, 32
    3c7e:	6884      	and      	r2, r1
    3c80:	3a40      	cmpnei      	r2, 0
    3c82:	0beb      	bt      	0x3c58	// 3c58 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP1H)==ADC12_CMP1H)
    3c84:	9348      	ld.w      	r2, (r3, 0x20)
    3c86:	3140      	movi      	r1, 64
    3c88:	6884      	and      	r2, r1
    3c8a:	3a40      	cmpnei      	r2, 0
    3c8c:	0be6      	bt      	0x3c58	// 3c58 <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP1L)==ADC12_CMP1L)
    3c8e:	9348      	ld.w      	r2, (r3, 0x20)
    3c90:	3180      	movi      	r1, 128
    3c92:	6884      	and      	r2, r1
    3c94:	3a40      	cmpnei      	r2, 0
    3c96:	0be1      	bt      	0x3c58	// 3c58 <ADCIntHandler+0x12>
}
    3c98:	1463      	ipop
    3c9a:	1461      	nir

00003c9c <EXI0IntHandler>:
//EXI0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0IntHandler(void) 
{
    3c9c:	1460      	nie
    3c9e:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN0)==EXI_PIN0) 
    3ca0:	1372      	lrw      	r3, 0x20000070	// 3e68 <EPTIntHandler+0x1c>
    3ca2:	3101      	movi      	r1, 1
    3ca4:	9360      	ld.w      	r3, (r3, 0x0)
    3ca6:	237f      	addi      	r3, 128
    3ca8:	934c      	ld.w      	r2, (r3, 0x30)
    3caa:	6884      	and      	r2, r1
    3cac:	3a40      	cmpnei      	r2, 0
    3cae:	0c04      	bf      	0x3cb6	// 3cb6 <EXI0IntHandler+0x1a>
    {
        SYSCON->EXICR = EXI_PIN0;
    3cb0:	b32b      	st.w      	r1, (r3, 0x2c)
    }
	else if ((SYSCON->EXIRS&EXI_PIN16)==EXI_PIN16) 		//EXT16 Interrupt
	{
		SYSCON->EXICR = EXI_PIN16;
	}
}
    3cb2:	1463      	ipop
    3cb4:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN16)==EXI_PIN16) 		//EXT16 Interrupt
    3cb6:	3280      	movi      	r2, 128
    3cb8:	932c      	ld.w      	r1, (r3, 0x30)
    3cba:	4249      	lsli      	r2, r2, 9
    3cbc:	6848      	and      	r1, r2
    3cbe:	3940      	cmpnei      	r1, 0
    3cc0:	0ff9      	bf      	0x3cb2	// 3cb2 <EXI0IntHandler+0x16>
		SYSCON->EXICR = EXI_PIN16;
    3cc2:	b34b      	st.w      	r2, (r3, 0x2c)
}
    3cc4:	07f7      	br      	0x3cb2	// 3cb2 <EXI0IntHandler+0x16>

00003cc6 <EXI1IntHandler>:
//EXI1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1IntHandler(void) 
{
    3cc6:	1460      	nie
    3cc8:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN1)==EXI_PIN1) 
    3cca:	1368      	lrw      	r3, 0x20000070	// 3e68 <EPTIntHandler+0x1c>
    3ccc:	3102      	movi      	r1, 2
    3cce:	9360      	ld.w      	r3, (r3, 0x0)
    3cd0:	237f      	addi      	r3, 128
    3cd2:	934c      	ld.w      	r2, (r3, 0x30)
    3cd4:	6884      	and      	r2, r1
    3cd6:	3a40      	cmpnei      	r2, 0
    3cd8:	0c04      	bf      	0x3ce0	// 3ce0 <EXI1IntHandler+0x1a>
    {
        SYSCON->EXICR = EXI_PIN1;
    3cda:	b32b      	st.w      	r1, (r3, 0x2c)
    }
	else if ((SYSCON->EXIRS&EXI_PIN17)==EXI_PIN17) 		//EXT17 Interrupt
	{
		SYSCON->EXICR = EXI_PIN17;
	}
}
    3cdc:	1463      	ipop
    3cde:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN17)==EXI_PIN17) 		//EXT17 Interrupt
    3ce0:	3280      	movi      	r2, 128
    3ce2:	932c      	ld.w      	r1, (r3, 0x30)
    3ce4:	424a      	lsli      	r2, r2, 10
    3ce6:	6848      	and      	r1, r2
    3ce8:	3940      	cmpnei      	r1, 0
    3cea:	0ff9      	bf      	0x3cdc	// 3cdc <EXI1IntHandler+0x16>
		SYSCON->EXICR = EXI_PIN17;
    3cec:	b34b      	st.w      	r2, (r3, 0x2c)
}
    3cee:	07f7      	br      	0x3cdc	// 3cdc <EXI1IntHandler+0x16>

00003cf0 <EXI2to3IntHandler>:
//EXI2~EXI3 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2to3IntHandler(void) 
{
    3cf0:	1460      	nie
    3cf2:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN2)==EXI_PIN2) 
    3cf4:	127d      	lrw      	r3, 0x20000070	// 3e68 <EPTIntHandler+0x1c>
    3cf6:	3104      	movi      	r1, 4
    3cf8:	9360      	ld.w      	r3, (r3, 0x0)
    3cfa:	237f      	addi      	r3, 128
    3cfc:	934c      	ld.w      	r2, (r3, 0x30)
    3cfe:	6884      	and      	r2, r1
    3d00:	3a40      	cmpnei      	r2, 0
    3d02:	0c04      	bf      	0x3d0a	// 3d0a <EXI2to3IntHandler+0x1a>
    {
        SYSCON->EXICR = EXI_PIN2;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 
    {
        SYSCON->EXICR = EXI_PIN3;
    3d04:	b32b      	st.w      	r1, (r3, 0x2c)
	}
	else if ((SYSCON->EXIRS&EXI_PIN19)==EXI_PIN19) 		//EXT19 Interrupt
	{
		SYSCON->EXICR = EXI_PIN19;
	}
}
    3d06:	1463      	ipop
    3d08:	1461      	nir
    else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 
    3d0a:	934c      	ld.w      	r2, (r3, 0x30)
    3d0c:	3108      	movi      	r1, 8
    3d0e:	6884      	and      	r2, r1
    3d10:	3a40      	cmpnei      	r2, 0
    3d12:	0bf9      	bt      	0x3d04	// 3d04 <EXI2to3IntHandler+0x14>
	else if ((SYSCON->EXIRS&EXI_PIN18)==EXI_PIN18) 		//EXT18 Interrupt
    3d14:	3280      	movi      	r2, 128
    3d16:	932c      	ld.w      	r1, (r3, 0x30)
    3d18:	424b      	lsli      	r2, r2, 11
    3d1a:	6848      	and      	r1, r2
    3d1c:	3940      	cmpnei      	r1, 0
    3d1e:	0c03      	bf      	0x3d24	// 3d24 <EXI2to3IntHandler+0x34>
		SYSCON->EXICR = EXI_PIN19;
    3d20:	b34b      	st.w      	r2, (r3, 0x2c)
}
    3d22:	07f2      	br      	0x3d06	// 3d06 <EXI2to3IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN19)==EXI_PIN19) 		//EXT19 Interrupt
    3d24:	3280      	movi      	r2, 128
    3d26:	932c      	ld.w      	r1, (r3, 0x30)
    3d28:	424c      	lsli      	r2, r2, 12
    3d2a:	6848      	and      	r1, r2
    3d2c:	3940      	cmpnei      	r1, 0
    3d2e:	0bf9      	bt      	0x3d20	// 3d20 <EXI2to3IntHandler+0x30>
    3d30:	07eb      	br      	0x3d06	// 3d06 <EXI2to3IntHandler+0x16>

00003d32 <EXI4to9IntHandler>:
//EXI4~EXI9 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI4to9IntHandler(void) 
{
    3d32:	1460      	nie
    3d34:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN4)==EXI_PIN4) 
    3d36:	126d      	lrw      	r3, 0x20000070	// 3e68 <EPTIntHandler+0x1c>
    3d38:	3280      	movi      	r2, 128
    3d3a:	9360      	ld.w      	r3, (r3, 0x0)
    3d3c:	60c8      	addu      	r3, r2
    3d3e:	932c      	ld.w      	r1, (r3, 0x30)
    3d40:	3010      	movi      	r0, 16
    3d42:	6840      	and      	r1, r0
    3d44:	3940      	cmpnei      	r1, 0
    3d46:	0c04      	bf      	0x3d4e	// 3d4e <EXI4to9IntHandler+0x1c>
    {
        SYSCON->EXICR = EXI_PIN5;
    } 
    else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
    {
        SYSCON->EXICR = EXI_PIN6;
    3d48:	b30b      	st.w      	r0, (r3, 0x2c)
    }
	else if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 
	{
        SYSCON->EXICR = EXI_PIN9;
	}
}
    3d4a:	1463      	ipop
    3d4c:	1461      	nir
    else if ((SYSCON->EXIRS&EXI_PIN5)==EXI_PIN5) 
    3d4e:	932c      	ld.w      	r1, (r3, 0x30)
    3d50:	3020      	movi      	r0, 32
    3d52:	6840      	and      	r1, r0
    3d54:	3940      	cmpnei      	r1, 0
    3d56:	0bf9      	bt      	0x3d48	// 3d48 <EXI4to9IntHandler+0x16>
    else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
    3d58:	932c      	ld.w      	r1, (r3, 0x30)
    3d5a:	3040      	movi      	r0, 64
    3d5c:	6840      	and      	r1, r0
    3d5e:	3940      	cmpnei      	r1, 0
    3d60:	0bf4      	bt      	0x3d48	// 3d48 <EXI4to9IntHandler+0x16>
    else if ((SYSCON->EXIRS&EXI_PIN7)==EXI_PIN7) 
    3d62:	932c      	ld.w      	r1, (r3, 0x30)
    3d64:	6848      	and      	r1, r2
    3d66:	3940      	cmpnei      	r1, 0
    3d68:	0c03      	bf      	0x3d6e	// 3d6e <EXI4to9IntHandler+0x3c>
        SYSCON->EXICR = EXI_PIN9;
    3d6a:	b34b      	st.w      	r2, (r3, 0x2c)
}
    3d6c:	07ef      	br      	0x3d4a	// 3d4a <EXI4to9IntHandler+0x18>
    else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 
    3d6e:	3280      	movi      	r2, 128
    3d70:	932c      	ld.w      	r1, (r3, 0x30)
    3d72:	4241      	lsli      	r2, r2, 1
    3d74:	6848      	and      	r1, r2
    3d76:	3940      	cmpnei      	r1, 0
    3d78:	0bf9      	bt      	0x3d6a	// 3d6a <EXI4to9IntHandler+0x38>
	else if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 
    3d7a:	3280      	movi      	r2, 128
    3d7c:	932c      	ld.w      	r1, (r3, 0x30)
    3d7e:	4242      	lsli      	r2, r2, 2
    3d80:	6848      	and      	r1, r2
    3d82:	3940      	cmpnei      	r1, 0
    3d84:	0bf3      	bt      	0x3d6a	// 3d6a <EXI4to9IntHandler+0x38>
    3d86:	07e2      	br      	0x3d4a	// 3d4a <EXI4to9IntHandler+0x18>

00003d88 <EXI10to15IntHandler>:
//EXI10~EXI15 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI10to15IntHandler(void) 
{
    3d88:	1460      	nie
    3d8a:	1462      	ipush
    if ((SYSCON->EXIRS&EXI_PIN10)==EXI_PIN10) 
    3d8c:	1177      	lrw      	r3, 0x20000070	// 3e68 <EPTIntHandler+0x1c>
    3d8e:	3280      	movi      	r2, 128
    3d90:	9360      	ld.w      	r3, (r3, 0x0)
    3d92:	237f      	addi      	r3, 128
    3d94:	932c      	ld.w      	r1, (r3, 0x30)
    3d96:	4243      	lsli      	r2, r2, 3
    3d98:	6848      	and      	r1, r2
    3d9a:	3940      	cmpnei      	r1, 0
    3d9c:	0c03      	bf      	0x3da2	// 3da2 <EXI10to15IntHandler+0x1a>
    {
        SYSCON->EXICR = EXI_PIN14;
    }
	else if ((SYSCON->EXIRS&EXI_PIN15)==EXI_PIN15) 
	{
        SYSCON->EXICR = EXI_PIN15;
    3d9e:	b34b      	st.w      	r2, (r3, 0x2c)
    }
}
    3da0:	041f      	br      	0x3dde	// 3dde <EXI10to15IntHandler+0x56>
    else if ((SYSCON->EXIRS&EXI_PIN11)==EXI_PIN11) 
    3da2:	3280      	movi      	r2, 128
    3da4:	932c      	ld.w      	r1, (r3, 0x30)
    3da6:	4244      	lsli      	r2, r2, 4
    3da8:	6848      	and      	r1, r2
    3daa:	3940      	cmpnei      	r1, 0
    3dac:	0bf9      	bt      	0x3d9e	// 3d9e <EXI10to15IntHandler+0x16>
    else if ((SYSCON->EXIRS&EXI_PIN12)==EXI_PIN12) 
    3dae:	3280      	movi      	r2, 128
    3db0:	932c      	ld.w      	r1, (r3, 0x30)
    3db2:	4245      	lsli      	r2, r2, 5
    3db4:	6848      	and      	r1, r2
    3db6:	3940      	cmpnei      	r1, 0
    3db8:	0bf3      	bt      	0x3d9e	// 3d9e <EXI10to15IntHandler+0x16>
    else if ((SYSCON->EXIRS&EXI_PIN13)==EXI_PIN13) 
    3dba:	3280      	movi      	r2, 128
    3dbc:	932c      	ld.w      	r1, (r3, 0x30)
    3dbe:	4246      	lsli      	r2, r2, 6
    3dc0:	6848      	and      	r1, r2
    3dc2:	3940      	cmpnei      	r1, 0
    3dc4:	0bed      	bt      	0x3d9e	// 3d9e <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN14)==EXI_PIN14) 
    3dc6:	3280      	movi      	r2, 128
    3dc8:	932c      	ld.w      	r1, (r3, 0x30)
    3dca:	4247      	lsli      	r2, r2, 7
    3dcc:	6848      	and      	r1, r2
    3dce:	3940      	cmpnei      	r1, 0
    3dd0:	0be7      	bt      	0x3d9e	// 3d9e <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN15)==EXI_PIN15) 
    3dd2:	3280      	movi      	r2, 128
    3dd4:	932c      	ld.w      	r1, (r3, 0x30)
    3dd6:	4248      	lsli      	r2, r2, 8
    3dd8:	6848      	and      	r1, r2
    3dda:	3940      	cmpnei      	r1, 0
    3ddc:	0be1      	bt      	0x3d9e	// 3d9e <EXI10to15IntHandler+0x16>
}
    3dde:	1463      	ipop
    3de0:	1461      	nir

00003de2 <WWDTHandler>:
//WWDT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void WWDTHandler(void)
{
    3de2:	1460      	nie
    3de4:	1462      	ipush
    3de6:	14d0      	push      	r15
	
	WWDT_CNT_Load(0xFF);
    3de8:	30ff      	movi      	r0, 255
    3dea:	e3ffebd0 	bsr      	0x158a	// 158a <WWDT_CNT_Load>
	if((WWDT->MISR&WWDT_EVI)==WWDT_EVI)					//WWDT EVI interrupt
    3dee:	1162      	lrw      	r3, 0x20000030	// 3e74 <EPTIntHandler+0x28>
    3df0:	3101      	movi      	r1, 1
    3df2:	9360      	ld.w      	r3, (r3, 0x0)
    3df4:	9343      	ld.w      	r2, (r3, 0xc)
    3df6:	6884      	and      	r2, r1
    3df8:	3a40      	cmpnei      	r2, 0
    3dfa:	0c02      	bf      	0x3dfe	// 3dfe <WWDTHandler+0x1c>
	{
		WWDT->ICR = WWDT_EVI;
    3dfc:	b325      	st.w      	r1, (r3, 0x14)
	} 
	WWDT->ICR=0X01;
    3dfe:	3201      	movi      	r2, 1
    3e00:	b345      	st.w      	r2, (r3, 0x14)
}
    3e02:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    3e06:	1401      	addi      	r14, r14, 4
    3e08:	1463      	ipop
    3e0a:	1461      	nir

00003e0c <USART0IntHandler>:
//USART0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void USART0IntHandler(void) 
{
    3e0c:	1460      	nie
    3e0e:	1462      	ipush
    // ISR content ...
	unsigned int status;
	status = USART0->MISR & USART0->IMSCR ;
    3e10:	107a      	lrw      	r3, 0x2000002c	// 3e78 <EPTIntHandler+0x2c>
    3e12:	9320      	ld.w      	r1, (r3, 0x0)
    3e14:	9167      	ld.w      	r3, (r1, 0x1c)
    3e16:	9145      	ld.w      	r2, (r1, 0x14)
    3e18:	68c8      	and      	r3, r2
	if( status & USART_RXRDY ) 
    3e1a:	3201      	movi      	r2, 1
    3e1c:	68c8      	and      	r3, r2
    3e1e:	3b40      	cmpnei      	r3, 0
    3e20:	0c14      	bf      	0x3e48	// 3e48 <USART0IntHandler+0x3c>
	{
	   r_usrat_cont++;
    3e22:	1077      	lrw      	r3, 0x200000f4	// 3e7c <EPTIntHandler+0x30>
    3e24:	8340      	ld.b      	r2, (r3, 0x0)
    3e26:	2200      	addi      	r2, 1
    3e28:	7488      	zextb      	r2, r2
    3e2a:	a340      	st.b      	r2, (r3, 0x0)
		if(r_usrat_cont>=3)
    3e2c:	8340      	ld.b      	r2, (r3, 0x0)
    3e2e:	7488      	zextb      	r2, r2
    3e30:	3a02      	cmphsi      	r2, 3
    3e32:	0c03      	bf      	0x3e38	// 3e38 <USART0IntHandler+0x2c>
		{
			r_usrat_cont=0;
    3e34:	3200      	movi      	r2, 0
    3e36:	a340      	st.b      	r2, (r3, 0x0)
		}
		r_usart_buf[r_usrat_cont]=CSP_USART_GET_RHR(USART0);
    3e38:	8360      	ld.b      	r3, (r3, 0x0)
    3e3a:	1012      	lrw      	r0, 0x200000c3	// 3e80 <EPTIntHandler+0x34>
    3e3c:	60c0      	addu      	r3, r0
    3e3e:	914a      	ld.w      	r2, (r1, 0x28)
    3e40:	7488      	zextb      	r2, r2
    3e42:	a340      	st.b      	r2, (r3, 0x0)
		CSP_USART_SET_ICR(USART0, USART_RXRDY);
    3e44:	3301      	movi      	r3, 1
    3e46:	b168      	st.w      	r3, (r1, 0x20)
	}
	if (status & USART_TXRDY) 
	{
		//CSP_USART_SET_ICR(USART0, USART_TXRDY);
	}
}
    3e48:	1463      	ipop
    3e4a:	1461      	nir

00003e4c <EPTIntHandler>:
//EPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPTIntHandler(void) 
{
    3e4c:	1460      	nie
    3e4e:	1462      	ipush
    3e50:	14d1      	push      	r4, r15
    // ISR content ...
	if((EPT0->MISR&EPT_TRGEV0_INT)==EPT_TRGEV0_INT)			//TRGEV0 interrupt
    3e52:	108d      	lrw      	r4, 0x20000034	// 3e84 <EPTIntHandler+0x38>
    3e54:	3280      	movi      	r2, 128
    3e56:	9460      	ld.w      	r3, (r4, 0x0)
    3e58:	60c8      	addu      	r3, r2
    3e5a:	9335      	ld.w      	r1, (r3, 0x54)
    3e5c:	3001      	movi      	r0, 1
    3e5e:	6840      	and      	r1, r0
    3e60:	3940      	cmpnei      	r1, 0
    3e62:	0c13      	bf      	0x3e88	// 3e88 <EPTIntHandler+0x3c>
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIFT);
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
	}
	else if((EPT0->MISR&EPT_CAP_LD2)==EPT_CAP_LD2)			//Capture Load to CMPC interrupt
	{
		EPT0->ICR=EPT_CAP_LD2;
    3e64:	b317      	st.w      	r0, (r3, 0x5c)
    3e66:	0434      	br      	0x3ece	// 3ece <EPTIntHandler+0x82>
    3e68:	20000070 	.long	0x20000070
    3e6c:	20000074 	.long	0x20000074
    3e70:	20000068 	.long	0x20000068
    3e74:	20000030 	.long	0x20000030
    3e78:	2000002c 	.long	0x2000002c
    3e7c:	200000f4 	.long	0x200000f4
    3e80:	200000c3 	.long	0x200000c3
    3e84:	20000034 	.long	0x20000034
	else if((EPT0->MISR&EPT_TRGEV1_INT)==EPT_TRGEV1_INT)	//TRGEV1 interrupt
    3e88:	9335      	ld.w      	r1, (r3, 0x54)
    3e8a:	3002      	movi      	r0, 2
    3e8c:	6840      	and      	r1, r0
    3e8e:	3940      	cmpnei      	r1, 0
    3e90:	0bea      	bt      	0x3e64	// 3e64 <EPTIntHandler+0x18>
	else if((EPT0->MISR&EPT_TRGEV2_INT)==EPT_TRGEV2_INT)	//TRGEV2 interrupt
    3e92:	9335      	ld.w      	r1, (r3, 0x54)
    3e94:	3004      	movi      	r0, 4
    3e96:	6840      	and      	r1, r0
    3e98:	3940      	cmpnei      	r1, 0
    3e9a:	0be5      	bt      	0x3e64	// 3e64 <EPTIntHandler+0x18>
	else if((EPT0->MISR&EPT_TRGEV3_INT)==EPT_TRGEV3_INT)	//TRGEV3 interrupt
    3e9c:	9335      	ld.w      	r1, (r3, 0x54)
    3e9e:	3008      	movi      	r0, 8
    3ea0:	6840      	and      	r1, r0
    3ea2:	3940      	cmpnei      	r1, 0
    3ea4:	0be0      	bt      	0x3e64	// 3e64 <EPTIntHandler+0x18>
	else if((EPT0->MISR&EPT_CAP_LD0)==EPT_CAP_LD0)			//Capture Load to CMPA interrupt
    3ea6:	9335      	ld.w      	r1, (r3, 0x54)
    3ea8:	3010      	movi      	r0, 16
    3eaa:	6840      	and      	r1, r0
    3eac:	3940      	cmpnei      	r1, 0
    3eae:	0c1f      	bf      	0x3eec	// 3eec <EPTIntHandler+0xa0>
		EPT0->ICR=EPT_CAP_LD0;
    3eb0:	b317      	st.w      	r0, (r3, 0x5c)
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIRT);
    3eb2:	3200      	movi      	r2, 0
    3eb4:	3101      	movi      	r1, 1
    3eb6:	3000      	movi      	r0, 0
    3eb8:	e3ffecbe 	bsr      	0x1834	// 1834 <EXTI_trigger_CMD>
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIFT);
    3ebc:	3201      	movi      	r2, 1
    3ebe:	3101      	movi      	r1, 1
    3ec0:	3001      	movi      	r0, 1
    3ec2:	e3ffecb9 	bsr      	0x1834	// 1834 <EXTI_trigger_CMD>
		R_CMPA_BUF=EPT0->CMPA;			//Low voltage counter
    3ec6:	9460      	ld.w      	r3, (r4, 0x0)
    3ec8:	934b      	ld.w      	r2, (r3, 0x2c)
    3eca:	007d      	lrw      	r3, 0x200000f8	// 4250 <Trap3Handler+0xe>
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
    3ecc:	b340      	st.w      	r2, (r3, 0x0)
	else if((EPT0->MISR&EPT_PEND)==EPT_PEND)				//End of cycle interrupt
	{
		EPT0->ICR=EPT_PEND;
	}
	//Emergency interruption
	if((EPT0->EMMISR&EPT_EP0_EMINT)==EPT_EP0_EMINT)			//interrupt flag of EP0 event
    3ece:	9460      	ld.w      	r3, (r4, 0x0)
    3ed0:	3280      	movi      	r2, 128
    3ed2:	60c8      	addu      	r3, r2
    3ed4:	932b      	ld.w      	r1, (r3, 0x2c)
    3ed6:	3001      	movi      	r0, 1
    3ed8:	6840      	and      	r1, r0
    3eda:	3940      	cmpnei      	r1, 0
    3edc:	0c5e      	bf      	0x3f98	// 3f98 <EPTIntHandler+0x14c>
	{
		EPT0->EMICR=EPT_EP5_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP6_EMINT)==EPT_EP6_EMINT)	//interrupt flag of EP6 event
	{
		EPT0->EMICR=EPT_EP6_EMINT;
    3ede:	b30d      	st.w      	r0, (r3, 0x34)
	}
	else if((EPT0->EMMISR&EPT_EOM_FAULT_EMINT)==EPT_EOM_FAULT_EMINT)	//interrupt flag of EOM_FAULT event
	{
		EPT0->EMICR=EPT_EOM_FAULT_EMINT;
	}
}
    3ee0:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    3ee4:	9880      	ld.w      	r4, (r14, 0x0)
    3ee6:	1402      	addi      	r14, r14, 8
    3ee8:	1463      	ipop
    3eea:	1461      	nir
	else if((EPT0->MISR&EPT_CAP_LD1)==EPT_CAP_LD1)			//Capture Load to CMPB interrupt
    3eec:	9335      	ld.w      	r1, (r3, 0x54)
    3eee:	3020      	movi      	r0, 32
    3ef0:	6840      	and      	r1, r0
    3ef2:	3940      	cmpnei      	r1, 0
    3ef4:	0c10      	bf      	0x3f14	// 3f14 <EPTIntHandler+0xc8>
		EPT0->ICR=EPT_CAP_LD1;
    3ef6:	b317      	st.w      	r0, (r3, 0x5c)
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);
    3ef8:	3200      	movi      	r2, 0
    3efa:	3101      	movi      	r1, 1
    3efc:	3001      	movi      	r0, 1
    3efe:	e3ffec9b 	bsr      	0x1834	// 1834 <EXTI_trigger_CMD>
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIFT);
    3f02:	3201      	movi      	r2, 1
    3f04:	3101      	movi      	r1, 1
    3f06:	3000      	movi      	r0, 0
    3f08:	e3ffec96 	bsr      	0x1834	// 1834 <EXTI_trigger_CMD>
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
    3f0c:	9460      	ld.w      	r3, (r4, 0x0)
    3f0e:	934c      	ld.w      	r2, (r3, 0x30)
    3f10:	016e      	lrw      	r3, 0x200000ac	// 4254 <Trap3Handler+0x12>
    3f12:	07dd      	br      	0x3ecc	// 3ecc <EPTIntHandler+0x80>
	else if((EPT0->MISR&EPT_CAP_LD2)==EPT_CAP_LD2)			//Capture Load to CMPC interrupt
    3f14:	9335      	ld.w      	r1, (r3, 0x54)
    3f16:	3040      	movi      	r0, 64
    3f18:	6840      	and      	r1, r0
    3f1a:	3940      	cmpnei      	r1, 0
    3f1c:	0ba4      	bt      	0x3e64	// 3e64 <EPTIntHandler+0x18>
	else if((EPT0->MISR&EPT_CAP_LD3)==EPT_CAP_LD3)			//Capture Load to CMPD interrupt
    3f1e:	9335      	ld.w      	r1, (r3, 0x54)
    3f20:	6848      	and      	r1, r2
    3f22:	3940      	cmpnei      	r1, 0
    3f24:	0c03      	bf      	0x3f2a	// 3f2a <EPTIntHandler+0xde>
		EPT0->ICR=EPT_PEND;
    3f26:	b357      	st.w      	r2, (r3, 0x5c)
    3f28:	07d3      	br      	0x3ece	// 3ece <EPTIntHandler+0x82>
	else if((EPT0->MISR&EPT_CAU)==EPT_CAU)					//Up-Counting phase CNT = CMPA interrupt
    3f2a:	3280      	movi      	r2, 128
    3f2c:	9335      	ld.w      	r1, (r3, 0x54)
    3f2e:	4241      	lsli      	r2, r2, 1
    3f30:	6848      	and      	r1, r2
    3f32:	3940      	cmpnei      	r1, 0
    3f34:	0bf9      	bt      	0x3f26	// 3f26 <EPTIntHandler+0xda>
	else if((EPT0->MISR&EPT_CAD)==EPT_CAD)					//Down-Counting phase CNT = CMPA interrupt
    3f36:	3280      	movi      	r2, 128
    3f38:	9335      	ld.w      	r1, (r3, 0x54)
    3f3a:	4242      	lsli      	r2, r2, 2
    3f3c:	6848      	and      	r1, r2
    3f3e:	3940      	cmpnei      	r1, 0
    3f40:	0bf3      	bt      	0x3f26	// 3f26 <EPTIntHandler+0xda>
	else if((EPT0->MISR&EPT_CBU)==EPT_CBU)					//Up-Counting phase CNT = CMPB interrupt 
    3f42:	3280      	movi      	r2, 128
    3f44:	9335      	ld.w      	r1, (r3, 0x54)
    3f46:	4243      	lsli      	r2, r2, 3
    3f48:	6848      	and      	r1, r2
    3f4a:	3940      	cmpnei      	r1, 0
    3f4c:	0bed      	bt      	0x3f26	// 3f26 <EPTIntHandler+0xda>
	else if((EPT0->MISR&EPT_CBD)==EPT_CBD)					//Down-Counting phase CNT = CMPB interrupt
    3f4e:	3280      	movi      	r2, 128
    3f50:	9335      	ld.w      	r1, (r3, 0x54)
    3f52:	4244      	lsli      	r2, r2, 4
    3f54:	6848      	and      	r1, r2
    3f56:	3940      	cmpnei      	r1, 0
    3f58:	0be7      	bt      	0x3f26	// 3f26 <EPTIntHandler+0xda>
	else if((EPT0->MISR&EPT_CCU)==EPT_CCU)					//Up-Counting phase CNT = CMPC interrupt 
    3f5a:	3280      	movi      	r2, 128
    3f5c:	9335      	ld.w      	r1, (r3, 0x54)
    3f5e:	4245      	lsli      	r2, r2, 5
    3f60:	6848      	and      	r1, r2
    3f62:	3940      	cmpnei      	r1, 0
    3f64:	0be1      	bt      	0x3f26	// 3f26 <EPTIntHandler+0xda>
	else if((EPT0->MISR&EPT_CCD)==EPT_CCD)					//Down-Counting phase CNT = CMPC interrupt
    3f66:	3280      	movi      	r2, 128
    3f68:	9335      	ld.w      	r1, (r3, 0x54)
    3f6a:	4246      	lsli      	r2, r2, 6
    3f6c:	6848      	and      	r1, r2
    3f6e:	3940      	cmpnei      	r1, 0
    3f70:	0bdb      	bt      	0x3f26	// 3f26 <EPTIntHandler+0xda>
	else if((EPT0->MISR&EPT_CDU)==EPT_CDU)					//Up-Counting phase CNT = CMPD interrupt
    3f72:	3280      	movi      	r2, 128
    3f74:	9335      	ld.w      	r1, (r3, 0x54)
    3f76:	4247      	lsli      	r2, r2, 7
    3f78:	6848      	and      	r1, r2
    3f7a:	3940      	cmpnei      	r1, 0
    3f7c:	0bd5      	bt      	0x3f26	// 3f26 <EPTIntHandler+0xda>
	else if((EPT0->MISR&EPT_CDD)==EPT_CDD)					//Down-Counting phase CNT = CMPD interrupt
    3f7e:	3280      	movi      	r2, 128
    3f80:	9335      	ld.w      	r1, (r3, 0x54)
    3f82:	4248      	lsli      	r2, r2, 8
    3f84:	6848      	and      	r1, r2
    3f86:	3940      	cmpnei      	r1, 0
    3f88:	0bcf      	bt      	0x3f26	// 3f26 <EPTIntHandler+0xda>
	else if((EPT0->MISR&EPT_PEND)==EPT_PEND)				//End of cycle interrupt
    3f8a:	3280      	movi      	r2, 128
    3f8c:	9335      	ld.w      	r1, (r3, 0x54)
    3f8e:	4249      	lsli      	r2, r2, 9
    3f90:	6848      	and      	r1, r2
    3f92:	3940      	cmpnei      	r1, 0
    3f94:	0f9d      	bf      	0x3ece	// 3ece <EPTIntHandler+0x82>
    3f96:	07c8      	br      	0x3f26	// 3f26 <EPTIntHandler+0xda>
	else if((EPT0->EMMISR&EPT_EP1_EMINT)==EPT_EP1_EMINT)	//interrupt flag of EP1 event
    3f98:	932b      	ld.w      	r1, (r3, 0x2c)
    3f9a:	3002      	movi      	r0, 2
    3f9c:	6840      	and      	r1, r0
    3f9e:	3940      	cmpnei      	r1, 0
    3fa0:	0b9f      	bt      	0x3ede	// 3ede <EPTIntHandler+0x92>
	else if((EPT0->EMMISR&EPT_EP2_EMINT)==EPT_EP2_EMINT)	//interrupt flag of EP2 event
    3fa2:	932b      	ld.w      	r1, (r3, 0x2c)
    3fa4:	3004      	movi      	r0, 4
    3fa6:	6840      	and      	r1, r0
    3fa8:	3940      	cmpnei      	r1, 0
    3faa:	0b9a      	bt      	0x3ede	// 3ede <EPTIntHandler+0x92>
	else if((EPT0->EMMISR&EPT_EP3_EMINT)==EPT_EP3_EMINT)	//interrupt flag of EP3 event
    3fac:	932b      	ld.w      	r1, (r3, 0x2c)
    3fae:	3008      	movi      	r0, 8
    3fb0:	6840      	and      	r1, r0
    3fb2:	3940      	cmpnei      	r1, 0
    3fb4:	0b95      	bt      	0x3ede	// 3ede <EPTIntHandler+0x92>
	else if((EPT0->EMMISR&EPT_EP4_EMINT)==EPT_EP4_EMINT)	//interrupt flag of EP4 event
    3fb6:	932b      	ld.w      	r1, (r3, 0x2c)
    3fb8:	3010      	movi      	r0, 16
    3fba:	6840      	and      	r1, r0
    3fbc:	3940      	cmpnei      	r1, 0
    3fbe:	0b90      	bt      	0x3ede	// 3ede <EPTIntHandler+0x92>
	else if((EPT0->EMMISR&EPT_EP5_EMINT)==EPT_EP5_EMINT)	//interrupt flag of EP5 event
    3fc0:	932b      	ld.w      	r1, (r3, 0x2c)
    3fc2:	3020      	movi      	r0, 32
    3fc4:	6840      	and      	r1, r0
    3fc6:	3940      	cmpnei      	r1, 0
    3fc8:	0b8b      	bt      	0x3ede	// 3ede <EPTIntHandler+0x92>
	else if((EPT0->EMMISR&EPT_EP6_EMINT)==EPT_EP6_EMINT)	//interrupt flag of EP6 event
    3fca:	932b      	ld.w      	r1, (r3, 0x2c)
    3fcc:	3040      	movi      	r0, 64
    3fce:	6840      	and      	r1, r0
    3fd0:	3940      	cmpnei      	r1, 0
    3fd2:	0b86      	bt      	0x3ede	// 3ede <EPTIntHandler+0x92>
	else if((EPT0->EMMISR&EPT_EP7_EMINT)==EPT_EP7_EMINT)	//interrupt flag of EP7 event
    3fd4:	932b      	ld.w      	r1, (r3, 0x2c)
    3fd6:	6848      	and      	r1, r2
    3fd8:	3940      	cmpnei      	r1, 0
    3fda:	0c03      	bf      	0x3fe0	// 3fe0 <EPTIntHandler+0x194>
		EPT0->EMICR=EPT_EOM_FAULT_EMINT;
    3fdc:	b34d      	st.w      	r2, (r3, 0x34)
}
    3fde:	0781      	br      	0x3ee0	// 3ee0 <EPTIntHandler+0x94>
	else if((EPT0->EMMISR&EPT_CPU_FAULT_EMINT)==EPT_CPU_FAULT_EMINT)	//interrupt flag of CPU_FAULT event
    3fe0:	3280      	movi      	r2, 128
    3fe2:	932b      	ld.w      	r1, (r3, 0x2c)
    3fe4:	4241      	lsli      	r2, r2, 1
    3fe6:	6848      	and      	r1, r2
    3fe8:	3940      	cmpnei      	r1, 0
    3fea:	0bf9      	bt      	0x3fdc	// 3fdc <EPTIntHandler+0x190>
	else if((EPT0->EMMISR&EPT_MEM_FAULT_EMINT)==EPT_MEM_FAULT_EMINT)	//interrupt flag of MEM_FAULT event
    3fec:	3280      	movi      	r2, 128
    3fee:	932b      	ld.w      	r1, (r3, 0x2c)
    3ff0:	4242      	lsli      	r2, r2, 2
    3ff2:	6848      	and      	r1, r2
    3ff4:	3940      	cmpnei      	r1, 0
    3ff6:	0bf3      	bt      	0x3fdc	// 3fdc <EPTIntHandler+0x190>
	else if((EPT0->EMMISR&EPT_EOM_FAULT_EMINT)==EPT_EOM_FAULT_EMINT)	//interrupt flag of EOM_FAULT event
    3ff8:	3280      	movi      	r2, 128
    3ffa:	932b      	ld.w      	r1, (r3, 0x2c)
    3ffc:	4243      	lsli      	r2, r2, 3
    3ffe:	6848      	and      	r1, r2
    4000:	3940      	cmpnei      	r1, 0
    4002:	0bed      	bt      	0x3fdc	// 3fdc <EPTIntHandler+0x190>
    4004:	076e      	br      	0x3ee0	// 3ee0 <EPTIntHandler+0x94>

00004006 <GPTAIntHandler>:
//GPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPTAIntHandler(void) 
{
    4006:	1460      	nie
    4008:	1462      	ipush
    // ISR content ...
	if((GPTA0->MISR&GPT_INT_TRGEV0)==GPT_INT_TRGEV0)			//TRGEV0 interrupt
    400a:	036b      	lrw      	r3, 0x20000038	// 4258 <Trap3Handler+0x16>
    400c:	3101      	movi      	r1, 1
    400e:	9360      	ld.w      	r3, (r3, 0x0)
    4010:	237f      	addi      	r3, 128
    4012:	9355      	ld.w      	r2, (r3, 0x54)
    4014:	6884      	and      	r2, r1
    4016:	3a40      	cmpnei      	r2, 0
    4018:	0c04      	bf      	0x4020	// 4020 <GPTAIntHandler+0x1a>
	{
		GPTA0->ICR = GPT_INT_CAPLD0;
	}
	else if((GPTA0->MISR&GPT_INT_CAPLD1)==GPT_INT_CAPLD1)		//Capture Load to CMPB interrupt
	{
		GPTA0->ICR = GPT_INT_CAPLD1;
    401a:	b337      	st.w      	r1, (r3, 0x5c)
	}
	else if((GPTA0->MISR&GPT_INT_PEND)==GPT_INT_PEND)		//End of cycle interrupt 
	{
		GPTA0->ICR = GPT_INT_PEND;
	}
}
    401c:	1463      	ipop
    401e:	1461      	nir
	else if((GPTA0->MISR&GPT_INT_TRGEV1)==GPT_INT_TRGEV1)	//TRGEV1 interrupt
    4020:	9355      	ld.w      	r2, (r3, 0x54)
    4022:	3102      	movi      	r1, 2
    4024:	6884      	and      	r2, r1
    4026:	3a40      	cmpnei      	r2, 0
    4028:	0bf9      	bt      	0x401a	// 401a <GPTAIntHandler+0x14>
	else if((GPTA0->MISR&GPT_INT_CAPLD0)==GPT_INT_CAPLD0)		//Capture Load to CMPA interrupt
    402a:	9355      	ld.w      	r2, (r3, 0x54)
    402c:	3110      	movi      	r1, 16
    402e:	6884      	and      	r2, r1
    4030:	3a40      	cmpnei      	r2, 0
    4032:	0bf4      	bt      	0x401a	// 401a <GPTAIntHandler+0x14>
	else if((GPTA0->MISR&GPT_INT_CAPLD1)==GPT_INT_CAPLD1)		//Capture Load to CMPB interrupt
    4034:	9355      	ld.w      	r2, (r3, 0x54)
    4036:	3120      	movi      	r1, 32
    4038:	6884      	and      	r2, r1
    403a:	3a40      	cmpnei      	r2, 0
    403c:	0bef      	bt      	0x401a	// 401a <GPTAIntHandler+0x14>
	else if((GPTA0->MISR&GPT_INT_CAU)==GPT_INT_CAU)			//Up-Counting phase CNT = CMPA Interrupt
    403e:	3280      	movi      	r2, 128
    4040:	9335      	ld.w      	r1, (r3, 0x54)
    4042:	4241      	lsli      	r2, r2, 1
    4044:	6848      	and      	r1, r2
    4046:	3940      	cmpnei      	r1, 0
    4048:	0c03      	bf      	0x404e	// 404e <GPTAIntHandler+0x48>
		GPTA0->ICR = GPT_INT_PEND;
    404a:	b357      	st.w      	r2, (r3, 0x5c)
}
    404c:	07e8      	br      	0x401c	// 401c <GPTAIntHandler+0x16>
	else if((GPTA0->MISR&GPT_INT_CAD)==GPT_INT_CAD)			//Down-Counting phase CNT = CMPA Interrupt
    404e:	3280      	movi      	r2, 128
    4050:	9335      	ld.w      	r1, (r3, 0x54)
    4052:	4242      	lsli      	r2, r2, 2
    4054:	6848      	and      	r1, r2
    4056:	3940      	cmpnei      	r1, 0
    4058:	0bf9      	bt      	0x404a	// 404a <GPTAIntHandler+0x44>
	else if((GPTA0->MISR&GPT_INT_CBU)==GPT_INT_CBU)			//Up-Counting phase CNT = CMPB Interrupt
    405a:	3280      	movi      	r2, 128
    405c:	9335      	ld.w      	r1, (r3, 0x54)
    405e:	4243      	lsli      	r2, r2, 3
    4060:	6848      	and      	r1, r2
    4062:	3940      	cmpnei      	r1, 0
    4064:	0bf3      	bt      	0x404a	// 404a <GPTAIntHandler+0x44>
	else if((GPTA0->MISR&GPT_INT_CBD)==GPT_INT_CBD)			//Down-Counting phase CNT = CMPB Interrupt
    4066:	3280      	movi      	r2, 128
    4068:	9335      	ld.w      	r1, (r3, 0x54)
    406a:	4244      	lsli      	r2, r2, 4
    406c:	6848      	and      	r1, r2
    406e:	3940      	cmpnei      	r1, 0
    4070:	0bed      	bt      	0x404a	// 404a <GPTAIntHandler+0x44>
	else if((GPTA0->MISR&GPT_INT_PEND)==GPT_INT_PEND)		//End of cycle interrupt 
    4072:	3280      	movi      	r2, 128
    4074:	9335      	ld.w      	r1, (r3, 0x54)
    4076:	4249      	lsli      	r2, r2, 9
    4078:	6848      	and      	r1, r2
    407a:	3940      	cmpnei      	r1, 0
    407c:	0be7      	bt      	0x404a	// 404a <GPTAIntHandler+0x44>
    407e:	07cf      	br      	0x401c	// 401c <GPTAIntHandler+0x16>

00004080 <BT0IntHandler>:
//BT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0IntHandler(void) 
{
    4080:	1460      	nie
    4082:	1462      	ipush
    // ISR content ...
	if((BT0->MISR&BT_PEND)==BT_PEND)
    4084:	1376      	lrw      	r3, 0x20000048	// 425c <Trap3Handler+0x1a>
    4086:	3101      	movi      	r1, 1
    4088:	9360      	ld.w      	r3, (r3, 0x0)
    408a:	934c      	ld.w      	r2, (r3, 0x30)
    408c:	6884      	and      	r2, r1
    408e:	3a40      	cmpnei      	r2, 0
    4090:	0c03      	bf      	0x4096	// 4096 <BT0IntHandler+0x16>
	{
		BT0->ICR = BT_OVF;
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT0->ICR = BT_EVTRG;
    4092:	b32d      	st.w      	r1, (r3, 0x34)
	} 
}
    4094:	0410      	br      	0x40b4	// 40b4 <BT0IntHandler+0x34>
	else if((BT0->MISR&BT_CMP)==BT_CMP)
    4096:	934c      	ld.w      	r2, (r3, 0x30)
    4098:	3102      	movi      	r1, 2
    409a:	6884      	and      	r2, r1
    409c:	3a40      	cmpnei      	r2, 0
    409e:	0bfa      	bt      	0x4092	// 4092 <BT0IntHandler+0x12>
	else if((BT0->MISR&BT_OVF)==BT_OVF)
    40a0:	934c      	ld.w      	r2, (r3, 0x30)
    40a2:	3104      	movi      	r1, 4
    40a4:	6884      	and      	r2, r1
    40a6:	3a40      	cmpnei      	r2, 0
    40a8:	0bf5      	bt      	0x4092	// 4092 <BT0IntHandler+0x12>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
    40aa:	934c      	ld.w      	r2, (r3, 0x30)
    40ac:	3108      	movi      	r1, 8
    40ae:	6884      	and      	r2, r1
    40b0:	3a40      	cmpnei      	r2, 0
    40b2:	0bf0      	bt      	0x4092	// 4092 <BT0IntHandler+0x12>
}
    40b4:	1463      	ipop
    40b6:	1461      	nir

000040b8 <BT1IntHandler>:
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1IntHandler(void) 
{
    40b8:	1460      	nie
    40ba:	1462      	ipush
    // ISR content ...
	if((BT1->MISR&BT_PEND)==BT_PEND)
    40bc:	1369      	lrw      	r3, 0x20000044	// 4260 <Trap3Handler+0x1e>
    40be:	3101      	movi      	r1, 1
    40c0:	9360      	ld.w      	r3, (r3, 0x0)
    40c2:	934c      	ld.w      	r2, (r3, 0x30)
    40c4:	6884      	and      	r2, r1
    40c6:	3a40      	cmpnei      	r2, 0
    40c8:	0c03      	bf      	0x40ce	// 40ce <BT1IntHandler+0x16>
	{
		BT1->ICR = BT_OVF;
	} 
	else if((BT1->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT1->ICR = BT_EVTRG;
    40ca:	b32d      	st.w      	r1, (r3, 0x34)
	} 
}
    40cc:	0410      	br      	0x40ec	// 40ec <BT1IntHandler+0x34>
	else if((BT1->MISR&BT_CMP)==BT_CMP)
    40ce:	934c      	ld.w      	r2, (r3, 0x30)
    40d0:	3102      	movi      	r1, 2
    40d2:	6884      	and      	r2, r1
    40d4:	3a40      	cmpnei      	r2, 0
    40d6:	0bfa      	bt      	0x40ca	// 40ca <BT1IntHandler+0x12>
	else if((BT1->MISR&BT_OVF)==BT_OVF)
    40d8:	934c      	ld.w      	r2, (r3, 0x30)
    40da:	3104      	movi      	r1, 4
    40dc:	6884      	and      	r2, r1
    40de:	3a40      	cmpnei      	r2, 0
    40e0:	0bf5      	bt      	0x40ca	// 40ca <BT1IntHandler+0x12>
	else if((BT1->MISR&BT_EVTRG)==BT_EVTRG)
    40e2:	934c      	ld.w      	r2, (r3, 0x30)
    40e4:	3108      	movi      	r1, 8
    40e6:	6884      	and      	r2, r1
    40e8:	3a40      	cmpnei      	r2, 0
    40ea:	0bf0      	bt      	0x40ca	// 40ca <BT1IntHandler+0x12>
}
    40ec:	1463      	ipop
    40ee:	1461      	nir

000040f0 <BT2IntHandler>:
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT2IntHandler(void) 
{
    40f0:	1460      	nie
    40f2:	1462      	ipush
    // ISR content ...
	if((BT2->MISR&BT_PEND)==BT_PEND)
    40f4:	127c      	lrw      	r3, 0x20000040	// 4264 <Trap3Handler+0x22>
    40f6:	3101      	movi      	r1, 1
    40f8:	9360      	ld.w      	r3, (r3, 0x0)
    40fa:	934c      	ld.w      	r2, (r3, 0x30)
    40fc:	6884      	and      	r2, r1
    40fe:	3a40      	cmpnei      	r2, 0
    4100:	0c03      	bf      	0x4106	// 4106 <BT2IntHandler+0x16>
	{
		BT2->ICR = BT_OVF;
	} 
	else if((BT2->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT2->ICR = BT_EVTRG;
    4102:	b32d      	st.w      	r1, (r3, 0x34)
	} 
}
    4104:	0410      	br      	0x4124	// 4124 <BT2IntHandler+0x34>
	else if((BT2->MISR&BT_CMP)==BT_CMP)
    4106:	934c      	ld.w      	r2, (r3, 0x30)
    4108:	3102      	movi      	r1, 2
    410a:	6884      	and      	r2, r1
    410c:	3a40      	cmpnei      	r2, 0
    410e:	0bfa      	bt      	0x4102	// 4102 <BT2IntHandler+0x12>
	else if((BT2->MISR&BT_OVF)==BT_OVF)
    4110:	934c      	ld.w      	r2, (r3, 0x30)
    4112:	3104      	movi      	r1, 4
    4114:	6884      	and      	r2, r1
    4116:	3a40      	cmpnei      	r2, 0
    4118:	0bf5      	bt      	0x4102	// 4102 <BT2IntHandler+0x12>
	else if((BT2->MISR&BT_EVTRG)==BT_EVTRG)
    411a:	934c      	ld.w      	r2, (r3, 0x30)
    411c:	3108      	movi      	r1, 8
    411e:	6884      	and      	r2, r1
    4120:	3a40      	cmpnei      	r2, 0
    4122:	0bf0      	bt      	0x4102	// 4102 <BT2IntHandler+0x12>
}
    4124:	1463      	ipop
    4126:	1461      	nir

00004128 <BT3IntHandler>:
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT3IntHandler(void) 
{
    4128:	1460      	nie
    412a:	1462      	ipush
    // ISR content ...
	if((BT3->MISR&BT_PEND)==BT_PEND)
    412c:	126f      	lrw      	r3, 0x2000003c	// 4268 <Trap3Handler+0x26>
    412e:	3101      	movi      	r1, 1
    4130:	9360      	ld.w      	r3, (r3, 0x0)
    4132:	934c      	ld.w      	r2, (r3, 0x30)
    4134:	6884      	and      	r2, r1
    4136:	3a40      	cmpnei      	r2, 0
    4138:	0c03      	bf      	0x413e	// 413e <BT3IntHandler+0x16>
	{
		BT3->ICR = BT_OVF;
	} 
	else if((BT3->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT3->ICR = BT_EVTRG;
    413a:	b32d      	st.w      	r1, (r3, 0x34)
	} 
}
    413c:	0410      	br      	0x415c	// 415c <BT3IntHandler+0x34>
	else if((BT3->MISR&BT_CMP)==BT_CMP)
    413e:	934c      	ld.w      	r2, (r3, 0x30)
    4140:	3102      	movi      	r1, 2
    4142:	6884      	and      	r2, r1
    4144:	3a40      	cmpnei      	r2, 0
    4146:	0bfa      	bt      	0x413a	// 413a <BT3IntHandler+0x12>
	else if((BT3->MISR&BT_OVF)==BT_OVF)
    4148:	934c      	ld.w      	r2, (r3, 0x30)
    414a:	3104      	movi      	r1, 4
    414c:	6884      	and      	r2, r1
    414e:	3a40      	cmpnei      	r2, 0
    4150:	0bf5      	bt      	0x413a	// 413a <BT3IntHandler+0x12>
	else if((BT3->MISR&BT_EVTRG)==BT_EVTRG)
    4152:	934c      	ld.w      	r2, (r3, 0x30)
    4154:	3108      	movi      	r1, 8
    4156:	6884      	and      	r2, r1
    4158:	3a40      	cmpnei      	r2, 0
    415a:	0bf0      	bt      	0x413a	// 413a <BT3IntHandler+0x12>
}
    415c:	1463      	ipop
    415e:	1461      	nir

00004160 <UART0IntHandler>:
//UART0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0IntHandler(void) 
{
    4160:	1460      	nie
    4162:	1462      	ipush
    // ISR content ...
	if ((UART0->ISR&UART_RX_INT_S)==UART_RX_INT_S)				//RX interrupt
    4164:	1262      	lrw      	r3, 0x20000028	// 426c <Trap3Handler+0x2a>
    4166:	3102      	movi      	r1, 2
    4168:	9360      	ld.w      	r3, (r3, 0x0)
    416a:	9343      	ld.w      	r2, (r3, 0xc)
    416c:	6884      	and      	r2, r1
    416e:	3a40      	cmpnei      	r2, 0
    4170:	0c07      	bf      	0x417e	// 417e <UART0IntHandler+0x1e>
	{
		UART0->ISR=UART_RX_INT_S;
    4172:	b323      	st.w      	r1, (r3, 0xc)
		RxDataFlag = TRUE;
    4174:	117f      	lrw      	r3, 0x2000007c	// 4270 <Trap3Handler+0x2e>
	}
	else if( (UART0->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 		//TX interrupt
    {
		UART0->ISR=UART_TX_INT_S;
		TxDataFlag = TRUE;
    4176:	3201      	movi      	r2, 1
    4178:	a340      	st.b      	r2, (r3, 0x0)
	}
	else if ((UART0->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
	{
		UART0->ISR=UART_TX_IOV_S;
	}
}
    417a:	1463      	ipop
    417c:	1461      	nir
	else if( (UART0->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 		//TX interrupt
    417e:	9343      	ld.w      	r2, (r3, 0xc)
    4180:	3101      	movi      	r1, 1
    4182:	6884      	and      	r2, r1
    4184:	3a40      	cmpnei      	r2, 0
    4186:	0c04      	bf      	0x418e	// 418e <UART0IntHandler+0x2e>
		UART0->ISR=UART_TX_INT_S;
    4188:	b323      	st.w      	r1, (r3, 0xc)
		TxDataFlag = TRUE;
    418a:	117b      	lrw      	r3, 0x2000007d	// 4274 <Trap3Handler+0x32>
    418c:	07f5      	br      	0x4176	// 4176 <UART0IntHandler+0x16>
	else if ((UART0->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)			//RX overrun interrupt
    418e:	9343      	ld.w      	r2, (r3, 0xc)
    4190:	3108      	movi      	r1, 8
    4192:	6884      	and      	r2, r1
    4194:	3a40      	cmpnei      	r2, 0
    4196:	0c03      	bf      	0x419c	// 419c <UART0IntHandler+0x3c>
		UART0->ISR=UART_TX_IOV_S;
    4198:	b323      	st.w      	r1, (r3, 0xc)
}
    419a:	07f0      	br      	0x417a	// 417a <UART0IntHandler+0x1a>
	else if ((UART0->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
    419c:	9343      	ld.w      	r2, (r3, 0xc)
    419e:	3104      	movi      	r1, 4
    41a0:	6884      	and      	r2, r1
    41a2:	3a40      	cmpnei      	r2, 0
    41a4:	0bfa      	bt      	0x4198	// 4198 <UART0IntHandler+0x38>
    41a6:	07ea      	br      	0x417a	// 417a <UART0IntHandler+0x1a>

000041a8 <CMP0IntHandler>:
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP0IntHandler(void) 
{
    41a8:	1460      	nie
    41aa:	1462      	ipush
    // ISR content ...
	if ((CMP->MISR & EDGEDET0)==EDGEDET0) 
    41ac:	1173      	lrw      	r3, 0x20000024	// 4278 <Trap3Handler+0x36>
    41ae:	3101      	movi      	r1, 1
    41b0:	9340      	ld.w      	r2, (r3, 0x0)
    41b2:	9279      	ld.w      	r3, (r2, 0x64)
    41b4:	68c4      	and      	r3, r1
    41b6:	3b40      	cmpnei      	r3, 0
    41b8:	0c02      	bf      	0x41bc	// 41bc <CMP0IntHandler+0x14>
	{
		CMP->ICR =	EDGEDET0;
    41ba:	b23a      	st.w      	r1, (r2, 0x68)
	}
}
    41bc:	1463      	ipop
    41be:	1461      	nir

000041c0 <CMP1IntHandler>:
//CMP1,CMP3,CMP4 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP1IntHandler(void) 
{
    41c0:	1460      	nie
    41c2:	1462      	ipush
    // ISR content ...
	if((CMP->MISR & EDGEDET1)==EDGEDET1)
    41c4:	116d      	lrw      	r3, 0x20000024	// 4278 <Trap3Handler+0x36>
    41c6:	3102      	movi      	r1, 2
    41c8:	9340      	ld.w      	r2, (r3, 0x0)
    41ca:	9279      	ld.w      	r3, (r2, 0x64)
    41cc:	68c4      	and      	r3, r1
    41ce:	3b40      	cmpnei      	r3, 0
    41d0:	0c02      	bf      	0x41d4	// 41d4 <CMP1IntHandler+0x14>
	{
		CMP->ICR =	EDGEDET1;
    41d2:	b23a      	st.w      	r1, (r2, 0x68)
	}
}
    41d4:	1463      	ipop
    41d6:	1461      	nir

000041d8 <CMP2IntHandler>:
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP2IntHandler(void) 
{
    41d8:	1460      	nie
    41da:	1462      	ipush
    // ISR content ...
	if ((CMP->MISR & EDGEDET2)==EDGEDET2) 
    41dc:	1167      	lrw      	r3, 0x20000024	// 4278 <Trap3Handler+0x36>
    41de:	3104      	movi      	r1, 4
    41e0:	9340      	ld.w      	r2, (r3, 0x0)
    41e2:	9279      	ld.w      	r3, (r2, 0x64)
    41e4:	68c4      	and      	r3, r1
    41e6:	3b40      	cmpnei      	r3, 0
    41e8:	0c02      	bf      	0x41ec	// 41ec <CMP2IntHandler+0x14>
	{
		CMP->ICR =	EDGEDET2;
    41ea:	b23a      	st.w      	r1, (r2, 0x68)
	}
}
    41ec:	1463      	ipop
    41ee:	1461      	nir

000041f0 <CMP3IntHandler>:
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP3IntHandler(void) 
{
    41f0:	1460      	nie
    41f2:	1462      	ipush
    // ISR content ...
	if((CMP->MISR & EDGEDET3)==EDGEDET3)
    41f4:	1161      	lrw      	r3, 0x20000024	// 4278 <Trap3Handler+0x36>
    41f6:	3108      	movi      	r1, 8
    41f8:	9340      	ld.w      	r2, (r3, 0x0)
    41fa:	9279      	ld.w      	r3, (r2, 0x64)
    41fc:	68c4      	and      	r3, r1
    41fe:	3b40      	cmpnei      	r3, 0
    4200:	0c02      	bf      	0x4204	// 4204 <CMP3IntHandler+0x14>
	{
		CMP->ICR =	EDGEDET3;				
    4202:	b23a      	st.w      	r1, (r2, 0x68)
	}
}
    4204:	1463      	ipop
    4206:	1461      	nir

00004208 <CMP4IntHandler>:
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP4IntHandler(void) 
{
    4208:	1460      	nie
    420a:	1462      	ipush
    // ISR content ...
	if((CMP->MISR & EDGEDET4)==EDGEDET4)
    420c:	107b      	lrw      	r3, 0x20000024	// 4278 <Trap3Handler+0x36>
    420e:	3110      	movi      	r1, 16
    4210:	9340      	ld.w      	r2, (r3, 0x0)
    4212:	9279      	ld.w      	r3, (r2, 0x64)
    4214:	68c4      	and      	r3, r1
    4216:	3b40      	cmpnei      	r3, 0
    4218:	0c02      	bf      	0x421c	// 421c <CMP4IntHandler+0x14>
	{
		CMP->ICR =	EDGEDET4;
    421a:	b23a      	st.w      	r1, (r2, 0x68)
	}
}
    421c:	1463      	ipop
    421e:	1461      	nir

00004220 <CMP5IntHandler>:
//CMP0,CMP2 interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CMP5IntHandler(void) 
{
    4220:	1460      	nie
    4222:	1462      	ipush
    // ISR content ...
	if((CMP->MISR & EDGEDET5)==EDGEDET5)
    4224:	1075      	lrw      	r3, 0x20000024	// 4278 <Trap3Handler+0x36>
    4226:	3120      	movi      	r1, 32
    4228:	9340      	ld.w      	r2, (r3, 0x0)
    422a:	9279      	ld.w      	r3, (r2, 0x64)
    422c:	68c4      	and      	r3, r1
    422e:	3b40      	cmpnei      	r3, 0
    4230:	0c02      	bf      	0x4234	// 4234 <CMP5IntHandler+0x14>
	{
		CMP->ICR =	EDGEDET5;
    4232:	b23a      	st.w      	r1, (r2, 0x68)
	}
}
    4234:	1463      	ipop
    4236:	1461      	nir

00004238 <PendTrapHandler>:
    // ISR content ...
	nop;
}

void PendTrapHandler(void) 
{
    4238:	1460      	nie
    423a:	1462      	ipush
    // ISR content ...
	nop;
    423c:	6c03      	mov      	r0, r0
}
    423e:	1463      	ipop
    4240:	1461      	nir

00004242 <Trap3Handler>:
    4242:	1460      	nie
    4244:	1462      	ipush
    4246:	14d0      	push      	r15
    4248:	e3fffff8 	bsr      	0x4238	// 4238 <PendTrapHandler>
    424c:	0418      	br      	0x427c	// 427c <Trap3Handler+0x3a>
    424e:	0000      	bkpt
    4250:	200000f8 	.long	0x200000f8
    4254:	200000ac 	.long	0x200000ac
    4258:	20000038 	.long	0x20000038
    425c:	20000048 	.long	0x20000048
    4260:	20000044 	.long	0x20000044
    4264:	20000040 	.long	0x20000040
    4268:	2000003c 	.long	0x2000003c
    426c:	20000028 	.long	0x20000028
    4270:	2000007c 	.long	0x2000007c
    4274:	2000007d 	.long	0x2000007d
    4278:	20000024 	.long	0x20000024
    427c:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    4280:	1401      	addi      	r14, r14, 4
    4282:	1463      	ipop
    4284:	1461      	nir

00004286 <Trap2Handler>:
    4286:	1460      	nie
    4288:	1462      	ipush
    428a:	14d0      	push      	r15
    428c:	e3ffffd6 	bsr      	0x4238	// 4238 <PendTrapHandler>
    4290:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    4294:	1401      	addi      	r14, r14, 4
    4296:	1463      	ipop
    4298:	1461      	nir

0000429a <Trap1Handler>:
    429a:	1460      	nie
    429c:	1462      	ipush
    429e:	14d0      	push      	r15
    42a0:	e3ffffcc 	bsr      	0x4238	// 4238 <PendTrapHandler>
    42a4:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    42a8:	1401      	addi      	r14, r14, 4
    42aa:	1463      	ipop
    42ac:	1461      	nir

000042ae <Trap0Handler>:
    42ae:	1460      	nie
    42b0:	1462      	ipush
    42b2:	14d0      	push      	r15
    42b4:	e3ffffc2 	bsr      	0x4238	// 4238 <PendTrapHandler>
    42b8:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    42bc:	1401      	addi      	r14, r14, 4
    42be:	1463      	ipop
    42c0:	1461      	nir

000042c2 <PriviledgeVioHandler>:
    42c2:	1460      	nie
    42c4:	1462      	ipush
    42c6:	14d0      	push      	r15
    42c8:	e3ffffb8 	bsr      	0x4238	// 4238 <PendTrapHandler>
    42cc:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    42d0:	1401      	addi      	r14, r14, 4
    42d2:	1463      	ipop
    42d4:	1461      	nir

000042d6 <UnrecExecpHandler>:
    42d6:	1460      	nie
    42d8:	1462      	ipush
    42da:	14d0      	push      	r15
    42dc:	e3ffffae 	bsr      	0x4238	// 4238 <PendTrapHandler>
    42e0:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    42e4:	1401      	addi      	r14, r14, 4
    42e6:	1463      	ipop
    42e8:	1461      	nir

000042ea <BreakPointHandler>:
    42ea:	1460      	nie
    42ec:	1462      	ipush
    42ee:	14d0      	push      	r15
    42f0:	e3ffffa4 	bsr      	0x4238	// 4238 <PendTrapHandler>
    42f4:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    42f8:	1401      	addi      	r14, r14, 4
    42fa:	1463      	ipop
    42fc:	1461      	nir

000042fe <AccessErrHandler>:
    42fe:	1460      	nie
    4300:	1462      	ipush
    4302:	14d0      	push      	r15
    4304:	e3ffff9a 	bsr      	0x4238	// 4238 <PendTrapHandler>
    4308:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    430c:	1401      	addi      	r14, r14, 4
    430e:	1463      	ipop
    4310:	1461      	nir

00004312 <IllegalInstrHandler>:
    4312:	1460      	nie
    4314:	1462      	ipush
    4316:	14d0      	push      	r15
    4318:	e3ffff90 	bsr      	0x4238	// 4238 <PendTrapHandler>
    431c:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    4320:	1401      	addi      	r14, r14, 4
    4322:	1463      	ipop
    4324:	1461      	nir

00004326 <MisalignedHandler>:
    4326:	1460      	nie
    4328:	1462      	ipush
    432a:	14d0      	push      	r15
    432c:	e3ffff86 	bsr      	0x4238	// 4238 <PendTrapHandler>
    4330:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    4334:	1401      	addi      	r14, r14, 4
    4336:	1463      	ipop
    4338:	1461      	nir
	...

0000433c <delay_nms>:
//software delay
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void delay_nms(unsigned int t)
{
    433c:	14d0      	push      	r15
    433e:	1423      	subi      	r14, r14, 12
    volatile unsigned int i,j ,k=0;
    j = 50* t;
    4340:	3232      	movi      	r2, 50
    volatile unsigned int i,j ,k=0;
    4342:	3300      	movi      	r3, 0
    j = 50* t;
    4344:	7c08      	mult      	r0, r2
    volatile unsigned int i,j ,k=0;
    4346:	b862      	st.w      	r3, (r14, 0x8)
    j = 50* t;
    4348:	b801      	st.w      	r0, (r14, 0x4)
    for ( i = 0; i < j; i++ )
    434a:	b860      	st.w      	r3, (r14, 0x0)
    434c:	9840      	ld.w      	r2, (r14, 0x0)
    434e:	9861      	ld.w      	r3, (r14, 0x4)
    4350:	64c8      	cmphs      	r2, r3
    4352:	0c03      	bf      	0x4358	// 4358 <delay_nms+0x1c>
    {
        k++;
		SYSCON_IWDCNT_Reload(); 
    }
}
    4354:	1403      	addi      	r14, r14, 12
    4356:	1490      	pop      	r15
        k++;
    4358:	9862      	ld.w      	r3, (r14, 0x8)
    435a:	2300      	addi      	r3, 1
    435c:	b862      	st.w      	r3, (r14, 0x8)
		SYSCON_IWDCNT_Reload(); 
    435e:	e3ffea27 	bsr      	0x17ac	// 17ac <SYSCON_IWDCNT_Reload>
    for ( i = 0; i < j; i++ )
    4362:	9860      	ld.w      	r3, (r14, 0x0)
    4364:	2300      	addi      	r3, 1
    4366:	07f2      	br      	0x434a	// 434a <delay_nms+0xe>

00004368 <delay_nus>:
void delay_nus(unsigned int t)
{
    4368:	1423      	subi      	r14, r14, 12
    volatile unsigned int i,j ,k=0;
    436a:	3300      	movi      	r3, 0
    436c:	b862      	st.w      	r3, (r14, 0x8)
    j = 1* t;
    436e:	b801      	st.w      	r0, (r14, 0x4)
    for ( i = 0; i < j; i++ )
    4370:	b860      	st.w      	r3, (r14, 0x0)
    4372:	9840      	ld.w      	r2, (r14, 0x0)
    4374:	9861      	ld.w      	r3, (r14, 0x4)
    4376:	64c8      	cmphs      	r2, r3
    4378:	0c03      	bf      	0x437e	// 437e <delay_nus+0x16>
    {
        k++;
    }
}
    437a:	1403      	addi      	r14, r14, 12
    437c:	783c      	jmp      	r15
        k++;
    437e:	9862      	ld.w      	r3, (r14, 0x8)
    4380:	2300      	addi      	r3, 1
    4382:	b862      	st.w      	r3, (r14, 0x8)
    for ( i = 0; i < j; i++ )
    4384:	9860      	ld.w      	r3, (r14, 0x0)
    4386:	2300      	addi      	r3, 1
    4388:	07f4      	br      	0x4370	// 4370 <delay_nus+0x8>

0000438a <GPIO_CONFIG>:
//GPIO Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void GPIO_CONFIG(void)
{
    438a:	14d1      	push      	r4, r15
	GPIO_DeInit();
	GPIO_Init(GPIOA0,0,0);
    438c:	ea84012b 	lrw      	r4, 0x20000014	// 4838 <SYSCON_CONFIG+0x30>
	GPIO_DeInit();
    4390:	e3fff3d8 	bsr      	0x2b40	// 2b40 <GPIO_DeInit>
	GPIO_Init(GPIOA0,0,0);
    4394:	9400      	ld.w      	r0, (r4, 0x0)
    4396:	3200      	movi      	r2, 0
    4398:	3100      	movi      	r1, 0
    439a:	e3fff431 	bsr      	0x2bfc	// 2bfc <GPIO_Init>

	//GPIO_Write_High(GPIOA0,10);				
	//GPIO_Write_Low(GPIOA0,10);				
//------------  EXI FUNTION  --------------------------------/
//EXI0_INT= EXI0/EXI16,EXI1_INT= EXI1/EXI17, EXI2_INT=EXI2~EXI3/EXI18/EXI19, EXI3_INT=EXI4~EXI9, EXI4_INT=EXI10~EXI15    
	GPIO_IntGroup_Set(PA0,5,Selete_EXI_PIN5);					//PA0.0 set as EXI0  
    439e:	3205      	movi      	r2, 5
    43a0:	3105      	movi      	r1, 5
    43a2:	3000      	movi      	r0, 0
    43a4:	e3fff544 	bsr      	0x2e2c	// 2e2c <GPIO_IntGroup_Set>
	GPIOA0_EXI_Init(EXI5);                                   	//PA0.0 set as input
    43a8:	3005      	movi      	r0, 5
    43aa:	e3fff5bb 	bsr      	0x2f20	// 2f20 <GPIOA0_EXI_Init>
	EXTI_trigger_CMD(ENABLE,EXI_PIN5,_EXIFT);                   //ENABLE falling edge
    43ae:	3201      	movi      	r2, 1
    43b0:	3120      	movi      	r1, 32
    43b2:	3001      	movi      	r0, 1
    43b4:	e3ffea40 	bsr      	0x1834	// 1834 <EXTI_trigger_CMD>
	//EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);                 //ENABLE rising edge
    EXTI_interrupt_CMD(ENABLE,EXI_PIN5);                	   	//enable EXI
    43b8:	3120      	movi      	r1, 32
    43ba:	3001      	movi      	r0, 1
    43bc:	e3ffea59 	bsr      	0x186e	// 186e <EXTI_interrupt_CMD>
    GPIO_EXTI_interrupt(GPIOA0,0b0000000000100000);				//enable GPIOA0.0 as EXI
    43c0:	9400      	ld.w      	r0, (r4, 0x0)
    43c2:	3120      	movi      	r1, 32
    43c4:	e3ffea6b 	bsr      	0x189a	// 189a <GPIO_EXTI_interrupt>
	//GPIO_Init(GPIOA0,0,0);
	
	//EXI0_Int_Enable();                                         //EXI0 / EXI16 INT Vector
    //EXI1_Int_Enable();                                       //EXI1 / EXI17 INT Vector
    //EXI2_Int_Enable();                                         //EXI2~EXI3 / EXI18~19 INT Vector
    EXI3_Int_Enable();                                       //EXI4~EXI8 INT Vector
    43c8:	e3ffeaa4 	bsr      	0x1910	// 1910 <EXI3_Int_Enable>
    //EXI4_Int_Enable();                                       //EXI9~EXI15 INT Vector
	
    //EXI0_WakeUp_Enable();										//EXI0 interrupt wake up enable
	//EXI1_WakeUp_Enable();										//EXI1 interrupt wake up enable
	//EXI2_WakeUp_Enable();										//EXI2~EXI3 interrupt wake up enable
	EXI3_WakeUp_Enable();										//EXI4~EXI8 interrupt wake up enable
    43cc:	e3ffeb12 	bsr      	0x19f0	// 19f0 <EXI3_WakeUp_Enable>
	//EXI4_WakeUp_Enable();										//EXI9~EXI15 interrupt wake up enable
}
    43d0:	1491      	pop      	r4, r15

000043d2 <GPT_CONFIG>:
//GPT0 Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT_CONFIG(void)
{
    43d2:	14d2      	push      	r4-r5, r15
    43d4:	1429      	subi      	r14, r14, 36
	GPT_IO_Init(GPT_CHA_PA03);
    43d6:	3000      	movi      	r0, 0
    43d8:	e3ffe3f4 	bsr      	0xbc0	// bc0 <GPT_IO_Init>
	GPT_IO_Init(GPT_CHA_PA13);
    43dc:	3001      	movi      	r0, 1
	GPT_Configure(GPTCLK_EN,GPT_PCLK,GPT_IMMEDIATE,1);
	GPT_WaveCtrl_Configure(GPT_INCREASE,GPT_SWSYNDIS,GPT_IDLE_LOW,GPT_PRDLD_PEND,GPT_OPM_CONTINUOUS,GPT_BURST_DIS,GPT_CKS_PCLK,GPT_CG_CHAX,GPT_CGFLT_00,GPT_PRDLD_ZERO);
    43de:	3400      	movi      	r4, 0
	GPT_IO_Init(GPT_CHA_PA13);
    43e0:	e3ffe3f0 	bsr      	0xbc0	// bc0 <GPT_IO_Init>
	GPT_Configure(GPTCLK_EN,GPT_PCLK,GPT_IMMEDIATE,1);
    43e4:	3301      	movi      	r3, 1
    43e6:	3240      	movi      	r2, 64
    43e8:	3100      	movi      	r1, 0
    43ea:	3001      	movi      	r0, 1
    43ec:	e3ffe43b 	bsr      	0xc62	// c62 <GPT_Configure>
	GPT_WaveCtrl_Configure(GPT_INCREASE,GPT_SWSYNDIS,GPT_IDLE_LOW,GPT_PRDLD_PEND,GPT_OPM_CONTINUOUS,GPT_BURST_DIS,GPT_CKS_PCLK,GPT_CG_CHAX,GPT_CGFLT_00,GPT_PRDLD_ZERO);
    43f0:	3300      	movi      	r3, 0
    43f2:	b885      	st.w      	r4, (r14, 0x14)
    43f4:	b884      	st.w      	r4, (r14, 0x10)
    43f6:	b883      	st.w      	r4, (r14, 0xc)
    43f8:	b882      	st.w      	r4, (r14, 0x8)
    43fa:	b881      	st.w      	r4, (r14, 0x4)
    43fc:	b880      	st.w      	r4, (r14, 0x0)
    43fe:	3208      	movi      	r2, 8
    4400:	3100      	movi      	r1, 0
    4402:	3000      	movi      	r0, 0
    4404:	e3ffe441 	bsr      	0xc86	// c86 <GPT_WaveCtrl_Configure>
	GPT_Period_CMP_Write(2000,1500,50);
    4408:	30fa      	movi      	r0, 250
    440a:	3232      	movi      	r2, 50
    440c:	ea81010c 	lrw      	r1, 0x5dc	// 483c <SYSCON_CONFIG+0x34>
    4410:	4003      	lsli      	r0, r0, 3
    4412:	e3ffe612 	bsr      	0x1036	// 1036 <GPT_Period_CMP_Write>
	GPT_WaveLoad_Configure(GPT_WAVEA_IMMEDIATE,GPT_WAVEB_SHADOW,GPT_AQLDA_ZERO,GPT_AQLDB_ZERO);
	GPT_WaveOut_Configure(GPT_CHA,GPT_CASEL_CMPA,GPT_CBSEL_CMPA,2,0,1,1,0,0,0,0,0,0);
    4416:	3501      	movi      	r5, 1
	GPT_WaveLoad_Configure(GPT_WAVEA_IMMEDIATE,GPT_WAVEB_SHADOW,GPT_AQLDA_ZERO,GPT_AQLDB_ZERO);
    4418:	3320      	movi      	r3, 32
    441a:	3204      	movi      	r2, 4
    441c:	3100      	movi      	r1, 0
    441e:	3001      	movi      	r0, 1
    4420:	e3ffe45d 	bsr      	0xcda	// cda <GPT_WaveLoad_Configure>
	GPT_WaveOut_Configure(GPT_CHA,GPT_CASEL_CMPA,GPT_CBSEL_CMPA,2,0,1,1,0,0,0,0,0,0);
    4424:	b888      	st.w      	r4, (r14, 0x20)
    4426:	b887      	st.w      	r4, (r14, 0x1c)
    4428:	b886      	st.w      	r4, (r14, 0x18)
    442a:	b885      	st.w      	r4, (r14, 0x14)
    442c:	b884      	st.w      	r4, (r14, 0x10)
    442e:	b883      	st.w      	r4, (r14, 0xc)
    4430:	b8a2      	st.w      	r5, (r14, 0x8)
    4432:	b8a1      	st.w      	r5, (r14, 0x4)
    4434:	b880      	st.w      	r4, (r14, 0x0)
    4436:	3302      	movi      	r3, 2
    4438:	3200      	movi      	r2, 0
    443a:	3100      	movi      	r1, 0
    443c:	3000      	movi      	r0, 0
    443e:	e3ffe470 	bsr      	0xd1e	// d1e <GPT_WaveOut_Configure>
	GPT_WaveOut_Configure(GPT_CHB,GPT_CASEL_CMPA,GPT_CBSEL_CMPB,2,0,0,0,1,1,0,0,0,0);
    4442:	3280      	movi      	r2, 128
    4444:	424f      	lsli      	r2, r2, 15
    4446:	3302      	movi      	r3, 2
    4448:	3100      	movi      	r1, 0
    444a:	3001      	movi      	r0, 1
    444c:	b888      	st.w      	r4, (r14, 0x20)
    444e:	b887      	st.w      	r4, (r14, 0x1c)
    4450:	b886      	st.w      	r4, (r14, 0x18)
    4452:	b885      	st.w      	r4, (r14, 0x14)
    4454:	b8a4      	st.w      	r5, (r14, 0x10)
    4456:	b8a3      	st.w      	r5, (r14, 0xc)
    4458:	b882      	st.w      	r4, (r14, 0x8)
    445a:	b881      	st.w      	r4, (r14, 0x4)
    445c:	b880      	st.w      	r4, (r14, 0x0)
    445e:	e3ffe460 	bsr      	0xd1e	// d1e <GPT_WaveOut_Configure>
	//GPT_SyncSet_Configure(GPT_SYNCUSR0_EN,GPT_OSTMD5_ONCE,GPT_TXREARM_DIS,GPT_TRGO0SEL_SR0,GPT_TRG10SEL_SR0,GPT_AREARM_DIS);
	//GPT_Trigger_Configure(GPT_SRCSEL_TRGUSR0EN,GPT_BLKINV_DIS,GPT_ALIGNMD_PRD,GPT_CROSSMD_DIS,5,5);
	//GPT_EVTRG_Configure(GPT_TRGSRC0_PRD,GPT_TRGSRC1_PRD,GPT_ESYN0OE_EN,GPT_ESYN1OE_EN,GPT_CNT0INIT_EN,GPT_CNT1INIT_EN,3,3,3,3);
	GPT_Start();
    4462:	e3ffe5a8 	bsr      	0xfb2	// fb2 <GPT_Start>
	GPT_ConfigInterrupt_CMD(ENABLE,GPT_INT_PEND);
    4466:	3180      	movi      	r1, 128
    4468:	4129      	lsli      	r1, r1, 9
    446a:	3001      	movi      	r0, 1
    446c:	e3ffe611 	bsr      	0x108e	// 108e <GPT_ConfigInterrupt_CMD>
	GPT_INT_ENABLE();
    4470:	e3ffe620 	bsr      	0x10b0	// 10b0 <GPT_INT_ENABLE>
	//INTC_ISER_WRITE(GPT_INT); 
	//INTC_IWER_WRITE(GPT_INT); 
}
    4474:	1409      	addi      	r14, r14, 36
    4476:	1492      	pop      	r4-r5, r15

00004478 <EPT_CONFIG>:
//ETP0 Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void EPT_CONFIG(void)
{
    4478:	14d3      	push      	r4-r6, r15
    447a:	1429      	subi      	r14, r14, 36
	EPT_Software_Prg();								//EPT software reset
    447c:	e3ffdef8 	bsr      	0x26c	// 26c <EPT_Software_Prg>
//------------  EPT GPIO Setting  --------------------------------/
	EPT_IO_SET(EPT_IO_CHAX,IO_NUM_PA00);			//AX channel selection
    4480:	3110      	movi      	r1, 16
    4482:	3000      	movi      	r0, 0
    4484:	e3ffdf23 	bsr      	0x2ca	// 2ca <EPT_IO_SET>
	EPT_IO_SET(EPT_IO_CHAY,IO_NUM_PA01);			//AY channel selection
    4488:	3114      	movi      	r1, 20
    448a:	3001      	movi      	r0, 1
    448c:	e3ffdf1f 	bsr      	0x2ca	// 2ca <EPT_IO_SET>
	EPT_IO_SET(EPT_IO_CHBX,IO_NUM_PA07);			//BX channel selection
    4490:	3117      	movi      	r1, 23
    4492:	3002      	movi      	r0, 2
    4494:	e3ffdf1b 	bsr      	0x2ca	// 2ca <EPT_IO_SET>
	EPT_IO_SET(EPT_IO_CHBY,IO_NUM_PA08);			//BY channel selection
    4498:	3119      	movi      	r1, 25
    449a:	3003      	movi      	r0, 3
    449c:	e3ffdf17 	bsr      	0x2ca	// 2ca <EPT_IO_SET>
	EPT_IO_SET(EPT_IO_CHCX,IO_NUM_PA05);			//CX channel selection
    44a0:	311a      	movi      	r1, 26
    44a2:	3004      	movi      	r0, 4
    44a4:	e3ffdf13 	bsr      	0x2ca	// 2ca <EPT_IO_SET>
	EPT_IO_SET(EPT_IO_CHCY,IO_NUM_PA06);			//CY channel selection
    44a8:	311c      	movi      	r1, 28
    44aa:	3005      	movi      	r0, 5
    44ac:	e3ffdf0f 	bsr      	0x2ca	// 2ca <EPT_IO_SET>
	EPT_IO_SET(EPT_IO_CHD,IO_NUM_PA13);			//D channel selection
    44b0:	311f      	movi      	r1, 31
    44b2:	3006      	movi      	r0, 6
//------------  EPT Control  --------------------------------/
	EPT_PWM_Config(EPT_Selecte_PCLK,EPT_CNTMD_increase,EPT_OPM_Continue,0);//PCLK as clock，increasing mode,continuous mode,TCLK=PCLK/(0+1) 
	//EPT_Tevent_Selecte(0x00,0x00);				//T1 source selection SYNCIN4,T2 source selectionSYNCIN5
	//EPT_SYNCR_Config(EPT_Triggle_Continue,EPT_SYNCUSR0_REARMTrig_DIS,EPT_TRGSRC0_ExtSync_SYNCUSR0,EPT_TRGSRC1_ExtSync_SYNCUSR4,0x30);//enable SYNCUSR4 SYNCUSR5 as trigger event,continuous mode
	EPT_PWMX_Output_Control(EPT_PWMA,EPT_CA_Selecte_CMPA,EPT_CB_Selecte_CMPA,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
    44b4:	3400      	movi      	r4, 0
	EPT_IO_SET(EPT_IO_CHD,IO_NUM_PA13);			//D channel selection
    44b6:	e3ffdf0a 	bsr      	0x2ca	// 2ca <EPT_IO_SET>
	EPT_PWMX_Output_Control(EPT_PWMA,EPT_CA_Selecte_CMPA,EPT_CB_Selecte_CMPA,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
    44ba:	3640      	movi      	r6, 64
    44bc:	3510      	movi      	r5, 16
	EPT_PWM_Config(EPT_Selecte_PCLK,EPT_CNTMD_increase,EPT_OPM_Continue,0);//PCLK as clock，increasing mode,continuous mode,TCLK=PCLK/(0+1) 
    44be:	3300      	movi      	r3, 0
    44c0:	3200      	movi      	r2, 0
    44c2:	3100      	movi      	r1, 0
    44c4:	3000      	movi      	r0, 0
    44c6:	e3ffdfe1 	bsr      	0x488	// 488 <EPT_PWM_Config>
	EPT_PWMX_Output_Control(EPT_PWMA,EPT_CA_Selecte_CMPA,EPT_CB_Selecte_CMPA,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
    44ca:	b888      	st.w      	r4, (r14, 0x20)
    44cc:	b887      	st.w      	r4, (r14, 0x1c)
    44ce:	b886      	st.w      	r4, (r14, 0x18)
    44d0:	b885      	st.w      	r4, (r14, 0x14)
    44d2:	b884      	st.w      	r4, (r14, 0x10)
    44d4:	b883      	st.w      	r4, (r14, 0xc)
    44d6:	b8c2      	st.w      	r6, (r14, 0x8)
    44d8:	b8a1      	st.w      	r5, (r14, 0x4)
    44da:	b880      	st.w      	r4, (r14, 0x0)
    44dc:	3302      	movi      	r3, 2
    44de:	3200      	movi      	r2, 0
    44e0:	3100      	movi      	r1, 0
    44e2:	3000      	movi      	r0, 0
    44e4:	e3ffe0cd 	bsr      	0x67e	// 67e <EPT_PWMX_Output_Control>
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);
	EPT_PWMX_Output_Control(EPT_PWMB,EPT_CA_Selecte_CMPB,EPT_CB_Selecte_CMPB,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
    44e8:	3280      	movi      	r2, 128
    44ea:	3180      	movi      	r1, 128
    44ec:	424f      	lsli      	r2, r2, 15
    44ee:	412d      	lsli      	r1, r1, 13
    44f0:	b888      	st.w      	r4, (r14, 0x20)
    44f2:	b887      	st.w      	r4, (r14, 0x1c)
    44f4:	b886      	st.w      	r4, (r14, 0x18)
    44f6:	b885      	st.w      	r4, (r14, 0x14)
    44f8:	b884      	st.w      	r4, (r14, 0x10)
    44fa:	b883      	st.w      	r4, (r14, 0xc)
    44fc:	b8c2      	st.w      	r6, (r14, 0x8)
    44fe:	b8a1      	st.w      	r5, (r14, 0x4)
    4500:	b880      	st.w      	r4, (r14, 0x0)
    4502:	3302      	movi      	r3, 2
    4504:	3001      	movi      	r0, 1
    4506:	e3ffe0bc 	bsr      	0x67e	// 67e <EPT_PWMX_Output_Control>
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);						
	EPT_PWMX_Output_Control(EPT_PWMC,EPT_CA_Selecte_CMPC,EPT_CB_Selecte_CMPC,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
    450a:	3280      	movi      	r2, 128
    450c:	3180      	movi      	r1, 128
    450e:	4250      	lsli      	r2, r2, 16
    4510:	412e      	lsli      	r1, r1, 14
    4512:	b888      	st.w      	r4, (r14, 0x20)
    4514:	b887      	st.w      	r4, (r14, 0x1c)
    4516:	b886      	st.w      	r4, (r14, 0x18)
    4518:	b885      	st.w      	r4, (r14, 0x14)
    451a:	b884      	st.w      	r4, (r14, 0x10)
    451c:	b883      	st.w      	r4, (r14, 0xc)
    451e:	b8c2      	st.w      	r6, (r14, 0x8)
    4520:	b8a1      	st.w      	r5, (r14, 0x4)
    4522:	b880      	st.w      	r4, (r14, 0x0)
    4524:	3302      	movi      	r3, 2
    4526:	3002      	movi      	r0, 2
    4528:	e3ffe0ab 	bsr      	0x67e	// 67e <EPT_PWMX_Output_Control>
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);	
	EPT_PWMX_Output_Control(EPT_PWMD,EPT_CA_Selecte_CMPD,EPT_CB_Selecte_CMPD,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
    452c:	32c0      	movi      	r2, 192
    452e:	31c0      	movi      	r1, 192
    4530:	4250      	lsli      	r2, r2, 16
    4532:	412e      	lsli      	r1, r1, 14
    4534:	b888      	st.w      	r4, (r14, 0x20)
    4536:	b887      	st.w      	r4, (r14, 0x1c)
    4538:	b886      	st.w      	r4, (r14, 0x18)
    453a:	b885      	st.w      	r4, (r14, 0x14)
    453c:	b884      	st.w      	r4, (r14, 0x10)
    453e:	b883      	st.w      	r4, (r14, 0xc)
    4540:	b8c2      	st.w      	r6, (r14, 0x8)
    4542:	b8a1      	st.w      	r5, (r14, 0x4)
    4544:	b880      	st.w      	r4, (r14, 0x0)
    4546:	3302      	movi      	r3, 2
    4548:	3003      	movi      	r0, 3
    454a:	e3ffe09a 	bsr      	0x67e	// 67e <EPT_PWMX_Output_Control>
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);		
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(4800,2400,1200,600,0);//PRDR=2400,CMPA=1200,CMPB=600,CMPC=2400,CMPD=0	
    454e:	3396      	movi      	r3, 150
    4550:	3296      	movi      	r2, 150
    4552:	3196      	movi      	r1, 150
    4554:	3096      	movi      	r0, 150
    4556:	4362      	lsli      	r3, r3, 2
    4558:	b880      	st.w      	r4, (r14, 0x0)
    455a:	4243      	lsli      	r2, r2, 3
    455c:	4124      	lsli      	r1, r1, 4
    455e:	4005      	lsli      	r0, r0, 5
    4560:	e3ffe108 	bsr      	0x770	// 770 <EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config>
	EPT_DB_CLK_Config(0,24,24);//Fdbclk=Fhclk/(0+1)，DTR=24clk，DTF=24clk
    4564:	3218      	movi      	r2, 24
    4566:	3118      	movi      	r1, 24
    4568:	3000      	movi      	r0, 0
    456a:	e3ffe084 	bsr      	0x672	// 672 <EPT_DB_CLK_Config>
	EPT_DBCR_Config(EPT_CHA_Selecte,EPT_CHAINSEL_PWMA_RISE_FALL,EPT_CHA_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMA Complementary,CHX rising edge,CHY falling edge		
    456e:	b880      	st.w      	r4, (r14, 0x0)
    4570:	3302      	movi      	r3, 2
    4572:	3203      	movi      	r2, 3
    4574:	3100      	movi      	r1, 0
    4576:	3000      	movi      	r0, 0
    4578:	e3ffe050 	bsr      	0x618	// 618 <EPT_DBCR_Config>
	EPT_DBCR_Config(EPT_CHB_Selecte,EPT_CHBINSEL_PWMB_RISE_FALL,EPT_CHB_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMB Complementary,CHX rising edge,CHY falling edge		
    457c:	32c0      	movi      	r2, 192
    457e:	b880      	st.w      	r4, (r14, 0x0)
    4580:	3302      	movi      	r3, 2
    4582:	4242      	lsli      	r2, r2, 2
    4584:	3100      	movi      	r1, 0
    4586:	3001      	movi      	r0, 1
    4588:	e3ffe048 	bsr      	0x618	// 618 <EPT_DBCR_Config>
	EPT_DBCR_Config(EPT_CHC_Selecte,EPT_CHCINSEL_PWMC_RISE_FALL,EPT_CHC_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMC Complementary,CHX rising edge,CHY falling edge
    458c:	32c0      	movi      	r2, 192
    458e:	424a      	lsli      	r2, r2, 10
    4590:	3302      	movi      	r3, 2
    4592:	3100      	movi      	r1, 0
    4594:	3002      	movi      	r0, 2
    4596:	b880      	st.w      	r4, (r14, 0x0)
    4598:	e3ffe040 	bsr      	0x618	// 618 <EPT_DBCR_Config>
	//EPT_Int_Enable(EPT_CDU);//Up-Counting phase CNT = CMPD interrupt request raw status
	//EPT_Int_Enable(EPT_CDD);//Down-Counting phase CNT = CMPD interrupt request raw status
	//EPT_Int_Enable(EPT_PEND);//End of cycle interrupt request raw status
	//EPT_Vector_Int_Enable();
//------------  EPT start  --------------------------------/	
	EPT_Start();
    459c:	e3ffde78 	bsr      	0x28c	// 28c <EPT_Start>
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(0XFFFF,0,0,0,0);
	EPT_Int_Enable(EPT_CAP_LD0);//Capture Load to CMPA interrupt request raw status
	EPT_Int_Enable(EPT_CAP_LD1);//Capture Load to CMPB interrupt request raw status
	EPT_Vector_Int_Enable();
	EPT_Start();*/
}
    45a0:	1409      	addi      	r14, r14, 36
    45a2:	1493      	pop      	r4-r6, r15

000045a4 <BT_CONFIG>:
void BT_CONFIG(void)
{
    45a4:	14d2      	push      	r4-r5, r15
    45a6:	1427      	subi      	r14, r14, 28
	BT_DeInit(BT0);
    45a8:	02b9      	lrw      	r5, 0x20000048	// 4840 <SYSCON_CONFIG+0x38>
	BT_IO_Init(BT0_PA02);
	BT_Configure(BT0,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
    45aa:	3400      	movi      	r4, 0
	BT_DeInit(BT0);
    45ac:	9500      	ld.w      	r0, (r5, 0x0)
    45ae:	e3ffe595 	bsr      	0x10d8	// 10d8 <BT_DeInit>
	BT_IO_Init(BT0_PA02);
    45b2:	3000      	movi      	r0, 0
    45b4:	e3ffe5a0 	bsr      	0x10f4	// 10f4 <BT_IO_Init>
	BT_Configure(BT0,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
    45b8:	9500      	ld.w      	r0, (r5, 0x0)
    45ba:	b881      	st.w      	r4, (r14, 0x4)
    45bc:	b880      	st.w      	r4, (r14, 0x0)
    45be:	3308      	movi      	r3, 8
    45c0:	3200      	movi      	r2, 0
    45c2:	3101      	movi      	r1, 1
    45c4:	e3ffe60b 	bsr      	0x11da	// 11da <BT_Configure>
	BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC0_DIS,BT_SYNC1_DIS,BT_SYNC2_DIS,BT_SYNCMD_DIS,BT_OSTMD0_ONCE,BT_AREARM0_DIS,BT_AREARM1_DIS,BT_CNTRLD_EN);
    45c8:	3380      	movi      	r3, 128
    45ca:	4371      	lsli      	r3, r3, 17
    45cc:	b863      	st.w      	r3, (r14, 0xc)
    45ce:	9500      	ld.w      	r0, (r5, 0x0)
    45d0:	3300      	movi      	r3, 0
    45d2:	b886      	st.w      	r4, (r14, 0x18)
    45d4:	b885      	st.w      	r4, (r14, 0x14)
    45d6:	b884      	st.w      	r4, (r14, 0x10)
    45d8:	b882      	st.w      	r4, (r14, 0x8)
    45da:	b881      	st.w      	r4, (r14, 0x4)
    45dc:	b880      	st.w      	r4, (r14, 0x0)
    45de:	3200      	movi      	r2, 0
    45e0:	3180      	movi      	r1, 128
    45e2:	e3ffe608 	bsr      	0x11f2	// 11f2 <BT_ControlSet_Configure>
	//BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_EN,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_Trigger_Configure(BT0,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT0,2000,500);
    45e6:	32fa      	movi      	r2, 250
    45e8:	31fa      	movi      	r1, 250
    45ea:	4241      	lsli      	r2, r2, 1
    45ec:	4123      	lsli      	r1, r1, 3
    45ee:	9500      	ld.w      	r0, (r5, 0x0)
    45f0:	e3ffe62d 	bsr      	0x124a	// 124a <BT_Period_CMP_Write>
	BT_Start(BT0);
    45f4:	9500      	ld.w      	r0, (r5, 0x0)
    45f6:	e3ffe5d7 	bsr      	0x11a4	// 11a4 <BT_Start>
	BT_ConfigInterrupt_CMD(BT0,ENABLE,BT_PEND);
    45fa:	9500      	ld.w      	r0, (r5, 0x0)
    45fc:	3201      	movi      	r2, 1
    45fe:	3101      	movi      	r1, 1
    4600:	e3ffe63b 	bsr      	0x1276	// 1276 <BT_ConfigInterrupt_CMD>
	BT0_INT_ENABLE();
    4604:	e3ffe642 	bsr      	0x1288	// 1288 <BT0_INT_ENABLE>
	BT_Trigger_Configure(BT3,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT3,1000,500);
	BT_Start(BT3);
	BT_ConfigInterrupt_CMD(BT3,ENABLE,BT_PEND);
	BT3_INT_ENABLE();*/
}
    4608:	1407      	addi      	r14, r14, 28
    460a:	1492      	pop      	r4-r5, r15

0000460c <ETCB_CONFIG>:
//ET Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void ETCB_CONFIG(void)
{
    460c:	14d0      	push      	r15
	ET_DeInit();
    460e:	e3ffe685 	bsr      	0x1318	// 1318 <ET_DeInit>

	ET_CH0_SRCSEL(ENABLE,TRG_HW,ET_EPT0_TRGSRC0);
    4612:	3212      	movi      	r2, 18
    4614:	3100      	movi      	r1, 0
    4616:	3001      	movi      	r0, 1
    4618:	e3ffe6e5 	bsr      	0x13e2	// 13e2 <ET_CH0_SRCSEL>
	ET_CH0_DSTSEL(ET_DST0,ENABLE,ET_ADC_SYNC0);
    461c:	3212      	movi      	r2, 18
    461e:	3101      	movi      	r1, 1
    4620:	3000      	movi      	r0, 0
    4622:	e3ffe6ac 	bsr      	0x137a	// 137a <ET_CH0_DSTSEL>
		
	ET_ENABLE();
    4626:	e3ffe693 	bsr      	0x134c	// 134c <ET_ENABLE>
}
    462a:	1490      	pop      	r15

0000462c <ADC12_CONFIG>:
//adc config
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void ADC12_CONFIG(void)
{
    462c:	14d0      	push      	r15
    462e:	1422      	subi      	r14, r14, 8
	ADC12_Software_Reset();
    4630:	e3fff6ec 	bsr      	0x3408	// 3408 <ADC12_Software_Reset>
	ADC12_CLK_CMD(ADC_CLK_CR , ENABLE);                                         //enable ADC CLK
    4634:	3101      	movi      	r1, 1
    4636:	3002      	movi      	r0, 2
    4638:	e3fff6d4 	bsr      	0x33e0	// 33e0 <ADC12_CLK_CMD>
	ADC12_Configure_Mode(ADC12_12BIT , Continuous_mode ,0, 6 ,2 , 1);           //12BIT ADC; Continuous mode; Conversion priority selection 0; Holding cycles=6 ;ADC_CLK=PCLK/2*2=0.2us; Number of Conversions=1
    463c:	3301      	movi      	r3, 1
    463e:	b861      	st.w      	r3, (r14, 0x4)
    4640:	3302      	movi      	r3, 2
    4642:	b860      	st.w      	r3, (r14, 0x0)
    4644:	3200      	movi      	r2, 0
    4646:	3306      	movi      	r3, 6
    4648:	3101      	movi      	r1, 1
    464a:	3000      	movi      	r0, 0
    464c:	e3fff717 	bsr      	0x347a	// 347a <ADC12_Configure_Mode>
	ADC12_Configure_VREF_Selecte(ADC12_VREFP_FVR2048_VREFN_VSS);					    //ADC VREF Positive FVR4.096V,negative VSS
    4650:	3002      	movi      	r0, 2
    4652:	e3fff74f 	bsr      	0x34f0	// 34f0 <ADC12_Configure_VREF_Selecte>
	ADC12_ConversionChannel_Config(ADC12_ADCIN0,ADC12_CV_RepeatNum1,ADC12_AVGDIS,0);    //SEQ0 chose ADCIN0, 6 Holding cycles, Average 1 time
    4656:	3300      	movi      	r3, 0
    4658:	3200      	movi      	r2, 0
    465a:	3100      	movi      	r1, 0
    465c:	3000      	movi      	r0, 0
    465e:	e3fff817 	bsr      	0x368c	// 368c <ADC12_ConversionChannel_Config>
	//ADC12_ConversionChannel_Config(ADC12_ADCIN1,ADC12_CV_RepeatNum1,ADC12_AVGDIS,1);  //SEQ1 chose ADCIN1, 6 Holding cycles , Average 1 time
	ADC12_CMD(ENABLE);                                                                  //enable ADC
    4662:	3001      	movi      	r0, 1
    4664:	e3fff6d7 	bsr      	0x3412	// 3412 <ADC12_CMD>
	ADC12_ready_wait(); 																//wait ADC get ready
    4668:	e3fff6e7 	bsr      	0x3436	// 3436 <ADC12_ready_wait>
	ADC12_Control(ADC12_START);															//ADC convert start
    466c:	3008      	movi      	r0, 8
    466e:	e3fff691 	bsr      	0x3390	// 3390 <ADC12_Control>
}
    4672:	1402      	addi      	r14, r14, 8
    4674:	1490      	pop      	r15

00004676 <CORET_CONFIG>:
//CORET Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void CORET_CONFIG(void)
{
    4676:	14d0      	push      	r15
	CORET_DeInit();									//Coret 所有寄存器复位赋值			
    4678:	e3fff210 	bsr      	0x2a98	// 2a98 <CORET_DeInit>
	SYSCON_General_CMD(ENABLE,ENDIS_SYSTICK);		//使能 STCLK 时钟
    467c:	3180      	movi      	r1, 128
    467e:	4124      	lsli      	r1, r1, 4
    4680:	3001      	movi      	r0, 1
    4682:	e3ffe80c 	bsr      	0x169a	// 169a <SYSCON_General_CMD>
	CK802->CORET_RVR=599999;						//100ms
    4686:	1370      	lrw      	r3, 0x20000078	// 4844 <SYSCON_CONFIG+0x3c>
    4688:	1350      	lrw      	r2, 0x927bf	// 4848 <SYSCON_CONFIG+0x40>
    468a:	9360      	ld.w      	r3, (r3, 0x0)
    468c:	b345      	st.w      	r2, (r3, 0x14)
	CORET_reload();									// Coret CVR 清除						
    468e:	e3fff251 	bsr      	0x2b30	// 2b30 <CORET_reload>
	CORET_CLKSOURCE_EX();							//使用时钟源为sysclk/8
    4692:	e3fff237 	bsr      	0x2b00	// 2b00 <CORET_CLKSOURCE_EX>
	CORET_TICKINT_Enable();							//使能计数器清零中断
    4696:	e3fff241 	bsr      	0x2b18	// 2b18 <CORET_TICKINT_Enable>
	
	CORET_start();									//Coret 计时开始				
    469a:	e3fff227 	bsr      	0x2ae8	// 2ae8 <CORET_start>
	CORET_Int_Enable();								//使能计数器清零中断向量
    469e:	e3fff207 	bsr      	0x2aac	// 2aac <CORET_Int_Enable>
	//CORET_WakeUp_Enable();							//使能计数器清零中断唤醒	
}
    46a2:	1490      	pop      	r15

000046a4 <UART_CONFIG>:
//UART0  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART_CONFIG(void)
{
    46a4:	14d0      	push      	r15
	UART0_DeInit();                                                //clear all UART Register
    46a6:	e3fff8eb 	bsr      	0x387c	// 387c <UART0_DeInit>
    UART_IO_Init(IO_UART0,0);                                     //use PA0.10->RXD0, PA0.9->TXD0
    46aa:	3100      	movi      	r1, 0
    46ac:	3000      	movi      	r0, 0
    46ae:	e3fff91d 	bsr      	0x38e8	// 38e8 <UART_IO_Init>
    //UARTInit(UART0,416,UART_PAR_NONE);							  //baudrate=sysclock/416=115200
	UARTInitRxTxIntEn(UART0,416,UART_PAR_NONE);	              //baudrate=sysclock/416=115200,RX TX int enable
    46b2:	1367      	lrw      	r3, 0x20000028	// 484c <SYSCON_CONFIG+0x44>
    46b4:	31d0      	movi      	r1, 208
    46b6:	9300      	ld.w      	r0, (r3, 0x0)
    46b8:	3200      	movi      	r2, 0
    46ba:	4121      	lsli      	r1, r1, 1
    46bc:	e3fff958 	bsr      	0x396c	// 396c <UARTInitRxTxIntEn>
	UART0_Int_Enable();
    46c0:	e3fff8f0 	bsr      	0x38a0	// 38a0 <UART0_Int_Enable>
} 
    46c4:	1490      	pop      	r15

000046c6 <USART_CONFIG>:
//USART Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void USART_CONFIG(void)
{
    46c6:	14d0      	push      	r15
    46c8:	1423      	subi      	r14, r14, 12
	USART_DeInit();                                                              	//USART 所有寄存器复位赋值
    46ca:	e3ffebaf 	bsr      	0x1e28	// 1e28 <USART_DeInit>
    USART_CLK_Enable();																//USART CLK	使能
    46ce:	e3ffec5b 	bsr      	0x1f84	// 1f84 <USART_CLK_Enable>
	USART_CTRL_Config(RSTRX,ENABLE);												//复位接收模块
    46d2:	3101      	movi      	r1, 1
    46d4:	3002      	movi      	r0, 2
    46d6:	e3ffec8c 	bsr      	0x1fee	// 1fee <USART_CTRL_Config>
	USART_CTRL_Config(RSTTX,ENABLE);												//复位发射模块
    46da:	3101      	movi      	r1, 1
    46dc:	3003      	movi      	r0, 3
    46de:	e3ffec88 	bsr      	0x1fee	// 1fee <USART_CTRL_Config>
	USART_IO_Init(IO_USART0,0);                                                  		//USART 使用PA0.2->RXD0, PB0.2->TXD0
    46e2:	3100      	movi      	r1, 0
    46e4:	3000      	movi      	r0, 0
    46e6:	e3ffebe1 	bsr      	0x1ea8	// 1ea8 <USART_IO_Init>
	//USART_CLKIO_Init(CLK_PB07);													//同步模式下可以选择PB0.7作为UARTCLK
    USART_MODE_Config(SENDTIME0,PCLK,CHRL8,ASYNC,PAR_EVEN,NBSTOP1,CHMODE_NORMAL);	//重发次数为0, CLKs=PCLK, 字节长度8bit, 异步模式, 偶校验位, 1个停止位, 普通模式
    46ea:	3300      	movi      	r3, 0
    46ec:	b862      	st.w      	r3, (r14, 0x8)
    46ee:	b861      	st.w      	r3, (r14, 0x4)
    46f0:	b860      	st.w      	r3, (r14, 0x0)
    46f2:	32c0      	movi      	r2, 192
    46f4:	3100      	movi      	r1, 0
    46f6:	3000      	movi      	r0, 0
    46f8:	e3ffec62 	bsr      	0x1fbc	// 1fbc <USART_MODE_Config>
	//USART_CLKO_Config(ENABLE);														//同步模式下需要输出UARTCLK时,需要使能
    USART_Baudrate_Cal(38400,48000000,PCLK,ASYNC);									//波特率=38400, 主频选择48M, PCLK不分频, 异步模式							
    46fc:	3096      	movi      	r0, 150
    46fe:	3300      	movi      	r3, 0
    4700:	3200      	movi      	r2, 0
    4702:	1234      	lrw      	r1, 0x2dc6c00	// 4850 <SYSCON_CONFIG+0x48>
    4704:	4008      	lsli      	r0, r0, 8
    4706:	e3ffecae 	bsr      	0x2062	// 2062 <USART_Baudrate_Cal>
	USART_CTRL_Config(TXEN,ENABLE);													//USART 发送使能
    470a:	3101      	movi      	r1, 1
    470c:	3006      	movi      	r0, 6
    470e:	e3ffec70 	bsr      	0x1fee	// 1fee <USART_CTRL_Config>
	USART_CTRL_Config(RXEN,ENABLE);													//USART 接收使能
    4712:	3101      	movi      	r1, 1
    4714:	3004      	movi      	r0, 4
    4716:	e3ffec6c 	bsr      	0x1fee	// 1fee <USART_CTRL_Config>
	USART_INT_Config(RXRDY_INT,ENABLE);												//USART 接收中断使能
    471a:	3101      	movi      	r1, 1
    471c:	3000      	movi      	r0, 0
    471e:	e3ffec39 	bsr      	0x1f90	// 1f90 <USART_INT_Config>
	//USART_INT_Config(TXRDY_INT,ENABLE);												//USART 发射中断使能	
	USART_Int_Enable();																//USART 中断向量使能
    4722:	e3ffeb9f 	bsr      	0x1e60	// 1e60 <USART_Int_Enable>
	//USART_WakeUp_Enable();															//USART 中断唤醒使能
	
}
    4726:	1403      	addi      	r14, r14, 12
    4728:	1490      	pop      	r15

0000472a <CMP_CONFIG>:
//CMP Init
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/  
void CMP_CONFIG(void)
{
    472a:	14d0      	push      	r15
    472c:	1423      	subi      	r14, r14, 12
	CMP_RESET_VALUE();								//CMP 所有寄存器复位赋值
    472e:	e3ffed13 	bsr      	0x2154	// 2154 <CMP_RESET_VALUE>
	CMP_software_reset();							//CMP 软件复位	
    4732:	e3ffed33 	bsr      	0x2198	// 2198 <CMP_software_reset>
	
	CMP_IO_Init(CPINP0,0);							//CPINP0 初始化
    4736:	3100      	movi      	r1, 0
    4738:	3000      	movi      	r0, 0
    473a:	e3ffed78 	bsr      	0x222a	// 222a <CMP_IO_Init>
	//CMP_IO_Init(CPINP6,0);							//CPINP6 初始化
	//CMP_IO_Init(CPINP7,0);							//CPINP7 初始化
	//CMP_IO_Init(CPINP8,0);							//CPINP8 初始化
	//CMP_IO_Init(CPINP9,0);							//CPINP9 初始化
	
	CMP_IO_Init(CPINN0,0);							//CPINN0 初始化	
    473e:	3100      	movi      	r1, 0
    4740:	300a      	movi      	r0, 10
    4742:	e3ffed74 	bsr      	0x222a	// 222a <CMP_IO_Init>
	//CMP_IO_Init(CPINN1,0);							//CPINN1 初始化		
	//CMP_IO_Init(CPINN2,0);							//CPINN2 初始化	
	//CMP_IO_Init(CPINN3,0);							//CPINN3 初始化	
	//CMP_IO_Init(CPINN4,0);							//CPINN4 初始化	
	
	CMP_IO_Init(CP0_OUT,0);							//CP0_OUT 初始化	
    4746:	3100      	movi      	r1, 0
    4748:	300f      	movi      	r0, 15
    474a:	e3ffed70 	bsr      	0x222a	// 222a <CMP_IO_Init>
	//CMP_IO_Init(CP1_OUT,0);							//CP1_OUT 初始化	
	//CMP_IO_Init(CP2_OUT,0);							//CP2_OUT 初始化	
	//CMP_IO_Init(CP3_OUT,0);							//CP3_OUT 初始化	
	//CMP_IO_Init(CP4_OUT,0);							//CP4_OUT 初始化	
	
	CMP_INPCRX_Config(CMP0_NUM,0,0);						//比较器负向:CPINN0  比较器正向:CPINP0
    474e:	3200      	movi      	r2, 0
    4750:	3100      	movi      	r1, 0
    4752:	3000      	movi      	r0, 0
    4754:	e3ffee89 	bsr      	0x2466	// 2466 <CMP_INPCRX_Config>
	CMP_CLK_CMD(CMP0_NUM,ENABLE);							//比较器0时钟使能
    4758:	3101      	movi      	r1, 1
    475a:	3000      	movi      	r0, 0
    475c:	e3ffed24 	bsr      	0x21a4	// 21a4 <CMP_CLK_CMD>
	CMP_CR_Config(CMP0_NUM,NHYST_0mv,PHYST_0mv,POLARITY_0,EVE_SEL_fall_rise,EN_FLTEN,CPOS_1);
    4760:	3380      	movi      	r3, 128
    4762:	4368      	lsli      	r3, r3, 8
    4764:	b862      	st.w      	r3, (r14, 0x8)
    4766:	3380      	movi      	r3, 128
    4768:	4363      	lsli      	r3, r3, 3
    476a:	b861      	st.w      	r3, (r14, 0x4)
    476c:	3380      	movi      	r3, 128
    476e:	4362      	lsli      	r3, r3, 2
    4770:	b860      	st.w      	r3, (r14, 0x0)
    4772:	3200      	movi      	r2, 0
    4774:	3300      	movi      	r3, 0
    4776:	3100      	movi      	r1, 0
    4778:	3000      	movi      	r0, 0
    477a:	e3ffeef3 	bsr      	0x2560	// 2560 <CMP_CR_Config>
	//使能CMP0比较器，比较器正向和负向迟滞电压为0mV，比较器输出不反向，事件触发为上升沿和下降沿，滤波器使能，选择经过滤波器后输出
	CMPX_FLTCR_Config(CMP0_NUM,CMPX_CLK_PCLK,4,199);		//FLT_CK = 20M/(199+1)/2^4=160us; 滤波次数固定为3次 160us*3=480us
    477e:	33c7      	movi      	r3, 199
    4780:	3204      	movi      	r2, 4
    4782:	3100      	movi      	r1, 0
    4784:	3000      	movi      	r0, 0
    4786:	e3ffefc0 	bsr      	0x2706	// 2706 <CMPX_FLTCR_Config>
	CMP_Open(CMP0_NUM);										//比较器0打开
    478a:	3000      	movi      	r0, 0
    478c:	e3ffef5d 	bsr      	0x2646	// 2646 <CMP_Open>
	CMP->ICR =	EDGEDET0;									//清除CMP0中断标志位
    4790:	1171      	lrw      	r3, 0x20000024	// 4854 <SYSCON_CONFIG+0x4c>
    4792:	3201      	movi      	r2, 1
    4794:	9360      	ld.w      	r3, (r3, 0x0)
    4796:	b35a      	st.w      	r2, (r3, 0x68)
	CMP_ConfigInterrupt_CMD(EDGEDET0,ENABLE);				//CMP0 中断使能
    4798:	3101      	movi      	r1, 1
    479a:	3001      	movi      	r0, 1
    479c:	e3fff0ae 	bsr      	0x28f8	// 28f8 <CMP_ConfigInterrupt_CMD>
	//CMPX_FLTCR_Config(CMP5_NUM,CMPX_CLK_PCLK,4,199);			//FLT_CK = 20M/(199+1)/2^4=160ms; 滤波次数固定为3次
	//CMP_Open(CMP5_NUM);										//比较器5打开
	//CMP->ICR = EDGEDET5;										//清除CMP4中断标志位
	//CMP_ConfigInterrupt_CMD(EDGEDET5,ENABLE);					//CMP5 中断使能
	
	CMP0_Int_Enable();										//CMP0~CMP1 中断向量使能
    47a0:	e3fff0b7 	bsr      	0x290e	// 290e <CMP0_Int_Enable>
	//CMP1_Int_Enable();										//CMP2~CMP3 中断向量使能
	
}
    47a4:	1403      	addi      	r14, r14, 12
    47a6:	1490      	pop      	r15

000047a8 <OPAMP_CONFIG>:
//OPAMP Init
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void OPAMP_CONFIG(void)
{
    47a8:	14d0      	push      	r15
    47aa:	1421      	subi      	r14, r14, 4
	OPA0_RESET_VALUE();										//OPAx 所有寄存器复位赋值
    47ac:	e3fff50c 	bsr      	0x31c4	// 31c4 <OPA0_RESET_VALUE>
	OPA1_RESET_VALUE();	
    47b0:	e3fff512 	bsr      	0x31d4	// 31d4 <OPA1_RESET_VALUE>
	
	OPA_IO_Init(OPA0P,0);									//OPA0P 初始化				
    47b4:	3100      	movi      	r1, 0
    47b6:	3001      	movi      	r0, 1
    47b8:	e3fff513 	bsr      	0x31de	// 31de <OPA_IO_Init>
	//OPA_IO_Init(OPA0N,0);									//OPA0N 初始化				
	OPA_IO_Init(OPA0X,0);									//OPA0X 初始化				
    47bc:	3100      	movi      	r1, 0
    47be:	3003      	movi      	r0, 3
    47c0:	e3fff50f 	bsr      	0x31de	// 31de <OPA_IO_Init>
	
	OPA_IO_Init(OPA1P,0);									//OPA1P 初始化		
    47c4:	3100      	movi      	r1, 0
    47c6:	3004      	movi      	r0, 4
    47c8:	e3fff50b 	bsr      	0x31de	// 31de <OPA_IO_Init>
	//OPA_IO_Init(OPA1N,0);									//OPA1N 初始化		
	OPA_IO_Init(OPA1X,0);									//OPA1X 初始化		
    47cc:	3100      	movi      	r1, 0
    47ce:	3006      	movi      	r0, 6
    47d0:	e3fff507 	bsr      	0x31de	// 31de <OPA_IO_Init>
	
	OPA_EN_CMD(OPA0_NUM,ENABLE);							//OPA0  ENABLE
    47d4:	3101      	movi      	r1, 1
    47d6:	3000      	movi      	r0, 0
    47d8:	e3fff551 	bsr      	0x327a	// 327a <OPA_EN_CMD>
	OPA_EN_CMD(OPA1_NUM,ENABLE);							//OPA1  ENABLE
    47dc:	3101      	movi      	r1, 1
    47de:	3001      	movi      	r0, 1
    47e0:	e3fff54d 	bsr      	0x327a	// 327a <OPA_EN_CMD>
	
	OPA_Config_Prg(OPA0_NUM,PGAEN_ENABLE,Op_ExtPinConnect_DIS,BUFFER_DISABLE,4);			//OPA0,使能内部增益控制,负向输入口与PIN脚连通禁止,正向输入口为OPA0P,增益x5,微调增益0
    47e4:	3304      	movi      	r3, 4
    47e6:	b860      	st.w      	r3, (r14, 0x0)
    47e8:	3200      	movi      	r2, 0
    47ea:	3300      	movi      	r3, 0
    47ec:	3101      	movi      	r1, 1
    47ee:	3000      	movi      	r0, 0
    47f0:	e3fff55b 	bsr      	0x32a6	// 32a6 <OPA_Config_Prg>
	OPA_Config_Prg(OPA1_NUM,PGAEN_ENABLE,Op_ExtPinConnect_DIS,BUFFER_DISABLE,1);			//OPA1,使能内部增益控制,负向输入口与PIN脚连通禁止,正向输入口为OPA1P,增益x10,微调增益0	
    47f4:	3301      	movi      	r3, 1
    47f6:	b860      	st.w      	r3, (r14, 0x0)
    47f8:	3200      	movi      	r2, 0
    47fa:	3300      	movi      	r3, 0
    47fc:	3101      	movi      	r1, 1
    47fe:	3001      	movi      	r0, 1
    4800:	e3fff553 	bsr      	0x32a6	// 32a6 <OPA_Config_Prg>
}
    4804:	1401      	addi      	r14, r14, 4
    4806:	1490      	pop      	r15

00004808 <SYSCON_CONFIG>:
//syscon Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CONFIG(void)
{
    4808:	14d0      	push      	r15
    480a:	1421      	subi      	r14, r14, 4
//------SYSTEM CLK AND PCLK FUNTION---------------------------/
	SYSCON_RST_VALUE();                                                         //SYSCON all register clr
    480c:	e3ffe71c 	bsr      	0x1644	// 1644 <SYSCON_RST_VALUE>
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC);										//SYSCON enable/disable clock source
    4810:	3101      	movi      	r1, 1
    4812:	3001      	movi      	r0, 1
    4814:	e3ffe743 	bsr      	0x169a	// 169a <SYSCON_General_CMD>
	//EMOSC_OSTR_Config(0XAD,0X1f,EM_LFSEL_EN,EM_FLEN_EN,EM_FLSEL_10ns);		//EM_CNT=0X3FF,0xAD(36K),EM_GM=0,Low F modedisable,EM filter disable,if enable,cont set 5ns
	//SYSCON_General_CMD(ENABLE,ENDIS_EMOSC);
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_48M);									//HFOSC selected 48MHz
    4818:	3000      	movi      	r0, 0
    481a:	e3ffe7a1 	bsr      	0x175c	// 175c <SYSCON_HFOSC_SELECTE>
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC,HCLK_DIV_1,PCLK_DIV_1,HFOSC_48M);//system clock set, Hclk div ,Pclk div  set system clock=SystemCLK/Hclk div/Pclk div
    481e:	3180      	movi      	r1, 128
    4820:	3308      	movi      	r3, 8
    4822:	3200      	movi      	r2, 0
    4824:	4121      	lsli      	r1, r1, 1
    4826:	3002      	movi      	r0, 2
    4828:	e3ffe74e 	bsr      	0x16c4	// 16c4 <SystemCLK_HCLKDIV_PCLKDIV_Config>
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_2S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
    482c:	3080      	movi      	r0, 128
    482e:	3118      	movi      	r1, 24
    4830:	4003      	lsli      	r0, r0, 3
    4832:	e3ffe7c4 	bsr      	0x17ba	// 17ba <SYSCON_IWDCNT_Config>
    4836:	0411      	br      	0x4858	// 4858 <SYSCON_CONFIG+0x50>
    4838:	20000014 	.long	0x20000014
    483c:	000005dc 	.long	0x000005dc
    4840:	20000048 	.long	0x20000048
    4844:	20000078 	.long	0x20000078
    4848:	000927bf 	.long	0x000927bf
    484c:	20000028 	.long	0x20000028
    4850:	02dc6c00 	.long	0x02dc6c00
    4854:	20000024 	.long	0x20000024
    SYSCON_WDT_CMD(DISABLE);                                                  	//enable/disable WDT		
    4858:	3000      	movi      	r0, 0
    485a:	e3ffe792 	bsr      	0x177e	// 177e <SYSCON_WDT_CMD>
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
    485e:	e3ffe7a7 	bsr      	0x17ac	// 17ac <SYSCON_IWDCNT_Reload>
	//IWDT_Int_Enable();
//------------  WWDT FUNTION  --------------------------------/
	WWDT_CNT_Load(0xFF);
    4862:	30ff      	movi      	r0, 255
    4864:	e3ffe693 	bsr      	0x158a	// 158a <WWDT_CNT_Load>
	WWDT_CONFIG(PCLK_4096_DIV0,0xFF,WWDT_DBGDIS);
    4868:	3200      	movi      	r2, 0
    486a:	31ff      	movi      	r1, 255
    486c:	3000      	movi      	r0, 0
    486e:	e3ffe67b 	bsr      	0x1564	// 1564 <WWDT_CONFIG>
	WWDT_Int_Config(DISABLE);													
    4872:	3000      	movi      	r0, 0
    4874:	e3ffe691 	bsr      	0x1596	// 1596 <WWDT_Int_Config>
	//WWDT_CMD(ENABLE);															//enable wwdt
//------------  CLO Output --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA08);												//CLO output setting
	//SYSCON_CLO_SRC_SET(CLO_PCLK,CLO_DIV16);									//CLO output clock and div
//------------  LVD FUNTION  --------------------------------/ 
    SYSCON_LVD_Config(DISABLE_LVDEN,INTDET_LVL_3_3V,RSTDET_LVL_1_9V,DISABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
    4878:	3340      	movi      	r3, 64
    487a:	3180      	movi      	r1, 128
    487c:	b860      	st.w      	r3, (r14, 0x0)
    487e:	3200      	movi      	r2, 0
    4880:	3300      	movi      	r3, 0
    4882:	4123      	lsli      	r1, r1, 3
    4884:	300a      	movi      	r0, 10
    4886:	e3ffe7a2 	bsr      	0x17ca	// 17ca <SYSCON_LVD_Config>
	//SYSCON->EVPS=0X00;
	//SYSCON->IMER =EM_EVTRG0_ST;
//------------  SYSCON Vector  --------------------------------/ 	
	//SYSCON_Int_Enable();    														//SYSCON VECTOR
	//SYSCON_WakeUp_Enable();  
}
    488a:	1401      	addi      	r14, r14, 4
    488c:	1490      	pop      	r15

0000488e <APT32F171_init>:
//APT32F171_init                                                                  /
//EntryParameter:NONE                                                             /
//ReturnValue:NONE                                                                /
/*********************************************************************************/
void APT32F171_init(void) 
{
    488e:	14d0      	push      	r15
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable  0x00410071
    4890:	1068      	lrw      	r3, 0x20000070	// 48b0 <APT32F171_init+0x22>
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
    4892:	3101      	movi      	r1, 1
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable  0x00410071
    4894:	9340      	ld.w      	r2, (r3, 0x0)
    4896:	1068      	lrw      	r3, 0xfffffff	// 48b4 <APT32F171_init+0x26>
    4898:	b26a      	st.w      	r3, (r2, 0x28)
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    489a:	b26d      	st.w      	r3, (r2, 0x34)
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
    489c:	926c      	ld.w      	r3, (r2, 0x30)
    489e:	68c4      	and      	r3, r1
    48a0:	3b40      	cmpnei      	r3, 0
    48a2:	0ffd      	bf      	0x489c	// 489c <APT32F171_init+0xe>
//------------------------------------------------------------/
//ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON_CONFIG();                                                 //syscon  initial
    48a4:	e3ffffb2 	bsr      	0x4808	// 4808 <SYSCON_CONFIG>
	CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
    48a8:	e3ffdcd9 	bsr      	0x25a	// 25a <CK_CPU_EnAllNormalIrq>
	//UART_CONFIG();                                               //UART initial
	//USART_CONFIG();                                               //USART initial
	//CMP_CONFIG();                                                 //CMP initial
	//OPAMP_CONFIG();                                               //OPA initial
	//SYSCON_INT_Priority();
}		
    48ac:	1490      	pop      	r15
    48ae:	0000      	bkpt
    48b0:	20000070 	.long	0x20000070
    48b4:	0fffffff 	.long	0x0fffffff

000048b8 <__udiv32>:
    48b8:	3940      	cmpnei      	r1, 0
    48ba:	0803      	bt      	0x48c0	// 48c0 <__udiv32+0x8>
    48bc:	c0002c20 	trap      	3
    48c0:	3840      	cmpnei      	r0, 0
    48c2:	0802      	bt      	0x48c6	// 48c6 <__udiv32+0xe>
    48c4:	783c      	jmp      	r15
    48c6:	14c1      	push      	r4
    48c8:	3201      	movi      	r2, 1
    48ca:	6cc3      	mov      	r3, r0
    48cc:	3420      	movi      	r4, 32
    48ce:	3b00      	cmphsi      	r3, 1
    48d0:	0c04      	bf      	0x48d8	// 48d8 <__udiv32+0x20>
    48d2:	2c00      	subi      	r4, 1
    48d4:	4b61      	lsri      	r3, r3, 1
    48d6:	07fc      	br      	0x48ce	// 48ce <__udiv32+0x16>
    48d8:	7090      	lsl      	r2, r4
    48da:	7010      	lsl      	r0, r4
    48dc:	6cc7      	mov      	r3, r1
    48de:	3420      	movi      	r4, 32
    48e0:	3b00      	cmphsi      	r3, 1
    48e2:	0c04      	bf      	0x48ea	// 48ea <__udiv32+0x32>
    48e4:	2c00      	subi      	r4, 1
    48e6:	4b61      	lsri      	r3, r3, 1
    48e8:	07fc      	br      	0x48e0	// 48e0 <__udiv32+0x28>
    48ea:	2400      	addi      	r4, 1
    48ec:	6cc3      	mov      	r3, r0
    48ee:	70d1      	lsr      	r3, r4
    48f0:	6d12      	nor      	r4, r4
    48f2:	2420      	addi      	r4, 33
    48f4:	7090      	lsl      	r2, r4
    48f6:	7010      	lsl      	r0, r4
    48f8:	3a40      	cmpnei      	r2, 0
    48fa:	0c09      	bf      	0x490c	// 490c <__udiv32+0x54>
    48fc:	6402      	cmpne      	r0, r0
    48fe:	6001      	addc      	r0, r0
    4900:	60cd      	addc      	r3, r3
    4902:	644c      	cmphs      	r3, r1
    4904:	0c02      	bf      	0x4908	// 4908 <__udiv32+0x50>
    4906:	60c6      	subu      	r3, r1
    4908:	6089      	addc      	r2, r2
    490a:	0ff9      	bf      	0x48fc	// 48fc <__udiv32+0x44>
    490c:	6c0b      	mov      	r0, r2
    490e:	6c4f      	mov      	r1, r3
    4910:	1481      	pop      	r4
	...

00004914 <___gnu_csky_case_uqi>:
    4914:	1421      	subi      	r14, r14, 4
    4916:	b820      	st.w      	r1, (r14, 0x0)
    4918:	6c7f      	mov      	r1, r15
    491a:	6040      	addu      	r1, r0
    491c:	8120      	ld.b      	r1, (r1, 0x0)
    491e:	4121      	lsli      	r1, r1, 1
    4920:	63c4      	addu      	r15, r1
    4922:	9820      	ld.w      	r1, (r14, 0x0)
    4924:	1401      	addi      	r14, r14, 4
    4926:	783c      	jmp      	r15

00004928 <__memset_fast>:
    4928:	14c3      	push      	r4-r6
    492a:	7444      	zextb      	r1, r1
    492c:	3a40      	cmpnei      	r2, 0
    492e:	0c1f      	bf      	0x496c	// 496c <__memset_fast+0x44>
    4930:	6d43      	mov      	r5, r0
    4932:	6d03      	mov      	r4, r0
    4934:	3603      	movi      	r6, 3
    4936:	6918      	and      	r4, r6
    4938:	3c40      	cmpnei      	r4, 0
    493a:	0c1a      	bf      	0x496e	// 496e <__memset_fast+0x46>
    493c:	a520      	st.b      	r1, (r5, 0x0)
    493e:	2a00      	subi      	r2, 1
    4940:	3a40      	cmpnei      	r2, 0
    4942:	0c15      	bf      	0x496c	// 496c <__memset_fast+0x44>
    4944:	2500      	addi      	r5, 1
    4946:	6d17      	mov      	r4, r5
    4948:	3603      	movi      	r6, 3
    494a:	6918      	and      	r4, r6
    494c:	3c40      	cmpnei      	r4, 0
    494e:	0c10      	bf      	0x496e	// 496e <__memset_fast+0x46>
    4950:	a520      	st.b      	r1, (r5, 0x0)
    4952:	2a00      	subi      	r2, 1
    4954:	3a40      	cmpnei      	r2, 0
    4956:	0c0b      	bf      	0x496c	// 496c <__memset_fast+0x44>
    4958:	2500      	addi      	r5, 1
    495a:	6d17      	mov      	r4, r5
    495c:	3603      	movi      	r6, 3
    495e:	6918      	and      	r4, r6
    4960:	3c40      	cmpnei      	r4, 0
    4962:	0c06      	bf      	0x496e	// 496e <__memset_fast+0x46>
    4964:	a520      	st.b      	r1, (r5, 0x0)
    4966:	2a00      	subi      	r2, 1
    4968:	2500      	addi      	r5, 1
    496a:	0402      	br      	0x496e	// 496e <__memset_fast+0x46>
    496c:	1483      	pop      	r4-r6
    496e:	4168      	lsli      	r3, r1, 8
    4970:	6c4c      	or      	r1, r3
    4972:	4170      	lsli      	r3, r1, 16
    4974:	6c4c      	or      	r1, r3
    4976:	3a2f      	cmplti      	r2, 16
    4978:	0809      	bt      	0x498a	// 498a <__memset_fast+0x62>
    497a:	b520      	st.w      	r1, (r5, 0x0)
    497c:	b521      	st.w      	r1, (r5, 0x4)
    497e:	b522      	st.w      	r1, (r5, 0x8)
    4980:	b523      	st.w      	r1, (r5, 0xc)
    4982:	2a0f      	subi      	r2, 16
    4984:	250f      	addi      	r5, 16
    4986:	3a2f      	cmplti      	r2, 16
    4988:	0ff9      	bf      	0x497a	// 497a <__memset_fast+0x52>
    498a:	3a23      	cmplti      	r2, 4
    498c:	0806      	bt      	0x4998	// 4998 <__memset_fast+0x70>
    498e:	2a03      	subi      	r2, 4
    4990:	b520      	st.w      	r1, (r5, 0x0)
    4992:	2503      	addi      	r5, 4
    4994:	3a23      	cmplti      	r2, 4
    4996:	0ffc      	bf      	0x498e	// 498e <__memset_fast+0x66>
    4998:	3a40      	cmpnei      	r2, 0
    499a:	0fe9      	bf      	0x496c	// 496c <__memset_fast+0x44>
    499c:	2a00      	subi      	r2, 1
    499e:	a520      	st.b      	r1, (r5, 0x0)
    49a0:	3a40      	cmpnei      	r2, 0
    49a2:	0fe5      	bf      	0x496c	// 496c <__memset_fast+0x44>
    49a4:	2a00      	subi      	r2, 1
    49a6:	a521      	st.b      	r1, (r5, 0x1)
    49a8:	3a40      	cmpnei      	r2, 0
    49aa:	0fe1      	bf      	0x496c	// 496c <__memset_fast+0x44>
    49ac:	a522      	st.b      	r1, (r5, 0x2)
    49ae:	1483      	pop      	r4-r6

000049b0 <__memcpy_fast>:
    49b0:	14c3      	push      	r4-r6
    49b2:	6d83      	mov      	r6, r0
    49b4:	6d07      	mov      	r4, r1
    49b6:	6d18      	or      	r4, r6
    49b8:	3303      	movi      	r3, 3
    49ba:	690c      	and      	r4, r3
    49bc:	3c40      	cmpnei      	r4, 0
    49be:	0c0b      	bf      	0x49d4	// 49d4 <__memcpy_fast+0x24>
    49c0:	3a40      	cmpnei      	r2, 0
    49c2:	0c08      	bf      	0x49d2	// 49d2 <__memcpy_fast+0x22>
    49c4:	8160      	ld.b      	r3, (r1, 0x0)
    49c6:	2100      	addi      	r1, 1
    49c8:	2a00      	subi      	r2, 1
    49ca:	a660      	st.b      	r3, (r6, 0x0)
    49cc:	2600      	addi      	r6, 1
    49ce:	3a40      	cmpnei      	r2, 0
    49d0:	0bfa      	bt      	0x49c4	// 49c4 <__memcpy_fast+0x14>
    49d2:	1483      	pop      	r4-r6
    49d4:	3a2f      	cmplti      	r2, 16
    49d6:	080e      	bt      	0x49f2	// 49f2 <__memcpy_fast+0x42>
    49d8:	91a0      	ld.w      	r5, (r1, 0x0)
    49da:	9161      	ld.w      	r3, (r1, 0x4)
    49dc:	9182      	ld.w      	r4, (r1, 0x8)
    49de:	b6a0      	st.w      	r5, (r6, 0x0)
    49e0:	91a3      	ld.w      	r5, (r1, 0xc)
    49e2:	b661      	st.w      	r3, (r6, 0x4)
    49e4:	b682      	st.w      	r4, (r6, 0x8)
    49e6:	b6a3      	st.w      	r5, (r6, 0xc)
    49e8:	2a0f      	subi      	r2, 16
    49ea:	210f      	addi      	r1, 16
    49ec:	260f      	addi      	r6, 16
    49ee:	3a2f      	cmplti      	r2, 16
    49f0:	0ff4      	bf      	0x49d8	// 49d8 <__memcpy_fast+0x28>
    49f2:	3a23      	cmplti      	r2, 4
    49f4:	0808      	bt      	0x4a04	// 4a04 <__memcpy_fast+0x54>
    49f6:	9160      	ld.w      	r3, (r1, 0x0)
    49f8:	2a03      	subi      	r2, 4
    49fa:	2103      	addi      	r1, 4
    49fc:	b660      	st.w      	r3, (r6, 0x0)
    49fe:	2603      	addi      	r6, 4
    4a00:	3a23      	cmplti      	r2, 4
    4a02:	0ffa      	bf      	0x49f6	// 49f6 <__memcpy_fast+0x46>
    4a04:	3a40      	cmpnei      	r2, 0
    4a06:	0fe6      	bf      	0x49d2	// 49d2 <__memcpy_fast+0x22>
    4a08:	8160      	ld.b      	r3, (r1, 0x0)
    4a0a:	2100      	addi      	r1, 1
    4a0c:	2a00      	subi      	r2, 1
    4a0e:	a660      	st.b      	r3, (r6, 0x0)
    4a10:	2600      	addi      	r6, 1
    4a12:	07f9      	br      	0x4a04	// 4a04 <__memcpy_fast+0x54>

Disassembly of section .text.startup:

00004a14 <main>:

/*************************************************************/
//main
/*************************************************************/
int main(void) 
{
    4a14:	14d1      	push      	r4, r15
	delay_nms(2000);
    4a16:	30fa      	movi      	r0, 250
    4a18:	4003      	lsli      	r0, r0, 3
    4a1a:	e3fffc91 	bsr      	0x433c	// 433c <delay_nms>
	APT32F171_init();		
    4a1e:	e3ffff38 	bsr      	0x488e	// 488e <APT32F171_init>
    while(1)
	{
		SYSCON_IWDCNT_Reload();                 	//清狗
		//...
		//my_printf("hello apt32f171!\r\n");
		GPIO_Set_Value(GPIOA0,0,1);
    4a22:	108c      	lrw      	r4, 0x20000014	// 4a50 <main+0x3c>
		SYSCON_IWDCNT_Reload();                 	//清狗
    4a24:	e3ffe6c4 	bsr      	0x17ac	// 17ac <SYSCON_IWDCNT_Reload>
		GPIO_Set_Value(GPIOA0,0,1);
    4a28:	3201      	movi      	r2, 1
    4a2a:	3100      	movi      	r1, 0
    4a2c:	9400      	ld.w      	r0, (r4, 0x0)
    4a2e:	e3fff39c 	bsr      	0x3166	// 3166 <GPIO_Set_Value>
		delay_nms(500);
    4a32:	30fa      	movi      	r0, 250
    4a34:	4001      	lsli      	r0, r0, 1
    4a36:	e3fffc83 	bsr      	0x433c	// 433c <delay_nms>
		PCLK_goto_deepsleep_mode();
    4a3a:	e3ffe735 	bsr      	0x18a4	// 18a4 <PCLK_goto_deepsleep_mode>
		GPIO_Set_Value(GPIOA0,0,0);
    4a3e:	9400      	ld.w      	r0, (r4, 0x0)
    4a40:	3200      	movi      	r2, 0
    4a42:	3100      	movi      	r1, 0
    4a44:	e3fff391 	bsr      	0x3166	// 3166 <GPIO_Set_Value>
		delay_nms(10000);   			//唤醒≈800ms后PA0.0输出高
    4a48:	1003      	lrw      	r0, 0x2710	// 4a54 <main+0x40>
    4a4a:	e3fffc79 	bsr      	0x433c	// 433c <delay_nms>
    4a4e:	07eb      	br      	0x4a24	// 4a24 <main+0x10>
    4a50:	20000014 	.long	0x20000014
    4a54:	00002710 	.long	0x00002710

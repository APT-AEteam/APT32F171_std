##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=apt32f171a
ConfigurationName      :=BuildSet
WorkspacePath          :=../Workspace/APT32F171_StdPeriph_Lib/
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=clutc
Date                   :=16/12/2022
CDKPath                :=F:/C-Sky/CDK
ToolchainPath          :=F:/C-Sky/CDKRepo/Toolchain/CKV2ElfMinilib/V3.10.29/R/
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=apt32f171a.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck801  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/ckcpu.ld"
LinkOtherFlagsOption   :=
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch). $(IncludeSwitch)include  
IncludeAPath           := $(IncludeSwitch). $(IncludeSwitch)include  
Libs                   := -Wl,--start-group  -Wl,--end-group $(LibrarySwitch)m  
ArLibs                 := "libm" 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch)../lib802le/Obj/  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck801    -Os  -g3  -Wall -mistack 
CFLAGS   := -mcpu=ck801    -Os  -g3  -Wall -mistack 
ASFLAGS  := -mcpu=ck801    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IntermediateDirectory)/arch_apt32f171_iostring$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32f171$(ObjectSuffix) $(IntermediateDirectory)/drivers_apt32f171_ck802$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_ept$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_gpt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_hwdiv$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_bt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_crc$(ObjectSuffix) \
	$(IntermediateDirectory)/FWlib_apt32f171_etcb$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_wwdt$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_syscon$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_usart$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_cmp$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_coret$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_gpio$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_oamp$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_ifc$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_adc$(ObjectSuffix) \
	$(IntermediateDirectory)/FWlib_apt32f171_uart$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_epwm$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_tc0$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_tc1$(ObjectSuffix) $(IntermediateDirectory)/FWlib_apt32f171_tc2$(ObjectSuffix) $(IntermediateDirectory)/main$(ObjectSuffix) $(IntermediateDirectory)/apt32f171_interrupt$(ObjectSuffix) $(IntermediateDirectory)/apt32f171_initial$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) $(LinkOtherFlagsOption)  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs)
	$(OBJCOPY) $(ObjcopySwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  $(ProjectPath)/Obj/$(OutputFile)$(IHexSuffix) 
	$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix): arch/mem_init.c  
	$(CC) $(SourceSwitch) arch/mem_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_mem_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_mem_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arch_mem_init$(PreprocessSuffix): arch/mem_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_mem_init$(PreprocessSuffix) arch/mem_init.c

$(IntermediateDirectory)/arch_crt0$(ObjectSuffix): arch/crt0.S  
	$(AS) $(SourceSwitch) arch/crt0.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_crt0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_crt0$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/arch_crt0$(PreprocessSuffix): arch/crt0.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_crt0$(PreprocessSuffix) arch/crt0.S

$(IntermediateDirectory)/arch_apt32f171_iostring$(ObjectSuffix): arch/apt32f171_iostring.c  
	$(CC) $(SourceSwitch) arch/apt32f171_iostring.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_apt32f171_iostring$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_apt32f171_iostring$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_apt32f171_iostring$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arch_apt32f171_iostring$(PreprocessSuffix): arch/apt32f171_iostring.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_apt32f171_iostring$(PreprocessSuffix) arch/apt32f171_iostring.c

$(IntermediateDirectory)/drivers_apt32f171$(ObjectSuffix): drivers/apt32f171.c  
	$(CC) $(SourceSwitch) drivers/apt32f171.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32f171$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32f171$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32f171$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32f171$(PreprocessSuffix): drivers/apt32f171.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32f171$(PreprocessSuffix) drivers/apt32f171.c

$(IntermediateDirectory)/drivers_apt32f171_ck802$(ObjectSuffix): drivers/apt32f171_ck802.c  
	$(CC) $(SourceSwitch) drivers/apt32f171_ck802.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_apt32f171_ck802$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_apt32f171_ck802$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_apt32f171_ck802$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_apt32f171_ck802$(PreprocessSuffix): drivers/apt32f171_ck802.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_apt32f171_ck802$(PreprocessSuffix) drivers/apt32f171_ck802.c

$(IntermediateDirectory)/FWlib_apt32f171_ept$(ObjectSuffix): FWlib/apt32f171_ept.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_ept.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_ept$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_ept$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_ept$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_ept$(PreprocessSuffix): FWlib/apt32f171_ept.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_ept$(PreprocessSuffix) FWlib/apt32f171_ept.c

$(IntermediateDirectory)/FWlib_apt32f171_gpt$(ObjectSuffix): FWlib/apt32f171_gpt.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_gpt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_gpt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_gpt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_gpt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_gpt$(PreprocessSuffix): FWlib/apt32f171_gpt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_gpt$(PreprocessSuffix) FWlib/apt32f171_gpt.c

$(IntermediateDirectory)/FWlib_apt32f171_hwdiv$(ObjectSuffix): FWlib/apt32f171_hwdiv.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_hwdiv.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_hwdiv$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_hwdiv$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_hwdiv$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_hwdiv$(PreprocessSuffix): FWlib/apt32f171_hwdiv.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_hwdiv$(PreprocessSuffix) FWlib/apt32f171_hwdiv.c

$(IntermediateDirectory)/FWlib_apt32f171_bt$(ObjectSuffix): FWlib/apt32f171_bt.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_bt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_bt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_bt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_bt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_bt$(PreprocessSuffix): FWlib/apt32f171_bt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_bt$(PreprocessSuffix) FWlib/apt32f171_bt.c

$(IntermediateDirectory)/FWlib_apt32f171_crc$(ObjectSuffix): FWlib/apt32f171_crc.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_crc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_crc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_crc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_crc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_crc$(PreprocessSuffix): FWlib/apt32f171_crc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_crc$(PreprocessSuffix) FWlib/apt32f171_crc.c

$(IntermediateDirectory)/FWlib_apt32f171_etcb$(ObjectSuffix): FWlib/apt32f171_etcb.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_etcb.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_etcb$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_etcb$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_etcb$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_etcb$(PreprocessSuffix): FWlib/apt32f171_etcb.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_etcb$(PreprocessSuffix) FWlib/apt32f171_etcb.c

$(IntermediateDirectory)/FWlib_apt32f171_wwdt$(ObjectSuffix): FWlib/apt32f171_wwdt.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_wwdt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_wwdt$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_wwdt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_wwdt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_wwdt$(PreprocessSuffix): FWlib/apt32f171_wwdt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_wwdt$(PreprocessSuffix) FWlib/apt32f171_wwdt.c

$(IntermediateDirectory)/FWlib_apt32f171_syscon$(ObjectSuffix): FWlib/apt32f171_syscon.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_syscon.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_syscon$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_syscon$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_syscon$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_syscon$(PreprocessSuffix): FWlib/apt32f171_syscon.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_syscon$(PreprocessSuffix) FWlib/apt32f171_syscon.c

$(IntermediateDirectory)/FWlib_apt32f171_usart$(ObjectSuffix): FWlib/apt32f171_usart.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_usart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_usart$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_usart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_usart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_usart$(PreprocessSuffix): FWlib/apt32f171_usart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_usart$(PreprocessSuffix) FWlib/apt32f171_usart.c

$(IntermediateDirectory)/FWlib_apt32f171_cmp$(ObjectSuffix): FWlib/apt32f171_cmp.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_cmp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_cmp$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_cmp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_cmp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_cmp$(PreprocessSuffix): FWlib/apt32f171_cmp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_cmp$(PreprocessSuffix) FWlib/apt32f171_cmp.c

$(IntermediateDirectory)/FWlib_apt32f171_coret$(ObjectSuffix): FWlib/apt32f171_coret.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_coret.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_coret$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_coret$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_coret$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_coret$(PreprocessSuffix): FWlib/apt32f171_coret.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_coret$(PreprocessSuffix) FWlib/apt32f171_coret.c

$(IntermediateDirectory)/FWlib_apt32f171_gpio$(ObjectSuffix): FWlib/apt32f171_gpio.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_gpio$(PreprocessSuffix): FWlib/apt32f171_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_gpio$(PreprocessSuffix) FWlib/apt32f171_gpio.c

$(IntermediateDirectory)/FWlib_apt32f171_oamp$(ObjectSuffix): FWlib/apt32f171_oamp.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_oamp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_oamp$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_oamp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_oamp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_oamp$(PreprocessSuffix): FWlib/apt32f171_oamp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_oamp$(PreprocessSuffix) FWlib/apt32f171_oamp.c

$(IntermediateDirectory)/FWlib_apt32f171_ifc$(ObjectSuffix): FWlib/apt32f171_ifc.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_ifc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_ifc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_ifc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_ifc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_ifc$(PreprocessSuffix): FWlib/apt32f171_ifc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_ifc$(PreprocessSuffix) FWlib/apt32f171_ifc.c

$(IntermediateDirectory)/FWlib_apt32f171_adc$(ObjectSuffix): FWlib/apt32f171_adc.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_adc$(PreprocessSuffix): FWlib/apt32f171_adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_adc$(PreprocessSuffix) FWlib/apt32f171_adc.c

$(IntermediateDirectory)/FWlib_apt32f171_uart$(ObjectSuffix): FWlib/apt32f171_uart.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_uart$(PreprocessSuffix): FWlib/apt32f171_uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_uart$(PreprocessSuffix) FWlib/apt32f171_uart.c

$(IntermediateDirectory)/FWlib_apt32f171_epwm$(ObjectSuffix): FWlib/apt32f171_epwm.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_epwm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_epwm$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_epwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_epwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_epwm$(PreprocessSuffix): FWlib/apt32f171_epwm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_epwm$(PreprocessSuffix) FWlib/apt32f171_epwm.c

$(IntermediateDirectory)/FWlib_apt32f171_tc0$(ObjectSuffix): FWlib/apt32f171_tc0.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_tc0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_tc0$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_tc0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_tc0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_tc0$(PreprocessSuffix): FWlib/apt32f171_tc0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_tc0$(PreprocessSuffix) FWlib/apt32f171_tc0.c

$(IntermediateDirectory)/FWlib_apt32f171_tc1$(ObjectSuffix): FWlib/apt32f171_tc1.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_tc1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_tc1$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_tc1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_tc1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_tc1$(PreprocessSuffix): FWlib/apt32f171_tc1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_tc1$(PreprocessSuffix) FWlib/apt32f171_tc1.c

$(IntermediateDirectory)/FWlib_apt32f171_tc2$(ObjectSuffix): FWlib/apt32f171_tc2.c  
	$(CC) $(SourceSwitch) FWlib/apt32f171_tc2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FWlib_apt32f171_tc2$(ObjectSuffix) -MF$(IntermediateDirectory)/FWlib_apt32f171_tc2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FWlib_apt32f171_tc2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FWlib_apt32f171_tc2$(PreprocessSuffix): FWlib/apt32f171_tc2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FWlib_apt32f171_tc2$(PreprocessSuffix) FWlib/apt32f171_tc2.c

$(IntermediateDirectory)/main$(ObjectSuffix): main.c  
	$(CC) $(SourceSwitch) main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/main$(ObjectSuffix) -MF$(IntermediateDirectory)/main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/main$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main$(PreprocessSuffix) main.c

$(IntermediateDirectory)/apt32f171_interrupt$(ObjectSuffix): apt32f171_interrupt.c  
	$(CC) $(SourceSwitch) apt32f171_interrupt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32f171_interrupt$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32f171_interrupt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32f171_interrupt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32f171_interrupt$(PreprocessSuffix): apt32f171_interrupt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32f171_interrupt$(PreprocessSuffix) apt32f171_interrupt.c

$(IntermediateDirectory)/apt32f171_initial$(ObjectSuffix): apt32f171_initial.c  
	$(CC) $(SourceSwitch) apt32f171_initial.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/apt32f171_initial$(ObjectSuffix) -MF$(IntermediateDirectory)/apt32f171_initial$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/apt32f171_initial$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/apt32f171_initial$(PreprocessSuffix): apt32f171_initial.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/apt32f171_initial$(PreprocessSuffix) apt32f171_initial.c


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S

-include $(IntermediateDirectory)/*$(DependSuffix)

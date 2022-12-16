.PHONY: clean All Project_Title Project_Build

All: Project_Title Project_Build

Project_Title:
	@echo "----------Building project:[ apt32f171a - BuildSet ]----------"

Project_Build:
	@make -r -f apt32f171a.mk -j 6 -C  "D:/OneDrive/Works/Work Storage/Project/MCU/APT32F171/std/APT32F171_StdPeriph_Lib_V1_00/Source" 


clean:
	@echo "----------Cleaning project:[ apt32f171a - BuildSet ]----------"


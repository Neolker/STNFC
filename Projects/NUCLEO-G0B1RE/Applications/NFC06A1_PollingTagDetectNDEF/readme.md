::: {.row}
::: {.col-sm-12 .col-lg-8}
**NFC06A1 Polling Tag Detect NDEF**
-----------------------------------

This application reads/writes NDEF messages as well as work in CE mode

Example Description:

This directory contains a set of source files that implement a simple example based on ST25R3916.
-------------------------------------------------------------------------------------------------

WARNING: When starting the project from Example Selector in STM32CubeMX
and regenerating it from ioc file, you may face a build issue. To solve
it, assuming you started the project for the Nucleo-L476RG board, remove
from the IDE project the file stm32l4xx\_nucleo.c in the
Application/User virtual folder and delete, from Src and Inc folders,
the files: stm32l4xx\_nucleo.c, stm32l4xx\_nucleo.h,
stm32l4xx\_nucleo\_bus.c, stm32l4xx\_nucleo\_bus.h and
stm32l4xx\_nucleo\_errno.h. The same operations apply if you starts the
project for another STM32 Nucleo board (e.g. for Nucleo-L053R8, the
files to be removed are stm32l0xx\_nucleo.c, stm32l0xx\_nucleo.c,
stm32l0xx\_nucleo.h, stm32l0xx\_nucleo\_bus.c, stm32l0xx\_nucleo\_bus.h
and stm32l0xx\_nucleo\_errno.h). ------------------------------------

### **Keywords**

NFC, NDEF, SPI, ST25R3916

### **Directory contents**

-   app\_x-cube-nfcx.c NFC6 initialization and applicative code

-   analogConfigTbl\_NFC06A1.c Analog configuration file

-   main.c Main program body

-   logger.c Logger file

-   demo\_polling.c NDEF polling File

-   demo\_ce.c manage card emul mode

-   stm32\*\*xx\_hal\_msp.c Source code for MSP Initialization and
    de-Initialization

-   stm32\*\*xx\_it.c Source code for interrupt Service Routines

-   stm32\*\*xx\_nucleo.c Source file for the BSP Common driver

-   stm32\*\*xx\_nucleo\_bus.c Source file for the BSP BUS IO driver

-   system\_stm32\*\*xx.c CMSIS Cortex-Mx Device Peripheral Access Layer
    System Source File

### **Hardware and Software environment**

-   This example runs on STM32 Nucleo devices with NFC6 expansion board
-   X-NUCLEO-NFC06A1

-   This example has been tested with STMicroelectronics:
-   NUCLEO-G0B1RE RevC board
-   NUCLEO-L476RG RevC board and can be easily tailored to any other
    supported device and development board.

ADDITIONAL\_BOARD : X-NUCLEO-NFC06A1
https://www.st.com/en/ecosystems/x-nucleo-nfc06a1.html ADDITIONAL\_COMP
: ST25R3916 https://www.st.com/en/nfc/st25r3916.html

### **How to use it?**

In order to make the program work, you must do the following : - Open
your preferred toolchain - Rebuild all files and load your image into
target memory - Run the example - \< Add any other step(s) to be done by
the user to make the example working \>

### **Author**

SRA Application Team

### **License**

Copyright (c) 2022 STMicroelectronics. All rights reserved.

This software is licensed under terms that can be found in the LICENSE
file in the root directory of this software component. If no LICENSE
file comes with this software, it is provided AS-IS.
:::
:::

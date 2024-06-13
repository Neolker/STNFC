[#ftl]
/**
  ******************************************************************************
  * @file           : nfc_conf.c
  * @brief          : This file contains definitions for the NFC6/8 components bus interfaces
  ******************************************************************************
  * @attention
  *
  * Copyright (c) ${year} STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
[#assign IpInstance = ""]
[#assign IpName = ""]
[#assign ExtiLine = ""]
[#assign IrqNumber = ""]
[#assign NFC0XCOMMInstance = ""]
[#assign NFC_INT_PORT = ""]
[#assign NFC_INT_PIN = ""]
[#assign NFC_INT_EXTI_LINE = ""]
[#assign NFC_INT_EXTI_IRQn = ""]

[#if BspIpDatas??]
  [#list BspIpDatas as SWIP] 
	[#if SWIP.variables??]
		[#list SWIP.variables as variables]
			[#if variables.name?contains("IpInstance")]
				[#assign IpInstance = variables.value]
			[/#if]
			[#if variables.name?contains("IpName")]
				[#assign IpName = variables.value]
			[/#if]
			[#if variables.value?contains("NFC06A1_8A1 BUS IO driver")]
				[#assign NFC0XCOMMInstance = IpInstance]
			[/#if]
			[#if variables.name?contains("GPIO_INT_NUM")]
				[#assign IrqNumber = variables.value]
			[/#if]
			[#if variables.name?contains("EXTI_LINE_NUMBER")]
				[#assign ExtiLine = variables.value]
			[/#if]		
			[#if variables.value?contains("NFC INT PIN")]
				[#assign NFC_INT_PORT = IpName]
				[#assign NFC_INT_PIN = IpInstance]		
                [#assign NFC_INT_EXTI_LINE = ExtiLine]
				[#assign NFC_INT_EXTI_IRQn = IrqNumber]					
			[/#if]			
		[/#list]
	[/#if]
  [/#list]
[/#if]



[#assign useNFC6POLLINGTAGDETECT = false]
[#assign useNFC6POLLINGTAGDETECTNDEF = false]
[#assign useNFC8POLLINGTAGDETECT = false]
[#assign useNFC8POLLINGTAGDETECTNDEF = false]
[#assign useSPI = false]
[#assign useI2C = false]
[#assign useCustomNFC6TAG = false]
[#assign useCustomNFC8TAG = false]
[#assign useBOARDNFC6 = false]
[#assign useBOARDNFC8 = false]



[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("NFC06A1_POLLING_TAG_DETECT")]
[#assign useNFC6POLLINGTAGDETECT = true]
[/#if]

[#if define?contains("NFC06A1_POLLING_TAG_DETECT_NDEF")]
[#assign useNFC6POLLINGTAGDETECTNDEF = true]
[#assign useNFC6POLLINGTAGDETECT = false]
[/#if]

[#if define?contains("NFC08A1_POLLING_TAG_DETECT")]
[#assign useNFC8POLLINGTAGDETECT = true]
[/#if]

[#if define?contains("NFC08A1_POLLING_TAG_DETECT_NDEF")]
[#assign useNFC8POLLINGTAGDETECTNDEF = true]
[#assign useNFC8POLLINGTAGDETECT = false]
[/#if]

[#if define?contains("BSP_NFC6TAG")]
[#assign useCustomNFC6TAG = true]
[/#if]

[#if define?contains("BSP_NFC8TAG")]
[#assign useCustomNFC8TAG = true]
[/#if]

[#if define?contains("USE_I2C")]
[#assign useI2C = true]
[/#if]

[#if define?contains("USE_SPI")]
[#assign useSPI = true]
[/#if]

[#if define?contains("USE_NFC06A1")]
[#assign useBOARDNFC6 = true]
[/#if]

[#if define?contains("USE_NFC08A1")]
[#assign useBOARDNFC8 = true]
[/#if]


[/#list]
[/#if] 
 
#include "${FamilyName?lower_case}xx_hal.h"
#include "nfc_conf.h" 
 

/* Private variables ---------------------------------------------------------*/
EXTI_HandleTypeDef USR_INT_LINE;  

/* Private user code ---------------------------------------------------------*/
/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void _Error_Handler(char * file, int line)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
  



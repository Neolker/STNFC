[#ftl]
/**
  ******************************************************************************
  * @file           : st25r3916_conf.h
  * @brief          : Header file for st25r3916_conf.c
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __ST25R3916_CONF_H__
#define __ST25R3916_CONF_H__

#ifdef __cplusplus
extern "C" {
#endif
 
 
#include "${FamilyName?lower_case}xx_hal.h"
#include "${BoardName}_bus.h"
#include "${BoardName}_errno.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"

[#assign IpInstance = ""]
[#assign IpName = ""]
[#assign ExtiLine = ""]
[#assign IrqNumber = ""]
[#assign NFC7_INT_PIN_GPO_EXTI_LINE = ""]
[#assign CUSTOM_GPO_PORT = ""]
[#assign CUSTOM_GPO_PIN = ""]
[#assign NFC7_INT_PIN_GPO_EXTI_IRQn = ""]
[#assign ST25DVXXKCI2CInstance = ""]


[#list BspIpDatas as SWIP] 
	[#if SWIP.variables??]
		[#list SWIP.variables as variables]
			[#if variables.name?contains("IpInstance")]
				[#assign IpInstance = variables.value]
			[/#if]
			[#if variables.name?contains("IpName")]
				[#assign IpName = variables.value]
			[/#if]
			[#if variables.value?contains("ST25DVXXKC BUS IO driver")]
				[#assign ST25DVXXKCI2CInstance = IpInstance]
			[/#if]
			[#if variables.name?contains("GPIO_INT_NUM")]
				[#assign IrqNumber = variables.value]
			[/#if]
			[#if variables.name?contains("EXTI_LINE_NUMBER")]
				[#assign ExtiLine = variables.value]
			[/#if]
			[#if variables.value?contains("ST25DVXXKC GPO PIN")]
				[#assign CUSTOM_GPO_PORT = IpName]
				[#assign CUSTOM_GPO_PIN = IpInstance]	
				[#assign NFC7_INT_PIN_GPO_EXTI_LINE = ExtiLine]
				[#assign NFC7_INT_PIN_GPO_EXTI_IRQn = IrqNumber]
			[/#if]		
        [/#list]
	[/#if]
[/#list]			


[#if ST25DVXXKCI2CInstance != ""]
#define CUSTOM_ST25DVXXKC_I2C_Init         BSP_${ST25DVXXKCI2CInstance}_Init
#define CUSTOM_ST25DVXXKC_I2C_DeInit       BSP_${ST25DVXXKCI2CInstance}_DeInit
#define CUSTOM_ST25DVXXKC_I2C_ReadReg16    BSP_${ST25DVXXKCI2CInstance}_ReadReg16
#define CUSTOM_ST25DVXXKC_I2C_WriteReg16   BSP_${ST25DVXXKCI2CInstance}_WriteReg16
#define CUSTOM_ST25DVXXKC_I2C_Recv         BSP_${ST25DVXXKCI2CInstance}_Recv
#define CUSTOM_ST25DVXXKC_I2C_IsReady      BSP_${ST25DVXXKCI2CInstance}_IsReady

#define CUSTOM_ST25DVXXKC_GetTick HAL_GetTick

[/#if]

[#if CUSTOM_GPO_PORT != ""]
#define ST25DVXXKC_INT_PIN_GPO_EXTI_PORT ${CUSTOM_GPO_PORT}
[/#if]
[#if CUSTOM_GPO_PIN != ""]
#define ST25DVXXKC_INT_PIN_GPO_EXTI_PIN ${CUSTOM_GPO_PIN}
[/#if]
[#if NFC7_INT_PIN_GPO_EXTI_LINE != ""]
#define ST25DVXXKC_INT_PIN_GPO_EXTI_LINE EXTI_LINE_${NFC7_INT_PIN_GPO_EXTI_LINE}
[/#if]
[#if NFC7_INT_PIN_GPO_EXTI_IRQn != ""]
#define ST25DVXXKC_INT_PIN_GPO_EXTI_IRQn ${NFC7_INT_PIN_GPO_EXTI_IRQn}
extern EXTI_HandleTypeDef GPO_EXTI;
#define H_EXTI_${NFC7_INT_PIN_GPO_EXTI_LINE}  GPO_EXTI 
[/#if]



#define CUSTOM_NFCTAG_INSTANCE         (0)
#define CUSTOM_NFCTAG_GPO_PRIORITY     (0)
#ifdef __cplusplus
}
#endif

#endif /* __ST25R3916_CONF_H__*/



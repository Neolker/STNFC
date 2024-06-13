[#ftl]
/**
  ******************************************************************************
  * @file           : nfc_conf.h
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
[#assign LED1_PORT = ""]
[#assign LED1_PIN = ""]
[#assign LED2_PORT = ""]
[#assign LED2_PIN = ""]
[#assign LED3_PORT = ""]
[#assign LED3_PIN = ""]
[#assign LED4_PORT = ""]
[#assign LED4_PIN = ""]
[#assign LED5_PORT = ""]
[#assign LED5_PIN = ""]
[#assign LED6_PORT = ""]
[#assign LED6_PIN = ""]
[#assign NFC_CS_PORT = ""]
[#assign NFC_CS_PIN = ""]
[#assign NFC_INT_PORT = ""]
[#assign NFC_INT_PIN = ""]
[#assign NFC_INT_EXTI_LINE = ""]
[#assign NFC_INT_EXTI_IRQn = ""]
[#assign TESTED_VAR = true]
[#assign RFAL_FEATURE_ISO_DEP_IBLOCK_MAX_LEN_TEST = "0x10"]

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
			[#if variables.value?contains("LED1")]
				[#assign LED1_PORT = IpName]
				[#assign LED1_PIN = IpInstance]				
			[/#if]
			[#if variables.value?contains("LED2")]
				[#assign LED2_PORT = IpName]
				[#assign LED2_PIN = IpInstance]				
			[/#if]
			[#if variables.value?contains("LED3")]
				[#assign LED3_PORT = IpName]
				[#assign LED3_PIN = IpInstance]				
			[/#if]	
			[#if variables.value?contains("LED4")]
				[#assign LED4_PORT = IpName]
				[#assign LED4_PIN = IpInstance]				
			[/#if]
			[#if variables.value?contains("LED5")]
				[#assign LED5_PORT = IpName]
				[#assign LED5_PIN = IpInstance]				
			[/#if]
			[#if variables.value?contains("LED6")]
				[#assign LED6_PORT = IpName]
				[#assign LED6_PIN = IpInstance]				
			[/#if]		
			[#if variables.value?contains("NFC CS PIN")]
				[#assign NFC_CS_PORT = IpName]
				[#assign NFC_CS_PIN = IpInstance]				
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __NFC0XA1_CONF_H__
#define __NFC0XA1_CONF_H__

#ifdef __cplusplus
extern "C" {
#endif
 
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
[#assign useNDEF                = false]

[#assign USE_RFAL_FEATURE_LISTEN_MODE            = false]
[#assign USE_RFAL_FEATURE_WAKEUP_MODE            = false]
[#assign USE_RFAL_FEATURE_LOWPOWER_MODE          = false]
[#assign USE_RFAL_FEATURE_NFCA                   = false]
[#assign USE_RFAL_FEATURE_NFCB                   = false]
[#assign USE_RFAL_FEATURE_NFCF                   = false]
[#assign USE_RFAL_FEATURE_NFCV                   = false]
[#assign USE_RFAL_FEATURE_T1T                    = false]
[#assign USE_RFAL_FEATURE_T2T                    = false]
[#assign USE_RFAL_FEATURE_T4T                    = false]
[#assign USE_RFAL_FEATURE_ST25TB                 = false]
[#assign USE_RFAL_FEATURE_ST25xV                 = false]
[#assign USE_RFAL_FEATURE_DYNAMIC_ANALOG_CONFIG  = false]
[#assign USE_RFAL_FEATURE_DPO                    = false]
[#assign USE_RFAL_FEATURE_ISO_DEP                = false]
[#assign USE_RFAL_FEATURE_ISO_DEP_POLL           = false]
[#assign USE_RFAL_FEATURE_ISO_DEP_LISTEN         = false]
[#assign USE_RFAL_FEATURE_NFC_DEP                = false]

[#assign USE_RFAL_DEFAULT_CONFIG                 = false]
[#assign USE_RFAL_CUSTOM_CONFIG                  = false]
[#assign RFAL_FEATURE_ISO_DEP_IBLOCK_MAX_LEN_TEST                  = "0x10"]

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

[#if define?contains("LIB_NDEF_DEFAULT")]
[#assign useNDEF = true]
[/#if]

[#if define?contains("LIB_RFAL_DEFAULT")]
[#assign USE_RFAL_DEFAULT_CONFIG = true]
[/#if]

[#if define?contains("LIB_RFAL_CUSTOM")]
[#assign USE_RFAL_CUSTOM_CONFIG = true]
[/#if]

[#if define?contains("RFAL_FEATURE_LISTEN_MODE")]
[#assign USE_RFAL_FEATURE_LISTEN_MODE = true]
[/#if]

[#if define?contains("RFAL_FEATURE_WAKEUP_MODE")]
[#assign USE_RFAL_FEATURE_WAKEUP_MODE = true]
[/#if]

[#if define?contains("RFAL_FEATURE_LOWPOWER_MODE")]
[#assign USE_RFAL_FEATURE_LOWPOWER_MODE = true]
[/#if]

[#if define?contains("RFAL_FEATURE_NFCA")]
[#assign USE_RFAL_FEATURE_NFCA = true]
[/#if]

[#if define?contains("RFAL_FEATURE_NFCB")]
[#assign USE_RFAL_FEATURE_NFCB = true]
[/#if]

[#if define?contains("RFAL_FEATURE_NFCF")]
[#assign USE_RFAL_FEATURE_NFCF = true]
[/#if]

[#if define?contains("RFAL_FEATURE_NFCV")]
[#assign USE_RFAL_FEATURE_NFCV = true]
[/#if]

[#if define?contains("RFAL_FEATURE_T1T")]
[#assign USE_RFAL_FEATURE_T1T = true]
[/#if]

[#if define?contains("RFAL_FEATURE_T2T")]
[#assign USE_RFAL_FEATURE_T2T = true]
[/#if]

[#if define?contains("RFAL_FEATURE_T4T")]
[#assign USE_RFAL_FEATURE_T4T = true]
[/#if]

[#if define?contains("RFAL_FEATURE_ST25TB")]
[#assign USE_RFAL_FEATURE_ST25TB = true]
[/#if]

[#if define?contains("RFAL_FEATURE_ST25xV")]
[#assign USE_RFAL_FEATURE_ST25xV = true]
[/#if]

[#if define?contains("RFAL_FEATURE_DYNAMIC_ANALOG_CONFIG")]
[#assign USE_RFAL_FEATURE_DYNAMIC_ANALOG_CONFIG = true]
[/#if]

[#if define?contains("RFAL_FEATURE_DPO")]
[#assign USE_RFAL_FEATURE_DPO = true]
[/#if]

[#if define?contains("RFAL_FEATURE_ISO_DEP")]
[#assign USE_RFAL_FEATURE_ISO_DEP = true]
[/#if]

[#if define?contains("RFAL_FEATURE_ISO_DEP_POLL")]
[#assign USE_RFAL_FEATURE_ISO_DEP_POLL = true]
[/#if]

[#if define?contains("RFAL_FEATURE_ISO_DEP_LISTEN")]
[#assign USE_RFAL_FEATURE_ISO_DEP_LISTEN = true]
[/#if]

[#if define?contains("RFAL_FEATURE_NFC_DEP")]
[#assign USE_RFAL_FEATURE_NFC_DEP = true]

[/#if]

[/#list]
[/#if] 
[#compress]

[#list SWIPdatas as SWIP]
    [#if SWIP.defines??]
        [#list SWIP.defines as definition]
            [#assign value = definition.value]
            [#assign name = definition.name]
         
            [#if name == "RFAL_FEATURE_ISO_DEP_IBLOCK_MAX_LEN"]
                [#assign TEST_RFAL_FEATURE_ISO_DEP_IBLOCK_MAX_LEN = value]
            [/#if]
			
			[#if name == "RFAL_FEATURE_NFC_RF_BUF_LEN"]
                [#assign TEST_RFAL_FEATURE_NFC_RF_BUF_LEN = value]
            [/#if]
			
			[#if name == "RFAL_FEATURE_NFC_DEP_BLOCK_MAX_LEN"]
                [#assign TEST_RFAL_FEATURE_NFC_DEP_BLOCK_MAX_LEN= value]
            [/#if]
			
			[#if name == "RFAL_FEATURE_ISO_DEP_APDU_MAX_LEN"]
                [#assign TEST_RFAL_FEATURE_ISO_DEP_APDU_MAX_LEN= value]
            [/#if]
			
			[#if name == "RFAL_FEATURE_NFC_DEP_PDU_MAX_LEN"]
                [#assign TEST_RFAL_FEATURE_NFC_DEP_PDU_MAX_LEN= value]
            [/#if]
         
        [/#list]
    [/#if]
[/#list]

[/#compress]


#include "${FamilyName?lower_case}xx_hal.h"
#include "${BoardName}_bus.h"
#include "${BoardName}_errno.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"
#include "RTE_Components.h"
#include "st25r3916_irq.h"
[#if USE_RFAL_DEFAULT_CONFIG]
#include "rfal_defConfig.h"                   
[/#if] 

#define TEST               ${NFC_INT_EXTI_LINE}
#define TEST_LINE          ${NFC_INT_EXTI_IRQn}


[#if useNDEF]
#define TEST_USE_NDEF_TRUE                    
[/#if] 

[#if USE_RFAL_DEFAULT_CONFIG]
#define TEST_RFAL_DEFAULT                    
[/#if] 

[#if USE_RFAL_CUSTOM_CONFIG]
#define TEST_RFAL_CUSTOM                   
[/#if] 

[#if USE_RFAL_CUSTOM_CONFIG]

[#if USE_RFAL_FEATURE_LISTEN_MODE]
[#if ("${McuName}"?contains("STM32L053R8"))]
#define RFAL_FEATURE_LISTEN_MODE                    false       /*!< Enable/Disable RFAL support for Listen Mode                               */
[#else ]
#define RFAL_FEATURE_LISTEN_MODE                    true       /*!< Enable/Disable RFAL support for Listen Mode                               */
[/#if]
[#else]
#define RFAL_FEATURE_LISTEN_MODE                    false  /*!< Enable/Disable RFAL support for Listen Mode                               */
[/#if] 
[#if USE_RFAL_FEATURE_WAKEUP_MODE]
#define RFAL_FEATURE_WAKEUP_MODE                    true /*!< Enable/Disable RFAL support for the Wake-Up mode                          */
[#else]
#define RFAL_FEATURE_WAKEUP_MODE                    false /*!< Enable/Disable RFAL support for the Wake-Up mode                          */
[/#if] 
[#if USE_RFAL_FEATURE_LOWPOWER_MODE]
#define RFAL_FEATURE_LOWPOWER_MODE                  true  /*!< Enable/Disable RFAL support for the Low Power mode                        */
[#else]
#define RFAL_FEATURE_LOWPOWER_MODE                  false /*!< Enable/Disable RFAL support for the Low Power mode                        */
[/#if] 
[#if USE_RFAL_FEATURE_NFCA]
#define RFAL_FEATURE_NFCA                           true /*!< Enable/Disable RFAL support for NFC-A (ISO14443A)                         */
[#else]
#define RFAL_FEATURE_NFCA                           false /*!< Enable/Disable RFAL support for NFC-A (ISO14443A)                         */
[/#if] 
[#if USE_RFAL_FEATURE_NFCB]
#define RFAL_FEATURE_NFCB                           true  /*!< Enable/Disable RFAL support for NFC-B (ISO14443B)                         */
[#else]
#define RFAL_FEATURE_NFCB                           false /*!< Enable/Disable RFAL support for NFC-B (ISO14443B)                         */
[/#if] 
[#if USE_RFAL_FEATURE_NFCF]
#define RFAL_FEATURE_NFCF                           true /*!< Enable/Disable RFAL support for NFC-F (FeliCa)                            */
[#else]
#define RFAL_FEATURE_NFCF                           false /*!< Enable/Disable RFAL support for NFC-F (FeliCa)                            */
[/#if] 
[#if USE_RFAL_FEATURE_NFCV]
#define RFAL_FEATURE_NFCV                           true /*!< Enable/Disable RFAL support for NFC-V (ISO15693)                          */
[#else]
#define RFAL_FEATURE_NFCV                           false /*!< Enable/Disable RFAL support for NFC-V (ISO15693)                          */
[/#if] 
[#if USE_RFAL_FEATURE_T1T]
#define RFAL_FEATURE_T1T                            true /*!< Enable/Disable RFAL support for T1T (Topaz)                               */
[#else]
#define RFAL_FEATURE_T1T                            false /*!< Enable/Disable RFAL support for T1T (Topaz)                               */
[/#if] 
[#if USE_RFAL_FEATURE_T2T]
#define RFAL_FEATURE_T2T                            true /*!< Enable/Disable RFAL support for T2T                                       */
[#else]
#define RFAL_FEATURE_T2T                            false /*!< Enable/Disable RFAL support for T2T                                       */
[/#if] 
[#if USE_RFAL_FEATURE_T4T]
#define RFAL_FEATURE_T4T                            true /*!< Enable/Disable RFAL support for T4T                                       */
[#else]
#define RFAL_FEATURE_T4T                            false /*!< Enable/Disable RFAL support for T4T                                       */
[/#if] 
[#if USE_RFAL_FEATURE_ST25TB]
#define RFAL_FEATURE_ST25TB                         true /*!< Enable/Disable RFAL support for ST25TB                                    */
[#else]
#define RFAL_FEATURE_ST25TB                         false /*!< Enable/Disable RFAL support for ST25TB                                    */
[/#if] 
[#if USE_RFAL_FEATURE_ST25xV]
#define RFAL_FEATURE_ST25xV                         true  /*!< Enable/Disable RFAL support for  ST25TV/ST25DV                            */
[#else]
#define RFAL_FEATURE_ST25xV                         false  /*!< Enable/Disable RFAL support for  ST25TV/ST25DV                            */
[/#if] 
[#if USE_RFAL_FEATURE_DYNAMIC_ANALOG_CONFIG] 
#define RFAL_FEATURE_DYNAMIC_ANALOG_CONFIG          true  /*!< Enable/Disable Analog Configs to be dynamically updated (RAM)             */
[#else]
#define RFAL_FEATURE_DYNAMIC_ANALOG_CONFIG          false  /*!< Enable/Disable Analog Configs to be dynamically updated (RAM)             */
[/#if] 
[#if USE_RFAL_FEATURE_DPO]
#define RFAL_FEATURE_DPO                            true  /*!< Enable/Disable RFAL Dynamic Power Output support                          */
[#else]
#define RFAL_FEATURE_DPO                            false  /*!< Enable/Disable RFAL Dynamic Power Output support                          */
[/#if] 
[#if USE_RFAL_FEATURE_ISO_DEP]
#define RFAL_FEATURE_ISO_DEP                        true /*!< Enable/Disable RFAL support for ISO-DEP (ISO14443-4)                      */
[#else]
#define RFAL_FEATURE_ISO_DEP                        false /*!< Enable/Disable RFAL support for ISO-DEP (ISO14443-4)                      */
[/#if] 
[#if USE_RFAL_FEATURE_ISO_DEP_POLL]
#define RFAL_FEATURE_ISO_DEP_POLL                   true /*!< Enable/Disable RFAL support for Poller mode (PCD) ISO-DEP (ISO14443-4)    */
[#else]
#define RFAL_FEATURE_ISO_DEP_POLL                   false /*!< Enable/Disable RFAL support for Poller mode (PCD) ISO-DEP (ISO14443-4)    */
[/#if] 
[#if USE_RFAL_FEATURE_ISO_DEP_LISTEN]
#define RFAL_FEATURE_ISO_DEP_LISTEN                 true /*!< Enable/Disable RFAL support for Listen mode (PICC) ISO-DEP (ISO14443-4)   */
[#else]
#define RFAL_FEATURE_ISO_DEP_LISTEN                 false /*!< Enable/Disable RFAL support for Listen mode (PICC) ISO-DEP (ISO14443-4)   */
[/#if] 
[#if USE_RFAL_FEATURE_NFC_DEP]
[#if ("${McuName}"?contains("STM32L053R8"))]
#define RFAL_FEATURE_NFC_DEP                        false       /*!< Enable/Disable RFAL support for NFC-DEP (NFCIP1/P2P)                      */
[#else ]
#define RFAL_FEATURE_NFC_DEP                        true       /*!< Enable/Disable RFAL support for NFC-DEP (NFCIP1/P2P)                      */
[/#if]
[#else]
#define RFAL_FEATURE_NFC_DEP                        false /*!< Enable/Disable RFAL support for NFC-DEP (NFCIP1/P2P)                      */
[/#if] 



[#if useNDEF] 
[#if !(USE_RFAL_FEATURE_T1T & USE_RFAL_FEATURE_T2T & USE_RFAL_FEATURE_T4T & USE_RFAL_FEATURE_NFCF & USE_RFAL_FEATURE_NFCV & USE_RFAL_FEATURE_ST25xV)]
#warning "To use NDEF, Select features: RFAL_FEATURE_T1T, RFAL_FEATURE_T2T, RFAL_FEATURE_T4T, RFAL_FEATURE_NFCF, RFAL_FEATURE_NFCV and RFAL_FEATURE_ST25xV"
[/#if] 
[/#if] 


[#if USE_RFAL_FEATURE_T1T | USE_RFAL_FEATURE_T2T] 
[#if !USE_RFAL_FEATURE_NFCA]
#warning "Please select feature : RFAL_FEATURE_NFCA"
[/#if] 
[/#if] 


[#if USE_RFAL_FEATURE_T4T] 
[#if !USE_RFAL_FEATURE_ISO_DEP]
#warning "Please select feature : RFAL_FEATURE_ISO_DEP"
[/#if] 
[/#if] 

[#if USE_RFAL_FEATURE_ST25TB] 
[#if !USE_RFAL_FEATURE_NFCB]
#warning "Please select feature : RFAL_FEATURE_NFCB"
[/#if] 
[/#if] 


[#if USE_RFAL_FEATURE_ST25xV] 
[#if !USE_RFAL_FEATURE_NFCV]
#warning "Please select feature : RFAL_FEATURE_NFCV"
[/#if] 
[/#if] 


[#if USE_RFAL_FEATURE_ISO_DEP] 
[#if !(USE_RFAL_FEATURE_NFCA & USE_RFAL_FEATURE_NFCB & (USE_RFAL_FEATURE_ISO_DEP_POLL | USE_RFAL_FEATURE_ISO_DEP_LISTEN ))]
#warning "Please select feature : RFAL_FEATURE_NFCA and RFAL_FEATURE_NFCB and (RFAL_FEATURE_ISO_DEP_POLL or RFAL_FEATURE_ISO_DEP_LISTEN"
[/#if] 
[/#if] 


[#if USE_RFAL_FEATURE_NFC_DEP] 
[#if !(USE_RFAL_FEATURE_NFCA & USE_RFAL_FEATURE_NFCF)]
#warning "Please select feature : RFAL_FEATURE_NFCA & RFAL_FEATURE_NFCF"
[/#if] 
[/#if] 


/*
******************************************************************************
* RFAL FEATURES CONFIGURATION
******************************************************************************
*/

#define RFAL_FEATURE_ISO_DEP_IBLOCK_MAX_LEN ${TEST_RFAL_FEATURE_ISO_DEP_IBLOCK_MAX_LEN}U  /*!< ISO-DEP I-Block max length. Please use values as defined by rfalIsoDepFSx */
#define RFAL_FEATURE_NFC_RF_BUF_LEN         ${TEST_RFAL_FEATURE_NFC_RF_BUF_LEN}U          /*!< RF buffer length used by RFAL NFC layer                                   */
#define RFAL_FEATURE_NFC_DEP_BLOCK_MAX_LEN  ${TEST_RFAL_FEATURE_NFC_DEP_BLOCK_MAX_LEN}U   /*!< NFC-DEP Block/Payload length. Allowed values: 64, 128, 192, 254           */
#define RFAL_FEATURE_ISO_DEP_APDU_MAX_LEN   ${TEST_RFAL_FEATURE_ISO_DEP_APDU_MAX_LEN}U    /*!< ISO-DEP APDU max length. Please use multiples of I-Block max length       */
#define RFAL_FEATURE_NFC_DEP_PDU_MAX_LEN    ${TEST_RFAL_FEATURE_NFC_DEP_PDU_MAX_LEN}U     /*!< NFC-DEP PDU max length.                                                   */

/*
******************************************************************************
* RFAL CUSTOM SETTINGS
******************************************************************************
  Custom analog configs are used to cope with Automatic Antenna Tuning (AAT)
  that are optimized differently for each board.
*/
#define RFAL_ANALOG_CONFIG_CUSTOM                         /*!< Use Custom Analog Configs when defined                                    */

[/#if] 


[#if TESTED_VAR]
#define TESTED_VAR_OK_BMP         
[/#if] 

[#if useI2C]
#define TEST_I2C 
#define RFAL_USE_I2C            
[/#if] 

#define LED_FIELD_Pin 1         /*!< Enable usage of led field pin on the platform      */
#define LED_FIELD_GPIO_Port 1   /*!< Enable usage of led field port on the platform     */
#define USE_LOGGER 1


[#if useNFC6POLLINGTAGDETECT | useNFC6POLLINGTAGDETECTNDEF | useCustomNFC6TAG | useBOARDNFC6]
#define NFC06A1_LED1_PIN_CLK_ENABLE()     __HAL_RCC_${LED1_PORT}_CLK_ENABLE()
#define NFC06A1_LED2_PIN_CLK_ENABLE()     __HAL_RCC_${LED2_PORT}_CLK_ENABLE()
#define NFC06A1_LED3_PIN_CLK_ENABLE()     __HAL_RCC_${LED3_PORT}_CLK_ENABLE()
#define NFC06A1_LED4_PIN_CLK_ENABLE()     __HAL_RCC_${LED4_PORT}_CLK_ENABLE()
#define NFC06A1_LED5_PIN_CLK_ENABLE()     __HAL_RCC_${LED5_PORT}_CLK_ENABLE()
#define NFC06A1_LED6_PIN_CLK_ENABLE()     __HAL_RCC_${LED6_PORT}_CLK_ENABLE()
#define NFC06A1_LED1_PIN                  ${LED1_PIN}
#define NFC06A1_LED1_PIN_PORT             ${LED1_PORT}
#define NFC06A1_LED2_PIN                  ${LED2_PIN}
#define NFC06A1_LED2_PIN_PORT             ${LED2_PORT}
#define NFC06A1_LED3_PIN                  ${LED3_PIN}
#define NFC06A1_LED3_PIN_PORT             ${LED3_PORT}
#define NFC06A1_LED4_PIN                  ${LED4_PIN}
#define NFC06A1_LED4_PIN_PORT             ${LED4_PORT}
#define NFC06A1_LED5_PIN                  ${LED5_PIN}
#define NFC06A1_LED5_PIN_PORT             ${LED5_PORT}
#define NFC06A1_LED6_PIN                  ${LED6_PIN}
#define NFC06A1_LED6_PIN_PORT             ${LED6_PORT}

#define NFC06A1_ALLLED_GPIO_CLK_ENABLE() {NFC06A1_LED1_PIN_CLK_ENABLE();NFC06A1_LED2_PIN_CLK_ENABLE();NFC06A1_LED3_PIN_CLK_ENABLE();NFC06A1_LED4_PIN_CLK_ENABLE();NFC06A1_LED5_PIN_CLK_ENABLE();NFC06A1_LED6_PIN_CLK_ENABLE();}
#define NFC06A1_NFCTAG_INSTANCE         (0)
#define NFC06A1_NFCTAG_GPO_PRIORITY     (0)

#ifdef LED_FIELD_Pin
/* Case of ST25R3916 */
#define PLATFORM_LED_FIELD_PIN       ${LED6_PIN}         /*!< GPIO pin used as field LED                        */
#endif

#ifdef LED_FIELD_GPIO_Port
/* Case of ST25R3916 */
#define PLATFORM_LED_FIELD_PORT       ${LED6_PORT}    /*!< GPIO port used as field LED                       */
#endif

/* Case of ST25R3916 */
#define PLATFORM_LED_A_PIN           ${LED3_PIN}         /*!< GPIO pin used for LED A    */
#define PLATFORM_LED_A_PORT          ${LED3_PORT}    /*!< GPIO port used for LED A   */
#define PLATFORM_LED_B_PIN           ${LED2_PIN}         /*!< GPIO pin used for LED B    */
#define PLATFORM_LED_B_PORT          ${LED2_PORT}    /*!< GPIO port used for LED B   */
#define PLATFORM_LED_F_PIN           ${LED1_PIN}         /*!< GPIO pin used for LED F    */
#define PLATFORM_LED_F_PORT          ${LED1_PORT}    /*!< GPIO port used for LED F   */
#define PLATFORM_LED_V_PIN           ${LED4_PIN}         /*!< GPIO pin used for LED V    */
#define PLATFORM_LED_V_PORT          ${LED4_PORT}    /*!< GPIO port used for LED V   */
#define PLATFORM_LED_AP2P_PIN        ${LED5_PIN}         /*!< GPIO pin used for LED AP2P */
#define PLATFORM_LED_AP2P_PORT       ${LED5_PORT}    /*!< GPIO port used for LED AP2P*/

[/#if]



[#if useNFC8POLLINGTAGDETECT | useNFC8POLLINGTAGDETECTNDEF | useCustomNFC8TAG | useBOARDNFC8]

#ifdef LED_FIELD_GPIO_Port
/* Case of ST25R3916B */
#define PLATFORM_LED_FIELD_PORT      ${LED6_PORT}    /*!< GPIO port used as field LED                  */
#endif

#ifdef LED_FIELD_Pin
/* Case of ST25R3916B */
#define PLATFORM_LED_FIELD_PIN       ${LED6_PIN}         /*!< GPIO pin used as field LED               */
#endif

#define NFC08A1_LED1_PIN_PORT        ${LED1_PORT}
#define NFC08A1_LED1_PIN             ${LED1_PIN}
#define NFC08A1_LED2_PIN_PORT        ${LED2_PORT}
#define NFC08A1_LED2_PIN             ${LED2_PIN}
#define NFC08A1_LED3_PIN_PORT        ${LED3_PORT}
#define NFC08A1_LED3_PIN             ${LED3_PIN}

#define NFC08A1_LED1_PIN_CLK_ENABLE()     __HAL_RCC_${LED1_PORT}_CLK_ENABLE();
#define NFC08A1_LED2_PIN_CLK_ENABLE()     __HAL_RCC_${LED2_PORT}_CLK_ENABLE();
#define NFC08A1_LED3_PIN_CLK_ENABLE()     __HAL_RCC_${LED3_PORT}_CLK_ENABLE();
#define NFC08A1_LED4_PIN_CLK_ENABLE()     __HAL_RCC_${LED4_PORT}_CLK_ENABLE();
#define NFC08A1_LED5_PIN_CLK_ENABLE()     __HAL_RCC_${LED5_PORT}_CLK_ENABLE();
#define NFC08A1_LED6_PIN_CLK_ENABLE()     __HAL_RCC_${LED6_PORT}_CLK_ENABLE();
#define NFC08A1_LED1_PIN                  ${LED1_PIN}
#define NFC08A1_LED1_PIN_PORT             ${LED1_PORT}
#define NFC08A1_LED2_PIN                  ${LED2_PIN}
#define NFC08A1_LED2_PIN_PORT             ${LED2_PORT}
#define NFC08A1_LED3_PIN                  ${LED3_PIN}
#define NFC08A1_LED3_PIN_PORT             ${LED3_PORT}
#define NFC08A1_LED4_PIN                  ${LED4_PIN}
#define NFC08A1_LED4_PIN_PORT             ${LED4_PORT}
#define NFC08A1_LED5_PIN                  ${LED5_PIN}
#define NFC08A1_LED5_PIN_PORT             ${LED5_PORT}
#define NFC08A1_LED6_PIN                  ${LED6_PIN}
#define NFC08A1_LED6_PIN_PORT             ${LED6_PORT}

#define NFC08A1_ALLLED_GPIO_CLK_ENABLE() {NFC08A1_LED1_PIN_CLK_ENABLE();NFC08A1_LED2_PIN_CLK_ENABLE();NFC08A1_LED3_PIN_CLK_ENABLE();NFC08A1_LED4_PIN_CLK_ENABLE();NFC08A1_LED5_PIN_CLK_ENABLE();NFC08A1_LED6_PIN_CLK_ENABLE();}

/* Case of ST25R3916B */
#define PLATFORM_LED_A_PIN           ${LED3_PIN}         /*!< GPIO pin used for LED A    */
#define PLATFORM_LED_A_PORT          ${LED3_PORT}    /*!< GPIO port used for LED A   */
#define PLATFORM_LED_B_PIN           ${LED2_PIN}         /*!< GPIO pin used for LED B    */
#define PLATFORM_LED_B_PORT          ${LED2_PORT}    /*!< GPIO port used for LED B   */
#define PLATFORM_LED_F_PIN           ${LED1_PIN}         /*!< GPIO pin used for LED F    */
#define PLATFORM_LED_F_PORT          ${LED1_PORT}    /*!< GPIO port used for LED F   */
#define PLATFORM_LED_V_PIN           ${LED4_PIN}         /*!< GPIO pin used for LED V    */
#define PLATFORM_LED_V_PORT          ${LED4_PORT}    /*!< GPIO port used for LED V   */
#define PLATFORM_LED_AP2P_PIN        ${LED5_PIN}         /*!< GPIO pin used for LED AP2P */
#define PLATFORM_LED_AP2P_PORT       ${LED5_PORT}    /*!< GPIO port used for LED AP2P*/
[/#if]




#define BUS_${NFC0XCOMMInstance}_NSS_GPIO_PIN           ${NFC_CS_PIN}
#define BUS_${NFC0XCOMMInstance}_NSS_GPIO_PORT          ${NFC_CS_PORT}
#define BUS_${NFC0XCOMMInstance}_IRQ_GPIO_PIN           ${NFC_INT_PIN}
#define BUS_${NFC0XCOMMInstance}_IRQ_GPIO_PORT          ${NFC_INT_PORT}


/* Exported constants --------------------------------------------------------*/
/** @defgroup PTD_Platform_Exported_Constants
 *  @{
 */
#define ST25R_SS_PIN             BUS_${NFC0XCOMMInstance}_NSS_GPIO_PIN    /*!< GPIO pin used for ST25R SPI SS                */
#define ST25R_SS_PORT            BUS_${NFC0XCOMMInstance}_NSS_GPIO_PORT   /*!< GPIO port used for ST25R SPI SS port          */

#define ST25R_INT_PIN            BUS_${NFC0XCOMMInstance}_IRQ_GPIO_PIN    /*!< GPIO pin used for ST25R IRQ                   */
#define ST25R_INT_PORT           BUS_${NFC0XCOMMInstance}_IRQ_GPIO_PORT   /*!< GPIO port used for ST25R IRQ port             */


#define IRQ_ST25R_EXTI_IRQn      ${NFC_INT_EXTI_IRQn}


#define PLATFORM_USER_BUTTON_PIN     USER_BUTTON_PIN          /*!< GPIO pin user button       */
#define PLATFORM_USER_BUTTON_PORT    USER_BUTTON_GPIO_PORT    /*!< GPIO port user button      */



#define USR_INT_LINE             H_EXTI_${NFC_INT_EXTI_LINE}
#define USR_INT_LINE_NUM         EXTI_LINE_${NFC_INT_EXTI_LINE}
#define BSP_NFC0XCOMM_Init             BSP_${NFC0XCOMMInstance}_Init
#define BSP_NFC0XCOMM_IRQ_Callback     BSP_${NFC0XCOMMInstance}_IRQ_Callback

#define BSP_NFC0XCOMM_SequencialSend  BSP_${NFC0XCOMMInstance}_SequencialSend
#define BSP_NFC0XCOMM_SequencialRecv  BSP_${NFC0XCOMMInstance}_SequencialRecv

void BSP_${NFC0XCOMMInstance}_IRQ_Callback(void);
[#if useI2C]
int32_t BSP_${NFC0XCOMMInstance}_SequencialSend(const uint16_t DevAddr, const uint8_t * const pData, const uint16_t Length, const uint8_t last, const uint8_t txOnly);

int32_t BSP_${NFC0XCOMMInstance}_SequencialRecv(const uint16_t DevAddr, uint8_t * const pData, uint16_t Length);
[/#if] 
/**
  * @}
  */

/**
  * @}
  */

/*
******************************************************************************
* GLOBAL VARIABLES
******************************************************************************
*/

/* Exported variables --------------------------------------------------------*/
[#if useSPI]
extern SPI_HandleTypeDef h${NFC0XCOMMInstance?lower_case};          
[/#if] 

[#if useI2C]
extern I2C_HandleTypeDef h${NFC0XCOMMInstance?lower_case};         
[/#if] 

extern uint8_t globalCommProtectCnt;
extern  EXTI_HandleTypeDef H_EXTI_${NFC_INT_EXTI_LINE};
/* Exported functions ------------------------------------------------------- */
[#if useSPI]
int32_t BSP_NFC0XCOMM_SendRecv(const uint8_t * const pTxData, uint8_t * const pRxData, uint16_t Length);
[/#if]

int32_t BSP_NFC0XCOMM_Init(void);

#define  COMM_HANDLE                                     h${NFC0XCOMMInstance?lower_case}  
[#if useI2C]   
#define  BSP_NFC0XCOMM_SequencialSend                    BSP_${NFC0XCOMMInstance}_SequencialSend
#define  BSP_NFC0XCOMM_SequencialRecv                    BSP_${NFC0XCOMMInstance}_SequencialRecv
[/#if]

[#if useNFC6POLLINGTAGDETECT]
void MX_NFC6_PollingTagDetect_Process(void);
void MX_NFC6_PollingDemo_Init(void);
[/#if]

[#if useNFC6POLLINGTAGDETECTNDEF]
[/#if]

[#if useNFC8POLLINGTAGDETECT]
void MX_NFC8_PollingTagDetect_Init(void);
[/#if]

[#if useNFC8POLLINGTAGDETECTNDEF]
[/#if]

void _Error_Handler(char * file, int line);

#ifdef __cplusplus
}
#endif

#endif /* __NFC0XA1_CONF_H__*/




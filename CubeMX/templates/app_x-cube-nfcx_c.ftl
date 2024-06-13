[#ftl]
[#assign moduleName = "x-cube-nfcx"]
[#if ModuleName??]
    [#assign moduleName = ModuleName]
[/#if]

/**
  ******************************************************************************
  * File Name          :  app_${moduleName?lower_case}.c
  * Description        : This file provides code for the configuration
  *                      of the ${name} instances.
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
  
#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "rfal_platform.h"
#include "nfc_conf.h"
#include "app_${moduleName?lower_case}.h"


[#assign useNFC6POLLINGTAGDETECT = false]
[#assign useNFC6POLLINGTAGDETECTNDEF = false]
[#assign useNFC8POLLINGTAGDETECT = false]
[#assign useNFC8POLLINGTAGDETECTNDEF = false]


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


[/#list]
[/#if]

[#if useNFC6POLLINGTAGDETECT]
[@common.optinclude name=mxTmpFolder + "/nfc06a1_PollingTagDetect_demo_gv.tmp"/]
[/#if]

[#if useNFC6POLLINGTAGDETECTNDEF]
[@common.optinclude name=mxTmpFolder + "/nfc06a1_PollingTagDetectNDEF_demo_gv.tmp"/]
[/#if]

[#if useNFC8POLLINGTAGDETECT]
[@common.optinclude name=mxTmpFolder + "/nfc08a1_PollingTagDetect_demo_gv.tmp"/]
[/#if]


[#if useNFC8POLLINGTAGDETECTNDEF]
[@common.optinclude name=mxTmpFolder + "/nfc08a1_PollingTagDetectNDEF_demo_gv.tmp"/]
[/#if]


void ${fctName}(void)
{
  /* USER CODE BEGIN SV */ 

  /* USER CODE END SV */


  [#if useNFC6POLLINGTAGDETECT]
  /* USER CODE BEGIN NFC6_Library_Init_PreTreatment */
  
  /* USER CODE END NFC6_Library_Init_PreTreatment */

  /* Initialize the peripherals and the NFC6 components */
  [@common.optinclude name=mxTmpFolder + "/nfc06a1_PollingTagDetect_demo_init.tmp"/]
  /* USER CODE BEGIN SV */ 

  /* USER CODE END SV */
  
  /* USER CODE BEGIN NFC6_Library_Init_PostTreatment */
  
  /* USER CODE END NFC6_Library_Init_PostTreatment */
  [/#if]

  [#if useNFC6POLLINGTAGDETECTNDEF]
  /* USER CODE BEGIN NFC6_Library_Init_PreTreatment */
  
  /* USER CODE END NFC6_Library_Init_PreTreatment */

  /* Initialize the peripherals and the NFC6 components */
  [@common.optinclude name=mxTmpFolder + "/nfc06a1_PollingTagDetectNDEF_demo_init.tmp"/]
  /* USER CODE BEGIN SV */ 

  /* USER CODE END SV */
  
  /* USER CODE BEGIN NFC6_Library_Init_PostTreatment */
  
  /* USER CODE END NFC6_Library_Init_PostTreatment */
  [/#if]
  
  [#if useNFC8POLLINGTAGDETECT]
  /* USER CODE BEGIN NFC8_Library_Init_PreTreatment */
  
  /* USER CODE END NFC8_Library_Init_PreTreatment */

  /* Initialize the peripherals and the NFC8 components */
  [@common.optinclude name=mxTmpFolder + "/nfc08a1_PollingTagDetect_demo_init.tmp"/]
  /* USER CODE BEGIN SV */ 

  /* USER CODE END SV */
  
  /* USER CODE BEGIN NFC8_Library_Init_PostTreatment */
  
  /* USER CODE END NFC8_Library_Init_PostTreatment */
  [/#if]
  

  [#if useNFC8POLLINGTAGDETECTNDEF]
  /* USER CODE BEGIN NFC8_Library_Init_PreTreatment */
  
  /* USER CODE END NFC8_Library_Init_PreTreatment */

  /* Initialize the peripherals and the NFC8 components */
  [@common.optinclude name=mxTmpFolder + "/nfc08a1_PollingTagDetectNDEF_demo_init.tmp"/]
   /* USER CODE BEGIN SV */ 

  /* USER CODE END SV */
  
  /* USER CODE BEGIN NFC8_Library_Init_PostTreatment */
  
  /* USER CODE END NFC8_Library_Init_PostTreatment */
  [/#if]  
  

}
/*
 * LM background task
 */
void ${fctProcessName}(void)
{
  [#if useNFC6POLLINGTAGDETECT]
    /* USER CODE BEGIN NFC6_Library_Process */
  
    /* USER CODE END NFC6_Library_Process */
    /* Run Demo Application */
    demoCycle(); 
  [/#if]

  [#if useNFC6POLLINGTAGDETECTNDEF]
    /* USER CODE BEGIN NFC6_Library_Process */
  
    /* USER CODE END NFC6_Library_Process */
    /* Run Demo Application */
    demoCycle(); 
  [/#if]
  
  [#if useNFC8POLLINGTAGDETECT]
    /* USER CODE BEGIN NFC8_Library_Process */
  
    /* USER CODE END NFC8_Library_Process */
    /* Run Demo Application */
    demoCycle();
  [/#if]
  

  [#if useNFC8POLLINGTAGDETECTNDEF]
    /* USER CODE BEGIN NFC8_Library_Process */
  
    /* USER CODE END NFC8_Library_Process */
    /* Run Demo Application */
    demoCycle();
  [/#if]  
 
}

[#if useNFC6POLLINGTAGDETECT]
[@common.optinclude name=mxTmpFolder + "/nfc06a1_PollingTagDetect_demo.tmp"/]
[/#if]

[#if useNFC6POLLINGTAGDETECTNDEF]
[@common.optinclude name=mxTmpFolder + "/nfc06a1_PollingTagDetectNDEF_demo.tmp"/]
[/#if]

[#if useNFC8POLLINGTAGDETECT]
[@common.optinclude name=mxTmpFolder + "/nfc08a1_PollingTagDetect_demo.tmp"/]
[/#if]

[#if useNFC8POLLINGTAGDETECTNDEF]
[@common.optinclude name=mxTmpFolder + "/nfc08a1_PollingTagDetectNDEF_demo.tmp"/]
[/#if]


#ifdef __cplusplus
}
#endif


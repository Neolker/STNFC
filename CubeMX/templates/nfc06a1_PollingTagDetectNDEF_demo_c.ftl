[#ftl]
[#assign useNFC6POLLINGTAGDETECT = false]
[#assign useNFC6POLLINGTAGDETECTNDEF = false]
[#assign useNFC8POLLINGTAGDETECT = false]
[#assign useNFC8POLLINGTAGDETECTNDEF = false]
[#assign useSPI = false]
[#assign useI2C = false]

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

[#if define?contains("USE_I2C")]
[#assign useI2C = true]
[/#if]

[#if define?contains("USE_SPI")]
[#assign useSPI = true]
[/#if]

[/#list]
[/#if] 
/**
  * @brief  Initialize the I2CProtection  feature Example
  * @retval None
  */
void MX_NFC6_PollingTagDetectNDEF_Init(void)
{
   BSP_NFC0XCOMM_Init();
   BSP_COM_Init(COM1);
   USR_INT_LINE.Line = USR_INT_LINE_NUM;
[#if ("${McuName}"?contains("STM32G0")) || ("${McuName}"?contains("STM32U5")) || ("${McuName}"?contains("STM32U0"))]
[#else]   
   USR_INT_LINE.PendingCallback = st25r3916Isr;
[/#if] 
   BSP_PB_Init(BUTTON_USER, BUTTON_MODE_GPIO);
     
   /* Configure interrupt callback */
  (void)HAL_EXTI_GetHandle(&USR_INT_LINE, USR_INT_LINE.Line);
  (void)HAL_EXTI_RegisterCallback(&USR_INT_LINE, HAL_EXTI_COMMON_CB_ID, BSP_NFC0XCOMM_IRQ_Callback);
   
#ifdef ST25R3916
  platformLog("Welcome to X-NUCLEO-NFC06A1\r\n");
#else
  platformLog("Welcome to X-NUCLEO-NFC08A1\r\n");
#endif /* ST25R3916 */
  /* Initalize RFAL */
  if( !demoIni() )
  {
    /*
    * in case the rfal initalization failed signal it by flashing all LED
    * and stoping all operations
    */
    platformLog("Initialization failed..\r\n");
    while(1) 
    {
      platformLedToogle(PLATFORM_LED_A_PORT, PLATFORM_LED_A_PIN);
      platformLedToogle(PLATFORM_LED_B_PORT, PLATFORM_LED_B_PIN);
      platformLedToogle(PLATFORM_LED_F_PORT, PLATFORM_LED_F_PIN);
      platformLedToogle(PLATFORM_LED_V_PORT, PLATFORM_LED_V_PIN);
      platformLedToogle(PLATFORM_LED_AP2P_PORT, PLATFORM_LED_AP2P_PIN);
      platformLedToogle(PLATFORM_LED_FIELD_PORT, PLATFORM_LED_FIELD_PIN);

      platformDelay(100);
    }
  } 
  else
  {
    platformLog("Initialization succeeded..\r\n");
    for (int i = 0; i < 6; i++) 
    {
      platformLedToogle(PLATFORM_LED_A_PORT, PLATFORM_LED_A_PIN);
      platformLedToogle(PLATFORM_LED_B_PORT, PLATFORM_LED_B_PIN);
      platformLedToogle(PLATFORM_LED_F_PORT, PLATFORM_LED_F_PIN);
      platformLedToogle(PLATFORM_LED_V_PORT, PLATFORM_LED_V_PIN);
      platformLedToogle(PLATFORM_LED_AP2P_PORT, PLATFORM_LED_AP2P_PIN);
      platformLedToogle(PLATFORM_LED_FIELD_PORT, PLATFORM_LED_FIELD_PIN);

      platformDelay(200);
    }
	
    platformLedOff(PLATFORM_LED_A_PORT, PLATFORM_LED_A_PIN);
    platformLedOff(PLATFORM_LED_B_PORT, PLATFORM_LED_B_PIN);
    platformLedOff(PLATFORM_LED_F_PORT, PLATFORM_LED_F_PIN);
    platformLedOff(PLATFORM_LED_V_PORT, PLATFORM_LED_V_PIN);
    platformLedOff(PLATFORM_LED_AP2P_PORT, PLATFORM_LED_AP2P_PIN);
    platformLedOff(PLATFORM_LED_FIELD_PORT, PLATFORM_LED_FIELD_PIN);

  }
 
}


/**
 * @brief   This function sends data on the uart
 * @param   puartmsg: 
 * @retval  HAL_StatusTypeDef
 */
HAL_StatusTypeDef UARTConsolePrint( char *puartmsg )
{
  return HAL_UART_Transmit( &hcom_uart[COM1], (uint8_t *)puartmsg, strlen( puartmsg ), 500);
}

/**
 * @brief   This function wait a data on the uart
 * @param   uartchar received character
 * @retval  HAL_StatusTypeDef
 */
HAL_StatusTypeDef UARTConsoleScan( uint8_t uartchar )
{
  while( HAL_UART_Receive( &hcom_uart[COM1], &uartchar, 1, 500) == HAL_TIMEOUT );
  
  return HAL_OK;
}

[#if useSPI]
/**
  * @brief      SPI Read and Write byte(s) to device
  * @param[in]  pTxData : Pointer to data buffer to write
  * @param[out] pRxData : Pointer to data buffer for read data
  * @param[in]  Length : number of bytes to write
  * @return     BSP status
  */
int32_t BSP_NFC0XCOMM_SendRecv(const uint8_t * const pTxData, uint8_t * const pRxData, uint16_t Length)
{
  HAL_StatusTypeDef status = HAL_ERROR;
  int32_t ret = BSP_ERROR_NONE;
  
  if((pTxData != NULL) && (pRxData != NULL))
  {
    status = HAL_SPI_TransmitReceive(&COMM_HANDLE, (uint8_t *)pTxData, (uint8_t *)pRxData, Length, 2000);
  } 
  else if ((pTxData != NULL) && (pRxData == NULL)) 
  {
    status = HAL_SPI_Transmit(&COMM_HANDLE, (uint8_t *)pTxData, Length, 2000);
  } 
  else if ((pTxData == NULL) && (pRxData != NULL)) 
  {
    status = HAL_SPI_Receive(&COMM_HANDLE, (uint8_t *)pRxData, Length, 2000);
  }
  else
  {
  	ret = BSP_ERROR_WRONG_PARAM;
  }
  
  /* Check the communication status */
  if (status != HAL_OK)
  {
    /* Execute user timeout callback */
    ret = BSP_NFC0XCOMM_Init();
  }
  
  return ret;
}

[/#if]

[#if useI2C]
/**
  * @brief     This method transmits sequentially in master I2C mode an amount of data in blocking mode with Interrupt.
  * @param[in] address : Target device address: The device 7 bits address value
  *                      in datasheet must be shifted to the left before calling the interface
  * @param[in] txBuf   : Pointer to data buffer
  * @param[in] txLen   : Amount of data to be sent
  * @param[in] last    : true if last data to be transmitted
  * @param[in] txOnly  : true if no reception is to be performed after (STOP)
  *                      false if a reception should happen afterwards with repeated START
  * @return    HAL Error code
  */
int32_t BSP_NFC0XCOMM_SequencialSend(const uint16_t DevAddr, const uint8_t * const pData, const uint16_t Length, const uint8_t last, const uint8_t txOnly)
{
  HAL_StatusTypeDef ret;
  uint32_t txFlag;

  if ((last != 0) && (txOnly != 0))
  {
    txFlag = I2C_LAST_FRAME;
  }
  else
  {
    txFlag = (last ? /*I2C_LAST_FRAME_NO_STOP*/ I2C_FIRST_FRAME : I2C_FIRST_AND_NEXT_FRAME);
  }
  
  
  ret = HAL_I2C_Master_Seq_Transmit_IT(&COMM_HANDLE, DevAddr, (uint8_t*)pData, Length, txFlag);
  if (ret != HAL_OK)
  {
    return ret;
  }
  
  while (HAL_I2C_GetState(&COMM_HANDLE) != HAL_I2C_STATE_READY);
  
  if (HAL_I2C_GetError(&COMM_HANDLE) != HAL_I2C_ERROR_NONE)
  {
    return HAL_ERROR;
  }
  return HAL_OK;
}

/**
  * @brief      This method receives sequentially in master I2C mode an amount of data in blocking mode with Interrupt.
  * @param[in]  address : Target device address: The device 7 bits address value
  *                       in datasheet must be shifted to the left before calling the interface
  * @param[out] rxBuf   : Pointer to data buffer
  * @param[in]  rxLen   : Amount of data to read
  * @return     HAL Error code
  */
int32_t BSP_NFC0XCOMM_SequencialRecv(const uint16_t DevAddr, uint8_t * const pData, uint16_t Length)
{
  HAL_StatusTypeDef ret;
  
  ret = HAL_I2C_Master_Seq_Receive_IT(&COMM_HANDLE, DevAddr, (uint8_t*)pData, Length, I2C_LAST_FRAME);
  if (ret != HAL_OK)
  {
    return ret;
  }
  
  while (HAL_I2C_GetState(&COMM_HANDLE) != HAL_I2C_STATE_READY);
  
  if (HAL_I2C_GetError(&COMM_HANDLE) != HAL_I2C_ERROR_NONE)
  {
    return HAL_ERROR;
  }
  
  return HAL_OK;
}
[/#if]

/**
  * @brief  BSP SPI1 callback
  * @param  None
  * @return None
  */
__weak void BSP_NFC0XCOMM_IRQ_Callback(void)
{
  /* Prevent unused argument(s) compilation warning */
  
  /* This function should be implemented by the user application.
   * It is called into this driver when an event from ST25R3916 is triggered. 
   */
  st25r3916Isr();
}

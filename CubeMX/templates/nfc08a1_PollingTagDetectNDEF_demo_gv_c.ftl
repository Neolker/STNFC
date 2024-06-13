[#ftl]
/* Includes ------------------------------------------------------------------*/
#include "${BoardName}.h"
#include <stdio.h>
#include <string.h>	


/** @defgroup App NFC6
  * @{
  */

/** @defgroup Main
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Global variables ----------------------------------------------------------*/

uint8_t globalCommProtectCnt = 0;   /*!< Global Protection counter     */
/* Private functions ---------------------------------------------------------*/
void MX_NFC8_PollingTagDetectNDEF_Init(void);
void MX_NFC8_PollingTagDetectNDEF_Process(void);

HAL_StatusTypeDef UARTConsolePrint( char *puartmsg );
HAL_StatusTypeDef UARTConsoleScan( uint8_t uartchar );
1. Rework Rate : 

Formula: AVG( CASE WHEN PU_COUNT("VBAP","_CEL_O2C_ACTIVITIES". 
33. VARIABLE_ACTIVITY_COLUMN ,"_CEL_O2C_ACTIVITIES".33. VARIABLE_ACTIVITY_COLUMN 
IN (33. VARIABLE_UNDESIRED_ACTIVITIES) ) > 0 THEN 1.0 ELSE 0.0 END )*100

2. Rejection Rate :

Formula: AVG(CASE WHEN PU_COUNT("VBAP","_CEL_O2C_ACTIVITIES".
33. VARIABLE_ACTIVITY_COLUMN ,"_CEL_O2C_ACTIVITIES".
33. VARIABLE_ACTIVITY_COLUMN = 33. VARIABLE_REJECTION_ACTIVITIES ) >0
THEN 1.0 ELSE 0.0 END)*100


3. On-Time Delivery Rate :

Formula: AVG(
  CASE 
    WHEN PU_COUNT("VBAP", "_CEL_O2C_ACTIVITIES"."33. VARIABLE_ACTIVITY_COLUMN", "_CEL_O2C_ACTIVITIES"."33. VARIABLE_ACTIVITY_COLUMN" = 33. VARIABLE_ON_TIME_DELIVERY_ACTIVITY) > 0 
    THEN 1.0   ELSE 0.0 
  END
)*100


4. Touchless Order Rate :

Formula: AVG(CASE 
WHEN PU_COUNT("VBAK","_CEL_O2C_ACTIVITIES"."USER_TYPE","_CEL_O2C_ACTIVITIES"."US"
NOT IN ( 33. VARIABLE_AUTO_TYPES ) ) = 0 THEN 1.0 ELSE 0.0 END)*100


5. Unbilled Revenue Rate :

Formula: AVG(CALC_THROUGHPUT(CASE_START TO 
CASE_END, REMAP_TIMESTAMPS("_CEL_O2C_ACTIVITIES"."EVENTTIME", HOURS))/24)

6.  Unbilled Unbilled delivery item net amount (converted)

  SUM(
  CASE
    WHEN "o_celonis_DeliveryItem"."BillingStatus" IN ('UNBILLED_PAST_DUE', 'UNBILLED_AGED')
    THEN "o_celonis_DeliveryItem"."NetAmountConverted"
  END
)

*******************************************************************************************************************************************************************

                                                  Variables Name and Value

  
Variable name: VARIABLE_ACTIVITY_COLUMN  
Variable value: "ACTIVITY_EN"

Variable name: VARIABLE_UNDESIRED_ACTIVITIES  
Variable value: 'Change Billing Block','Change Confirmed Delivery Date','Change Confirmed Goods Issue Date','Change Confirmed Quantity','Change Delivery Block','Change Freight Terms','Change Inco Terms (Part 1)','Change Inco Terms (Part 2)','Change Item Credit Price','Change Material','Change Material Availability Date','Change Payment Terms','Change Plant','Change Price','Change Reason for Rejection','Change Requested Delivery Date','Change Requested Goods Issue Date','Change Requested Quantity','Change Route','Change Shipping Type','Change Storage Location','Set Delivery Block','Remove Delivery Block','Set Credit Block','Remove Credit Block','Set Billing Block','Remove Billing Block','Create Returns delivery for order','Set Reason for Rejection'

Variable name: VARIABLE_REJECTION_ACTIVITIES  
Variable value: 'Set Reason for Rejection'

Variable name: VARIABLE_RECORD_GOODS_ISSUE_ACTIVITY  
Variable value: 'Record Goods Issue'

Variable name: VARIABLE_DUE_DATE  
Variable value: PU_LAST("VBAP"."VBEP"."TS_EDATU","VBEP"."BMENG" > 0)

Variable name: VARIABLE_TOO_LATE_BUFFER  
Variable value: round( parseNumber( 0 , , ) )

Variable name: VARIABLE_TOO_EARLY_BUFFER  
Variable value: round( parseNumber( 3 , , ) )

Variable name: VARIABLE_ROUTE  
Variable value: "VBAP"."ROUTE_IN_DAYS"

Variable name: VARIABLE_AUTO_TYPES  
Variable value: 'B','S'

Variable name: VARIABLE_CREATE_INVOICE_ACTIVITY  
Variable value: 'Create Invoice','Create Pro forma invoice'

Variable name: CREATION_DATE  
Variable value: "VBAK"."TS_ERDAT"

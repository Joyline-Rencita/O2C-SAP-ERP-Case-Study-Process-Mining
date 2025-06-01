365 * KPI(IM_Metric_MaterialMasterPlant_SUM__InventoryOnHandValue) /
(
  KPI(IM_Metric_MaterialMasterPlant_SUM__ConsumptionAmount12Months)
  +
  CASE
    WHEN ${IM_Variable_INPUT__DaysOfCoverDueDate} LIKE 'Consider'
    THEN  KPI(IM_Metric_MaterialMasterPlant_SUM__OpenSalesOrderItemBackorderAmount)
END
)

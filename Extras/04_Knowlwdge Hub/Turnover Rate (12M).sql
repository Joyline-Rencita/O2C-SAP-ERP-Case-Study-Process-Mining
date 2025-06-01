CASE
  WHEN ${IM_Variable_INPUT__TurnoverRateConsideredInput} LIKE 'Finished Goods Only'
  THEN
    KPI(IM_Metric_MaterialMasterPlant_SUM__ConsumptionAmountFinishedGoods12Months) / KPI(IM_Metric_MaterialMasterPlant_SUM__AvgInventoryAmountFinishedGoods12Months)
  ELSE
    KPI(IM_Metric_MaterialMasterPlant_SUM__ConsumptionAmount12Months) / KPI(IM_Metric_MaterialMasterPlant_SUM__AvgInventoryAmount12Months)
END

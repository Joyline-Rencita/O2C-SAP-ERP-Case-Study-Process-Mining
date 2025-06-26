Description
Percentage of documents where the PO payment terms are more favorable than the net document payment terms.

Pseudo-code :
(
    Sum of specific conditions for cleared documents
)
/
Count of distinct cleared documents

SUM(CASE
  WHEN "o_celonis_VendorAccountCreditItem"."isRelevantAndCleared" = 0 THEN 0.0
  WHEN "o_celonis_VendorAccountCreditItem"."PaymentTermsMismatchPoVsDocument" LIKE '%Unfavorable%'
  THEN 1
  ELSE 0
END)
/
KPI("AP_Metric_VendorAccountCreditItem_COUNTDISTINCT__NumberOfClearedDocuments")

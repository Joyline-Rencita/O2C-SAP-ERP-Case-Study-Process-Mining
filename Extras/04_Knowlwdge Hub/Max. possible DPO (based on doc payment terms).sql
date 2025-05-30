Pseudo-code
(
    Sum of (NetDocumentPaymentTerm * Invoice_Value) for valid documents
 )
/
Sum of net cleared document value converted


SUM(CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevantAndCleared"  = 0.0 THEN NULL
    ELSE "o_celonis_VendorAccountCreditItem"."NetPaymentTerm" * "o_celonis_VendorAccountCreditItem"."ConvertedDocumentValue"
   END)
  / KPI("AP_Metric_VendorAccountCreditItem_SUM__NetClearedDocumentValueConverted")

Description :
Percentage of document value paid before the due date taking any grace period into account. For documents with a cash discount option, the cash discount due date is used; otherwise, the net due date is used.

Pseudo-code :
Sum of Early Payment Amounts for Documents
/
Sum of Net Cleared Document Values (Converted)


 CODE :
KPI("AP_Metric_VendorAccountCreditItem_SUM__EarlyPaymentByDocumentValue")
      / KPI("AP_Metric_VendorAccountCreditItem_SUM__NetClearedDocumentValueConverted")

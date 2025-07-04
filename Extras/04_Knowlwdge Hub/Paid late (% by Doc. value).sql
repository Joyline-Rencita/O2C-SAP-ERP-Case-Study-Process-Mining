Description :
Percentage of document value paid after the due date taking any grace period into account. For documents with a cash discount option, the cash discount due date is used; otherwise, the net due date is used.

Pseudo-code :
Sum of Late Payments by Document Value
/
Sum of Net Cleared Document Values Converted

Code :
KPI("AP_Metric_VendorAccountCreditItem_SUM__LatePaymentByDocumentValue")
  / KPI("AP_Metric_VendorAccountCreditItem_SUM__NetClearedDocumentValueConverted")

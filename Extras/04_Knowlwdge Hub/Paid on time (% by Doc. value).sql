Description
Percent of document value that were paid before the due date, considering the specified grace period. For documents w/ cash discount option the cash discount due date is considered, for documents w/o cash discount the maximum due date is considered.

Pseudo-code
Sum of On-time Payments by Document Value
/
Sum of Net Cleared Document Values Converted

KPI("AP_Metric_VendorAccountCreditItem_SUM__OnTimePaymentByDocumentValue")
/ KPI("AP_Metric_VendorAccountCreditItem_SUM__NetClearedDocumentValueConverted")

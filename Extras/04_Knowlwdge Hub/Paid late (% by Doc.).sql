Description :
Percentage of documents paid after the due date taking any grace period into account. For documents with a cash discount option, the cash discount due date is used; otherwise, the net due date is used.

Pseudo-code :
Count of Late Payments by Document
/
Distinct Count of Cleared Documents

  Code :
KPI("AP_Metric_VendorAccountCreditItem_COUNT__LatePaymentByDocument")
/  KPI("AP_Metric_VendorAccountCreditItem_COUNTDISTINCT__NumberOfClearedDocuments")

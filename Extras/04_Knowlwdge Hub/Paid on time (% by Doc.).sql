Description :
Percentage of documents paid before the due date taking any grace period into account. For documents with a cash discount option, the cash discount due date is used; otherwise, the net due date is used.

Pseudo-code :
Count of On-time Payments by Document
/
Count of Distinct Cleared Documents

Code :

KPI("AP_Metric_VendorAccountCreditItem_COUNT__OnTimePaymentByDocument")
/  KPI("AP_Metric_VendorAccountCreditItem_COUNTDISTINCT__NumberOfClearedDocuments")

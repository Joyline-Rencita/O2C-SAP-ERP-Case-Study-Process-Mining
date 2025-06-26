Pseudo-code:
Sum of Free Cash Flow Increase (Resolved Payment Terms Mismatch) for Open and Cleared Documents
/
Rounded Number of Days between Global Minimum Clearing Date and Global Maximum Clearing Date


SUM(
  CASE WHEN "o_celonis_VendorAccountCreditItem"."isRelevant" = 0 THEN 0.0
  ELSE
  "o_celonis_VendorAccountCreditItem"."FreeCashFlowIncreaseResolvedPaymentTermsMismatchPoVsVmdVsDocument"
  END)
/ 365

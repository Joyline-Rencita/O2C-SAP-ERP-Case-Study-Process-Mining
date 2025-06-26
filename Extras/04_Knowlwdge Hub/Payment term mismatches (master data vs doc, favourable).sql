Description
Number of document items affected by favorable mismatches between document and vendor master data

Pseudo-code :
Sum of Indicator for Documents:
    If Generic Validation for Open and Cleared Documents is 0, then 0.0
    Else If Payment Terms Mismatch is 'Favorable Mismatch', then 1.0
    Else 0.0

COUNT(
  CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevant"=1
      AND "o_celonis_VendorAccountCreditItem"."PaymentTermsMismatchVmdVsDocument"='Favorable Mismatch'
      THEN 1
    ELSE NULL
  END)

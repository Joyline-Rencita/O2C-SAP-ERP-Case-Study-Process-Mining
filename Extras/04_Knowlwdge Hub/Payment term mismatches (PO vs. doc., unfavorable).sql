Description
Number of documents where the PO payment term is more favorable than the document payment term, considering the net payment terms.

Pseudo-code
Sum of 1s for Documents with 'Unfavorable Mismatch' Payment Terms Mismatch Classification
Exclude documents that are not open and cleared

COUNT(
  CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevant"=1
      AND "o_celonis_VendorAccountCreditItem"."PaymentTermsMismatchPoVsDocument"='Unfavorable Mismatch'
      THEN 1
    ELSE NULL
  END)

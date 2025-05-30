Pseudo-code
Count of Distinct Non-NULL Payment Terms
for Documents that are not Open and Cleared

COUNT(DISTINCT
  CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevant" = 0
      THEN NULL
    WHEN ISNULL("o_celonis_VendorAccountCreditItem"."PaymentTerms")=1
      THEN NULL
    ELSE "o_celonis_VendorAccountCreditItem"."PaymentTerms"
  END)

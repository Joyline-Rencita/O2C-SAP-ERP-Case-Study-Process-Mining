COUNT(DISTINCT
  CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevant" = 0
      THEN NULL
    WHEN ISNULL("o_celonis_VendorAccountCreditItem"."PaymentTerms")=1
      THEN NULL
    ELSE "o_celonis_VendorAccountCreditItem"."PaymentTerms"
  END)

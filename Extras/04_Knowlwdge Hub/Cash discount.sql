SUM(
  CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevantAndCleared" = 0
      THEN 0.0
    ELSE "o_celonis_VendorAccountCreditItem"."PossibleCashDiscount"
  END)

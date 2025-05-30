AVG(
  CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevantAndCleared"= 0
      THEN NULL
    WHEN DAYS_BETWEEN ( ADD_DAYS("o_celonis_VendorAccountCreditItem"."BaseLineDate",
          "o_celonis_VendorAccountCreditItem"."NetPaymentTerm"),
          "o_celonis_VendorAccountCreditItem"."ClearingDate")
           >= 0
      THEN NULL
    ELSE DAYS_BETWEEN ( ADD_DAYS("o_celonis_VendorAccountCreditItem"."BaseLineDate",
          "o_celonis_VendorAccountCreditItem"."NetPaymentTerm"),
          "o_celonis_VendorAccountCreditItem"."ClearingDate")
  END
)

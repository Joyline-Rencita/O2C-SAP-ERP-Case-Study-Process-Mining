Pseudo-code
Sum of (
    If open and cleared documents are invalid, then 0.0
    If NetVmdPaymentTerm > NetDocumentPaymentTerm, then calculate the difference in payment terms, divide by 365, and multiply by Invoice_Value
    If NetDocumentPaymentTerm is rounded to 0, then calculate the ratio of ShortPaymentTerms divided by 365, and multiply by Invoice_Value
    Otherwise, 0.0
)


SUM(
    CASE
      WHEN "o_celonis_VendorAccountCreditItem"."isRelevant" = 0 THEN 0.0
      WHEN "o_celonis_VendorAccountCreditItem"."NetVmdPaymentTerm" > "o_celonis_VendorAccountCreditItem"."NetPaymentTerm"
        THEN ("o_celonis_VendorAccountCreditItem"."NetVmdPaymentTerm" - "o_celonis_VendorAccountCreditItem"."NetPaymentTerm") / 365 *
            "o_celonis_VendorAccountCreditItem"."ConvertedDocumentValue"
      WHEN ROUND("o_celonis_VendorAccountCreditItem"."NetPaymentTerm") = 0
        THEN (${AP_Variable_Input__ShortPaymentTerms}/365) * "o_celonis_VendorAccountCreditItem"."ConvertedDocumentValue"
    ELSE 0.0
    END )

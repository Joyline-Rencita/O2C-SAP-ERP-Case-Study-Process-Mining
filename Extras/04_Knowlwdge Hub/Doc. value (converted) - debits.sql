Pseudo-code
Sum of Invoice Values for Open and Cleared Documents


SUM(
    CASE WHEN  "o_celonis_VendorAccountDebitItem"."isRelevant" = 1
    THEN "o_celonis_VendorAccountDebitItem"."ConvertedDocumentValue"
    ELSE 0.0 END
  )

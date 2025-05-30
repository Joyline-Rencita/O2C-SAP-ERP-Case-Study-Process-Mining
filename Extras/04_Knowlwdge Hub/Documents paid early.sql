Pseudo-code
Sum of Documents Paid Early
(
    If Document is not Cleared, Result is 0.0
    If Document is Paid Early, Result is 1.0
    Otherwise, Result is 0.0
)

SUM(
  CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevantAndCleared" = 0.0
      THEN 0.0
    WHEN "o_celonis_VendorAccountCreditItem"."IsPaidEarly" = 1.0
      THEN 1.0
    ELSE 0.0
  END
)

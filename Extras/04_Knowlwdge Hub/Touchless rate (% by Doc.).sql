Description :
Percentage of document items where all process steps are performed without manual intervention.

Pseudo-code :
Average value of DocumentIsTouchless for valid documents

Code :

AVG(
  CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevantAndCleared"= 0.0
      THEN NULL
    ELSE "o_celonis_VendorAccountCreditItem"."IsTouchless"
  END)

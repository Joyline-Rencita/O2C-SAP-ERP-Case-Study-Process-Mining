Pseudo-code
Count of Distinct Shortened Activities for Valid Documents

COUNT(DISTINCT
  CASE
    WHEN "o_celonis_VendorAccountCreditItem"."isRelevant" = 0
      THEN NULL
    ELSE SHORTENED ( VARIANT ( "el__VendorAccountCreditItemActivities"."ACTIVITY" ) )
  END)

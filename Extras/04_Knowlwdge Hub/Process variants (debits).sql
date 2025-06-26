Pseudo-code:
Count of Distinct Shortened Activity Values
for valid Documents

COUNT ( DISTINCT
CASE
  WHEN "o_celonis_VendorAccountDebitItem"."isRelevant" = 0
    THEN NULL
  ELSE SHORTENED ( VARIANT ( "el_celonis_VendorAccountDebitItem"."ACTIVITY" ) )
END )

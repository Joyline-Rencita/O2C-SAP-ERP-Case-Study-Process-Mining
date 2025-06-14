Description
Net amount of delivery items where the goods have been shipped but an invoice hasn’t been created
Unit None

SUM(
  CASE
    WHEN "o_celonis_DeliveryItem"."BillingStatus" IN ('UNBILLED_PAST_DUE', 'UNBILLED_AGED')
    THEN "o_celonis_DeliveryItem"."NetAmountConverted"
  END
)

Description :
Value of order items that have a free text line item(s) rather than choosing from a item master or catalog.
Unit None

SUM(CASE WHEN "o_celonis_PurchaseOrderItem"."FreeTextOrder" = 1
  THEN "o_celonis_PurchaseOrderItem"."NetOrderValueConverted"
  ELSE 0.0
END)

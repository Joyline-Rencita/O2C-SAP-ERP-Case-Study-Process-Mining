Description
Count the selected automated activities NOT executed by selected automated user types
Unit None

sum( case when ${UNIVERSAL_Variable_INPUT__USERTYPE_RUNTIME} not in (${UNIVERSAL_Variable_INPUT__AUTOMATEDUSERS_RUNTIME})
 then 1.0 else 0.0 end)

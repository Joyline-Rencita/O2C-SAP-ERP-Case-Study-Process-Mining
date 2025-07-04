Description :
The average number of distinct users per case.

Code :

AVG (
  PU_COUNT_DISTINCT (
  CASE_TABLE ( ${UNIVERSAL_Variable_INPUT__ACTIVITYTABLE_RUNTIME} ) ,
  FILTER_TO_NULL ( ${UNIVERSAL_Variable_INPUT__USERNAME_RUNTIME} )
  )
)

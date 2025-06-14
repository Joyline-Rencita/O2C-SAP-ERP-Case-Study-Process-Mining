Description
Average number of cases with at least 2 occurrence of a identical repeated activity
Unit None
Format ,.1%
Desired direction NONE


AVG(
  CASE
    WHEN
      PU_COUNT (
    CASE_TABLE ( ${UNIVERSAL_Variable_INPUT__ACTIVITYTABLE_RUNTIME} ) ,
    FILTER_TO_NULL ( ACTIVITY_COLUMN ( ${UNIVERSAL_Variable_INPUT__ACTIVITYTABLE_RUNTIME} )) ,
    ACTIVITY_COLUMN ( ${UNIVERSAL_Variable_INPUT__ACTIVITYTABLE_RUNTIME} )
    in (
        ${UNIVERSAL_Variable_INPUT__REPEATEDACTIVITIES_RUNTIME}
    )
    AND INDEX_ACTIVITY_TYPE ( ACTIVITY_COLUMN ( ${UNIVERSAL_Variable_INPUT__ACTIVITYTABLE_RUNTIME} ) ) > 1
  ) >0


    THEN 1.0
    ELSE 0.0
    END
  )

Description
Count selected Undesired Activities
Unit None
Format .3s
Desired direction NONE
Process type None
Business concept Labor Productivity (From: Universal)
ID UNIVERSAL_Metric_COUNT__UndesiredActivitiesCount
Created by celonis
Last edited Apr 11, 2024

sum (
  PU_COUNT (
    CASE_TABLE ( ${UNIVERSAL_Variable_INPUT__ACTIVITYTABLE_RUNTIME} ) ,
    FILTER_TO_NULL ( ACTIVITY_COLUMN ( ${UNIVERSAL_Variable_INPUT__ACTIVITYTABLE_RUNTIME} )) ,
    ACTIVITY_COLUMN ( ${UNIVERSAL_Variable_INPUT__ACTIVITYTABLE_RUNTIME} )
    in (
        ${UNIVERSAL_Variable_INPUT__UNDESIREDACTIVITIES_RUNTIME}
    )
  )
)

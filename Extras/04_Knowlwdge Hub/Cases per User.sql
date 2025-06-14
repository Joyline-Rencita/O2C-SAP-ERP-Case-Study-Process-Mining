Description
Number of cases divided by total number of distinct users.
Unit None
Format .3s
Desired direction NONE
Process type None
Business concept Labor Productivity (From: Universal)
ID UNIVERSAL_Metric_AVG__CasesPerUser
Created by celonis
Last edited Apr 11, 2024

COUNT_TABLE ( CASE_TABLE(${UNIVERSAL_Variable_INPUT__ACTIVITYTABLE_RUNTIME}) )/COUNT (DISTINCT ${UNIVERSAL_Variable_INPUT__USERNAME_RUNTIME})

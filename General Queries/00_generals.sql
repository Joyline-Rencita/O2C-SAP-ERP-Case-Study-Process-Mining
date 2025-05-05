1. Activity KPI: An Activity KPI is calculated and displayed on the activity/event node in the process graph.

Example of an Activity KPI for Automation:

AVG(CASE WHEN "EVENTLOG"."USERTYPE" = 'Batch' THEN 1.0 ELSE 0.0 END)


2. Connection KPI: A Connection KPI is calculated and displayed on the connections between nodes in the process graph.

Example of a Connection KPI for Duration:

AVG(1.0*DATEDIFF(dd, SOURCE("EVENTLOG"."EVENTTIME"), TARGET("EVENTLOG"."EVENTTIME")))

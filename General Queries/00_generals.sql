1. Activity KPI: An Activity KPI is calculated and displayed on the activity/event node in the process graph.

Example of an Activity KPI for Automation:

AVG(CASE WHEN "EVENTLOG"."USERTYPE" = 'Batch' THEN 1.0 ELSE 0.0 END)


2. Connection KPI: A Connection KPI is calculated and displayed on the connections between nodes in the process graph.

Example of a Connection KPI for Duration:

AVG(1.0*DATEDIFF(dd, SOURCE("EVENTLOG"."EVENTTIME"), TARGET("EVENTLOG"."EVENTTIME")))


3. Process Query Language (PQL) - Short Overview

| **Syntax**                                                   | **Example**                                     | **Description**                                                            |
| ------------------------------------------------------------ | ----------------------------------------------- | -------------------------------------------------------------------------- |
| `FILTER PROCESS <STATEMENT> <activity>`                      | `FILTER PROCESS EQUALS 'Create Purchase Order'` | Filters for all cases that include the activity "Create Purchase Order".   |
| `FILTER <FUNCTION>("TABLE_NAME"."COLUMN_NAME") <op> <value>` | `FILTER YEAR("EVENTLOG"."EVENTTIME") = 2010`    | Filters for all occurrences in the year 2010.                              |
| `FILTER "TABLE_NAME"."COLUMN_NAME" <op> <value>`             | `FILTER "EVENTLOG"."USER_TYPE" != 'BATCH'`      | Filters for non-automated actions in the process (i.e., excludes 'BATCH'). |


4. 


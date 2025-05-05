I am currently working on getting the Manual Delivery Rate?

What do i need to modify on this code that is currently getting the On-Time Delivery Rate?

100.0*AVG(

CASE

WHEN ISNULL(<%=DUE_DATE%>) = 1 THEN NULL No Confirmation

WHEN ISNULL(
    PU_LAST("VBAP",ROUND_DAY("_CEL_O2C_ACTIVITIES"."EVENTTIME"),"_CEL_O2C_ACTIVITIES"."ACTIVITY_<%=language%>"='<%=record_goods_issue_activity%>')
    ) = 1 AND DAYS_BETWEEN(<%=DUE_DATE%>,TODAY()) <= 0 THEN NULL --'No GI and Future Due Date'
	
	WHEN ISNULL(
	PU_LAST("VBAP",ROUND_DAY("_CEL_O2C_ACTIVITIES"."EVENTTIME"),"_CEL_O2C_ACTIVITIES"."ACTIVITY_<%=language%>"='<%=record_goods_issue_activity%>')
	) = 1 AND DAYS_BETWEEN(<%=DUE_DATE%>,TODAY()) > 0 AND DAYS_BETWEEN(<%=DUE_DATE%>,TODAY()) <= <%=TOO_LATE_BUFFER%> - COALESCE(<%=ROUTE%>*1.0,0.0) THEN NULL -- 'No GI and Passed Due Date, but still within tolerance'
	
	WHEN ISNULL(
	PU_LAST("VBAP",ROUND_DAY("_CEL_O2C_ACTIVITIES"."EVENTTIME"),"_CEL_O2C_ACTIVITIES"."ACTIVITY_<%=language%>"='<%=record_goods_issue_activity%>')
	) = 1 AND DAYS_BETWEEN(<%=DUE_DATE%>,TODAY()) > <%=TOO_LATE_BUFFER%> - COALESCE(<%=ROUTE%>*1.0,0.0) THEN 0.0 -- 'No GI and Passed Due Date and out of tolerance'
    
   	WHEN ROUND(DAYS_BETWEEN(
    PU_LAST("VBAP",ROUND_DAY("_CEL_O2C_ACTIVITIES"."EVENTTIME"),"_CEL_O2C_ACTIVITIES"."ACTIVITY_<%=language%>"='<%=record_goods_issue_activity%>')
    ,<%=DUE_DATE%>)) > COALESCE(<%=ROUTE%>*1.0,0.0) + <%=TOO_EARLY_BUFFER%>
        THEN 0.0 --'Too Early'
    
    WHEN ROUND(DAYS_BETWEEN(
    PU_LAST("VBAP",ROUND_DAY("_CEL_O2C_ACTIVITIES"."EVENTTIME"),"_CEL_O2C_ACTIVITIES"."ACTIVITY_<%=language%>"='<%=record_goods_issue_activity%>')
    ,<%=DUE_DATE%>)) >= COALESCE(<%=ROUTE%>*1.0,0.0)
            AND ROUND(DAYS_BETWEEN(
            PU_LAST("VBAP",ROUND_DAY("_CEL_O2C_ACTIVITIES"."EVENTTIME"),"_CEL_O2C_ACTIVITIES"."ACTIVITY_<%=language%>"='<%=record_goods_issue_activity%>')
            ,<%=DUE_DATE%>)) <= COALESCE(<%=ROUTE%>*1.0,0.0) + <%=TOO_EARLY_BUFFER%>
        THEN 1.0 --'On Time' - earlier than due date,  but within too early buffer   
    
    WHEN ROUND(DAYS_BETWEEN(
    PU_LAST("VBAP",ROUND_DAY("_CEL_O2C_ACTIVITIES"."EVENTTIME"),"_CEL_O2C_ACTIVITIES"."ACTIVITY_<%=language%>"='<%=record_goods_issue_activity%>')
    ,<%=DUE_DATE%>)) < COALESCE(<%=ROUTE%>*1.0,0.0)
            AND ROUND(DAYS_BETWEEN(
            PU_LAST("VBAP",ROUND_DAY("_CEL_O2C_ACTIVITIES"."EVENTTIME"),"_CEL_O2C_ACTIVITIES"."ACTIVITY_<%=language%>"='<%=record_goods_issue_activity%>')
            ,<%=DUE_DATE%>)) >= COALESCE(<%=ROUTE%>*1.0,0.0) - <%=TOO_LATE_BUFFER%>
        THEN 1.0 --'On Time' - later than due date, but within too late buffer
   
    ELSE 0.0 --'Too Late'
END
)

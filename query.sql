INSERT INTO "_CEL_O2C_ACTIVITIES" (
    "_CASE_KEY",
    "ACTIVITY_EN",
    "EVENTTIME",
    "_SORTING",
    "USER_NAME",
    "MANDT",
    "VBELN",
    "POSNR"
)
SELECT
    VBAP."MANDT" || VBAP."VBELN" || VBAP."POSNR" AS "_CASE_KEY",
    'Remove Delivery Block' AS "ACTIVITY_EN",
    CAST(CDHDR."UDATE" || ' ' || CDHDR."UTIME" AS TIMESTAMP) AS "EVENTTIME",
    285 AS "_SORTING",
    CDHDR."USERNAME" AS "USER_NAME",
    VBAP."MANDT" AS "MANDT",
    VBAP."VBELN" AS "VBELN",
    VBAP."POSNR" AS "POSNR"
FROM
    VBAP
JOIN
    VBAK ON VBAP."VBELN" = VBAK."VBELN" AND VBAP."MANDT" = VBAK."MANDT"
JOIN
    CDHDR ON VBAK."VBELN" = CDHDR."OBJECTID" AND CDHDR."OBJECTCLAS" = 'VBAK'
JOIN
    CDPOS ON CDHDR."OBJECTID" = CDPOS."OBJECTID" AND CDPOS."TABNAME" = 'VBAK' AND CDPOS."FNAME" = 'LIFSK'
WHERE
    CDPOS."VALUE_NEW" IS NULL
    AND CDPOS."VALUE_OLD" = 'ZA';

select count(*) from "_CEL_O2C_ACTIVITIES";

-- Line 26 (WERKS): To be active in case order/requisition and contract must share the same Plant (WERKS). If inactive, it can also be setup on Knowledge Model.
-- Line 27 (MATNR): To be active in case order/requisition and contract must share the same Material (MATNR). If inactive, it can also be setup on Knowledge Model.
-- Line 31: Active in case you want to throw recommendations only with valid contracts (for Operational Data Models). If inactive, it will be used to analyze contract expiration (Analytical Data Models).
-- Line 38 (AND P.WERKS = C.WERKS): Active in case order/requisition and contract must share the same Plant (WERKS). If inactive, it can also be setup on Knowledge Model.
-- Line 39 (AND P.MATNR = C.MATNR): Active in case order/requisition and contract must share the same Material (MATNR). If inactive, it can also be setup on Knowledge Model.
-- Line 40 (WHERE P.KONNR IS NULL): Active in case you want to throw recommendations for order/requisitions that does not have an contract (KONNR). Inactive in cae you want to improve the existing use of contracts.

-- Query No: 1
DROP VIEW IF EXISTS P2P_CONTRACT_RECOMMENDATION;

-- Query No: 2
CREATE VIEW P2P_CONTRACT_RECOMMENDATION AS 
SELECT 
      P.MANDT AS P2P_MANDT
    , P.EBELN AS P2P_EBELN
    , P.EBELP AS P2P_EBELP
    , P.KONNR AS P2P_KONNR     
    , C.*,GREATEST(P.EPOCH,C.EPOCH ) AS EPOCH
FROM P2P_EKPO_STAGING AS P 
JOIN 
    (SELECT *,EPOCH FROM (
            SELECT   *, EPOCH,ROW_NUMBER() OVER (PARTITION BY 
                MANDT,
                EKORG,
                WAERS,
                -- WERKS,
                MATNR,
                NETPR 
                ORDER BY TS_KDATB DESC, NETPR ASC) AS RANKING
            FROM P2P_CONTRACT_INFO 
            -- WHERE TS_KDATE > NOW() or TS_KDATE IS NUll
            ) F  
    WHERE RANKING<=<%=contractsRecommended%> 
    ) AS C   
    ON  P.MANDT = C.MANDT
    AND P.EKORG = C.EKORG
    AND P.WAERS = C.WAERS
    -- AND P.WERKS = C.WERKS
    AND P.MATNR = C.MATNR
WHERE P.KONNR IS NULL 
;

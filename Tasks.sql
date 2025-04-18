select * from EKKO;
select * from EKPO;

select count(*) from "EKKO";  -- 43 
select count(*) from "EKPO";  -- 75

-- FOR PURCHASE ORDER :
select A.EBELN, WAERS, NETWR FROM EKKO AS A    -- Select the Purchase Order number, currency, and net price
JOIN EKPO AS B ON                              -- From the Purchase Order Header table (EKKO), aliased as A
A.MANDT = B.MANDT AND A.EBELN = B.EBELN;       -- Join it with the Purchase Order Item table (EKPO), aliased as B

-- FOR INVOICING :

SELECT * FROM BKPF;
SELECT * FROM BSEG;
SELECT * FROM RSEG;

-- Homework : A table that will give me fields from Invoice header and amount WRBTR_CONVERTED

-- WRBTR_CONVERTED (in BSEG table) & invoice header()
SELECT SAMNR, REBZZ, SAKNR, AUFNR, LIFNR, SHKZG, CPUDT, WRBTR_CONVERTED 
FROM BKPF AS BK JOIN BSEG BS ON BK.MANDT = BS.MANDT AND BK.BELNR = BS.BELNR;

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

-- Homework A table that will give me fields from Invoice header and amount WRBTR_CONVERTED

SELECT A.BELNR, A.WAERS, B.DMBTR, C.WRBTR * 1 AS WRBTR_CONVERTED  -- Invoice number, currency, amounts
FROM BKPF AS A                                                    -- Accounting document header
JOIN BSEG AS B ON A.MANDT = B.MANDT AND A.BELNR = B.BELNR         -- Line items
JOIN RSEG AS C ON A.MANDT = C.MANDT AND A.BELNR = C.BELNR;        -- MM invoice table


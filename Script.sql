UPDATE Sorefsis.RequiredVats
SET lastSearchDate=NULL, harvestStatus = NULL ;
TRUNCATE table SoapApi ; 

select COUNT(rv.vat)  from RequiredVats rv WHERE rv.lastSearchDate is not null;

select COUNT(rv.vat)  from RequiredVats rv WHERE rv.harvestStatus=1;

select COUNT(rv.vat)  from RequiredVats rv WHERE rv.id<=10000 AND rv.lastSearchDate is null;

SELECT DISTINCT sa.status  from SoapApi sa ;

explain SELECT DISTINCT sa.stateAidCode, sa.stateAidDescription  from SoapApi sa ;

SELECT DISTINCT sa.articleCode , sa.articleDescription  from SoapApi sa ;

SELECT DISTINCT sa.proposalCode  , sa.proposalTitle  from SoapApi sa ;

explain SELECT COUNT(sa.CompanyTitle) FROM SoapApi sa WHERE sa.CompanyTitle = "Μη Διαθέσιμο";

SELECT *  FROM SoapApi sa WHERE sa.proposalCode = "07";

SELECT *  FROM SoapApi sa WHERE sa.amount <0;

SELECT * FROM SoapApi sa WHERE sa.vat = "082236377";

explain select * from SoapApi sa where sa.articleCode = "SG120";

select * from vatList vl where vl.lastSearchedDate in ("2023-11-27","2023-11-28","2023-11-29","2023-12-01");

select vl.vat  from vatList vl where vl.lastSearchedDate in ("2023-11-27");

select rv.vat  from RequiredVats rv  where rv.lastSearchDate  = "2023-12-04";

SELECT * from SoapApi sa where sa.proposalCode = "1";

CREATE view diffView as
SELECT v2.code, v2.vat from View111 v1 right join View222 v2 on v1.code = v2.code where v1.code is null; 

select DISTINCT dv.vat  from diffView dv;

SELECT * from SoapApi sa where sa.articleCode  is NULL ;

CREATE view diff27reverse As
select vs.vat, vs.code from ViewSoap2711 vs left join ViewMain2711 vm on vs.code = vm.code where vm.code is null;

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `Sorefsis`.`diff29reverse` AS;
explain select
    `v2`.`code` AS `code`,
    `v2`.`vat` AS `vat`
from
    (`Sorefsis`.`ViewMain2911` `v2`
right join `Sorefsis`.`ViewSoap2911` `v1` on
    ((`v1`.`code` = `v2`.`code`)))
where
    isnull(`v2`.`code`);
   
   SELECT DISTINCT sa.id
FROM SoapApi sa 
;

SELECT sa.id, COUNT(*)
FROM SoapApi sa 
GROUP BY sa.id 
HAVING COUNT(*) > 1;




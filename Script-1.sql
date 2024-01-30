aaaaaaaUPDATE tmp_Sorefsis.RequiredVats set lastSearchDate = null, harvestStatus = NULL;





SELECT * FROM Sorefsis.SoapApi WHERE proposalId = 78;

SELECT *  FROM information_schema.PROCESSLIST p;

show PROCESSLIST;

show variables;

select count(rv.vat) from Sorefsis.RequiredVats rv where rv.harvestStatus =0;

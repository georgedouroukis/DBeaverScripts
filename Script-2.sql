select * from Companies c where c.individual = 0

select * from Gemh_info g where g.company_id not in (select DISTINCT gi.company_id from Gemh_info gi );

select DISTINCT gi.company_id from Gemh_info gi where company_id is not NULL ;



SELECT SUM(sub.c)  from (SELECT count(*) as c, gi.company_id  FROM Gemh_info gi WHERE gi.company_id IS NOT NULL GROUP BY gi.company_id ) sub WHERE sub.c>1;

select DISTINCT  gi.orgType, BINARY(gi.orgType)  from Gemh_info gi ;

select *  from NameMatching nm where nm.dateProcessed = "2024-01-29";

select DISTINCT nm.cid  from NameMatching nm ;

select DISTINCT nm.preOrgTypeId  from NameMatching nm ;

select * from NameMatching nm where nm.preOrgTypeId =6;

-- namematchind entries from companies that dont have title
select DISTINCT nm.cid  from NameMatching nm where nm.preOrgTypeId =1;

-- namematchind entries from companies that have title
SELECT nm.cid, COUNT(1) 
FROM NameMatching nm 
WHERE nm.preOrgTypeId = 1 
GROUP BY nm.cid 
HAVING COUNT(1) > 1;
	   
-- Companies entries that have title
SELECT c.id as company_id 
FROM BI.Companies c  
JOIN BI.Formats f ON c.format = f.id 
WHERE f.categoryId = 1 AND title IS NOT NULL;

SELECT * from NameMatching nm where nm.cid in (
	SELECT company_id
	FROM (
	    SELECT c.id as company_id 
	    FROM BI.Companies c  
	    JOIN BI.Formats f ON c.format = f.id 
	    WHERE f.categoryId = 1 AND title IS NOT NULL
	) com 
	LEFT JOIN (
	    SELECT nm.cid, COUNT(1) 
	    FROM NameMatching nm 
	    WHERE nm.preOrgTypeId = 1 
	    GROUP BY nm.cid 
	    HAVING COUNT(1) > 1
	) com2 ON company_id = com2.cid 
	WHERE com2.cid IS NULL
);


SELECT * from Gemh_info  c where c.name like "%περιωρισμ%";
SELECT * from Gemh_info  c where c.name  like "%diagr%" 
and not c.name  like "%(%)%" 
;

select * from Companies c left join NameMatching nm on (c.id = nm.cid and nm.gid is null) where nm.cid is null ;
select * from Gemh_info gi left join NameMatching nm on (gi.id = nm.gid and gi.company_id= nm.cid) where (nm.cid is null and nm.gid is null);

-- All from Companies
SELECT count(DISTINCT nm.cid) from NameMatching nm  where nm.gid is NULL ;

-- All from Gemh_info
SELECT count(DISTINCT nm.gid) from NameMatching nm  ;

-- All NameMatching entries
SELECT count(nm.id) from NameMatching nm  ;

-- duplicate rows 
SELECT nm.cid, nm.gid, nm.preProcessed1, nm.preProcessed2, nm.preOrgTypeId, count(nm.id)
FROM NameMatching nm 
GROUP BY nm.cid, nm.gid, nm.preProcessed1, nm.preProcessed2, nm.preOrgTypeId 
HAVING COUNT(id) > 1 ;

-- different orgtype, same preprocessed names 
SELECT nm.cid, nm.gid, nm.preProcessed1, nm.preProcessed2, count(nm.id)
FROM NameMatching nm 
GROUP BY nm.cid, nm.gid, nm.preProcessed1, nm.preProcessed2 
HAVING COUNT(id) > 1 ;

-- different orgtype, same preprocessed names 
SELECT nm.cid, nm.gid, count(nm.id)
FROM NameMatching nm 
GROUP BY nm.cid, nm.gid
HAVING COUNT(id) > 1 ;


show PROCESSLIST;

show variables;

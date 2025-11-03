# Task 3: 
---Popola le tabelle utilizzando dati a tua discrezione (sono sufficienti pochi record per tabella; riporta le query utilizzate) 


USE TOYSGROUP;

##POPOLAZIONE TABELLA

SELECT *
FROM CATEGORY;
INSERT INTO CATEGORY (CATEGORYID,CATEGORYNAME)
VALUES
		('1','LEGO DUPLO'),
        ('2','LEGO CLASSIC'),
        ('3','LEGO TECHNIC'),
        ('4','LEGO DISNEY');
SELECT*
FROM PRODUCT;
INSERT INTO PRODUCT (PRODUCTID,PRODUCTNAME,LISTPRICE,QUANTITY,CATEGORYID)
VALUES
			('1','Cura animali','40','230','1'),
            ('2','camion','32','45','1'),
			('3','Mattoncini','28','128','2'),
            ('4','Scatola Magica','19','49','2'),
            ('5','Escavatore','39','65','3'),
            ('6','Motocicletta','53','29','3'),
            ('7','Castello Disney','49','38','4'),
            ('8','Nave Pirata','65','48','4');
SELECT *
FROM REGION;
        
INSERT INTO REGION (REGIONID,REGIONNAME)
VALUES 		
		('1','NORTH EUROPE'),
        ('2','AFRICA'),
        ('3','ASIA'),
        ('4','OCEANIA'),
        ('5','SOUTH AMERICA');


SELECT *
FROM COUNTRY;
INSERT INTO COUNTRY (COUNTRYID,COUNTRYNAME,REGIONID)
VALUES
			('1','DENMARK','1'),
            ('2','SENEGAL','2'),
            ('3','CHINA','3'),
            ('4','AUSTRALIA','4'),
            ('5','ARGENTINA','5');

INSERT INTO SALES (SALESORDERNUMBER,QUANTITY,UNITPRICE,SALESAMOUNT,SALESDATE,PRODUCTID,REGIONID)
VALUES 
		('200','50','2025-09-12','productid','regionid'),
        ('120','30','2025-02-20','productd','regionid'),
        ('67','70','2025-04-19','productid','regionid'),
        ('94','54','2025-07-23','productid','regionid');
        

SELECT *
FROM SALES;
INSERT INTO SALES (SALESORDERNUMBER, PRODUCTID, COUNTRYID, QUANTITY, UNITPRICE, TOTALAMOUNT, SALESDATE)
VALUES 
    (200, 1, 1, 50, 10.00, 500.00, '2025-09-12'),
    (120, 2, 2, 30, 15.00, 450.00, '2025-02-20'),
    (67, 3, 3, 70, 8.00, 560.00, '2025-04-19'),
    (94, 4, 4, 54, 12.00, 648.00, '2025-07-23');
		
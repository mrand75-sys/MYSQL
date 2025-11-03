Task 4:
Dopo aver popolate le tabelle, scrivi delle query utili a:
# 1)	Verificare che i campi definiti come PK siano univoci.
In altre parole, scrivi una query per determinare l’univocità dei valori di ciascuna PK (una query per tabella implementata).

Per verificare che i campi siamo definiti come PK è sufficiente osservare 
le informazioni della tabella che si trova nella parte bassa a sinistra del workbench.

Altro modo per verificare i campi PK è fare un SELECT * FROM nome della tabella, si potrà osservare nel result set i campi univoci



# 2)	Esporre l’elenco delle transazioni indicando nel result set 
il codice documento, la data, il nome del prodotto, la categoria del prodotto, il nome dello stato, il nome della regione di vendita 
e un campo booleano valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno (>180 -> True, <= 180 -> False)
USE TOYSGROUP;
SELECT 
    s.SALESORDERNUMBER,
    s.SALESDATE,
    p.PRODUCTNAME,
    c.CATEGORYNAME,
    co.COUNTRYNAME,
    r.REGIONNAME,
    CASE 
        WHEN DATEDIFF('2025-10-29', s.SALESDATE) > 180 THEN 'True'
        ELSE 'False'
    END AS Oltre180Giorni
FROM SALES s
JOIN PRODUCT p ON s.PRODUCTID = p.PRODUCTID
JOIN CATEGORY c ON p.CATEGORYID = c.CATEGORYID
JOIN COUNTRY co ON s.COUNTRYID = co.COUNTRYID
JOIN REGION r ON co.REGIONID = r.REGIONID
ORDER BY s.SALESDATE DESC, s.SALESORDERNUMBER;




# 3)	Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito. 
(ogni valore della condizione deve risultare da una query e non deve essere inserito a mano).
 Nel result set devono comparire solo il codice prodotto e il totale venduto.
 
 SELECT 
    S.SALESORDERNUMBER AS CodiceDocumento,
    S.SALESDATE AS DataVendita,
    P.PRODUCTNAME AS NomeProdotto,
    C.CATEGORYNAME AS CategoriaProdotto,
    CO.COUNTRYNAME AS Stato,
    R.REGIONNAME AS RegioneVendita
FROM SALES S
    INNER JOIN PRODUCT P ON S.PRODUCTID = P.PRODUCTID
    INNER JOIN CATEGORY C ON P.CATEGORYID = C.CATEGORYID
    INNER JOIN COUNTRY CO ON S.COUNTRYID = CO.COUNTRYID
    INNER JOIN REGION R ON CO.REGIONID = R.REGIONID;
 
 SELECT 
    S.SALESORDERNUMBER AS CodiceDocumento,
    S.SALESDATE AS DataVendita,
    P.PRODUCTNAME AS NomeProdotto,
    C.CATEGORYNAME AS CategoriaProdotto,
    CO.COUNTRYNAME AS Stato,
    R.REGIONNAME AS RegioneVendita
FROM SALES S
INNER JOIN PRODUCT P ON S.PRODUCTID = P.PRODUCTID
INNER JOIN CATEGORY C ON P.CATEGORYID = C.CATEGORYID
INNER JOIN COUNTRY CO ON S.COUNTRYID = CO.COUNTRYID
INNER JOIN REGION R ON CO.REGIONID = R.REGIONID;

# 4)	Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno. 

SELECT 
    P.PRODUCTNAME AS NomeProdotto,
    YEAR(S.SALESDATE) AS Anno,
    SUM(S.TOTALAMOUNT) AS FatturatoTotale
FROM SALES S
    INNER JOIN PRODUCT P ON S.PRODUCTID = P.PRODUCTID
GROUP BY 
    P.PRODUCTNAME,
    YEAR(S.SALESDATE)
ORDER BY 
    P.PRODUCTNAME,
    Anno;




#5)	Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.

SELECT 
    CO.COUNTRYNAME AS Stato,
    YEAR(S.SALESDATE) AS Anno,
    SUM(S.TOTALAMOUNT) AS FatturatoTotale
FROM SALES S
    INNER JOIN COUNTRY CO ON S.COUNTRYID = CO.COUNTRYID
GROUP BY 
    CO.COUNTRYNAME,
    YEAR(S.SALESDATE)
ORDER BY 
    Anno ASC,
    FatturatoTotale DESC;


#6)	Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?

SELECT 
    C.CATEGORYNAME AS Categoria,
    SUM(S.QUANTITY) AS TotaleVenduto
FROM SALES S
INNER JOIN PRODUCT P ON S.PRODUCTID = P.PRODUCTID
INNER JOIN CATEGORY C ON P.CATEGORYID = C.CATEGORYID
GROUP BY C.CATEGORYNAME
ORDER BY TotaleVenduto DESC;




#7)	Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.

SELECT 
    P.PRODUCTID,
    P.PRODUCTNAME
FROM 
    PRODUCT P
    LEFT JOIN SALES S ON P.PRODUCTID = S.PRODUCTID
WHERE 
    S.PRODUCTID IS NULL;


#8)	Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” delle informazioni utili 
codice prodotto, nome prodotto, nome categoria)

CREATE VIEW V_PRODOTTI_DENORMALIZZATI AS
SELECT 
    P.PRODUCTID AS CodiceProdotto,
    P.PRODUCTNAME AS NomeProdotto,
    C.CATEGORYNAME AS NomeCategoria
FROM 
    PRODUCT P
    INNER JOIN CATEGORY C ON P.CATEGORYID = C.CATEGORYID;



#9)	Creare una vista per le informazioni geografiche

CREATE VIEW V_INFORMAZIONI_GEOGRAFICHE AS
SELECT 
    CO.COUNTRYID AS CodiceStato,
    CO.COUNTRYNAME AS NomeStato,
    R.REGIONID AS CodiceRegione,
    R.REGIONNAME AS NomeRegione
FROM 
    COUNTRY CO
    INNER JOIN REGION R ON CO.REGIONID = R.REGIONID;


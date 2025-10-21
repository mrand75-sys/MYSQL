USE AdventureWorksDW;

#1. Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria. 
#Quali considerazioni/ragionamenti è necessario che tu faccia?
--RIFLESSIONI: Una chiave primaria - PK:UNIVOCA - NON PUO ESSERE NULL - IDENTIFICA UNIVOCAMENTE OGNI TUPLA.
--Per verificare che il campo PRODUCTKEY sia una chiave primaria - devo calcolare le TUPLA 


SELECT 
    COUNT(*) AS TotaleRighe,
    COUNT(DISTINCT ProductKey) AS ValoriUnici,
    COUNT(*) - COUNT(ProductKey) AS ValoriNull
FROM dimproduct; --questo comando mi permette di verifiare i valori UNIVOCI della TABELLA DIMPRODUCT

#2. Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber 
#e SalesOrderLineNumber sia una PK.

SELECT SalesOrderNumber, SalesOrderLineNumber, 
		COUNT(*) AS Occorrenze
FROM factresellersales
GROUP BY SalesOrderNumber, SalesOrderLineNumber -- qui raggruppo i 2 attributi
HAVING COUNT(*) > 1;--selezione solo gruppi che hanno piùdi una riga


select SalesOrderNumber,SalesOrderLineNumber
from factresellersales;
select *
from factresellersales;

#3. Conta il numero transazioni SalesOrderLineNumber) realizzate ogni giorno a partire dal 1 Gennaio 2020.
SELECT 
    OrderDate AS DataOrdine,
    COUNT(SalesOrderLineNumber) AS NumeroTransazioni -- qui ho chiesto di contare le tupla presenti nell'attributo e messo un alias
FROM factresellersales -- nome del database
WHERE OrderDate >= '2020-01-01'  -- filtro WHERE, quindi gli chiesto di mostrare gli ordini effettuati dal 1 gennaio 2020
GROUP BY OrderDate -- selezionare
ORDER BY OrderDate; -- ordnato per data


#4.Calcola il fatturato totale FactResellerSales.SalesAmount), la quantità totale venduta FactResellerSales.OrderQuantity) 
#e il prezzo medio di vendita FactResellerSales.UnitPrice) per prodotto DimProduct) 
#a partire dal 1 Gennaio 2020. Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, 
#la quantità totale venduta e il prezzo medio di vendita. I campi in output devono essere parlanti!

SELECT 
    dp.EnglishProductName AS NomeProdotto,
    SUM(fr.SalesAmount) AS FatturatoTotale, #sommato l attributo salesamount e messo alias
    SUM(fr.OrderQuantity) AS QuantitaTotaleVenduta, #sommato orderquantity e messo alias
    AVG(fr.UnitPrice) AS PrezzoMedio #fatto il calcolo della media del prezzounitario
FROM factresellersales fr
JOIN dimproduct dp ON fr.ProductKey = dp.ProductKey #fatto join tra attributo 
WHERE fr.OrderDate >= '2020-01-01'
GROUP BY dp.EnglishProductName
ORDER BY FatturatoTotale DESC; #ordinato in ordine decrescente



select *
from factinternetsales; # PK: ProductKey,CustomerKey,PromotionKey,CurrencyKey,SalesTerritoryKey,




SELECT *
FROM factresellersales;

#ESERCIZIO 2
#1 Calcola il fatturato totale FactResellerSales.SalesAmount) e la quantità totale venduta FactResellerSales.OrderQuantity) per Categoria prodotto DimProductCategory). Il result set deve esporre pertanto il nome della categoria prodotto, il fatturato totale e la quantità totale venduta. I campi in output devono essere parlanti! 

SELECT 
    pc.EnglishProductCategoryName AS CategoriaProdotto,
    SUM(fs.SalesAmount) AS FatturatoTotale,
    SUM(fs.OrderQuantity) AS QuantitaTotaleVenduta
FROM factresellersales fs
JOIN dimproduct p ON fs.ProductKey = p.ProductKey
JOIN dimproductsubcategory ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN dimproductcategory pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY pc.EnglishProductCategoryName
ORDER BY FatturatoTotale DESC;


#2. Calcola il fatturato totale per area città DimGeography.City) realizzato a partire dal 1 Gennaio 2020. 
#Il result set deve esporre lʼelenco delle città con fatturato realizzato superiore a 60K.

SELECT 
    dg.City AS Città,
    SUM(fr.SalesAmount) AS FatturatoTotale
FROM factresellersales fr
JOIN dimreseller r ON fr.ResellerKey = r.ResellerKey
JOIN dimgeography dg ON r.GeographyKey = dg.GeographyKey
WHERE fr.OrderDate >= '2020-01-01'
GROUP BY dg.City
HAVING SUM(fr.SalesAmount) > 60000
ORDER BY FatturatoTotale DESC;


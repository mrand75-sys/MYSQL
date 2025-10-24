use AdventureWorksDW;

#1. Implementa una vista denominata Product al fine di creare unʼanagrafica (dimensione) prodotto completa. 
#La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome prodotto, 
#il nome della sottocategoria associata e il nome della categoria associata.

CREATE VIEW Product AS
SELECT 
    p.EnglishProductName AS NomeProdotto,
    ps.EnglishProductSubcategoryName AS Nomesottocategoria,
    pc.EnglishProductCategoryName AS NomeCategoria
FROM dimproduct p
LEFT JOIN DimProductSubcategory ps
    ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
LEFT JOIN DimProductCategory pc
    ON ps.ProductCategoryKey = pc.ProductCategoryKey;
    
#2.Implementa una vista denominata Reseller al fine di creare unʼanagrafica (dimensione) reseller completa. 
#La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome del reseller, 
#il nome della città e il nome della regione.

CREATE VIEW Reseller AS
SELECT 
    r.ResellerName AS Venditore,
    g.City AS Citta,
    g.StateProvinceName AS Regione
FROM dimreseller r
LEFT JOIN dimgeography g
    ON r.GeographyKey = g.GeographyKey;
    
# 3.Crea una vista denominata Sales che deve restituire la data dellʼordine, 
#il codice documento, la riga di corpo del documento, la quantità venduta, lʼimporto totale e il profitto.

CREATE VIEW Sales AS
SELECT 
    d.FullDateAlternateKey AS Dataordine,
    frs.SalesOrderNumber AS Numeroscontrino,
    frs.SalesOrderLineNumber AS Numeroriga,
    frs.OrderQuantity AS Quantità,
    frs.SalesAmount AS Totalevendita,
    frs.ProfitAmount AS Ricavo
FROM FactResellerSales frs
LEFT JOIN dimdate d
    ON frs.OrderDateKey = d.DateKey;


    


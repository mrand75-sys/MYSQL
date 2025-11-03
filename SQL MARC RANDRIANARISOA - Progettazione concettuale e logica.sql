#Task 1: Proponi una progettazione concettuale e logica della base dati
---La progettazione concettuale deve includere tutte le entità coinvolte e le relazioni tra queste. 
---Per ciascuna entità indica l’attributo chiave e i principali attributi descrittivi (non è necessario indicare tutti gli attributi).
Relazioni e cardinalità
Relazione	Cardinalità	Descrizione
PRODUCT → CATEGORY	Molti-a-Uno. Ogni prodotto appartiene a una sola categoria
STATE → REGION	Molti-a-Uno. Ogni stato appartiene a una sola regione
SALES → PRODUCT	Molti-a-Uno. Ogni vendita riguarda un solo prodotto
SALES → STATE	Molti-a-Uno. Ogni vendita avviene in uno stato specifico

CREAZIONE DATABASE TOYSGROUP
CREATE DATABASE TOYSGROUP;


#Task 2: 
---Descrivi la struttura delle tabelle che reputi utili e sufficienti a modellare lo scenario proposto tramite la sintassi DDL. 
---Implementa fisicamente le tabelle utilizzando il DBMS SQL Server(o altro).
USE TOYSGROUP;
CREAZIONE TABELLA
CREATE TABLE CATEGORY (
					CATEGORYID INT AUTO_INCREMENT PRIMARY KEY,
					CATEGORYNAME VARCHAR(100) NOT NULL
  );

CREATE TABLE PRODUCT (
					PRODUCTID INT AUTO_INCREMENT PRIMARY KEY,
					PRODUCTNAME VARCHAR(100) NOT NULL,
					LISTPRICE DECIMAL(10,2) NOT NULL,
					QUANTITY INT,
					CATEGORYID INT NOT NULL,
					FOREIGN KEY (CATEGORYID) REFERENCES CATEGORY(CATEGORYID)
);

CREATE TABLE REGION (
					REGIONID INT AUTO_INCREMENT PRIMARY KEY,
					REGIONNAME VARCHAR(30) NOT NULL
);

CREATE TABLE COUNTRY (
					COUNTRYID INT AUTO_INCREMENT PRIMARY KEY,
					COUNTRYNAME VARCHAR(100) NOT NULL,
					REGIONID INT NOT NULL,
					FOREIGN KEY (REGIONID) REFERENCES REGION(REGIONID)
);


CREATE TABLE SALES (
				SALESORDERNUMBER INT PRIMARY KEY,
				PRODUCTID INT NOT NULL,
				COUNTRYID INT NOT NULL,
				QUANTITY INT NOT NULL,
				UNITPRICE DECIMAL(10,2) NOT NULL,
				TOTALAMOUNT DECIMAL(10,2) NOT NULL,
				SALESDATE DATE NOT NULL,
				FOREIGN KEY (PRODUCTID) REFERENCES PRODUCT(PRODUCTID),
				FOREIGN KEY (COUNTRYID) REFERENCES COUNTRY(COUNTRYID)
);
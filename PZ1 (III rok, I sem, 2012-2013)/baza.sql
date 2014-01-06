-- TABELE

-- Tabela u¿ytkowników (osoby fizyczne + firmy)
CREATE TABLE Uzytkownicy
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	Nazwa varchar(100) NOT NULL,
	Haslo varchar(500) NOT NULL,
	NazwaFirmy varchar(500),
	Nazwisko varchar(100),
	PierwszeImie varchar(100),
	DrugieImie varchar(100),
	DataUrodzenia date,
	Ulica varchar(200),
	KodPocztowy varchar(10),
	Miejscowosc varchar(100),
	Wojewodztwo varchar(30),
	Kraj varchar(30),
	Email varchar(200) NOT NULL,
	Telefon varchar(30),
	Regon varchar(20),
	Nip varchar(20),
	Krs varchar(20)
)

-- Tabela kategorii produktów (podkategorie bêd¹ mia³y klucz do nadrzêdnej kategorii)
CREATE TABLE KategorieProduktow
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	PodkategoriaId int FOREIGN KEY REFERENCES KategorieProduktow(Id),
	Nazwa varchar(100) NOT NULL
)

-- Tabela szczegó³ów produktów unikalnych dla danej kategorii (np. kategoria "Smartfony" mo¿e mieæ szczegó³y takie jak "stan","rozdzielczoœæ wyœwietlacza" itp.)
CREATE TABLE SzczegolyKategorii
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	KategoriaId int FOREIGN KEY REFERENCES KategorieProduktow(Id) NOT NULL,
	Nazwa varchar(200) NOT NULL
)

-- Tabela opisuj¹ca opisy szczegó³ów z poprzedniej tabeli (opisuje opcje dla np. "rozdzielczoœæ wyœwietlacza" mo¿liwoœci takie jak: "640x480","111x200" itp.)
CREATE TABLE OpisySzczegolowKategorii
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	SzczegolKategoriiId int FOREIGN KEY REFERENCES SzczegolyKategorii(Id) NOT NULL,
	opis varchar(200) NOT NULL
)

-- Tabela sposobów dostawy
CREATE TABLE SposobyDostawy
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	nazwa varchar(100) NOT NULL
)

-- Tabela produktów
CREATE TABLE OfertySprzedazy
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	SprzedajacyId int FOREIGN KEY REFERENCES Uzytkownicy(Id) NOT NULL,
	KategoriaId int FOREIGN KEY REFERENCES KategorieProduktow(Id) NOT NULL,
	nazwa varchar(500) NOT NULL,
	opis text,
	lokalizacja varchar(100),
	DataWystawienia datetime NOT NULL,
	DataZakonczenia datetime NOT NULL,
	Ilosc int NOT NULL,
	CenaKupTeraz numeric(10,2),
	CenaMinimalna numeric(10,2),
	IloscWyswietlen int
)

-- Tabela kosztów dostawy produktów
CREATE TABLE KosztyDostawyProduktu
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	OfertaSprzedazyId int FOREIGN KEY REFERENCES OfertySprzedazy(Id) NOT NULL,
	SposobDostawyId int FOREIGN KEY REFERENCES SposobyDostawy(Id) NOT NULL,
	KosztDostawy numeric(10,2) NOT NULL
)

-- Tabela zdjêæ produktów
CREATE TABLE ZdjeciaProduktow
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	OfertaSprzedazyId int FOREIGN KEY REFERENCES OfertySprzedazy(Id) NOT NULL,
	Zdjecie image NOT NULL
)

-- Tabela szczegó³ów produktu (zale¿ne od kategorii w jakiej znajduje siê prokukt)
CREATE TABLE SzczegolyProduktow
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	OfertaSprzedazyId int FOREIGN KEY REFERENCES OfertySprzedazy(Id) NOT NULL,
	SzczegolKategoriiId int FOREIGN KEY REFERENCES SzczegolyKategorii(Id) NOT NULL,
	OpisSzczegoluKategoriiId int FOREIGN KEY REFERENCES OpisySzczegolowKategorii(Id) NOT NULL
)

-- Tabela ofert kupna produktów w przypadku aukcji i kup teraz
CREATE TABLE OfertyKupna
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	OfertaSprzedazyId int FOREIGN KEY REFERENCES OfertySprzedazy(Id) NOT NULL,
	UzytkownikId int FOREIGN KEY REFERENCES Uzytkownicy(Id) NOT NULL,
	Oferta numeric(10,2),
	KupTeraz numeric(10,2),
)

-- Tabela recenzji produktów
CREATE TABLE RecenzjeProduktow
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	OfertaSprzedazyId int FOREIGN KEY REFERENCES OfertySprzedazy(Id) NOT NULL,
	WystawiajacyId int FOREIGN KEY REFERENCES Uzytkownicy(Id) NOT NULL,
	Zalety text,
	Wady text,
	Opis text,
	OcenaProduktu int CHECK(OcenaProduktu>0 AND OcenaProduktu<6) NOT NULL
)

-- Tabela komentarzy sprzeda¿y
CREATE TABLE KomentarzeSprzedazy
(
	Id int PRIMARY KEY IDENTITY NOT NULL,
	OfertaSprzedazyId int FOREIGN KEY REFERENCES OfertySprzedazy(Id) NOT NULL,
	Typ varchar(20) NOT NULL,
	Tresc text,
	OcenaSprzedazy int CHECK(OcenaSprzedazy>0 AND OcenaSprzedazy<6) NOT NULL
)

GO

-- WIDOKI

-- Widok produktów z dodatkowym polek IloscRecenzji
CREATE VIEW WOfertySprzedazy AS
SELECT Id,SprzedajacyId,KategoriaId,nazwa,opis,lokalizacja,
DataWystawienia,DataZakonczenia,Ilosc,CenaKupTeraz,CenaMinimalna,IloscWyswietlen,
(SELECT COUNT(R.Id) FROM RecenzjeProduktow R WHERE R.OfertaSprzedazyId=P.Id) AS IloscRecenzji,
(SELECT MAX(O1.Oferta) FROM OfertyKupna O1 WHERE O1.OfertaSprzedazyId=P.Id) AS NajwyzszaCenaAukcji,
(SELECT COUNT(O2.Id) FROM OfertyKupna O2 WHERE O2.OfertaSprzedazyId=P.Id AND CenaKupTeraz IS NOT NULL) AS IloscKupionychPrzezKupTeraz
FROM OfertySprzedazy P
GO

-- Widok komentarzy sprzeda¿y z dodatkowym polem SprzedajacyId
CREATE VIEW WKomentarzeSprzedazy AS
SELECT Id,OfertaSprzedazyId,Typ,Tresc,OcenaSprzedazy,
(SELECT SprzedajacyId FROM OfertySprzedazy S WHERE K.OfertaSprzedazyId=S.Id) AS SprzedajacyId
FROM KomentarzeSprzedazy K
GO

-- Widok tabeli u¿ytkowników z dodatkowymi polami
CREATE VIEW WUzytkownicy AS
SELECT Id,Nazwa,Haslo,NazwaFirmy,Nazwisko,PierwszeImie,DrugieImie,DataUrodzenia,Ulica,
KodPocztowy,Miejscowosc,Wojewodztwo,Kraj,Email,Telefon,Regon,Nip,Krs,
(SELECT COUNT(K1.Id) FROM WKomentarzeSprzedazy K1 WHERE U.Id=K1.SprzedajacyId) AS IloscKomentarzy,
(SELECT COUNT(K2.Id) FROM WKomentarzeSprzedazy K2 WHERE U.Id=K2.SprzedajacyId AND K2.Typ='Pozytywny') AS IloscPozytywnychKomentarzy,
(SELECT COUNT(K3.Id) FROM WKomentarzeSprzedazy K3 WHERE U.Id=K3.SprzedajacyId AND K3.Typ='Neutralny') AS IloscNeutralnychKomentarzy,
(SELECT COUNT(K4.Id) FROM WKomentarzeSprzedazy K4 WHERE U.Id=K4.SprzedajacyId AND K4.Typ='Negatywny') AS IloscNegatywnychKomentarzy
FROM Uzytkownicy U
GO
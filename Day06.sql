use hamzadeneme;

CREATE TABLE kursiyer(
id char(3),
isim varchar(50),
veli_isim varchar(50),
yazili_notu int,
CONSTRAINT kursiyer_pk
PRIMARY KEY (id)
);

INSERT INTO kursiyer VALUES(123, 'Ali Can', 'Hasan',75); 
INSERT INTO kursiyer VALUES(124, 'Merve Gul', 'Ayse',85); 
INSERT INTO kursiyer VALUES(125, 'Kemal Yasa', 'Ali',85);

SELECT * FROM kursiyer;

-- verileri database'e ilk olarak yedekle
SAVEPOINT AKSAM;

-- isminde a harfi olan ogrencilerin yazılı notunu 5 arttırın
UPDATE kursiyer SET yazili_notu = yazili_notu + 5
WHERE isim LIKE ('%a%');

-- veli ismi 3 harften fazla olanlardan 3 puan silin
UPDATE kursiyer SET yazili_notu = yazili_notu - 3
WHERE veli_isim LIKE ('___%');


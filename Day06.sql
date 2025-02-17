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

-- veli ismi Hasan olan ogrenciyi silin
DELETE FROM kursiyer
WHERE veli_isim = 'Hasan';

-- geri dönmek için;
ROLLBACK TO AKSAM;

-- SAVEPOINT calistirildigi anda ki guncel durumu dondurur ve o haliyle yedekler.
-- Tekrar ROLLBACK TO komutu ile cagirildiginda ise dondurdugu verileri getirir.
-- Yani SAVEPOINT isleminden ROLLBACK islemine kadar yapilan hic bir islem
-- SAVEPOINT ile kaydedilmeyecegi icin
-- ROLLBACK TO komutu ile geri getirilemez.

/*
   TRUNCATE komutu kayıtları geri getirilemeyecek sekilde siler.
*/

-- kursiyer tablosundaki verileri TRUNCATE ile silin
TRUNCATE kursiyer;

ROLLBACK TO sabah; -- doesn't exist

-- ============================================================================================================================================================
CREATE TABLE talebeler(
id CHAR(3) PRIMARY KEY,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu INT
);

INSERT INTO talebeler VALUES
        (123,'Ali Can', 'Hasan', 75),
        (124,'Merve Gul', 'Ayse', 85),
        (125,'Kemal Yasa', 'Hasan', 85),
        (126,'Nesıbe Yılmaz', 'Ayse', 95),
        (127,'Mustafa Bak', 'Can', 99);


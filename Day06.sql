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

CREATE TABLE dereceler(
talebe_id CHAR(3),
ders_adi VARCHAR(30),
yazili_notu INT,
CONSTRAINT talebe_id_fk 
FOREIGN KEY (talebe_id)
REFERENCES talebeler(id) 
);

INSERT INTO dereceler VALUES
        (123, 'Kimya', 75),
        (124, 'Fizik', 65),
        (125, 'Tarih', 90),
        (126, 'Matematik', 90),
        (127, 'Matematik', 23);
        
SELECT * FROM talebeler;
SELECT * FROM dereceler;

-- Talebeler tablosundan id'si 125'den büyük olan dataları silin
DELETE FROM dereceler
WHERE talebe_id > 125;

DELETE FROM talebeler
WHERE id > 125;

-- -------------------ON DELETE CASCADE-------------
/*
   Her defasinda once child tablodaki verileri silmek yerine
   ON DELETE CASCADE silme ozelligini aktif hale getirebiliriz.
   Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmak yeterli.
*/

DROP TABLE dereceler;
TRUNCATE talebeler;

-- dereceler tablosunu yeniden olusturalım
CREATE TABLE dereceler(
talebe_id CHAR(3),
ders_adi VARCHAR(30),
yazili_notu INT,
CONSTRAINT talebe_id_fk FOREIGN KEY (talebe_id)
REFERENCES talebeler(id) ON DELETE CASCADE
);

-- Talebeler tablosundan id'si 125'den büyük olan dataları silin
DELETE FROM talebeler
WHERE id > 125; -- otomatik parenttan sildi boylelikle child tablodan'da gitti.

-- ============================================================================================================================================================
USE hamzadeneme;

SELECT * FROM nisan_satislar;
SELECT * FROM mayis_satislar;

-- nisan veya mayıs'da Toyota alan müsterilerin isimleri
SELECT musteri_isim FROM nisan_satislar
WHERE urun_isim = 'Toyota'
UNION
SELECT musteri_isim FROM mayis_satislar
WHERE urun_isim = 'Toyota';

CREATE TABLE kadro(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO kadro VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO kadro VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO kadro VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO kadro VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO kadro VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO kadro VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO kadro VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO kadro VALUES(345678902, 'Mehmet Ozturk', 'Izmir', 3500,'Honda');   
 
SELECT * FROM kadro;

-- 1) Honda ve Tofas'ta calisan benzersiz isimdeki personelleri listeleyin
SELECT DISTINCT isim FROM kadro
WHERE sirket IN ('Honda','Tofas');

SELECT isim FROM kadro
WHERE sirket = 'Honda'
UNION
SELECT isim FROM kadro
WHERE sirket = 'Tofas';

-- 2) Honda, Ford ve Tofas'ta calisan benzersiz isimdeki personelleri listeleyin
SELECT isim FROM kadro
WHERE sirket = 'Honda'
UNION
SELECT isim FROM kadro
WHERE sirket = 'Tofas'
UNION
SELECT isim FROM kadro
WHERE sirket = 'Ford';

SELECT DISTINCT isim FROM kadro
WHERE sirket IN ('Honda','Tofas','Ford');

-- Maasi 4000'den fazla olan isci isimlerini ve 5000'den fazla
-- maas alinan sehirleri ayni sutunda alt alta gosteren sorguyu yaziniz
SELECT isim AS Isim_ve_Sehir FROM kadro
WHERE maas > 4000
UNION
SELECT sehir FROM kadro
WHERE maas > 5000;






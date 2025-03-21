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

-- 5000'den az maas alanlarin , buna ek olarak Honda calisani olmayanlarin
-- isim bilgilerini listeleyiniz.
SELECT isim FROM kadro
WHERE maas < 5000
UNION
SELECT isim FROM kadro
WHERE sirket != 'Honda';

-- ============================================================================================================================================================
CREATE TABLE sirket (
sirket_id INT , 
sirket_isim VARCHAR(20)
);

INSERT INTO sirket VALUES(100, 'Toyota');
INSERT INTO sirket VALUES(101, 'Honda');
INSERT INTO sirket VALUES(102, 'Ford');
INSERT INTO sirket VALUES(103, 'Hyundai');

SELECT * FROM sirket;

CREATE TABLE siparisler    (
siparis_id INT,
sirket_id INT, 
siparis_tarihi DATE
);

INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');
INSERT INTO siparisler VALUES(55, 105, '2020-04-21'); 

SELECT * FROM siparisler;

-- Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve 
-- siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT sir.sirket_isim,sip.siparis_id,sip.siparis_tarihi
FROM siparisler sip INNER JOIN sirket sir
ON sip.sirket_id = sir.sirket_id;

/* -----------------------------------------------------------------------------
  ORNEK2: sirket tablosundaki tum sirketleri ve bu sirketlere ait olan 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
SELECT sir.sirket_isim,sip.siparis_id,sip.siparis_tarihi
FROM sirket sir LEFT JOIN siparisler sip
ON sip.sirket_id = sir.sirket_id;

-- siparisler tablosundaki tum sirketleri ve bu sirketlere ait olan 
-- siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT sir.sirket_isim,sip.siparis_id,sip.siparis_tarihi
FROM sirket sir RIGHT JOIN siparisler sip
ON sip.sirket_id = sir.sirket_id;

-- sirket ve siparisler adindaki tablolarda yer alan sirket_id, 
-- sirket_isim, siparis_id ve siparis_tarihleri'ni listeleyen bir query yaziniz
SELECT sir.sirket_isim,sir.sirket_isim,sip.siparis_id,sip.siparis_tarihi
FROM sirket sir LEFT JOIN siparisler sip
ON sip.sirket_id = sir.sirket_id
UNION
SELECT sir.sirket_isim,sir.sirket_isim,sip.siparis_id,sip.siparis_tarihi
FROM sirket sir RIGHT JOIN siparisler sip
ON sip.sirket_id = sir.sirket_id;

-- ==============================================================================================

CREATE TABLE bolumler (
bolum_id   INT PRIMARY KEY,
bolum_isim VARCHAR(14),
konum      VARCHAR(13)
);

INSERT INTO bolumler VALUES (10,'MUHASEBE','IST');
INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');
INSERT INTO bolumler VALUES (60,'SATIS', 'CORUM');

CREATE TABLE personeller (
personel_id   INT ,
personel_isim VARCHAR(10),
meslek        VARCHAR(9),
mudur_id      INT,
maas          INT,
bolum_id      INT,
CONSTRAINT bolumID_fk FOREIGN KEY(bolum_id)
REFERENCES bolumler(bolum_id)
);

INSERT INTO personeller VALUES (7369,'AHMET','KATIP',1111,800,20);
INSERT INTO personeller VALUES (7499,'BAHATTIN','SATIS',1222,1600,30);
INSERT INTO personeller VALUES (7521,'NESE','SATISE',1222,1250,30);
INSERT INTO personeller VALUES (1111,'MUZAFFER','MUDUR',7839,2975,20);
INSERT INTO personeller VALUES (7654,'MUHAMMET','SATIS',1222,1250,30);
INSERT INTO personeller VALUES (1222,'EMINE','MUDUR',7839,2850,30);
INSERT INTO personeller VALUES (1333,'HARUN','MUDUR',7839, 2450,10);
INSERT INTO personeller VALUES (7788,'MESUT','ANALIST',1111,3000,20);
INSERT INTO personeller VALUES (7839,'SEHER','BASKAN',NULL,5000,10);
INSERT INTO personeller VALUES (7844,'DUYGU','SATIS',1222,1500,30);
INSERT INTO personeller VALUES (7876,'ALI','KATIP',1111,1100,20);
INSERT INTO personeller VALUES (7900,'MERVE','KATIP',1222,950,30);
INSERT INTO personeller VALUES (7902,'NAZLI','ANALIST',1111,3000,20);
INSERT INTO personeller VALUES (7934,'EBRU','KATIP',1333,1300,10);
INSERT INTO personeller VALUES (7956,'SIBEL','MIMAR',1333,3300,60);
INSERT INTO personeller VALUES (7933,'ZEKI','MUHENDIS',1333,4300,60);

SELECT * FROM bolumler;
SELECT * FROM personeller;

-- SATIS ve MUHASEBE bolumlerinde calisanlarin isimlerini ve 
-- bolumlerini, once bolum sonra isim sirali olarak listeleyiniz
SELECT p.personel_isim,b.bolum_isim
FROM bolumler b JOIN personeller p 
ON b.bolum_id = p.bolum_id  
WHERE b.bolum_isim IN ('SATIS','MUHASEBE')
ORDER BY b.bolum_isim,p.personel_isim;

/*
  SATIS, ISLETME ve DEPO bolumlerinde calisanlarin isimlerini ve
  bolumlerini isim sirali olarak listeleyiniz
  NOT: Calisani olmasa bile bolum ismi listelenmelidir.
*/
SELECT p.personel_isim,b.bolum_isim
FROM bolumler b LEFT JOIN personeller p 
ON b.bolum_id = p.bolum_id  
WHERE b.bolum_isim IN ('SATIS','ISLETME','DEPO')
ORDER BY b.bolum_isim,p.personel_isim;











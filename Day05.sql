use hamzadeneme;

CREATE TABLE calisanlar(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
sirket VARCHAR(20)
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');

CREATE TABLE sirketler(
sirket_id int,
sirket VARCHAR(20),
calisanlar_sayisi int
);

INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);

SELECT * FROM calisanlar;
SELECT * FROM sirketler;

-- Honda'da çalışan personelin isimlerini listeleyin
SELECT isim FROM calisanlar 
WHERE sirket = 'Honda';

-- Calısan sayısı 15000'den fazla olan şirket isimlerini listeleyin
SELECT sirket FROM sirketler
WHERE calisanlar_sayisi > 15000;

-- Ford ve Toyota'da calısan personelin isimlerini listeleyin
SELECT isim FROM calisanlar
WHERE sirket IN ('Ford','Toyota');

-- Calısan sayısı 15000'den fazla olan sirketlerde 
-- Çalısan personelin isimlerini listeleyin.
SELECT isim FROM calisanlar
WHERE sirket IN ( SELECT sirket FROM sirketler WHERE calisanlar_sayisi > 15000 );

-- Sirket ID'si 100 olan şirkette
-- çalısan personel isimlerini listeleyin.
SELECT isim FROM calisanlar
WHERE sirket = ( SELECT sirket FROM sirketler WHERE sirket_id = 100 );

/*
----------------------------------------------------------------
  1) Veli Yilmaz isimli personelin calistigi sirketlerin sirket
  ismini ve personel sayilarini listeleyiniz.
----------------------------------------------------------------
*/
SELECT sirket,calisanlar_sayisi FROM sirketler
WHERE sirket IN ( SELECT sirket FROM calisanlar WHERE isim = 'Veli Yilmaz' );

/*
 ----------------------------------------------------------------
  2) Ankara da calisani olan sirketlerin ID isim ve calisan sayilarini
  listeleyiniz.
----------------------------------------------------------------
*/
SELECT * FROM sirketler
WHERE sirket IN ( SELECT sirket FROM calisanlar WHERE sehir = 'Ankara' );

/*
----------------------------------------------------------------
  3) ID'si 101 den yuksek olan sirketlerde calisanlarin maas sehir
  sirket ismini listeleyiniz.
----------------------------------------------------------------
*/
SELECT sehir,maas,sirket FROM calisanlar
WHERE sirket IN ( SELECT sirket FROM sirketler WHERE sirket_id > 101 );

/*
----------------------------------------------------------------
  4) ID'si 100 olan sirketde calisanlarin maas ortalamasini listeleyiniz.
----------------------------------------------------------------
*/
SELECT AVG(maas) AS Calisanlarin_maas_ortalaması FROM calisanlar
WHERE sirket IN ( SELECT sirket FROM sirketler WHERE sirket_id = 100 );

/*
----------------------------------------------------------------
 SORU 1- Her sirketin ismini, personel sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------
*/
SELECT sirket,calisanlar_sayisi,(SELECT AVG(maas) FROM calisanlar WHERE sirketler.sirket = calisanlar.sirket)
AS Personel_Ortalama_Maas
FROM sirketler;

/*
----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi
listeleyen bir QUERY yazin.
----------------------------------------------------------------
*/
SELECT sirket,(SELECT MAX(maas) FROM calisanlar WHERE calisanlar.sirket = sirketler.sirket)
AS Her_sirketteki_personelin_max_maasi
FROM sirketler;

/*
----------------------------------------------------------------
SORU 3- id'si 101'den büyük sirketlerin ismini ve personelin aldigi max. maasi
listeleyen bir QUERY yazin.
----------------------------------------------------------------
*/
SELECT sirket,(SELECT MAX(maas) FROM calisanlar WHERE calisanlar.sirket = sirketler.sirket)
AS Her_sirketteki_personelin_max_maasi
FROM sirketler
WHERE sirket_id > 101;

/*
----------------------------------------------------------------
SORU 4- Her sirketin id'sini, ismini ve toplam kac sehirde
bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------
*/
SELECT sirket_id,sirket,(SELECT COUNT(sehir) FROM calisanlar WHERE calisanlar.sirket = sirketler.sirket)
AS Kaç_sehirde_bulunduğu_sayı
FROM sirketler;

/*
----------------------------------------------------------------
SORU 5- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve
toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------
*/
SELECT sirket_id,sirket,(SELECT COUNT(sehir) FROM calisanlar WHERE calisanlar.sirket = sirketler.sirket)
AS Kaç_sehirde_bulunduğu_sayı
FROM sirketler
WHERE sirket_id > 101;

/*
----------------------------------------------------------------
SORU 6- Her sirketin ismini,personel sayisini ve personelin
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------
*/
SELECT sirket,calisanlar_sayisi,(SELECT MAX(maas) FROM calisanlar WHERE calisanlar.sirket = sirketler.sirket)
AS max_maas,
(SELECT MIN(maas) FROM calisanlar WHERE calisanlar.sirket = sirketler.sirket)
AS min_maas
FROM sirketler;

-- ============================================================================================================================

CREATE TABLE mayis_satislar(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (20, 'John', 'Toyota');
INSERT INTO mayis_satislar VALUES (30, 'Amy', 'Ford');
INSERT INTO mayis_satislar VALUES (20, 'Mark', 'Toyota');
INSERT INTO mayis_satislar VALUES (10, 'Adem', 'Honda');
INSERT INTO mayis_satislar VALUES (40, 'John', 'Hyundai');
INSERT INTO mayis_satislar VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan_satislar(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mayis_satislar;
SELECT * FROM nisan_satislar;

/*
----------------------------------------------------------------
SORU 1 : Her iki ayda da ayni id ile satilan urunlerin urun_id'lerini
ve urunleri mayis ayinda alanlarin isimlerini getiren bir query yaziniz.
----------------------------------------------------------------
*/
SELECT urun_id,musteri_isim FROM mayis_satislar
WHERE urun_id IN ( SELECT urun_id FROM nisan_satislar WHERE nisan_satislar.urun_id = mayis_satislar.urun_id)
ORDER BY urun_id,musteri_isim;

SELECT urun_id,musteri_isim FROM mayis_satislar
WHERE EXISTS ( SELECT urun_id FROM nisan_satislar WHERE nisan_satislar.urun_id = mayis_satislar.urun_id)
ORDER BY urun_id,musteri_isim;

-- ============================================================================================================================

CREATE TABLE firmalar(
id INT,
isim VARCHAR(30),
iletisim_isim VARCHAR(30),
CONSTRAINT id_isim_pk
PRIMARY KEY(id,isim)
);

INSERT INTO firmalar VALUES
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez');

SELECT * FROM firmalar;

-- Id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz
UPDATE firmalar SET isim = 'KRM'
WHERE id = 3;

-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.
UPDATE firmalar SET id = 4 , isim = 'FDS'
WHERE iletisim_isim = 'Veli Gul';

-- Ismi ACB olan firmanin iletisim ismini 'Osman Can' olarak guncelleyiniz.
UPDATE firmalar SET iletisim_isim = 'Osman Can'
WHERE isim = 'ACB';

-- ============================================================================================================================
use hamzadeneme;

-- id, isim ve irtibat fieldlarinin oldugu bir tedarik tablosu olusturun.
-- id field'ini Primary Key yapin.
CREATE TABLE tedarik(
id INT,
isim VARCHAR(30),
irtibat VARCHAR(30),
CONSTRAINT id_pk PRIMARY KEY(id)
);

-- tedarikci_id, urun_id, urun_ismi, musteri_isim fieldlari olan urun
-- tablosu olusturun
-- Bu tablodaki tedarikci_id fieldinin tedarik tablosunun PK si ile
-- Foreign Key baglantisini kurun
CREATE TABLE urun(
tedarikci_id INT,
urun_id INT,
urun_ismi VARCHAR(30),
musteri_isim VARCHAR(30),
CONSTRAINT td_id_fk
FOREIGN KEY(tedarikci_id)
REFERENCES tedarik(id)
);

INSERT INTO tedarik VALUES(100, 'IBM', 'Ali Can');
INSERT INTO tedarik VALUES(101, 'APPLE', 'Merve Temiz');
INSERT INTO tedarik VALUES(102, 'SAMSUNG', 'Kemal Can');
INSERT INTO tedarik VALUES(103, 'LG', 'Ali Can');

INSERT INTO urun VALUES(100, 1001,'Laptop', 'Suleyman');
INSERT INTO urun VALUES(101, 1002,'iPad', 'Fatma');
INSERT INTO urun VALUES(102, 1003,'TV', 'Ramazan');
INSERT INTO urun VALUES(103, 1004,'Phone', 'Ali Can');

SELECT * FROM tedarik;
SELECT * FROM urun;

-- 'LG' firmasinda calisan 'Ali Can'in ismini 'Veli Can'
-- olarak degistiriniz.
UPDATE tedarik SET irtibat = 'Veli Can'
WHERE isim = 'LG';

/*  Urun tablosundan Ali Can'in aldigi urunun ismini,
tedarik tablosunda irtibat Merve Temiz olan
sirketin ismi ile degistirin. */
UPDATE urun SET urun_ismi = (SELECT isim FROM tedarik WHERE irtibat = 'Merve Temiz')
WHERE musteri_isim = 'Ali Can';

-- Urun tablosundaki TV satin alan musterinin ismini,
-- tedarik tablosundaki IBM'in irtibat'i ile degistirin.
UPDATE urun SET musteri_isim = (SELECT irtibat FROM tedarik WHERE isim = 'IBM')
WHERE urun_ismi = 'TV';

-- urun id'si 1001 olan urun ismini, id'si 102 olan
-- sirketin ismi ile degistirin.
UPDATE urun SET urun_ismi = (SELECT isim FROM tedarik WHERE id = 102)
WHERE urun_id = 1001;








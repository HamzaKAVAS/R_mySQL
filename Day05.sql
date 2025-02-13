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
SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde
bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------
*/
SELECT sirket_id,sirket,(SELECT COUNT(sehir) FROM calisanlar WHERE calisanlar.sirket = sirketler.sirket)
AS Kaç_sehirde_bulunduğu_sayı
FROM sirketler;

/*
----------------------------------------------------------------
SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve
toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------
*/
SELECT sirket_id,sirket,(SELECT COUNT(sehir) FROM calisanlar WHERE calisanlar.sirket = sirketler.sirket)
AS Kaç_sehirde_bulunduğu_sayı
FROM sirketler
WHERE sirket_id > 101;

/*
----------------------------------------------------------------
SORU 5- Her sirketin ismini,personel sayisini ve personelin
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






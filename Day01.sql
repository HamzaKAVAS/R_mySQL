use HamzaDeneme;

create table ogrenciler(
isim varchar(40),
soyisim varchar(40),
yas int,
dogum_yeri varchar(40)
);

select * from ogrenciler;

INSERT INTO ogrenciler() values('Hayri','Koru',25,'Ibiza');
INSERT INTO ogrenciler() values('Meltem','Koru',24,'Monaco');
INSERT INTO ogrenciler () VALUES ('Mehmet', 'Kara', 25, 'İstanbul');
INSERT INTO ogrenciler () VALUES ('Ayşe', 'Kaya', 22, 'İzmir');
INSERT INTO ogrenciler () VALUES ('Fatma', 'Güneş', 28, 'Bursa');
INSERT INTO ogrenciler () VALUES ('Ali', 'Çelik', 35, 'Antalya');
INSERT INTO ogrenciler () VALUES ('Elif', 'Demir', 29, 'Ankara');
INSERT INTO ogrenciler () VALUES ('Can', 'Özdemir', 33, 'İstanbul'),
								 ('Deniz', 'Arslan', 24, 'İzmir'),
								 ('Selin', 'Yıldız', 27, 'Bursa'),
								 ('Emre', 'Koç', 31, 'Antalya'),
								 ('Zeynep', 'Çınar', 26, 'Konya'),
								 ('Oğuz', 'Kaplan', 40, 'Samsun');

-- ogrenciler tablosundaki yas ve dogum_yeri sutununu goruntuleyin
select yas,dogum_yeri from ogrenciler;

-- yas sütununun data türünü double yapın
alter table ogrenciler MODIFY COLUMN yas double;

-- yas sütununun adını ogrenci_yasi ve data türünü int yapın
alter table ogrenciler CHANGE COLUMN yas ogrenci_yasi int; 

-- yas sütununu silin
alter table ogrenciler DROP COLUMN ogrenci_yasi;

-- ogrenciler tablosunu silin
DROP TABLE ogrenciler;

-- ===================================================================================================================================

CREATE TABLE kisiler
(
isim VARCHAR(30),
soyisim VARCHAR(30),
yas INT,
sehir VARCHAR(20)
);

INSERT INTO kisiler () VALUES ('Ahmet', 'Yılmaz', 30, 'Ankara');
INSERT INTO kisiler () VALUES ('Mehmet', 'Kara', 25, 'İstanbul');
INSERT INTO kisiler () VALUES ('Ayşe', 'Kaya', 22, 'İzmir');
INSERT INTO kisiler () VALUES ('Fatma', 'Güneş', 28, 'Bursa');
INSERT INTO kisiler () VALUES ('Ali', 'Çelik', 35, 'Antalya');
INSERT INTO kisiler () VALUES ('Elif', 'Demir', 29, 'Ankara');
INSERT INTO kisiler () VALUES ('Can', 'Özdemir', 33, 'İstanbul');
INSERT INTO kisiler () VALUES ('Deniz', 'Arslan', 24, 'İzmir');
INSERT INTO kisiler () VALUES ('Selin', 'Yıldız', 27, 'Bursa');
INSERT INTO kisiler () VALUES ('Emre', 'Koç', 31, 'Antalya');
INSERT INTO kisiler () VALUES ('Zeynep', 'Çınar', 26, 'Konya');
INSERT INTO kisiler () VALUES ('Oğuz', 'Kaplan', 40, 'Samsun');
INSERT INTO kisiler () VALUES ('Burcu', 'Ertuğrul', 22, 'Trabzon');
INSERT INTO kisiler () VALUES ('Kaya', 'Durmaz', 35, 'Diyarbakır');
INSERT INTO kisiler () VALUES ('Seda', 'Aydın', 28, 'Eskişehir');

select * from kisiler;
select isim,soyisim from kisiler where sehir='bursa';

-- ===================================================================================================================================

/*
========================  SORU-1 ========================
 Kisiler tablosundan isim ve soy isim bilgilerini listeleyiniz.
=========================================================
 */
 
 select isim,soyisim from kisiler;
 
 /*  
========================  SORU-2 ========================
 Kisiler tablosundaki sehir= antalya olan kisileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where sehir='antalya';
 
 /*
 ========================  SORU-3 ========================
    Kisiler tablosundaki yasi 22 olan kisileri listeleyiniz.
 =========================================================
 */
 
 select * from kisiler where yas=22;
 
 /*
 ========================  SORU-4 ========================
    Kisiler tablosundaki sehri Ankara olanlarin yas, isim ve soyisim
    bilgilerini listeleyiniz.
 =========================================================
 */
 
 select yas,isim,soyisim from kisiler where sehir='ankara';
 
 /*
========================  SORU-5 ========================
    Kisiler tablosundaki yasi 30 `dan buyuk olan kisilerin
    bilgilerini listeleyiniz.
=========================================================
 */
 
 select * from kisiler where yas > 30;
 
 /*
========================  SORU-6 ========================
    Kisiler tablosundaki ismi 'emre' den buyuk olan kisilerin
    isimlerini listeleyiniz.
=========================================================
 */
 
 select isim from kisiler where isim > 'Emre';
 
 /*
========================  SORU-7 ========================
    Kisiler tablosundaki sehri 'D' den buyuk olan sehirlerde
    yasayan kisileri isim ve soyisim  bilgilerini listeleyiniz.
=========================================================
 */
 
 select isim,soyisim from kisiler where sehir > 'D';
 
 /*
 ========================  SORU-8 ========================
    Kisiler tablosundaki yasi 35 den kucuk veya esit olan kisilerin
    bilgilerini listeleyiniz.
 =========================================================
 */
 
 select * from kisiler where yas <= 35;
 
 /*  
 ========================  SORU-9 ========================
    Kisiler tablosundaki sehri Trabzon olmayan kisilerin
    bilgilerini listeleyiniz.
 =========================================================
 */
 
 select * from kisiler where sehir != 'Trabzon';
 select * from kisiler where sehir <> 'Trabzon';
 
 /*
========================  SORU-10 ========================
 Kisiler tablosundan 29 yaşından büyük olan ve Ankara'da yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where yas > 29 and sehir = 'ankara';
 
 /*
========================  SORU-11 ========================
 Kisiler tablosundan Adı 'Fatma' olan ve Bursa'da yaşayan kişilerin yasini listeleyiniz.
=========================================================
 */
 
 select yas from kisiler where isim='Fatma' and sehir='Bursa';
 
 /*
========================  SORU-12 ========================
 Kisiler tablosundan ismi 'Ayse' ve soyismi 'Kaya' olan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where isim='Ayşe' and soyisim='Kaya';
 
 /*  
 ========================  SORU-13 ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan kişileri listeleyiniz.
 =========================================================
 */
 
 select * from kisiler where yas between 25 and 35;
 
 /*
========================  SORU-14 ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan ve Ankara'da yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where yas between 25 and 35 and sehir='ankara';
 
 /*  
========================  SORU-15 ========================
 Kisiler tablosundan yaşı 22 veya 35 olan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where yas=22 or yas=35;
 
 /*
========================  SORU-16 ========================
 Kisiler tablosundan 29 yaşından büyük olan veya Ankara'da yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where yas>29 or sehir='ankara';
 
 /*
========================  SORU-17 ========================
 Kisiler tablosundan İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where sehir='ankara' or sehir='istanbul' or sehir='izmir';
 
 /*  
========================  SORU-18 ========================
 Kisiler tablosundan İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where sehir IN ('ankara','istanbul','izmir');
 
 /*
========================  SORU-19 ========================
    Kisiler tablosundan adı 'Ahmet', 'Mehmet' veya 'Ayşe' olan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where isim IN ('ahmet','mehmet','ayşe');
 
 /*  
========================  SORU-20 ========================
 Kisiler tablosundan  İstanbul'da yaşamayan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where not sehir='istanbul';
 
 /*  
========================  SORU-21 ========================
 Kisiler tablosundan  İstanbul, Izmir veya Ankara'da yaşamayan kişileri listeleyiniz.
=========================================================
 */

 select * from kisiler where not sehir IN ('istanbul','izmir','ankara');
 
 /*
========================  SORU-22 ========================
 Kisiler tablosundan 30 yaşından büyük olmayan kişileri listeleyiniz.
=========================================================
 */
 
 select * from kisiler where not yas > 30;
 
 -- =================================================================================================================================== 

								                                 



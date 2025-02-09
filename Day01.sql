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
 
 create table maaslar(
 id char(5),
 isim varchar(50),
 maas int
 );
 
INSERT INTO maaslar VALUES('10001','Ahmet Aslan',7000);
INSERT INTO maaslar VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO maaslar VALUES('10003','Meryem',7215);
INSERT INTO maaslar VALUES('10004','Veli Han',5000);
INSERT INTO maaslar VALUES('10005','Mustafa Ali',5500);
INSERT INTO maaslar VALUES('10006','Ayse Can',5600);
INSERT INTO maaslar VALUES('10010','Ayse',4700);
INSERT INTO maaslar VALUES('10009','Ayse Cemile',4000);
INSERT INTO maaslar VALUES('10008','Ayse Fatma',4300);
INSERT INTO maaslar VALUES('10007','Beyza Ayse',7700);
INSERT INTO maaslar VALUES('10011','Yeliz Alina',12700);

select * from maaslar;

-- ismi Ayse olan kisinin maasını yazdırın
select maas from maaslar where isim='ayşe';

/*  
=============================  SORU-1 =============================
    Personel tablosundan dort harfli personeli listeleyiniz.
===================================================================
 */
 
 select * from maaslar where isim LIKE '____';
 select * from maaslar where isim LIKE '____ ___';
 
 /*  
=============================  SORU-2 =============================
    Personel tablosundan isminde a bulunan personeli listeleyiniz.
===================================================================
 */

select * from maaslar where isim LIKE '%a%';

/*  
=============================  SORU-3 =============================
    Personel tablosundan ismi Ayse olan personeli listeleyiniz.
===================================================================
 */
 
 select * from maaslar where isim LIKE '%ayse%';
 
 /*  
=============================  SORU-4 =============================
    Personel tablosundan ismi 'a' ile biten personeli listeleyiniz.
===================================================================
 */
 
 select * from maaslar where isim LIKE '%a';
 
 /*
=============================  SORU-5 =============================
    Personel tablosundan isminin 2. harfi 'e' olan personeli listeleyiniz
===================================================================
 */
 
 select * from maaslar where isim LIKE '_e%';
 
 /*
=============================  SORU-6 =============================
    Personel tablosundan Isminin 2. harfi 'e' olup diger harflerinde 'y'
    olan personeli listeleyiniz
===================================================================
 */
 
 select * from maaslar where isim LIKE '_e%' and isim LIKE '%y%';
 
 /*
=============================  SORU-7 =============================
    Personel tablosundan maasi 5 haneli olan personel isimlerini listeleyiniz
===================================================================
 */
 
 select isim from maaslar where maas LIKE '_____';
 
 /*
=============================  SORU-8 =============================
    Personel tablosundan isminin 1. harfi 'a' ve 7. harfi 'a' olan
    personeli listeleyiniz
===================================================================
 */
 
 select * from maaslar where isim LIKE 'a_____a%';
 
 CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50),
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES 
    (1001, 'hot', 3),
    (1002, 'hat', 3),
    (1003, 'hit', 3),
    (1004, 'hbt', 3),
    (1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
    (1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);
    
    SELECT * FROM kelimeler;
    
    /*  
=============================  SORU-9 =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    listeleyiniz
===================================================================
 */
 
 select * from kelimeler where kelime LIKE '%ot%' or kelime LIKE '%at%';
 select * from kelimeler where regexp_like (kelime,'ot|at');
 
 /*  
=============================  SORU-10 =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    case-sensitive'e dikkat ederek listeleyiniz.
===================================================================
 */
 
 select * from kelimeler where regexp_like (kelime,'ot|at','c');
 select * from kelimeler where regexp_like (kelime,'ot|at','i'); -- önemli değilken
 
  /*
=============================  SORU-11 =============================
    Kelimeler tablosundan sonu 't' veya 'm' ile bitenleri
    case-sensitive'e dikkat etmeksizin listeleyiniz.
===================================================================
 */
 
 select * from kelimeler where regexp_like (kelime,'t$|m$','i');
 
 /*  
=============================  SORU-12 =============================
    Kelimeler tablosundan h ile baslayip t ile biten 3 harfli kelimeleri 
    (h ile t kucuk harfli olanlari) listeleyiniz.
===================================================================
 */
 
 SELECT kelime FROM kelimeler 
 WHERE REGEXP_LIKE (kelime,'^h.t$','c');
 
 /*  
=============================  SORU-13 =============================
    Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri rakam 
    olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
===================================================================
 */
 
 SELECT kelime FROM kelimeler 
 WHERE REGEXP_LIKE (kelime,'^h[0-9]t$','c');
 
 /*  
=============================  SORU-14 =============================
    Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri buyuk 
    harf olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
===================================================================
 */
 
 SELECT kelime FROM kelimeler 
 WHERE REGEXP_LIKE (kelime,'^h[A-Z]t$','c');
 
 /*  
=============================  SORU-15 =============================
    Kelimeler tablosundan 2. harfi 'O' (buyuk O harfli) olan 3 karakterli 
    kelimeleri ve id'lerini listeleyiniz
===================================================================
 */
 
 SELECT id,kelime FROM kelimeler 
 WHERE REGEXP_LIKE (kelime,'^.O.$','c');
 
-- =================================================================================================================================== 
use hamzadeneme;

CREATE TABLE insanlar(
id INT,
isim VARCHAR(40),
soyisim VARCHAR(40),
goz_renk VARCHAR(40),
yas INT
);

INSERT INTO insanlar VALUES (1,'Enes','Yayla','Ela',25),
                            (2,'Leyla','Koru','Ela',23),
                            (3,'Hayri','Koru','Siyah',24),
                            (4,'Fatih','Mert','Kahverengi',30),
                            (5,'Ali','Türk','Yeşil',30),
                            (6,'Fuat','Kemal','Sarı',30);
                            
SELECT * FROM insanlar;

-- insanlar tablosundan dört harfli insanları listeleyin.

SELECT isim FROM insanlar
WHERE isim LIKE '____';

                       

 
 
								                                 



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

								                                 



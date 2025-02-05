create schema HamzaDeneme;
use HamzaDeneme;
 
 -- bu bir yorum satırıdır.
 /*
 birden fazla satır yazacagın zaman kullan.
 */
 
 /*  
   ========================  SORU-1 ========================
   Icerisinde kitap id, kitap adi, yazar adi, yayin yili ve kategori columnlari
   olan bir kitaplar tablosu create ediniz. 
   =========================================================
 */
 
 create table books (
 kitap_id int, 
 kitap_adi varchar(50), 
 yazar_adi varchar(50), 
 yayin_yili int, 
 kategori varchar(50)
 );
 
 select * from books;
 
insert into books() values (1, 'Araba Sevdası', 'Recaizade Mahmut Ekrem', 1901, 'Roman'); 
insert into books(kitap_id, kitap_adi, yazar_adi) values (3, 'Ateşten Gömlek', 'Halide Edip Adıvar');
INSERT INTO books()
VALUES  (1, 'Savaş ve Barış',    'Lev Tolstoy',  1869,   'Tarihi' ),
        (2, 'Suç ve Ceza', 'Fyodor Dostoyevski',   1866,   'Psikolojik'),
        (3, 'Anna Karenina',    'Lev Tolstoy',  1877,   'Aşk'),
        (4, '1984', 'George Orwell',    1949,   'Politik'),
        (5, 'Büyük Umutlar',  'Charles Dickens',  1861,   'Dram'),
        (6, 'Don Kişot',   'Miguel de Cervantes',  1605,   'Macera'),
        (7, 'Gurur ve Önyargı',   'Jane Austen',  1813,   'Dram'),
        (8, 'Monte Kristo Kontu',   'Alexandre Dumas',  1844,   'Macera'),
        (9, 'Faust',    'Johann Wolfgang von Goethe',   1808,   'Felsefi'),
        (10, 'Ulysses',  'James Joyce',  1922,   'Modernist');
        
 alter table books add sayfa_sayisi int; 
 alter table books add fiyat int;
 alter table books modify column fiyat double;
 alter table books rename column fiyat to fiat;
 alter table books drop column fiat;
 
 /*  
    ========================  SORU-2 ========================
    Icerisinde personel id, adi, soyadi, dogum tarihi, pozisyon ve maas columnlari
    olan bir personel tablosu create ediniz. 
    =========================================================
 */
 
 create table personel (
 personel_id int, 
 adi varchar(50), 
 soyadi varchar(50), 
 dogum_tarihi date, 
 pozisyon varchar(50), 
 maas int
 );
 
 select * from personel;
 select adi, soyadi from personel;
 
 select kitap_adi, yazar_adi from books;
 
 select kitap_id, yazar_adi from books where kategori = 'Macera'; 
 select * from books where kategori = 'Macera';


 
 
 



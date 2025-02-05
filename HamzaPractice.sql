create schema HamzaDeneme;
use HamzaDeneme;

CREATE TABLE takim (
 personel_id INT,
 adi VARCHAR(40),
 soyadi VARCHAR(40),
 dogum_tarihi DATE,
 pozisyon VARCHAR(40),
 maas INT
 );
 
 select * from takim;

 
 CREATE TABLE books(
	kitap_id  INT,
    kitap_adi VARCHAR(50),
    yazar_adi VARCHAR(50),
    yayin_yili INT,
    kategori VARCHAR(30) 
 );
 
 select*from books;
 
 -- bu bir yorum satırıdır.
 /*
 birden fazla satır yazacagın zaman kullan.
 */
 
 



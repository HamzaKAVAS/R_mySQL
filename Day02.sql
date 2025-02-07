use HamzaDeneme;

-- kelimeler tablosunu görüntüleyin
SELECT * FROM kelimeler;

-- kelimeler tablosunda harf sayısı 3'den büyük olanları listeleyin
SELECT * FROM kelimeler 
WHERE harf_sayisi > 3;

-- kelimeler tablosunda harf sayısı 3'den fazla olan kelimelerin id'lerini listeleyin
SELECT id FROM kelimeler 
WHERE harf_sayisi > 3;

-- kelimeler tablosunda harf sayısı 1'den fazla ve 5'den az olan kelimeleri listeleyin
SELECT kelime FROM kelimeler
WHERE harf_sayisi BETWEEN 2 AND 4;

-- 2.harfi o olan kelimeleri listeleyin
SELECT kelime FROM kelimeler 
WHERE kelime LIKE '_o%';

-- ikinci harfi o olan ve uzunluğu 3 olan kelimeleri listeleyin
SELECT kelime FROM kelimeler 
WHERE kelime LIKE '_o%' AND harf_sayisi=3;

SELECT kelime FROM kelimeler 
WHERE kelime LIKE '_o_';

SELECT kelime FROM kelimeler 
WHERE REGEXP_LIKE (kelime,'^.o.$');

-- ilk harfi h olup kelime uzunluğu 3'den fazla olan kelimeleri listeleyin
SELECT kelime FROM kelimeler
WHERE kelime LIKE 'h%' AND harf_sayisi>3;

-- ================================================================================================

CREATE TABLE kitaplar (
kitap_id  INT,
kitap_adi VARCHAR(50),
yazar_adi VARCHAR(50),
yayin_yili INT,
kategori VARCHAR(30) 
);

INSERT INTO kitaplar ()
VALUES  (1, 'Savaş ve Barış',    'Lev Tolstoy',  1869,   'Tarihi' ),
        (2, 'Suç ve Ceza', 'Fyodor Dostoyevski',   1866,   'Psikolojik'),
        (3, 'Anna Karenina',    'Lev Tolstoy',  1877,   'Aşk'),
        (4, '1984', 'George Orwell',    1949,   'Politik'),
        (5, 'Büyük Umutlar',  'Charles Dickens',  1861,   'Dram'),
        (6, 'Don Kişot',   'Miguel de Cervantes',  1605,   'Macera'),
        (7, 'Gurur ve Önyargı',   'Jane Austen',  1813,   'Dram'),
        (8, 'Monte Kristo Kontu',   'Alexandre Dumas',  1844,   'Macera'),
        (9, 'Faust',    'Johann Wolfgang von Goethe',   1808,   'Felsefi'),
        (10,    'Ulysses',  'James Joyce',  1922,   'Modernist');
        
SELECT * FROM kitaplar;

-- tüm kitapları tekrarsız olarak listeleyin
SELECT DISTINCT * FROM kitaplar;        
SELECT DISTINCT kitap_adi FROM kitaplar;    

-- listedeki yazarları tekrarsız olarak listeleyin.
SELECT DISTINCT yazar_adi FROM kitaplar;    

-- 1860 ile 1890 yılları arasında kitap yayınlayan yazarları TEKRARSIZ olarak listeleyin
SELECT DISTINCT yazar_adi FROM kitaplar
WHERE yayin_yili BETWEEN 1860 AND 1890;

-- ================================================================================================

CREATE TABLE kitaplik (
    id INT,
    kitap_adi VARCHAR(100),
    yazar VARCHAR(50),
    yayin_yili INT
);

INSERT INTO kitaplik (id, kitap_adi, yazar, yayin_yili) VALUES
(1, 'Sefiller', 'Victor Hugo', 1862),
(2, '1984', 'George Orwell', 1949),
(3, 'Suç ve Ceza', 'Fyodor Dostoyevski', 1866),
(4, 'Kürk Mantolu Madonna', 'Sabahattin Ali', 1943),
(5, 'Yabancı', 'Albert Camus', 1942),
(6, 'Ulysses', 'James Joyce', 1922),
(7, 'Yüzüklerin Efendisi', 'J.R.R. Tolkien', 1954),
(8, 'Harry Potter ve Felsefe Taşı', 'J.K. Rowling', 1998),
(9, 'Da Vinci Şifresi', 'Dan Brown', 2003),
(10, 'Zamanın Kısa Tarihi', 'Stephen Hawking', 1998),
(11, 'Karamazov Kardeşler', 'Fyodor Dostoyevski', 1880),
(12, 'Budala', 'Fyodor Dostoyevski', 1869),
(13, 'Savaş ve Barış', 'Lev Tolstoy', 1866),
(14, 'Anna Karenina', 'Lev Tolstoy', 1877),
(15, 'Hobbit', 'J.R.R. Tolkien', 1942);

SELECT * FROM kitaplik;

/*  
============================= SORU-1 =============================
    Kitaplik tablosundaki kitapları yayın yılına göre eski olanlardan
    yeni olanlara doğru sıralayiniz.
===================================================================
*/

SELECT kitap_adi,yayin_yili FROM kitaplik
ORDER BY yayin_yili ASC;

SELECT kitap_adi,yayin_yili FROM kitaplik
ORDER BY yayin_yili;

/*
============================= SORU-2 =============================
    Kitaplik tablosundaki kitapların yayın yılına göre yeni olanlardan
    eski olanlara doğru sıralayiniz.
===================================================================
*/

SELECT kitap_adi,yayin_yili FROM kitaplik
ORDER BY yayin_yili DESC;

/*
============================= SORU-3 =============================
    Kitaplik tablosundaki "Fyodor Dostoyevski"nin kitaplarını yayın
    yılına göre eskiden gunumuze sıralayiniz.
===================================================================
*/

SELECT kitap_adi,yayin_yili FROM kitaplik
WHERE yazar='Fyodor Dostoyevski'
ORDER BY yayin_yili;

/*
============================= SORU-4 =============================
    Kitaplik tablosundaki yazarlarin isimlerini ters siralayiniz.
===================================================================
*/

SELECT yazar FROM kitaplik
ORDER BY yazar DESC;

/*
============================= SORU-5 =============================
    Kitaplik tablosundaki ismi K harfi ile T harfi arasında olan yazarlarin isimlerini ters siralayiniz.
===================================================================
*/

SELECT yazar FROM kitaplik
WHERE yazar BETWEEN 'K' AND 'T'
ORDER BY yazar DESC;

/*
============================= SORU-6 =============================
    Kitaplik tablosundaki "Lev Tolstoy" un kitaplarını isimlerine
    göre dogal sırayiniz.
===================================================================
*/

SELECT kitap_adi FROM kitaplik
WHERE yazar='Lev Tolstoy'
ORDER BY kitap_adi;

/*
============================= SORU-7 =============================
    Kitaplik tablosundaki yazar isimlerini ve kitaplarini
    dogal sıralayiniz.
===================================================================
*/

SELECT yazar,kitap_adi FROM kitaplik
ORDER BY yazar,kitap_adi;

/*
============================= SORU-8 =============================
    Kitaplik tablosundaki kitaplari yayin yilina gore gunumuzden eskiye
    ve yazar isimlerini dogal sıralayiniz.
===================================================================
*/

SELECT yazar,yayin_yili,kitap_adi FROM kitaplik
ORDER BY yayin_yili DESC, yazar ASC;

-- ================================================================================================


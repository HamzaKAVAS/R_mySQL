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


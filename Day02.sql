use HamzaDeneme;

-- kelimeler tablosunu görüntüleyin
SELECT * FROM kelimeler;

-- kelimeler tablosunda harf sayısı 3'den büyük olanları listeleyin
SELECT * FROM kelimeler WHERE harf_sayisi > 3;

-- kelimeler tablosunda harf sayısı 3'den fazla olan kelimelerin id'lerini listeleyin
SELECT id FROM kelimeler WHERE harf_sayisi > 3;

-- kelimeler tablosunda harf sayısı 1'den fazla ve 5'den az olan kelimeleri listeleyin
SELECT kelime FROM kelimeler WHERE harf_sayisi BETWEEN 2 AND 4;

-- 2.harfi o olan kelimeleri listeleyin
SELECT kelime FROM kelimeler WHERE kelime LIKE '_o%';
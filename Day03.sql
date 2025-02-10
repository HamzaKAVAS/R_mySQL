use hamzadeneme;

-- kelimeler tablosunu görüntüleyin
SELECT * FROM kelimeler;

-- kelimeler tablosunda harf sayısı 3'den büyük olanları listeleyin
SELECT * FROM kelimeler
WHERE harf_sayisi > 3;

-- kelimeler tablosunda harf sayısı 3'den fazla olan kelimelerin id'lerini listeleyin
SELECT id FROM kelimeler
WHERE harf_sayisi > 3;


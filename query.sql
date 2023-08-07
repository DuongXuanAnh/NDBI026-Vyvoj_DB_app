-- jména a pozice všech zaměstnanců, kteří jsou "kuchaři"
SELECT z.jmeno, z.prijmeni, p.nazev
FROM zamestnanci z
JOIN pozice p ON z.pozice_id = p.id
WHERE p.nazev = 'Šéfkuchař';

-- Zjištění celkového počtu objednávek pro daný stůl
SELECT s.identifikator, COUNT(o.id) as pocet_objednavek
FROM stoly s
JOIN objednavka o ON s.id = o.stul_id
GROUP BY s.identifikator;

-- Celkový počet objednaných jídel za určitý den
SELECT SUM(pocet) AS celkem_objednanych_jidel
FROM objednavka_jidel
WHERE objednavka_id IN (
   SELECT id
   FROM objednavka
   WHERE TRUNC(datum_cas) = TO_DATE('2023-08-07', 'YYYY-MM-DD')
);
-- Seznam všech jídel, které byly objednány víc než 100 krát
SELECT j.nazev, COUNT(oj.jidlo_id) as pocet_objednavek
FROM jidelni_listek j
JOIN objednavka_jidel oj ON j.id = oj.jidlo_id
GROUP BY j.nazev
HAVING COUNT(oj.jidlo_id) > 100;

-- Seznam jídel, které nebyly nikdy objednány
SELECT j.nazev
FROM jidelni_listek j
LEFT JOIN objednavka_jidel oj ON j.id = oj.jidlo_id
WHERE oj.jidlo_id IS NULL;

-- Seznam stolů a počet objednávek v každém stavu
SELECT s.identifikator, o.stav, COUNT(*) AS pocet_objednavek
FROM stoly s
LEFT JOIN objednavka o ON s.id = o.stul_id
GROUP BY s.identifikator, o.stav;

-- Seznam zaměstnanců a jejich pozic v oddělení "Kuchyně"
SELECT z.jmeno, z.prijmeni, p.nazev AS pozice
FROM zamestnanci z
JOIN pozice p ON z.pozice_id = p.id
JOIN oddeleni o ON p.oddeleni_id = o.id
WHERE o.nazev = 'Kuchyně';

-- Počet objednávek pro každý stůl v posledním měsíci
SELECT s.identifikator AS identifikator_stolu, o.stul_id, COUNT(*) AS pocet_objednavek
FROM objednavka o
JOIN stoly s ON o.stul_id = s.id
WHERE o.datum_cas > ADD_MONTHS(SYSDATE, -1)
GROUP BY s.identifikator, o.stul_id;
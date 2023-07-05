-- jména a pozice všech zaměstnanců, kteří jsou "kuchaři"
SELECT z.jmeno, p.nazev
FROM zamestnanci z
JOIN pozice p ON z.pozice_id = p.id
WHERE p.nazev = 'kuchař';

-- Zjištění celkového počtu objednávek pro daný stůl
SELECT s.id, COUNT(o.id) as pocet_objednavek
FROM stoly s
JOIN objednavka o ON s.id = o.stul_id
GROUP BY s.id;

-- Výpočet celkových tržeb za určitý den
SELECT SUM(j.cena) as celkove_trzby
FROM objednavka o
JOIN objednavka_jidel oj ON o.id = oj.objednavka_id
JOIN jidelni_listek j ON oj.jidlo_id = j.id
WHERE DATE(o.datum_cas) = TO_DATE('2023-07-05', 'YYYY-MM-DD');

-- Seznam všech jídel, které byly objednány víc než 100 krát
SELECT j.nazev, COUNT(oj.jidlo_id) as pocet_objednavek
FROM jidelni_listek j
JOIN objednavka_jidel oj ON j.id = oj.jidlo_id
GROUP BY j.nazev
HAVING COUNT(oj.jidlo_id) > 100;

-- Získání seznamu všech zaměstnanců, kteří vydělávají více než průměrný plat
SELECT z.jmeno, p.plat
FROM zamestnanci z
JOIN plat_zamestnancu p ON z.id = p.zamestnanec_id
WHERE p.plat > (SELECT AVG(plat) FROM plat_zamestnancu);
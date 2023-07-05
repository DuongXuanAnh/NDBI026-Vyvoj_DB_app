-- zobrazování denního tržeb z objednávek
CREATE VIEW Denni_trzba AS
SELECT TRUNC(o.datum_cas) AS datum, SUM(jl.cena) AS celkova_trzba
FROM objednavka o
JOIN objednavka_jidel oj ON o.id = oj.objednavka_id
JOIN jidelni_listek jl ON oj.jidlo_id = jl.id
GROUP BY TRUNC(o.datum_cas);

-- zobrazování detailů objednávky
CREATE VIEW Objednavka_detail AS
SELECT o.id, s.umisteni, jl.nazev, jl.cena
FROM objednavka o
JOIN stoly s ON o.stul_id = s.id
JOIN objednavka_jidel oj ON o.id = oj.objednavka_id
JOIN jidelni_listek jl ON jl.id = oj.jidlo_id;

-- zobrazování platů zaměstnanců za měsíc a rok
CREATE VIEW Plat_zamestnancu_detail AS
SELECT z.jmeno, p.mesic, p.rok, p.plat, po.nazev as pozice
FROM plat_zamestnancu p
JOIN zamestnanci z ON p.zamestnanec_id = z.id
JOIN pozice po ON z.pozice_id = po.id;

-- zobrazování počtu objednávek u každého stolu
CREATE VIEW Stoly_objednavky AS
SELECT s.umisteni, COUNT(*) as pocet_objednavek
FROM stoly s
JOIN objednavka o ON s.id = o.stul_id
GROUP BY s.umisteni;

SELECT * FROM Denni_trzba;
SELECT * FROM Objednavka_detail;
SELECT * FROM Plat_zamestnancu_detail;
SELECT * FROM Stoly_objednavky;
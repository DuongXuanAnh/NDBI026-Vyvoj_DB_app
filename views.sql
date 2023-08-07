-- zobrazování denního tržeb z objednávek
CREATE OR REPLACE VIEW denni_trzba AS
SELECT TRUNC(o.datum_cas) AS datum, SUM(jl.cena) AS celkova_trzba
FROM objednavka o
JOIN objednavka_jidel oj ON o.id = oj.objednavka_id
JOIN jidelni_listek jl ON oj.jidlo_id = jl.id
GROUP BY TRUNC(o.datum_cas);

-- zobrazování detailů objednávky
CREATE OR REPLACE VIEW objednavka_detail AS
SELECT o.id, s.umisteni, jl.nazev, jl.cena
FROM objednavka o
JOIN stoly s ON o.stul_id = s.id
JOIN objednavka_jidel oj ON o.id = oj.objednavka_id
JOIN jidelni_listek jl ON jl.id = oj.jidlo_id;

-- zobrazování platů zaměstnanců za měsíc a rok
CREATE OR REPLACE VIEW plat_zamestnancu_detail AS
SELECT z.jmeno, p.mesic, p.rok, p.plat, po.nazev as pozice
FROM plat_zamestnancu p
JOIN zamestnanci z ON p.zamestnanec_id = z.id
JOIN pozice po ON z.pozice_id = po.id;

-- zobrazování počtu objednávek u každého stolu
CREATE OR REPLACE VIEW pocet_objednavek_u_stolu AS
SELECT
    o.stul_id AS id_stolu,
    COUNT(o.id) AS pocet_objednavek
FROM objednavka o
GROUP BY o.stul_id
ORDER BY o.stul_id;

SELECT * FROM denni_trzba;
SELECT * FROM objednavka_detail;
SELECT * FROM plat_zamestnancu_detail;
SELECT * FROM pocet_objednavek_u_stolu;

-- Jídelní lístek
-- Jak vypadá jídelní lístek před změnami?
SELECT * FROM jidelni_listek;
-- Přidáme další jídlo do jídelního lístku
EXECUTE insert_package.insert_jidelni_listek(p_nazev => 'Pho Bo', p_popis => 'Vietnamska hovezi polevka', p_cena => 120.50);
-- Změníme cenu existujícího jídla
UPDATE jidelni_listek SET cena = 150.00 WHERE id = 3;
-- Zkusíme smazat jídlo, které má id 4
DELETE FROM jidelni_listek WHERE id = 4;
-- Zkusíme smazat jídlo, které má id 10
DELETE FROM jidelni_listek WHERE id = 10;
-- Jak vypadá jídelní lístek po změnách?
SELECT * FROM jidelni_listek;


-- Stoly
-- Jak vypadají stoly před změnami?
SELECT * FROM stoly;
-- Přidáme další stůl do seznamu stolů
EXECUTE insert_package.insert_stoly(p_identifikator => 'Stůl 12', p_pocet_mist => 5, p_umisteni => 'V rohu restaurace');
-- Změníme umístění existujícího stolu
UPDATE stoly SET umisteni = 'V rohu' WHERE id = 5;
-- Zkusíme smazat stůl, který má id 2
DELETE FROM stoly WHERE id = 2;
-- Jak vypadají stoly po změnách?
SELECT * FROM stoly;

-- Zaměstnanci
-- Jak vypadají zaměstnanci před změnami?
SELECT * FROM zamestnanci;
-- Přidáme dalšího zaměstnance do seznamu zaměstnanců
EXECUTE insert_package.insert_zamestnanci(p_jmeno => 'David', p_prijmeni => 'Duong', p_rodne_cislo => '9809303658', p_pozice_id => 1);
-- Změníme pozici existujícího zaměstnance
UPDATE zamestnanci SET pozice_id = 2 WHERE id = 5;
-- Zkusíme smazat zaměstnance, který má id 2
DELETE FROM zamestnanci WHERE id = 2;
-- Jak vypadají zaměstnanci po změnách?
SELECT * FROM zamestnanci;


-- Objednávka
-- Jak vypadají objednávky před změnami?
SELECT * FROM objednavka;
-- Přidáme další objednávku do seznamu objednávek
EXECUTE insert_package.insert_objednavka(p_datum_cas => SYSDATE, p_stul_id => 1, p_stav => 'nový');
-- Změníme stav existující objednávky
UPDATE objednavka SET stav = 'zpracovává se' WHERE id = 2;
-- Zkusíme smazat objednávku, která má id 3
DELETE FROM objednavka WHERE id = 3;
-- Jak vypadají objednávky po změnách?
SELECT * FROM objednavka;

-- Objednávka jídel
-- Jak vypadají objednávky jídel před změnami?
SELECT * FROM objednavka_jidel;
-- Přidáme další objednávku jídla do seznamu objednávek jídel
EXECUTE insert_package.insert_objednavka_jidel(p_objednavka_id => 1, p_jidlo_id => 2, p_pocet => 2);
-- Změníme počet objednaných jídel pro existující objednávku
UPDATE objednavka_jidel SET pocet = 4 WHERE objednavka_id = 2 AND jidlo_id = 3;
-- Zkusíme smazat objednávku jídel, která má objednavka_id 4
DELETE FROM objednavka_jidel WHERE objednavka_id = 4;
-- Jak vypadají objednávky jídel po změnách?
SELECT * FROM objednavka_jidel;

-- Oddělení
-- Jak vypadají oddělení před změnami?
SELECT * FROM oddeleni;
-- Přidáme další oddělení do seznamu oddělení
EXECUTE insert_package.insert_oddeleni(p_nazev => 'Marketing');
-- Zkusíme smazat oddělení, které má id 2
DELETE FROM oddeleni WHERE id = 2;
-- Jak vypadají oddělení po změnách?
SELECT * FROM oddeleni;

-- Pozice
-- Jak vypadají pozice před změnami?
SELECT * FROM pozice;
-- Přidáme další pozici do seznamu pozic
EXECUTE insert_package.insert_pozice(p_nazev => 'Asistent manažera', p_oddeleni_id => 1);
-- Zkusíme smazat pozici, která má id 3
DELETE FROM pozice WHERE id = 3;
-- Jak vypadají pozice po změnách?
SELECT * FROM pozice;

-- Plat zaměstnanců
-- Jak vypadají platy zaměstnanců před změnami?
SELECT * FROM plat_zamestnancu;
-- Přidáme další plat do seznamu platů zaměstnanců
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 1, p_rok => 2023, p_mesic => 10, p_plat => 25000.00);
-- Změníme plat existujícího zaměstnance
UPDATE plat_zamestnancu SET plat = 30000.00 WHERE zamestnanec_id = 2 AND rok = 2023 AND mesic = 9;
-- Zkusíme smazat plat, který má zamestnanec_id 3
DELETE FROM plat_zamestnancu WHERE zamestnanec_id = 3;
-- Jak vypadají platy zaměstnanců po změnách?
SELECT * FROM plat_zamestnancu;

-- Dodavatel
-- Jak vypadají dodavatelé před změnami?
SELECT * FROM dodavatel;
-- Přidáme dalšího dodavatele do seznamu dodavatelů
EXECUTE insert_package.insert_dodavatel(p_nazev => 'Fresh Fruits Ltd.', p_kontakt => 'info@freshfruits.com');
-- Změníme kontakt existujícího dodavatele
UPDATE dodavatel SET kontakt = 'sales@vegcompany.com' WHERE id = 2;
-- Zkusíme smazat dodavatele, který má id 2
DELETE FROM dodavatel WHERE id = 2;
-- Jak vypadají dodavatelé po změnách?
SELECT * FROM dodavatel;

-- Otestování funkci ziskat_celkovy_plat
SELECT zamestnanci.jmeno, zamestnanci.prijmeni, ziskat_celkovy_plat(zamestnanci.id, 2023) AS celkovy_plat
FROM zamestnanci;
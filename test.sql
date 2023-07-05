
-- Zamestnanci
-- Jak vypadají zamestnanci před změnami?
SELECT * FROM zamestnanci;
-- Přidáme dalšího zaměstnance do seznamu zaměstnanců
EXEC insert_package.insert_zamestnanci('David Duong', 1);
-- Změníme pozici existujícího zaměstnance
UPDATE zamestnanci SET pozice_id = 2 WHERE id = 6;
-- Zkusíme smazat zaměstnance, který má id 7
DELETE FROM zamestnanci WHERE id = 7;
-- Jak vypadají zaměstnanci po změnách?
SELECT * FROM zamestnanci;


-- Jidelni listek
-- Jak vypadá jídelní lístek před změnami?
SELECT * FROM jidelni_listek;

-- Přidáme další jídlo do jídelního lístku
EXEC insert_package.insert_jidelni_listek('Bramborová polévka', 'Tradiční bramborová polévka s klobásou.', 59.00);

-- Změníme cenu existujícího jídla
UPDATE jidelni_listek SET cena = 120.00 WHERE id = 1;

-- Jak vypadá jídelní lístek po změnách?
SELECT * FROM jidelni_listek;

-- Stoly
-- Jak vypadají stoly před změnami?
SELECT * FROM stoly;

-- přidáme stůl
EXEC insert_package.insert_stoly(5, 'Při okně');

-- Jak vypadají stoly po změnách?
SELECT * FROM stoly;


-- plat_zamestnancu
-- Zobrazení původního stavu tabulky
SELECT * FROM plat_zamestnancu; 
 -- Přidání záznamu o platě zaměstnance s ID 1 za měsíc 7 v roce 2023
EXEC insert_package.insert_plat_zamestnancu(1, 7, 2023, 30000.00);
-- Kontrola, zda byl plat úspěšně přidán
SELECT * FROM plat_zamestnancu; 


-- Test pro tabulku dodavatele
-- Zobrazení původního stavu tabulky dodavatele
SELECT * FROM dodavatel; 

-- Přidáme nového dodavatele
EXEC insert_package.insert_dodavatel('Dodavatel XYZ', 'Kontaktní informace XYZ');

-- Kontrola, zda byl dodavatel úspěšně přidán
SELECT * FROM dodavatel; 

-- Upravíme informace o dodavateli
UPDATE dodavatel SET nazev = 'Super dodavatel' WHERE id = 2;

-- Kontrola, zda byly údaje dodavatele úspěšně upraveny
SELECT * FROM dodavatel; 

-- Odstraníme dodavatele
DELETE FROM dodavatel WHERE id = 1;

-- Kontrola, zda byl dodavatel úspěšně odstraněn
SELECT * FROM dodavatel; 
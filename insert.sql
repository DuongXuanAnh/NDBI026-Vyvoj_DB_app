-- Insert do JIDELNI_LISTEK
EXECUTE insert_package.insert_jidelni_listek(p_id => 1, p_nazev => 'Steak', p_popis => 'Kvalitní steak z argentinského hovezího', p_cena => 300);
EXECUTE insert_package.insert_jidelni_listek(p_id => 2, p_nazev => 'Grilované kure', p_popis => 'Grilované kurecí prsícko s bylinkami', p_cena => 200);
EXECUTE insert_package.insert_jidelni_listek(p_id => 3, p_nazev => 'Losos', p_popis => 'Losos pecený na grilu s bylinkovým máslem', p_cena => 250);
EXECUTE insert_package.insert_jidelni_listek(p_id => 4, p_nazev => 'Hovezí gulaš', p_popis => 'Tradiční hovezí gulaš s knedlíkem', p_cena => 180);
EXECUTE insert_package.insert_jidelni_listek(p_id => 5, p_nazev => 'Vegetariánská pizza', p_popis => 'Pizza s cerstvou zeleninou a mozzarellou', p_cena => 150);
EXECUTE insert_package.insert_jidelni_listek(p_id => 6, p_nazev => 'Ravioli', p_popis => 'Ravioli plněné ricottou a špenátem', p_cena => 220);
EXECUTE insert_package.insert_jidelni_listek(p_id => 7, p_nazev => 'Caesar salát', p_popis => 'Klasický Caesar salát s kurecím masem a parmazánem', p_cena => 160);
EXECUTE insert_package.insert_jidelni_listek(p_id => 8, p_nazev => 'Burger', p_popis => 'Juicy burger s hranolkami', p_cena => 180);
EXECUTE insert_package.insert_jidelni_listek(p_id => 9, p_nazev => 'Sushi', p_popis => 'Mix sushi rolíků', p_cena => 290);
EXECUTE insert_package.insert_jidelni_listek(p_id => 10, p_nazev => 'Tiramisu', p_popis => 'Tradiční italský dezert', p_cena => 120);
-----------------------------------------------------------------------------
--Dodavatel
EXECUTE insert_package.insert_dodavatel('Dodavatel 1', 'Kontaktní info 1');
EXECUTE insert_package.insert_dodavatel('Dodavatel 2', 'Kontaktní info 2');
EXECUTE insert_package.insert_dodavatel('Dodavatel 3', 'Kontaktní info 3');
EXECUTE insert_package.insert_dodavatel('Dodavatel 4', 'Kontaktní info 4');
EXECUTE insert_package.insert_dodavatel('Dodavatel 5', 'Kontaktní info 5');

-- Stoly
EXECUTE insert_package.insert_stoly('Stůl 1', 4, 'V rohu restaurace');
EXECUTE insert_package.insert_stoly('Stůl 2', 2, 'U okna');
EXECUTE insert_package.insert_stoly('Stůl 3', 6, 'Vedle baru');
EXECUTE insert_package.insert_stoly('Stůl 4', 4, 'V předsíni');
EXECUTE insert_package.insert_stoly('Stůl 5', 10, 'Na terase');

-- Oddeleni
EXECUTE insert_package.insert_oddeleni('Kuchyně');
EXECUTE insert_package.insert_oddeleni('Číšnický tým');
EXECUTE insert_package.insert_oddeleni('Bar');
EXECUTE insert_package.insert_oddeleni('Management a administrativa');

-- Pozice
EXECUTE insert_package.insert_pozice('Kuchař', 1);
EXECUTE insert_package.insert_pozice('Číšník', 2);
EXECUTE insert_package.insert_pozice('Barman', 3);
EXECUTE insert_package.insert_pozice('Manažer', 4);

-- Zamestnanci
EXECUTE insert_package.insert_zamestnanci('Jan Novák', 1);
EXECUTE insert_package.insert_zamestnanci('Jana Svobodová', 2);
EXECUTE insert_package.insert_zamestnanci('Petr Dvořák', 3);
EXECUTE insert_package.insert_zamestnanci('Lucie Jelínková', 3);
EXECUTE insert_package.insert_zamestnanci('Martin Černý', 4);
EXECUTE insert_package.insert_zamestnanci('Eva Němcová', 4);

-- Plat zamestancu
EXECUTE insert_package.insert_plat_zamestnancu(1, 2023, 1, 100000);
EXECUTE insert_package.insert_plat_zamestnancu(2, 2023, 1, 20000);
EXECUTE insert_package.insert_plat_zamestnancu(3, 2023, 1, 30000);
EXECUTE insert_package.insert_plat_zamestnancu(4, 2023, 1, 40000);
EXECUTE insert_package.insert_plat_zamestnancu(5, 2023, 1, 50000);
EXECUTE insert_package.insert_plat_zamestnancu(6, 2023, 1, 60000);

EXECUTE insert_package.insert_plat_zamestnancu(1, 2023, 2, 100000);
EXECUTE insert_package.insert_plat_zamestnancu(2, 2023, 2, 20000);
EXECUTE insert_package.insert_plat_zamestnancu(3, 2023, 2, 30000);
EXECUTE insert_package.insert_plat_zamestnancu(4, 2023, 2, 40000);
EXECUTE insert_package.insert_plat_zamestnancu(5, 2023, 2, 50000);
EXECUTE insert_package.insert_plat_zamestnancu(6, 2023, 2, 60000);

-- Objednavky
EXECUTE insert_package.insert_objednavka(SYSDATE, 1, 'nový');
EXECUTE insert_package.insert_objednavka(SYSDATE, 2, 'zpracovává se');
EXECUTE insert_package.insert_objednavka(SYSDATE, 3, 'hotový');
EXECUTE insert_package.insert_objednavka(SYSDATE, 4, 'zpracovává se');
EXECUTE insert_package.insert_objednavka(SYSDATE, 5, 'zaplaceno');


SELECT * FROM JIDELNI_LISTEK;
SELECT * FROM DODAVATEL;
SELECT * FROM stoly;
SELECT * FROM pozice;
SELECT * FROM zamestnanci;
SELECT * FROM objednavka;
SELECT * FROM objednavka_jidel;
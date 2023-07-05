-- Insert do JIDELNI_LISTEK
EXECUTE insert_package.insert_jidelni_listek('Steak', 'Kvalitní steak z argentinského hovezího', 300);
EXECUTE insert_package.insert_jidelni_listek('Grilované kure', 'Grilované kurecí prsícko s bylinkami', 200);
EXECUTE insert_package.insert_jidelni_listek('Losos', 'Losos pecený na grilu s bylinkovým máslem', 250);
EXECUTE insert_package.insert_jidelni_listek('Hovezí gulaš', 'Tradianí hovezí gulaš s knedlíkem', 180);
EXECUTE insert_package.insert_jidelni_listek('Vegetariánská pizza', 'Pizza s cerstvou zeleninou a mozzarellou', 150);
EXECUTE insert_package.insert_jidelni_listek('Ravioli', 'Ravioli plnené ricottou a špenátem', 220);
EXECUTE insert_package.insert_jidelni_listek('Caesar salát', 'Klasický Caesar salát s kurecím masem a parmazánem', 160);
EXECUTE insert_package.insert_jidelni_listek('Burger', 'Juicy burger s hranolkami', 180);
EXECUTE insert_package.insert_jidelni_listek('Sushi', 'Mix sushi rollek', 290);
EXECUTE insert_package.insert_jidelni_listek('Tiramisu', 'Tradicní italský dezert', 120);
-----------------------------------------------------------------------------
--Dodavatel
EXECUTE insert_package.insert_dodavatel('Dodavatel 1', 'Kontaktní info 1');
EXECUTE insert_package.insert_dodavatel('Dodavatel 2', 'Kontaktní info 2');
EXECUTE insert_package.insert_dodavatel('Dodavatel 3', 'Kontaktní info 3');
EXECUTE insert_package.insert_dodavatel('Dodavatel 4', 'Kontaktní info 4');
EXECUTE insert_package.insert_dodavatel('Dodavatel 5', 'Kontaktní info 5');

-- Stoly
EXECUTE insert_package.insert_stoly(4, 'V rohu restaurace');
EXECUTE insert_package.insert_stoly(2, 'U okna');
EXECUTE insert_package.insert_stoly(6, 'Vedle baru');
EXECUTE insert_package.insert_stoly(4, 'V předsíni');
EXECUTE insert_package.insert_stoly(10, 'Na terase');

-- Pozice zamestnancu
EXECUTE insert_package.insert_pozice('Manažer');
EXECUTE insert_package.insert_pozice('Kuchař');
EXECUTE insert_package.insert_pozice('Číšník');
EXECUTE insert_package.insert_pozice('Barman');

-- Zamestnanci
EXECUTE insert_package.insert_zamestnanci('Jan Novák', 1);
EXECUTE insert_package.insert_zamestnanci('Jana Svobodová', 2);
EXECUTE insert_package.insert_zamestnanci('Petr Dvořák', 3);
EXECUTE insert_package.insert_zamestnanci('Lucie Jelínková', 3);
EXECUTE insert_package.insert_zamestnanci('Martin Černý', 4);
EXECUTE insert_package.insert_zamestnanci('Eva Němcová', 4);

-- Plat zamestancu
EXECUTE insert_package.insert_plat_zamestnancu(1, 1, 2023, 100000);
EXECUTE insert_package.insert_plat_zamestnancu(2, 1, 2023, 80000);
EXECUTE insert_package.insert_plat_zamestnancu(3, 1, 2023, 40000);
EXECUTE insert_package.insert_plat_zamestnancu(4, 1, 2023, 40000);
EXECUTE insert_package.insert_plat_zamestnancu(5, 1, 2023, 45000);
EXECUTE insert_package.insert_plat_zamestnancu(6, 1, 2023, 45000);
EXECUTE insert_package.insert_plat_zamestnancu(1, 2, 2023, 100000);
EXECUTE insert_package.insert_plat_zamestnancu(2, 2, 2023, 80000);
EXECUTE insert_package.insert_plat_zamestnancu(3, 2, 2023, 40000);
EXECUTE insert_package.insert_plat_zamestnancu(4, 2, 2023, 40000);
EXECUTE insert_package.insert_plat_zamestnancu(5, 2, 2023, 45000);
EXECUTE insert_package.insert_plat_zamestnancu(6, 2, 2023, 45000);

-- Objednavky (id_stolu, id_jidla)
EXECUTE insert_package.insert_objednavka(1, 9);
EXECUTE insert_package.insert_objednavka(1, 1);
EXECUTE insert_package.insert_objednavka(1, 2);
EXECUTE insert_package.insert_objednavka(2, 4);
EXECUTE insert_package.insert_objednavka(2, 6);
EXECUTE insert_package.insert_objednavka(3, 7);
EXECUTE insert_package.insert_objednavka(3, 4);
EXECUTE insert_package.insert_objednavka(3, 5);
EXECUTE insert_package.insert_objednavka(3, 7);
EXECUTE insert_package.insert_objednavka(4, 3);
EXECUTE insert_package.insert_objednavka(5, 8);
EXECUTE insert_package.insert_objednavka(5, 10);
EXECUTE insert_package.insert_objednavka(5, 2);
EXECUTE insert_package.insert_objednavka(5, 4);
EXECUTE insert_package.insert_objednavka(5, 6);
EXECUTE insert_package.insert_objednavka(5, 2);
EXECUTE insert_package.insert_objednavka(5, 1);

SELECT * FROM JIDELNI_LISTEK;
SELECT * FROM DODAVATEL;
SELECT * FROM stoly;
SELECT * FROM pozice;
SELECT * FROM zamestnanci;
SELECT * FROM objednavka;
SELECT * FROM objednavka_jidel;
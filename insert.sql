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
EXECUTE insert_package.insert_dodavatel(p_nazev => 'Dodavatel 1', p_kontakt => 'Kontaktní info 1');
EXECUTE insert_package.insert_dodavatel(p_nazev => 'Dodavatel 2', p_kontakt => 'Kontaktní info 2');
EXECUTE insert_package.insert_dodavatel(p_nazev => 'Dodavatel 3', p_kontakt => 'Kontaktní info 3');
EXECUTE insert_package.insert_dodavatel(p_nazev => 'Dodavatel 4', p_kontakt => 'Kontaktní info 4');

-- Stoly
EXECUTE insert_package.insert_stoly(p_id => 1, p_identifikator => 'Stůl 1', p_pocet_mist => 4, p_umisteni => 'V rohu restaurace');
EXECUTE insert_package.insert_stoly(p_id => 2, p_identifikator => 'Stůl 2', p_pocet_mist => 2, p_umisteni => 'U okna');
EXECUTE insert_package.insert_stoly(p_id => 3,p_identifikator => 'Stůl 3', p_pocet_mist => 6, p_umisteni => 'Vedle baru');
EXECUTE insert_package.insert_stoly(p_id => 4, p_identifikator => 'Stůl 4', p_pocet_mist => 4, p_umisteni => 'V předsíni');
EXECUTE insert_package.insert_stoly(p_id => 5, p_identifikator => 'Stůl 5', p_pocet_mist => 10, p_umisteni => 'Na terase');


-- Oddeleni
EXECUTE insert_package.insert_oddeleni(p_id => 1, p_nazev => 'Kuchyně');
EXECUTE insert_package.insert_oddeleni(p_id => 2, p_nazev => 'Číšníci');
EXECUTE insert_package.insert_oddeleni(p_id => 3, p_nazev => 'Management a administrativa');
EXECUTE insert_package.insert_oddeleni(p_id => 4, p_nazev => 'Bar');

-- Pozice
EXECUTE insert_package.insert_pozice(p_nazev => 'Šéfkuchař', p_oddeleni_id => 1);
EXECUTE insert_package.insert_pozice(p_nazev => 'Číšník', p_oddeleni_id => 2);
EXECUTE insert_package.insert_pozice(p_nazev => 'Manažer', p_oddeleni_id => 3);
EXECUTE insert_package.insert_pozice(p_nazev => 'Barman', p_oddeleni_id => 4);

-- Zamestnanci
EXECUTE insert_package.insert_zamestnanci(p_id => 1, p_jmeno => 'Jan', p_prijmeni => 'Novak', p_rodne_cislo => '12345678901', p_pozice_id => 1);
EXECUTE insert_package.insert_zamestnanci(p_id => 2, p_jmeno => 'Martina', p_prijmeni => 'Kovarova', p_rodne_cislo => '23456789012', p_pozice_id => 2);
EXECUTE insert_package.insert_zamestnanci(p_id => 3, p_jmeno => 'Petr', p_prijmeni => 'Dvořák', p_rodne_cislo => '98556789012', p_pozice_id => 2);
EXECUTE insert_package.insert_zamestnanci(p_id => 4, p_jmeno => 'Petr', p_prijmeni => 'Kral', p_rodne_cislo => '34567890123', p_pozice_id => 3);
EXECUTE insert_package.insert_zamestnanci(p_id => 5, p_jmeno => 'Martin', p_prijmeni => 'Černý', p_rodne_cislo => '46967890123', p_pozice_id => 4);


-- Plat zamestancu
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 1, p_rok => 2023, p_mesic => 8, p_plat => 150000);
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 2, p_rok => 2023, p_mesic => 8, p_plat => 50000);
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 3, p_rok => 2023, p_mesic => 8, p_plat => 50000);
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 4, p_rok => 2023, p_mesic => 8, p_plat => 80000);
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 5, p_rok => 2023, p_mesic => 8, p_plat => 40000);

EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 1, p_rok => 2023, p_mesic => 9, p_plat => 150000);
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 2, p_rok => 2023, p_mesic => 9, p_plat => 50000);
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 3, p_rok => 2023, p_mesic => 9, p_plat => 50000);
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 4, p_rok => 2023, p_mesic => 9, p_plat => 80000);
EXECUTE insert_package.insert_plat_zamestnancu(p_zamestnanec_id => 5, p_rok => 2023, p_mesic => 9, p_plat => 40000);


-- Objednavky
EXECUTE insert_package.insert_objednavka(p_datum_cas => SYSDATE, p_stul_id => 1, p_stav => 'nový');
EXECUTE insert_package.insert_objednavka(p_datum_cas => SYSDATE, p_stul_id => 2, p_stav => 'zpracovává se');
EXECUTE insert_package.insert_objednavka(p_datum_cas => SYSDATE, p_stul_id => 3, p_stav => 'hotový');
EXECUTE insert_package.insert_objednavka(p_datum_cas => SYSDATE, p_stul_id => 4, p_stav => 'zpracovává se');
EXECUTE insert_package.insert_objednavka(p_datum_cas => SYSDATE, p_stul_id => 5, p_stav => 'zaplaceno');

-- Objednavka_jidel
EXECUTE insert_package.insert_objednavka_jidel(p_objednavka_id => 1, p_jidlo_id => 1, p_pocet => 2);
EXECUTE insert_package.insert_objednavka_jidel(p_objednavka_id => 2, p_jidlo_id => 3, p_pocet => 4);
EXECUTE insert_package.insert_objednavka_jidel(p_objednavka_id => 3, p_jidlo_id => 2, p_pocet => 1);
EXECUTE insert_package.insert_objednavka_jidel(p_objednavka_id => 4, p_jidlo_id => 4, p_pocet => 3);
EXECUTE insert_package.insert_objednavka_jidel(p_objednavka_id => 5, p_jidlo_id => 5, p_pocet => 5);

SELECT * FROM JIDELNI_LISTEK;
SELECT * FROM DODAVATEL;
SELECT * FROM stoly;
SELECT * FROM pozice;
SELECT * FROM zamestnanci;
SELECT * FROM objednavka;
SELECT * FROM objednavka_jidel;
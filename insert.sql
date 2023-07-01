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



DELETE FROM JIDELNI_LISTEK;
SELECT * FROM JIDELNI_LISTEK;
SELECT * FROM DODAVATEL;
SELECT * FROM stoly;
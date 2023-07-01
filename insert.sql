-- Insert do JIDELNI_LISTEK
EXECUTE insert_package.insert_jidelni_listek('Steak', 'Kvalitní steak z argentinského hovězího', 300);
EXECUTE insert_package.insert_jidelni_listek('Grilované kuře', 'Grilované kuřecí prsíčko s bylinkami', 200);
EXECUTE insert_package.insert_jidelni_listek('Losos', 'Losos pečený na grilu s bylinkovým máslem', 250);
EXECUTE insert_package.insert_jidelni_listek('Hovězí gulaš', 'Tradiční hovězí gulaš s knedlíkem', 180);
EXECUTE insert_package.insert_jidelni_listek('Vegetariánská pizza', 'Pizza s čerstvou zeleninou a mozzarellou', 150);
EXECUTE insert_package.insert_jidelni_listek('Ravioli', 'Ravioli plněné ricottou a špenátem', 220);
EXECUTE insert_package.insert_jidelni_listek('Caesar salát', 'Klasický Caesar salát s kuřecím masem a parmazánem', 160);
EXECUTE insert_package.insert_jidelni_listek('Burger', 'Juicy burger s hranolkami', 180);
EXECUTE insert_package.insert_jidelni_listek('Sushi', 'Mix sushi rollek', 290);
EXECUTE insert_package.insert_jidelni_listek('Tiramisu', 'Tradiční italský dezert', 120);
-----------------------------------------------------------------------------
--Dodavatel
EXECUTE insert_package.insert_dodavatel('Dodavatel 1', 'Kontaktní info 1');
EXECUTE insert_package.insert_dodavatel('Dodavatel 2', 'Kontaktní info 2');
EXECUTE insert_package.insert_dodavatel('Dodavatel 3', 'Kontaktní info 3');
EXECUTE insert_package.insert_dodavatel('Dodavatel 4', 'Kontaktní info 4');
EXECUTE insert_package.insert_dodavatel('Dodavatel 5', 'Kontaktní info 5');


DELETE FROM JIDELNI_LISTEK;
SELECT * FROM JIDELNI_LISTEK;
SELECT * FROM DODAVATEL;
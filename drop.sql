-- drop all views
drop view Denni_trzba;
drop view Objednavka_detail;
drop view Plat_zamestnancu_detail;
drop view Stoly_objednavky;

-- drop all packages
drop package insert_package;
drop package conversion_package

-- drop all sequences
drop sequence jidelni_listek_seq;
drop sequence objednavka_seq;
drop sequence dodavatel_seq;
drop sequence stoly_seq;
drop sequence pozice_seq;
drop sequence zamestnanci_seq;

-- drop all triggers
drop trigger jidelni_listek_trigger;
drop trigger objednavka_trigger;
drop trigger stoly_trigger;
drop trigger pozice_trigger;
drop trigger zamestnanci_trigger;
drop trigger dodavatel_trigger;

-- drop all indexes
drop index idx_jidelni_listek_nazev;
drop index idx_objednavka_stul;
drop index idx_objednavka_datum;
drop index idx_objednavka_jidel_jidlo_id;
drop index idx_objednavka_jidel_objednavka_id;
drop index idx_pozice_oddeleni_id;
drop index idx_zamestnanci_pozice;
drop index idx_plat_zamestnancu_zamestnanec_id;
drop index idx_dodavatel_nazev;

-- drop all tables
DROP TABLE objednavka_jidel;
DROP TABLE plat_zamestnancu;
DROP TABLE objednavka;
DROP TABLE jidelni_listek;
DROP TABLE stoly;
DROP TABLE zamestnanci;
DROP TABLE pozice;
DROP TABLE oddeleni;
DROP TABLE dodavatel;
DROP TABLE denni_trzby;
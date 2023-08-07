-- drop all views
drop view denni_trzba;
drop view objednavka_detail;
drop view plat_zamestnancu_detail;
drop view pocet_objednavek_u_stolu;

-- drop all packages
drop package insert_package;
drop package conversion_package;

-- drop all sequences
drop sequence jidelni_listek_id_seq;
drop sequence stoly_id_seq;
drop sequence objednavka_id_seq;
drop sequence objednavka_jidel_id_seq;
drop sequence oddeleni_id_seq;
drop sequence pozice_id_seq;
drop sequence zamestnanci_id_seq;
drop sequence dodavatel_id_seq;

-- drop all triggers
drop trigger check_stul_availability_trigger;
drop trigger verify_order_status_trigger;
drop trigger check_employee_salary_trigger;

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
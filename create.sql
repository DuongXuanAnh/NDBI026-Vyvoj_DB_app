-- Autogenerate ID using sequence
CREATE SEQUENCE global_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;

-- Tabulka jidelni_listek
CREATE TABLE jidelni_listek (
    id NUMBER DEFAULT global_id_seq.NEXTVAL PRIMARY KEY,
    nazev VARCHAR2(100) NOT NULL,
    popis VARCHAR2(500),
    cena DECIMAL(8,2) NOT NULL CHECK (cena >= 0),
    UNIQUE (nazev, popis)
);

CREATE INDEX idx_jidelni_listek_nazev
ON jidelni_listek (nazev);

-- Tabulka stolu
CREATE TABLE stoly (
    id NUMBER DEFAULT global_id_seq.NEXTVAL PRIMARY KEY,
    identifikator VARCHAR2(50) NOT NULL UNIQUE,
    pocet_mist NUMBER NOT NULL,
    umisteni VARCHAR2(100) NOT NULL
);

-- Tabulka objednavka
CREATE TABLE objednavka (
    id NUMBER DEFAULT global_id_seq.NEXTVAL PRIMARY KEY,
    datum_cas TIMESTAMP NOT NULL,
    stul_id NUMBER NOT NULL,
    stav VARCHAR2(20),  -- 'nový', 'zpracovává se', 'hotový', 'zaplaceno'
    FOREIGN KEY (stul_id) REFERENCES stoly(id)
);

CREATE INDEX idx_objednavka_stul
ON objednavka (stul_id);

CREATE INDEX idx_objednavka_datum
ON objednavka (datum_cas);

-- Tabulka objednavka_jidel, která spojuje objednávky a jídla
CREATE TABLE objednavka_jidel (
    objednavka_id NUMBER NOT NULL,
    jidlo_id NUMBER NOT NULL,
    pocet NUMBER NOT NULL CHECK (pocet > 0),
    FOREIGN KEY (objednavka_id) REFERENCES objednavka(id) ON DELETE CASCADE,
    FOREIGN KEY (jidlo_id) REFERENCES jidelni_listek(id),
    PRIMARY KEY (objednavka_id, jidlo_id)
);

CREATE INDEX idx_objednavka_jidel_jidlo_id ON objednavka_jidel(jidlo_id);
CREATE INDEX idx_objednavka_jidel_objednavka_id ON objednavka_jidel(objednavka_id);


-- Tabulka oddeleni
CREATE TABLE oddeleni (
    id NUMBER DEFAULT global_id_seq.NEXTVAL PRIMARY KEY,
    nazev VARCHAR2(100) NOT NULL UNIQUE
);

-- Tabulka pozice
CREATE TABLE pozice (
    id NUMBER DEFAULT global_id_seq.NEXTVAL PRIMARY KEY,
    nazev VARCHAR2(50) NOT NULL,
    oddeleni_id NUMBER NOT NULL,
    FOREIGN KEY (oddeleni_id) REFERENCES oddeleni(id),
    UNIQUE (nazev, oddeleni_id)
);

CREATE INDEX idx_pozice_oddeleni_id ON pozice(oddeleni_id);

-- Tabulka zamestnancu
CREATE TABLE zamestnanci (
    id NUMBER DEFAULT global_id_seq.NEXTVAL PRIMARY KEY,
    jmeno VARCHAR2(100) NOT NULL,
    pozice_id NUMBER NOT NULL,
    FOREIGN KEY (pozice_id) REFERENCES pozice(id)
);

CREATE INDEX idx_zamestnanci_pozice
ON zamestnanci (pozice_id);

-- Tabulka denni_trzby
CREATE TABLE denni_trzby (
    datum DATE PRIMARY KEY,
    celkova_trzba DECIMAL(10,2) NOT NULL
);

-- Tabulka plat_zamestnancu
CREATE TABLE plat_zamestnancu (
    zamestnanec_id NUMBER NOT NULL,
    rok NUMBER NOT NULL,
    mesic NUMBER NOT NULL CHECK (mesic BETWEEN 1 AND 12),
    plat DECIMAL(8, 2) CHECK (plat >= 0),
    PRIMARY KEY (zamestnanec_id, rok, mesic),
    FOREIGN KEY (zamestnanec_id) REFERENCES zamestnanci(id)
);

CREATE INDEX idx_plat_zamestnancu_zamestnanec_id ON plat_zamestnancu(zamestnanec_id);

-- Tabulka dodavatelu
CREATE TABLE dodavatel (
    id NUMBER DEFAULT global_id_seq.NEXTVAL PRIMARY KEY,
    nazev VARCHAR2(100) NOT NULL,
    kontakt VARCHAR2(200)
);

CREATE INDEX idx_dodavatel_nazev
ON dodavatel (nazev);

---------------------------------------------------------------------

CREATE OR REPLACE PACKAGE insert_package AS

    PROCEDURE insert_jidelni_listek(
        p_nazev IN jidelni_listek.nazev%TYPE,
        p_popis IN jidelni_listek.popis%TYPE,
        p_cena IN jidelni_listek.cena%TYPE
    );

    PROCEDURE insert_stoly(
        p_identifikator IN stoly.identifikator%TYPE,
        p_pocet_mist IN stoly.pocet_mist%TYPE,
        p_umisteni IN stoly.umisteni%TYPE
        
    );

    PROCEDURE insert_objednavka(
        p_datum_cas IN objednavka.datum_cas%TYPE,
        p_stul_id IN objednavka.stul_id%TYPE,
        p_stav IN objednavka.stav%TYPE
    );

    PROCEDURE insert_objednavka_jidel(
        p_objednavka_id IN objednavka_jidel.objednavka_id%TYPE,
        p_jidlo_id IN objednavka_jidel.jidlo_id%TYPE,
        p_pocet IN objednavka_jidel.pocet%TYPE
    );

    PROCEDURE insert_oddeleni(
        p_nazev IN oddeleni.nazev%TYPE
    );

    PROCEDURE insert_pozice(
        p_nazev IN pozice.nazev%TYPE,
        p_oddeleni_id IN pozice.oddeleni_id%TYPE
    );

    PROCEDURE insert_zamestnanci(
        p_jmeno IN zamestnanci.jmeno%TYPE,
        p_pozice_id IN zamestnanci.pozice_id%TYPE
    );

    PROCEDURE insert_denni_trzby(
        p_datum IN denni_trzby.datum%TYPE,
        p_celkova_trzba IN denni_trzby.celkova_trzba%TYPE
    );

    PROCEDURE insert_plat_zamestnancu(
        p_zamestnanec_id IN plat_zamestnancu.zamestnanec_id%TYPE,
        p_rok IN plat_zamestnancu.rok%TYPE,
        p_mesic IN plat_zamestnancu.mesic%TYPE,
        p_plat IN plat_zamestnancu.plat%TYPE
    );

    PROCEDURE insert_dodavatel(
        p_nazev IN dodavatel.nazev%TYPE,
        p_kontakt IN dodavatel.kontakt%TYPE
    );

END insert_package;
/

CREATE OR REPLACE package body insert_package
AS
    PROCEDURE insert_jidelni_listek(
        p_nazev IN jidelni_listek.nazev%TYPE,
        p_popis IN jidelni_listek.popis%TYPE,
        p_cena IN jidelni_listek.cena%TYPE
    )
    IS
    BEGIN
        INSERT INTO jidelni_listek (nazev, popis, cena)
        VALUES (p_nazev, p_popis, p_cena);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20001, 'Duplikátní hodnota pro jídelní lístek ' || p_nazev);
    END insert_jidelni_listek;

    PROCEDURE insert_stoly(
        p_identifikator IN stoly.identifikator%TYPE,
        p_pocet_mist IN stoly.pocet_mist%TYPE,
        p_umisteni IN stoly.umisteni%TYPE
    ) IS
    BEGIN
        INSERT INTO stoly (identifikator, pocet_mist, umisteni)
        VALUES (p_identifikator, p_pocet_mist, p_umisteni);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20002, 'Duplikátní hodnota pro stůl ' || p_identifikator);
    END insert_stoly;

    PROCEDURE insert_oddeleni(
        p_nazev IN oddeleni.nazev%TYPE
    )
    IS
    BEGIN
        INSERT INTO oddeleni (nazev)
        VALUES (p_nazev);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20003, 'Duplikátní hodnota pro oddělení ' || p_nazev);
    END insert_oddeleni;

    PROCEDURE insert_pozice(
        p_nazev IN pozice.nazev%TYPE,
        p_oddeleni_id IN pozice.oddeleni_id%TYPE
    )
    IS
    BEGIN
        INSERT INTO pozice (nazev, oddeleni_id)
        VALUES (p_nazev, p_oddeleni_id);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20004, 'Duplikátní hodnota pro pozici ' || p_nazev);
    END insert_pozice;

    PROCEDURE insert_zamestnanci(
        p_jmeno IN zamestnanci.jmeno%TYPE,
        p_pozice_id IN zamestnanci.pozice_id%TYPE
    )
    IS
    BEGIN
        INSERT INTO zamestnanci (jmeno, pozice_id)
        VALUES (p_jmeno, p_pozice_id);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20005, 'Duplikátní hodnota pro zaměstnance ' || p_jmeno);
    END insert_zamestnanci;

    
    PROCEDURE insert_denni_trzby(
        p_datum IN denni_trzby.datum%TYPE,
        p_celkova_trzba IN denni_trzby.celkova_trzba%TYPE
    )
    IS
    BEGIN
        INSERT INTO denni_trzby (datum, celkova_trzba)
        VALUES (p_datum, p_celkova_trzba);
    END insert_denni_trzby;

       PROCEDURE insert_plat_zamestnancu(
        p_zamestnanec_id IN plat_zamestnancu.zamestnanec_id%TYPE,
        p_rok IN plat_zamestnancu.rok%TYPE,
        p_mesic IN plat_zamestnancu.mesic%TYPE,
        p_plat IN plat_zamestnancu.plat%TYPE
    )
    IS
    BEGIN
        INSERT INTO plat_zamestnancu (zamestnanec_id, rok, mesic, plat)
        VALUES (p_zamestnanec_id, p_rok, p_mesic, p_plat);
    END insert_plat_zamestnancu;

    PROCEDURE insert_dodavatel(
        p_nazev IN dodavatel.nazev%TYPE,
        p_kontakt IN dodavatel.kontakt%TYPE
    )
    IS
    BEGIN
        INSERT INTO dodavatel (nazev, kontakt)
        VALUES (p_nazev, p_kontakt);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20006, 'Duplikátní hodnota pro dodavatele ' || p_nazev);
    END insert_dodavatel;

    PROCEDURE insert_objednavka(
        p_datum_cas IN objednavka.datum_cas%TYPE,
        p_stul_id IN objednavka.stul_id%TYPE,
        p_stav IN objednavka.stav%TYPE
    )
    IS
    BEGIN
        INSERT INTO objednavka (stul_id, datum_cas, stav)
        VALUES (p_stul_id, p_datum_cas, p_stav);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20007, 'Duplikátní hodnota pro objednávku ' || TO_CHAR(p_datum_cas, 'DD.MM.YYYY HH24:MI:SS') || ', stůl ID: ' || p_stul_id);
    END insert_objednavka;

    PROCEDURE INSERT_OBJEDNAVKA_JIDEL(
        p_objednavka_id IN objednavka_jidel.objednavka_id%TYPE,
        p_jidlo_id IN objednavka_jidel.jidlo_id%TYPE,
        p_pocet IN objednavka_jidel.pocet%TYPE
    )
    IS
    BEGIN
        INSERT INTO objednavka_jidel (objednavka_id, jidlo_id, pocet)
        VALUES (p_objednavka_id, p_jidlo_id, p_pocet);
    END INSERT_OBJEDNAVKA_JIDEL;

 

END insert_package;
/

CREATE OR REPLACE package conversion_package
AS
    FUNCTION jidelni_listek_to_id(p_nazev IN jidelni_listek.nazev%TYPE) RETURN jidelni_listek.id%TYPE;
    FUNCTION stoly_to_id(p_identifikator IN stoly.identifikator%TYPE) RETURN stoly.id%TYPE;
    FUNCTION oddeleni_to_id(p_nazev IN oddeleni.nazev%TYPE) RETURN oddeleni.id%TYPE;
    FUNCTION pozice_to_id(p_nazev IN pozice.nazev%TYPE) RETURN pozice.id%TYPE;
    FUNCTION zamestnanci_to_id(p_jmeno IN zamestnanci.jmeno%TYPE) RETURN zamestnanci.id%TYPE;
    FUNCTION dodavatel_to_id(p_nazev IN dodavatel.nazev%TYPE) RETURN dodavatel.id%TYPE;
END conversion_package;
/

CREATE OR REPLACE package body conversion_package
AS
    FUNCTION jidelni_listek_to_id(p_nazev IN jidelni_listek.nazev%TYPE) RETURN jidelni_listek.id%TYPE
    IS
        l_id jidelni_listek.id%TYPE;
    BEGIN
        SELECT id INTO l_id FROM jidelni_listek WHERE nazev = p_nazev;
        RETURN l_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20025, 'Nenalezen žádný jídelní lístek s názvem ' || p_nazev);
    END jidelni_listek_to_id;

    FUNCTION stoly_to_id(p_identifikator IN stoly.identifikator%TYPE) RETURN stoly.id%TYPE
    IS
        l_id stoly.id%TYPE;
    BEGIN
        SELECT id INTO l_id FROM stoly WHERE identifikator = p_identifikator;
        RETURN l_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20026, 'Nenalezen žádný stůl s identifikátorem ' || p_identifikator);
    END stoly_to_id;

    FUNCTION oddeleni_to_id(p_nazev IN oddeleni.nazev%TYPE) RETURN oddeleni.id%TYPE
    IS
        l_id oddeleni.id%TYPE;
    BEGIN
        SELECT id INTO l_id FROM oddeleni WHERE nazev = p_nazev;
        RETURN l_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20027, 'Nenalezeno žádné oddělení s názvem ' || p_nazev);
    END oddeleni_to_id;

    FUNCTION pozice_to_id(p_nazev IN pozice.nazev%TYPE) RETURN pozice.id%TYPE
    IS
        l_id pozice.id%TYPE;
    BEGIN
        SELECT id INTO l_id FROM pozice WHERE nazev = p_nazev;
        RETURN l_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20028, 'Nenalezena žádná pozice s názvem ' || p_nazev);
    END pozice_to_id;

    FUNCTION zamestnanci_to_id(p_jmeno IN zamestnanci.jmeno%TYPE) RETURN zamestnanci.id%TYPE
    IS
        l_id zamestnanci.id%TYPE;
    BEGIN
        SELECT id INTO l_id FROM zamestnanci WHERE jmeno = p_jmeno;
        RETURN l_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20029, 'Nenalezen žádný zaměstnanec s jménem ' || p_jmeno);
    END zamestnanci_to_id;

    FUNCTION dodavatel_to_id(p_nazev IN dodavatel.nazev%TYPE) RETURN dodavatel.id%TYPE
    IS
        l_id dodavatel.id%TYPE;
    BEGIN
        SELECT id INTO l_id FROM dodavatel WHERE nazev = p_nazev;
        RETURN l_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20030, 'Nenalezen žádný dodavatel s názvem ' || p_nazev);
    END dodavatel_to_id;

END conversion_package;
/

-- Autogenerate ID using sequence
CREATE SEQUENCE jidelni_listek_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE stoly_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE objednavka_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE objednavka_jidel_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE oddeleni_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE pozice_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE zamestnanci_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE dodavatel_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;

-- Tabulka jidelni_listek
CREATE TABLE jidelni_listek (
    id NUMBER DEFAULT jidelni_listek_id_seq.NEXTVAL PRIMARY KEY,
    nazev VARCHAR2(100) NOT NULL,
    popis VARCHAR2(500),
    cena DECIMAL(8,2) NOT NULL CHECK (cena >= 0),
    UNIQUE (nazev, popis)
);

CREATE INDEX idx_jidelni_listek_nazev
ON jidelni_listek (nazev);

-- Tabulka stolu
CREATE TABLE stoly (
    id NUMBER DEFAULT stoly_id_seq.NEXTVAL PRIMARY KEY,
    identifikator VARCHAR2(50) NOT NULL UNIQUE,
    pocet_mist NUMBER NOT NULL,
    umisteni VARCHAR2(100) NOT NULL
);

-- Tabulka objednavka
CREATE TABLE objednavka (
    id NUMBER DEFAULT objednavka_id_seq.NEXTVAL PRIMARY KEY,
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
    id NUMBER DEFAULT oddeleni_id_seq.NEXTVAL PRIMARY KEY,
    nazev VARCHAR2(100) NOT NULL UNIQUE
);

-- Tabulka pozice
CREATE TABLE pozice (
    id NUMBER DEFAULT pozice_id_seq.NEXTVAL PRIMARY KEY,
    nazev VARCHAR2(50) NOT NULL,
    oddeleni_id NUMBER NOT NULL,
    FOREIGN KEY (oddeleni_id) REFERENCES oddeleni(id),
    UNIQUE (nazev, oddeleni_id)
);

CREATE INDEX idx_pozice_oddeleni_id ON pozice(oddeleni_id);

-- Tabulka zamestnancu
CREATE TABLE zamestnanci (
    id NUMBER DEFAULT zamestnanci_id_seq.NEXTVAL PRIMARY KEY,
    jmeno VARCHAR2(100) NOT NULL,
    pozice_id NUMBER NOT NULL,
    FOREIGN KEY (pozice_id) REFERENCES pozice(id)
);

CREATE INDEX idx_zamestnanci_pozice
ON zamestnanci (pozice_id);

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
    id NUMBER DEFAULT dodavatel_id_seq.NEXTVAL PRIMARY KEY,
    nazev VARCHAR2(100) NOT NULL,
    kontakt VARCHAR2(200)
);

CREATE INDEX idx_dodavatel_nazev
ON dodavatel (nazev);
---------------------------------------------------------------------

CREATE OR REPLACE PACKAGE insert_package AS

   PROCEDURE insert_jidelni_listek(
        p_id IN jidelni_listek.id%TYPE DEFAULT NULL,
        p_nazev IN jidelni_listek.nazev%TYPE,
        p_popis IN jidelni_listek.popis%TYPE,
        p_cena IN jidelni_listek.cena%TYPE
    );

    PROCEDURE insert_stoly(
        p_id IN stoly.id%TYPE DEFAULT NULL,
        p_identifikator IN stoly.identifikator%TYPE,
        p_pocet_mist IN stoly.pocet_mist%TYPE,
        p_umisteni IN stoly.umisteni%TYPE
    );

    PROCEDURE insert_objednavka(
        p_id IN objednavka.id%TYPE DEFAULT NULL,
        p_datum_cas IN objednavka.datum_cas%TYPE,
        p_stul_id IN objednavka.stul_id%TYPE,
        p_stav IN objednavka.stav%TYPE
    );

    PROCEDURE insert_objednavka_jidel(
        p_objednavka_id IN objednavka_jidel.objednavka_id%TYPE,
        p_jidlo_id IN objednavka_jidel.jidlo_id%TYPE,
        p_pocet IN objednavka_jidel.pocet%TYPE
    );

    -- PROCEDURE insert_oddeleni(
    --     p_id IN oddeleni.id%TYPE DEFAULT NULL,
    --     p_nazev IN oddeleni.nazev%TYPE
    -- )

END insert_package;
/

CREATE OR REPLACE package body insert_package
AS
    PROCEDURE insert_jidelni_listek( 
        p_id IN jidelni_listek.id%TYPE DEFAULT NULL,
        p_nazev IN jidelni_listek.nazev%TYPE,
        p_popis IN jidelni_listek.popis%TYPE,
        p_cena IN jidelni_listek.cena%TYPE
    )
    IS
    BEGIN
        IF p_id IS NULL THEN
            INSERT INTO jidelni_listek (nazev, popis, cena)
            VALUES (p_nazev, p_popis, p_cena);
        ELSE
            INSERT INTO jidelni_listek (id, nazev, popis, cena)
            VALUES (p_id, p_nazev, p_popis, p_cena);
        END IF;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20001, 'Duplikátní hodnota pro jídelní lístek ' || p_nazev);
    END insert_jidelni_listek;

    PROCEDURE insert_stoly(
        p_id IN stoly.id%TYPE DEFAULT NULL,
        p_identifikator IN stoly.identifikator%TYPE,
        p_pocet_mist IN stoly.pocet_mist%TYPE,
        p_umisteni IN stoly.umisteni%TYPE
    )
    IS
    BEGIN
        IF p_id IS NULL THEN
            INSERT INTO stoly (identifikator, pocet_mist, umisteni)
            VALUES (p_identifikator, p_pocet_mist, p_umisteni);
        ELSE
            INSERT INTO stoly (id, identifikator, pocet_mist, umisteni)
            VALUES (p_id, p_identifikator, p_pocet_mist, p_umisteni);
        END IF;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20002, 'Duplikátní hodnota pro identifikátor stolu ' || p_identifikator);
    END insert_stoly;

    PROCEDURE insert_objednavka(
        p_id IN objednavka.id%TYPE DEFAULT NULL,
        p_datum_cas IN objednavka.datum_cas%TYPE,
        p_stul_id IN objednavka.stul_id%TYPE,
        p_stav IN objednavka.stav%TYPE
    )
    IS
    BEGIN
        IF p_id IS NULL THEN
            INSERT INTO objednavka (datum_cas, stul_id, stav)
            VALUES (p_datum_cas, p_stul_id, p_stav);
        ELSE
            INSERT INTO objednavka (id, datum_cas, stul_id, stav)
            VALUES (p_id, p_datum_cas, p_stul_id, p_stav);
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(-20003, 'Chyba při vkládání objednávky: ' || SQLERRM);
    END insert_objednavka;

    PROCEDURE insert_objednavka_jidel(
        p_objednavka_id IN objednavka_jidel.objednavka_id%TYPE,
        p_jidlo_id IN objednavka_jidel.jidlo_id%TYPE,
        p_pocet IN objednavka_jidel.pocet%TYPE
    )
    IS
    BEGIN
        INSERT INTO objednavka_jidel (objednavka_id, jidlo_id, pocet)
        VALUES (p_objednavka_id, p_jidlo_id, p_pocet);
    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(-20004, 'Chyba při vkládání objednávky jídla: ' || SQLERRM);
    END insert_objednavka_jidel;


END insert_package;
/

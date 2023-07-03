-- Tabulka jidelni_listek
CREATE TABLE jidelni_listek (
    id NUMBER PRIMARY KEY,
    nazev VARCHAR2(100) NOT NULL,
    popis VARCHAR2(500),
    cena DECIMAL(8,2) NOT NULL
);

CREATE INDEX idx_jidelni_listek_nazev
ON jidelni_listek (nazev);

-- Tabulka objednavka
CREATE TABLE objednavka (
    id NUMBER PRIMARY KEY,
    datum_cas TIMESTAMP NOT NULL,
    stul_id NUMBER NOT NULL,
    FOREIGN KEY (stul_id) REFERENCES stoly(id)
);

CREATE INDEX idx_objednavka_datum
ON objednavka (datum_cas);

-- Tabulka objednavka_jidel, která spojuje objednávky a jídla
CREATE TABLE objednavka_jidel (
    objednavka_id NUMBER NOT NULL,
    jidlo_id NUMBER NOT NULL,
    FOREIGN KEY (objednavka_id) REFERENCES objednavka(id),
    FOREIGN KEY (jidlo_id) REFERENCES jidelni_listek(id),
    PRIMARY KEY (objednavka_id, jidlo_id)
);

-- Tabulka stolu
CREATE TABLE stoly (
    id NUMBER PRIMARY KEY,
    pocet_mist NUMBER NOT NULL,
    umisteni VARCHAR2(100) NOT NULL
);

-- Tabulka pozice
CREATE TABLE pozice (
    id NUMBER PRIMARY KEY,
    nazev VARCHAR2(100) NOT NULL
);

-- Tabulka zamestnancu
CREATE TABLE zamestnanci (
    id NUMBER PRIMARY KEY,
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
    mesic INT NOT NULL,
    rok INT NOT NULL,
    plat DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (zamestnanec_id) REFERENCES zamestnanci(id),
    PRIMARY KEY (zamestnanec_id, mesic)
);

-- Tabulka dodavatelu
CREATE TABLE dodavatel (
    id NUMBER PRIMARY KEY,
    nazev VARCHAR2(100) NOT NULL,
    kontakt VARCHAR2(200)
);

CREATE INDEX idx_dodavatel_nazev
ON dodavatel (nazev);


----------------------------------------------------------------------
-- Autogenerate ID pomoci sekvence a triggery
CREATE SEQUENCE jidelni_listek_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE objednavka_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE dodavatel_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE stoly_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE pozice_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;
CREATE SEQUENCE zamestnanci_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;

-- reset id 
--DROP SEQUENCE pozice_seq;
--CREATE SEQUENCE pozice_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER jidelni_listek_trigger
BEFORE INSERT ON jidelni_listek
FOR EACH ROW
BEGIN
  SELECT jidelni_listek_seq.NEXTVAL
  INTO :new.id
  FROM dual;
END;

/
CREATE OR REPLACE TRIGGER objednavka_trigger
BEFORE INSERT ON objednavka
FOR EACH ROW
BEGIN
  SELECT objednavka_seq.NEXTVAL
  INTO :new.id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER stoly_trigger
BEFORE INSERT ON stoly
FOR EACH ROW
BEGIN
  SELECT stoly_seq.NEXTVAL
  INTO :new.id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER pozice_trigger
BEFORE INSERT ON pozice
FOR EACH ROW
BEGIN
  SELECT pozice_seq.NEXTVAL
  INTO :new.id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER zamestnanci_trigger
BEFORE INSERT ON zamestnanci
FOR EACH ROW
BEGIN
  SELECT zamestnanci_seq.NEXTVAL
  INTO :new.id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER dodavatel_trigger
BEFORE INSERT ON dodavatel
FOR EACH ROW
BEGIN
  SELECT dodavatel_seq.NEXTVAL
  INTO :new.id
  FROM dual;
END;
/

---------------------------------------------------------------------

CREATE OR REPLACE package insert_package
AS
    PROCEDURE insert_jidelni_listek(
        p_nazev IN jidelni_listek.nazev%TYPE,
        p_popis IN jidelni_listek.popis%TYPE,
        p_cena IN jidelni_listek.cena%TYPE
    );

    PROCEDURE insert_stoly(
        p_pocet_mist IN stoly.pocet_mist%TYPE,
        p_umisteni IN stoly.umisteni%TYPE
    );

    PROCEDURE insert_pozice(
        p_nazev IN pozice.nazev%TYPE
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
        p_mesic IN plat_zamestnancu.mesic%TYPE,
        p_rok IN plat_zamestnancu.rok%TYPE,
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
    END insert_jidelni_listek;

    PROCEDURE insert_stoly(
        p_pocet_mist IN stoly.pocet_mist%TYPE,
        p_umisteni IN stoly.umisteni%TYPE
    ) IS
    BEGIN
        INSERT INTO stoly (pocet_mist, umisteni)
        VALUES (p_pocet_mist, p_umisteni);
    END insert_stoly;

    PROCEDURE insert_pozice(
        p_nazev IN pozice.nazev%TYPE
    )
    IS
    BEGIN
        INSERT INTO pozice (nazev)
        VALUES (p_nazev);
    END insert_pozice;

    PROCEDURE insert_zamestnanci(
        p_jmeno IN zamestnanci.jmeno%TYPE,
        p_pozice_id IN zamestnanci.pozice_id%TYPE
    )
    IS
    BEGIN
        INSERT INTO zamestnanci (jmeno, pozice_id)
        VALUES (p_jmeno, p_pozice_id);
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
        p_mesic IN plat_zamestnancu.mesic%TYPE,
        p_rok IN plat_zamestnancu.rok%TYPE,
        p_plat IN plat_zamestnancu.plat%TYPE
    )
    IS
    BEGIN
        INSERT INTO plat_zamestnancu (zamestnanec_id, mesic, rok, plat)
        VALUES (p_zamestnanec_id, p_mesic, p_rok, p_plat);
    END insert_plat_zamestnancu;

    PROCEDURE insert_dodavatel(
        p_nazev IN dodavatel.nazev%TYPE,
        p_kontakt IN dodavatel.kontakt%TYPE
    )
    IS
    BEGIN
        INSERT INTO dodavatel (nazev, kontakt)
        VALUES (p_nazev, p_kontakt);
    END insert_dodavatel;

END insert_package;
/


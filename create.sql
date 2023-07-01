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
    umisteni VARCHAR2(100)
);

-- Tabulka zamestnancu
CREATE TABLE zamestnanci (
    id NUMBER PRIMARY KEY,
    jmeno VARCHAR2(100) NOT NULL,
    pozice VARCHAR2(100) NOT NULL
);

CREATE INDEX idx_zamestnanci_pozice
ON zamestnanci (pozice);

-- Tabulka denni_trzby
CREATE TABLE denni_trzby (
    datum DATE PRIMARY KEY,
    celkova_trzba DECIMAL(10,2) NOT NULL
);

-- Tabulka plat_zamestnancu
CREATE TABLE plat_zamestnancu (
    zamestnanec_id NUMBER NOT NULL,
    mesic DATE NOT NULL,
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
CREATE SEQUENCE jidelni_listek_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

CREATE OR REPLACE TRIGGER jidelni_listek_trigger
BEFORE INSERT ON jidelni_listek
FOR EACH ROW
BEGIN
  SELECT jidelni_listek_seq.NEXTVAL
  INTO :new.id
  FROM dual;
END;
/

----------------------------------------------------------------------

CREATE OR REPLACE package insert_package
AS
    PROCEDURE insert_jidelni_listek(
        p_nazev IN jidelni_listek.nazev%TYPE,
        p_popis IN jidelni_listek.popis%TYPE,
        p_cena IN jidelni_listek.cena%TYPE
    );
END insert_package;
/

CREATE OR REPLACE PACKAGE BODY insert_package
AS
    PROCEDURE insert_jidelni_listek(p_nazev IN jidelni_listek.nazev%TYPE,
                                    p_popis IN jidelni_listek.popis%TYPE,
                                    p_cena IN jidelni_listek.cena%TYPE)
    AS
    BEGIN
        INSERT INTO jidelni_listek (nazev, popis, cena)
        VALUES (p_nazev, p_popis, p_cena);
    END insert_jidelni_listek;
    
    -- Další procedury
END insert_package;
/




-- Autogenerate ID using sequence for jidelni_listek only
CREATE SEQUENCE jidelni_listek_id_seq START WITH 1 INCREMENT BY 1 NOMAXVALUE;

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


---------------------------------------------------------------------

CREATE OR REPLACE PACKAGE insert_package AS

   PROCEDURE insert_jidelni_listek(
        p_id IN jidelni_listek.id%TYPE DEFAULT NULL,
        p_nazev IN jidelni_listek.nazev%TYPE,
        p_popis IN jidelni_listek.popis%TYPE,
        p_cena IN jidelni_listek.cena%TYPE
    );

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
END insert_package;
/

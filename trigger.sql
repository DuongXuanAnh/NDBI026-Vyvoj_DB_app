--  Kontrola dostupnosti stolu před vytvořením objednávky
CREATE OR REPLACE TRIGGER check_stul_availability_trigger
BEFORE INSERT ON objednavka
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_count
  FROM objednavka
  WHERE stul_id = :NEW.stul_id
  AND stav NOT IN ('hotový', 'zaplaceno');

  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20021, 'Stůl již je obsazen');
  END IF;
END;
/

-- Ověření platnosti stavu objednávky
CREATE OR REPLACE TRIGGER verify_order_status_trigger
BEFORE UPDATE OF stav ON objednavka
FOR EACH ROW
BEGIN
  IF :NEW.stav NOT IN ('nový', 'zpracovává se', 'hotový', 'zaplaceno') THEN
    RAISE_APPLICATION_ERROR(-20022, 'Neplatný stav objednávky');
  END IF;
END;
/

--  Kontrola platů zaměstnanců, že plat zaměstnance nepřekročí 200000
CREATE OR REPLACE TRIGGER check_employee_salary_trigger
BEFORE INSERT OR UPDATE ON plat_zamestnancu
FOR EACH ROW
BEGIN
  IF :NEW.plat > 200000 THEN
    RAISE_APPLICATION_ERROR(-20023, 'Plat zaměstnance nesmí překročit 200000');
  END IF;
END;
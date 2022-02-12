CREATE SEQUENCE INVEN_ID
MINVALUE 1
MAXVALUE 999999999
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE OR REPLACE TRIGGER INVENTORY_INSERT_T1 
BEFORE INSERT ON INVENTORY_IN_STORE FOR EACH ROW 
DECLARE
BEGIN
    SELECT INVEN_ID.nextval INTO :NEW.INVENTORY_ID
    FROM DUAL;
END;

INSERT INTO INVENTORY_IN_STORE(BRAND, CATEGORIES, ITEM_SIZE, COLOR, PURCHASEPRICE_PER_UNIT, ITEM_NUMBER, MON, YR)
SELECT BRAND, CATEGORIES, ITEM_SIZE, COLOR, PURCHASEPRICE_PER_UNIT, ITEM_NUMBER, MON, YR
FROM PURCHASE;

SELECT * FROM INVENTORY_IN_STORE;

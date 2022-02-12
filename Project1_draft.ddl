-- Generated by Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   at:        2021-12-17 08:17:02 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE inventory_in_store (
    inventory_id           INTEGER NOT NULL,
    brand                  VARCHAR2(100),
    categories             VARCHAR2(100),
    item_size              VARCHAR2(100),
    color                  VARCHAR2(100),
    purchaseprice_per_unit NUMBER,
    item_number            INTEGER NOT NULL,
    mon                    VARCHAR2(100),
    yr                     VARCHAR2(100),
    sales_id               INTEGER NOT NULL
);

ALTER TABLE inventory_in_store ADD CONSTRAINT inventory_pk PRIMARY KEY ( inventory_id );

CREATE TABLE purchase (
    item_number            INTEGER NOT NULL,
    purchaseprice_per_unit NUMBER,
    brand                  VARCHAR2(100),
    categories             VARCHAR2(100),
    item_size              VARCHAR2(100),
    color                  VARCHAR2(100),
    whether_credit_buy     VARCHAR2(100),
    credit_buy_limitdays   INTEGER,
    creditbuy_repayment    NUMBER,
    mon                    VARCHAR2(100),
    yr                     VARCHAR2(100),
    supplier_id            INTEGER NOT NULL
);

ALTER TABLE purchase ADD CONSTRAINT purchase_pk PRIMARY KEY ( item_number );

CREATE TABLE sales (
    sales_id               INTEGER NOT NULL,
    salesprice_per_unit    NUMBER,
    inventory_id           INTEGER NOT NULL,
    purchaseprice_per_unit NUMBER,
    brand                  VARCHAR2(100),
    categories             VARCHAR2(100),
    item_size              VARCHAR2(100),
    color                  VARCHAR2(100),
    customer_name          VARCHAR2(100),
    whether_credit_pay     VARCHAR2(100),
    creditpay_repayment    NUMBER,
    mon                    VARCHAR2(100),
    yr                     VARCHAR2(100)
);

ALTER TABLE sales ADD CONSTRAINT sales_pk PRIMARY KEY ( sales_id );

CREATE TABLE suppliers (
    supplier_id INTEGER NOT NULL,
    sup_name    VARCHAR2(100),
    address     VARCHAR2(100),
    brand       VARCHAR2(100),
    email       VARCHAR2(100),
    telephone   NUMBER
);

ALTER TABLE suppliers ADD CONSTRAINT suppliers_pk PRIMARY KEY ( supplier_id );

ALTER TABLE inventory_in_store
    ADD CONSTRAINT inven_fk FOREIGN KEY ( item_number )
        REFERENCES purchase ( item_number );

ALTER TABLE inventory_in_store
    ADD CONSTRAINT inventory_in_store_sales_fk FOREIGN KEY ( sales_id )
        REFERENCES sales ( sales_id );

ALTER TABLE purchase
    ADD CONSTRAINT purch_fk FOREIGN KEY ( supplier_id )
        REFERENCES suppliers ( supplier_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

-- Generated by Oracle SQL Developer Data Modeler 17.4.0.355.2131
--   at:        2018-11-25 19:54:37 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE karnet (
    klient_id_klienta   INTEGER NOT NULL,
    zajecia_id_zajec    INTEGER NOT NULL,
    cena                FLOAT(2) NOT NULL,
    data_rozp           DATE NOT NULL,
    data_zakon          DATE NOT NULL
);

ALTER TABLE karnet ADD CONSTRAINT karnet_pk PRIMARY KEY ( klient_id_klienta,
zajecia_id_zajec );

CREATE TABLE klient (
    id_klienta   INTEGER NOT NULL,
    nazwisko     VARCHAR2(50) NOT NULL,
    imie         VARCHAR2(50) NOT NULL
);

ALTER TABLE klient ADD CONSTRAINT klient_pk PRIMARY KEY ( id_klienta );

CREATE TABLE obiekt_sportowy (
    id_obiektu    INTEGER NOT NULL,
    lokalizacja   VARCHAR2(50) NOT NULL,
    nazwa         VARCHAR2(50) NOT NULL,
    typ_obiektu   VARCHAR2(50) NOT NULL
);

ALTER TABLE obiekt_sportowy ADD CONSTRAINT obiekt_sportowy_pk PRIMARY KEY ( id_obiektu );

CREATE TABLE pracownik (
    pesel      VARCHAR2(11) NOT NULL,
    nazwisko   VARCHAR2(50) NOT NULL,
    imie       VARCHAR2(50) NOT NULL,
    funkcja    VARCHAR2(50) NOT NULL
);

ALTER TABLE pracownik ADD CONSTRAINT pracownik_pk PRIMARY KEY ( pesel );

CREATE TABLE relation_3 (
    zawody_nazwa      VARCHAR2(50) NOT NULL,
    uczestnik_pesel   VARCHAR2(11) NOT NULL
);

ALTER TABLE relation_3 ADD CONSTRAINT relation_3_pk PRIMARY KEY ( zawody_nazwa,
uczestnik_pesel );

CREATE TABLE sala (
    nr_sali                      VARCHAR2(50) NOT NULL,
    obiekt_sportowy_id_obiektu   INTEGER NOT NULL
);

ALTER TABLE sala ADD CONSTRAINT sala_pk PRIMARY KEY ( obiekt_sportowy_id_obiektu,
nr_sali );

CREATE TABLE trener (
    pesel        VARCHAR2(11) NOT NULL,
    dyscyplina   VARCHAR2(50) NOT NULL
);

ALTER TABLE trener ADD CONSTRAINT trener_pk PRIMARY KEY ( pesel );

CREATE TABLE uczestnik (
    pesel      VARCHAR2(11) NOT NULL,
    nazwisko   VARCHAR2(50) NOT NULL,
    imie       VARCHAR2(20) NOT NULL,
    oplacony   CHAR(1) NOT NULL
);

ALTER TABLE uczestnik ADD CONSTRAINT uczestnik_pk PRIMARY KEY ( pesel );

CREATE TABLE wyposazenie (
    id_wyposazenia               INTEGER NOT NULL,
    nazwa                        VARCHAR2(50) NOT NULL,
    dyscyplina                   VARCHAR2(50),
    ilosc                        INTEGER,
    obiekt_sportowy_id_obiektu   INTEGER,
    sala_obiekt_sportowy_id_ob   INTEGER,
    sala_nr_sali                 VARCHAR2(50)
);

ALTER TABLE wyposazenie
    ADD CONSTRAINT arc_2 CHECK (
        (
            ( obiekt_sportowy_id_obiektu IS NOT NULL )
            AND ( sala_obiekt_sportowy_id_ob IS NULL )
            AND ( sala_nr_sali IS NULL )
        )
        OR (
            ( sala_obiekt_sportowy_id_ob IS NOT NULL )
            AND ( sala_nr_sali IS NOT NULL )
            AND ( obiekt_sportowy_id_obiektu IS NULL )
        )
    );

ALTER TABLE wyposazenie ADD CONSTRAINT wyposazenie_pk PRIMARY KEY ( id_wyposazenia );

CREATE TABLE zajecia (
    id_zajec                     INTEGER NOT NULL,
    dzien_tygodnia               VARCHAR2(20) NOT NULL,
    godzina_rozp                 TIMESTAMP NOT NULL,
    godzina_zakon                TIMESTAMP NOT NULL,
    dyscyplina                   VARCHAR2(50) NOT NULL,
    cena                         FLOAT(2) NOT NULL,
    trener_pesel                 VARCHAR2(11),
    obiekt_sportowy_id_obiektu   INTEGER,
    sala_obiekt_sportowy_id_ob   INTEGER,
    sala_nr_sali                 VARCHAR2(50)
);

ALTER TABLE zajecia
    ADD CONSTRAINT arc_1 CHECK (
        (
            ( obiekt_sportowy_id_obiektu IS NOT NULL )
            AND ( sala_obiekt_sportowy_id_ob IS NULL )
            AND ( sala_nr_sali IS NULL )
        )
        OR (
            ( sala_obiekt_sportowy_id_ob IS NOT NULL )
            AND ( sala_nr_sali IS NOT NULL )
            AND ( obiekt_sportowy_id_obiektu IS NULL )
        )
    );

ALTER TABLE zajecia ADD CONSTRAINT zajecia_pk PRIMARY KEY ( id_zajec );

CREATE TABLE zawody (
    nazwa                        VARCHAR2(50) NOT NULL,
    data                         DATE NOT NULL,
    dyscyplina                   VARCHAR2(50) NOT NULL,
    oplata_startowa              FLOAT(2),
    obiekt_sportowy_id_obiektu   INTEGER NOT NULL
);

ALTER TABLE zawody ADD CONSTRAINT zawody_pk PRIMARY KEY ( nazwa );

ALTER TABLE karnet
    ADD CONSTRAINT karnet_klient_fk FOREIGN KEY ( klient_id_klienta )
        REFERENCES klient ( id_klienta );

ALTER TABLE karnet
    ADD CONSTRAINT karnet_zajecia_fk FOREIGN KEY ( zajecia_id_zajec )
        REFERENCES zajecia ( id_zajec );

ALTER TABLE relation_3
    ADD CONSTRAINT relation_3_uczestnik_fk FOREIGN KEY ( uczestnik_pesel )
        REFERENCES uczestnik ( pesel );

ALTER TABLE relation_3
    ADD CONSTRAINT relation_3_zawody_fk FOREIGN KEY ( zawody_nazwa )
        REFERENCES zawody ( nazwa );

ALTER TABLE sala
    ADD CONSTRAINT sala_obiekt_sportowy_fk FOREIGN KEY ( obiekt_sportowy_id_obiektu )
        REFERENCES obiekt_sportowy ( id_obiektu );

ALTER TABLE trener
    ADD CONSTRAINT trener_pracownik_fk FOREIGN KEY ( pesel )
        REFERENCES pracownik ( pesel );

ALTER TABLE wyposazenie
    ADD CONSTRAINT wyposazenie_obiekt_sportowy_fk FOREIGN KEY ( obiekt_sportowy_id_obiektu )
        REFERENCES obiekt_sportowy ( id_obiektu );

ALTER TABLE wyposazenie
    ADD CONSTRAINT wyposazenie_sala_fk FOREIGN KEY ( sala_obiekt_sportowy_id_ob,
    sala_nr_sali )
        REFERENCES sala ( obiekt_sportowy_id_obiektu,
        nr_sali );

ALTER TABLE zajecia
    ADD CONSTRAINT zajecia_obiekt_sportowy_fk FOREIGN KEY ( obiekt_sportowy_id_obiektu )
        REFERENCES obiekt_sportowy ( id_obiektu );

ALTER TABLE zajecia
    ADD CONSTRAINT zajecia_sala_fk FOREIGN KEY ( sala_obiekt_sportowy_id_ob,
    sala_nr_sali )
        REFERENCES sala ( obiekt_sportowy_id_obiektu,
        nr_sali );

ALTER TABLE zajecia
    ADD CONSTRAINT zajecia_trener_fk FOREIGN KEY ( trener_pesel )
        REFERENCES trener ( pesel );

ALTER TABLE zawody
    ADD CONSTRAINT zawody_obiekt_sportowy_fk FOREIGN KEY ( obiekt_sportowy_id_obiektu )
        REFERENCES obiekt_sportowy ( id_obiektu );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             25
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

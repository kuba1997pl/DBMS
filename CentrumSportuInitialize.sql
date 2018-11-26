/*
--INITIALIZES SAMPLE DATA
--alter table karnet modify cena number(6,2);
--alter zajecia karnet modify cena number(6,2);
--alter table zajecia modify godzina_rozp date;
--alter table zajecia modify godzina_zakon date;
--alter table zawody modify oplata_startowa number(6,2);
create SEQUENCE seq_id_obiektu minvalue 0 start with 0 increment by 1;
insert into OBIEKT_SPORTOWY values ( SEQ_ID_OBIEKTU.nextval, 'ul. Piotrowo 4, 61-138, Poznan', 'Centrum Sportu Politechniki Poznanskiej', 'budynek');
insert into OBIEKT_SPORTOWY values ( SEQ_ID_OBIEKTU.NEXTVAL, 'ul. Piotrowo 4, 61-138, Poznan', 'Kort tenisowy 1', 'kort tenisowy');
insert into OBIEKT_SPORTOWY values ( SEQ_ID_OBIEKTU.NEXTVAL, 'ul. Piotrowo 4, 61-138, Poznan', 'Kort tenisowy 2', 'kort tenisowy');
insert into OBIEKT_SPORTOWY values ( SEQ_ID_OBIEKTU.NEXTVAL, 'ul. Piotrowo 4, 61-138, Poznan', 'Kort tenisowy 3', 'kort tenisowy');
insert into OBIEKT_SPORTOWY values ( SEQ_ID_OBIEKTU.NEXTVAL, 'ul. Piotrowo 4, 61-138, Poznan', 'Boisko do pilki noznej', 'boisko do pilki noznej');
insert into sala values ( 'Squash 1', 1);
insert into sala values ( 'Squash 2', 1);
insert into sala values ( 'Squash 3', 1);
insert into sala values ( 'Squash 4', 1);
insert into sala values ( 'Hala sportowa', 1);
insert into sala values ( 'Silownia', 1);
insert into sala values ( 'Sala fitness', 1);
insert into sala values ( 'Kregielnia', 1);
insert into pracownik values ( '82110478194', 'Kowalski', 'Adam', 'Trener');
insert into trener values ( '82110478194', 'Squash');
insert into pracownik values ( '76071319471', 'Nowak', 'Wojciech', 'Trener');
insert into trener values ( '76071319471', 'Tenis');
insert into pracownik values ( '68063073877', 'Tomasz', 'Borski', 'Trener');
insert into trener values ( '68063073877', 'Silownia');
insert into pracownik values ( '60031874813', 'Grazyna', 'Karp', 'Sprzataczka');
insert into pracownik values ( '78003287311', 'Magda', 'Nowicka', 'Portierka');
create SEQUENCE seq_id_wyposazenia minvalue 0 start with 0 increment by 1;
insert into wyposazenie values ( seq_id_wyposazenia.nextval, 'Rakiety do squasha', 'Squash', '10', 1, NULL, NULL );
insert into wyposazenie values ( seq_id_wyposazenia.nextval, 'Sprzet w silowni', NULL, NULL, NULL, 1, 'Silownia' );
insert into wyposazenie values ( seq_id_wyposazenia.nextval, 'Pilka gimnastyczna', 'Gimnastyka', 5, NULL, 1, 'Sala fitness' );
create SEQUENCE seq_id_klienta minvalue 0 start with 0 increment by 1;
insert into klient values (seq_id_klienta.nextval, 'Igor', 'Matecki');
insert into klient values (seq_id_klienta.nextval, 'Ala', 'Kolot');
insert into klient values (seq_id_klienta.nextval, 'Andrzej', 'Bakat');
insert into klient values (seq_id_klienta.nextval, 'Piotr', 'Krupa');
insert into klient values (seq_id_klienta.nextval, 'Konrad', 'Tyma');
create SEQUENCE seq_id_zajec minvalue 0 start with 0 increment by 1;
insert into zajecia values (seq_id_zajec.nextval, 'poniedzialek', to_timestamp('12:00:00','HH24:MI:SS'), to_timestamp('13:00:00','HH24:MI:SS'), 'Silownia', '30', '68063073877', NULL, 1, 'Silownia');
insert into zajecia values (seq_id_zajec.nextval, 'sroda', to_timestamp('18:00:00','HH24:MI:SS'), to_timestamp('19:00:00','HH24:MI:SS'), 'Silownia', '40', '68063073877', NULL, 1, 'Silownia');
insert into zajecia values (seq_id_zajec.nextval, 'sroda', to_timestamp('19:00:00','HH24:MI:SS'), to_timestamp('21:00:00','HH24:MI:SS'), 'Squash', '50', '82110478194', NULL, 1, 'Squash 1');
insert into zajecia values (seq_id_zajec.nextval, 'piatek', to_timestamp('18:00:00','HH24:MI:SS'), to_timestamp('20:00:00','HH24:MI:SS'), 'Squash', '50', '82110478194', NULL, 1, 'Squash 1');
insert into zajecia values (seq_id_zajec.nextval, 'wtorek', to_timestamp('9:00:00','HH24:MI:SS'), to_timestamp('11:00:00','HH24:MI:SS'), 'Tenis', '70', '76071319471', 3, NULL, NULL);
insert into karnet values (4, 1, 275.50, TO_DATE('01-12-2018','DD-MM-YYYY'), TO_DATE('31-01-2019','DD-MM-YYYY'));
insert into karnet values (3, 2, 245.04, TO_DATE('01-12-2018','DD-MM-YYYY'), TO_DATE('31-01-2019','DD-MM-YYYY'));
insert into karnet values (1, 3, 210, TO_DATE('01-12-2018','DD-MM-YYYY'), TO_DATE('31-01-2019','DD-MM-YYYY'));
insert into karnet values (1, 1, 180.5, TO_DATE('01-12-2018','DD-MM-YYYY'), TO_DATE('31-01-2019','DD-MM-YYYY'));
insert into uczestnik values ('89081887811', 'Bury', 'Hubert', 0);
insert into uczestnik values ('95051387618', 'Jaki', 'Patryk', 0);
insert into uczestnik values ('92032384671', 'Nowy', 'Krzysztof', 1);

*/


/*
--DROPS ALL TABLES AND SEQUENCES
BEGIN

  --Bye Sequences!
  FOR i IN (SELECT us.sequence_name
              FROM USER_SEQUENCES us) LOOP
    EXECUTE IMMEDIATE 'drop sequence '|| i.sequence_name ||'';
  END LOOP;

  --Bye Tables!
  FOR i IN (SELECT ut.table_name
              FROM USER_TABLES ut) LOOP
    EXECUTE IMMEDIATE 'drop table '|| i.table_name ||' CASCADE CONSTRAINTS ';
  END LOOP;

END;
*/
/*
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
        
*/
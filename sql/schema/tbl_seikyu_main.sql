CREATE TABLE tbl_seikyu_main (
    sryym integer DEFAULT 0 NOT NULL,
    nyugaikbn character(1) NOT NULL,
    ptid bigint DEFAULT 0 NOT NULL,
    receka character(2) NOT NULL,
    teisyutusaki smallint DEFAULT 0 NOT NULL,
    recesyubetu character(4) NOT NULL,
    hknjanum character(8) NOT NULL,
    hojokbn_key character(1) NOT NULL,
    tekstymd character(8) NOT NULL,
    ptnum character(20) NOT NULL,
    prefkbn character(1) DEFAULT '0'::bpchar,
    prefnum character(2) DEFAULT '00'::bpchar,
    age smallint DEFAULT 0,
    kyurate smallint DEFAULT 0,
    zaitaku character(1) DEFAULT ''::bpchar,
    skyym character(6),
    henreiym character(6),
    skykbn character(1),
    teiseikbn character(1),
    hknnum character(3),
    honkzkkbn character(1),
    hojokbn character(1) DEFAULT ''::bpchar,
    contkbn character(1) DEFAULT ''::bpchar,
    kigo character varying(80),
    num character varying(80),
    rjnhknnum character(3),
    kohnum1 character(3) DEFAULT ''::bpchar,
    kohnum2 character(3) DEFAULT ''::bpchar,
    kohnum3 character(3) DEFAULT ''::bpchar,
    kohnum4 character(3) DEFAULT ''::bpchar,
    jnissu smallint DEFAULT 0,
    khnten1 integer DEFAULT 0,
    kaisu1 integer DEFAULT 0,
    tensu1 integer DEFAULT 0,
    khnten2 integer DEFAULT 0,
    kaisu2 integer DEFAULT 0,
    tensu2 integer DEFAULT 0,
    khnten3 integer DEFAULT 0,
    kaisu3 integer DEFAULT 0,
    tensu3 integer DEFAULT 0,
    khnten4 integer DEFAULT 0,
    kaisu4 integer DEFAULT 0,
    tensu4 integer DEFAULT 0,
    khnten5 integer DEFAULT 0,
    kaisu5 integer DEFAULT 0,
    tensu5 integer DEFAULT 0,
    khnten6 integer DEFAULT 0,
    kaisu6 integer DEFAULT 0,
    tensu6 integer DEFAULT 0,
    khnten7 integer DEFAULT 0,
    kaisu7 integer DEFAULT 0,
    tensu7 integer DEFAULT 0,
    khnten8 integer DEFAULT 0,
    kaisu8 integer DEFAULT 0,
    tensu8 integer DEFAULT 0,
    khnten9 integer DEFAULT 0,
    kaisu9 integer DEFAULT 0,
    tensu9 integer DEFAULT 0,
    khnten10 integer DEFAULT 0,
    kaisu10 integer DEFAULT 0,
    tensu10 integer DEFAULT 0,
    khnten11 integer DEFAULT 0,
    kaisu11 integer DEFAULT 0,
    tensu11 integer DEFAULT 0,
    khnten12 integer DEFAULT 0,
    kaisu12 integer DEFAULT 0,
    tensu12 integer DEFAULT 0,
    khnten13 integer DEFAULT 0,
    kaisu13 integer DEFAULT 0,
    tensu13 integer DEFAULT 0,
    khnten14 integer DEFAULT 0,
    kaisu14 integer DEFAULT 0,
    tensu14 integer DEFAULT 0,
    khnten15 integer DEFAULT 0,
    kaisu15 integer DEFAULT 0,
    tensu15 integer DEFAULT 0,
    khnten16 integer DEFAULT 0,
    kaisu16 integer DEFAULT 0,
    tensu16 integer DEFAULT 0,
    khnten17 integer DEFAULT 0,
    kaisu17 integer DEFAULT 0,
    tensu17 integer DEFAULT 0,
    khnten18 integer DEFAULT 0,
    kaisu18 integer DEFAULT 0,
    tensu18 integer DEFAULT 0,
    khnten19 integer DEFAULT 0,
    kaisu19 integer DEFAULT 0,
    tensu19 integer DEFAULT 0,
    khnten20 integer DEFAULT 0,
    kaisu20 integer DEFAULT 0,
    tensu20 integer DEFAULT 0,
    khnten21 integer DEFAULT 0,
    kaisu21 integer DEFAULT 0,
    tensu21 integer DEFAULT 0,
    khnten22 integer DEFAULT 0,
    kaisu22 integer DEFAULT 0,
    tensu22 integer DEFAULT 0,
    khnten23 integer DEFAULT 0,
    kaisu23 integer DEFAULT 0,
    tensu23 integer DEFAULT 0,
    khnten24 integer DEFAULT 0,
    kaisu24 integer DEFAULT 0,
    tensu24 integer DEFAULT 0,
    khnten25 integer DEFAULT 0,
    kaisu25 integer DEFAULT 0,
    tensu25 integer DEFAULT 0,
    khnten26 integer DEFAULT 0,
    kaisu26 integer DEFAULT 0,
    tensu26 integer DEFAULT 0,
    khnten27 integer DEFAULT 0,
    kaisu27 integer DEFAULT 0,
    tensu27 integer DEFAULT 0,
    khnten28 integer DEFAULT 0,
    kaisu28 integer DEFAULT 0,
    tensu28 integer DEFAULT 0,
    khnten29 integer DEFAULT 0,
    kaisu29 integer DEFAULT 0,
    tensu29 integer DEFAULT 0,
    khnten30 integer DEFAULT 0,
    kaisu30 integer DEFAULT 0,
    tensu30 integer DEFAULT 0,
    khnten31 integer DEFAULT 0,
    kaisu31 integer DEFAULT 0,
    tensu31 integer DEFAULT 0,
    khnten32 integer DEFAULT 0,
    kaisu32 integer DEFAULT 0,
    tensu32 integer DEFAULT 0,
    khnten33 integer DEFAULT 0,
    kaisu33 integer DEFAULT 0,
    tensu33 integer DEFAULT 0,
    khnten34 integer DEFAULT 0,
    kaisu34 integer DEFAULT 0,
    tensu34 integer DEFAULT 0,
    khnten35 integer DEFAULT 0,
    kaisu35 integer DEFAULT 0,
    tensu35 integer DEFAULT 0,
    khnten36 integer DEFAULT 0,
    kaisu36 integer DEFAULT 0,
    tensu36 integer DEFAULT 0,
    khnten37 integer DEFAULT 0,
    kaisu37 integer DEFAULT 0,
    tensu37 integer DEFAULT 0,
    khnten38 integer DEFAULT 0,
    kaisu38 integer DEFAULT 0,
    tensu38 integer DEFAULT 0,
    khnten39 integer DEFAULT 0,
    kaisu39 integer DEFAULT 0,
    tensu39 integer DEFAULT 0,
    khnten40 integer DEFAULT 0,
    kaisu40 integer DEFAULT 0,
    tensu40 integer DEFAULT 0,
    khnten41 integer DEFAULT 0,
    kaisu41 integer DEFAULT 0,
    tensu41 integer DEFAULT 0,
    khnten42 integer DEFAULT 0,
    kaisu42 integer DEFAULT 0,
    tensu42 integer DEFAULT 0,
    khnten43 integer DEFAULT 0,
    kaisu43 integer DEFAULT 0,
    tensu43 integer DEFAULT 0,
    khnten44 integer DEFAULT 0,
    kaisu44 integer DEFAULT 0,
    tensu44 integer DEFAULT 0,
    khnten45 integer DEFAULT 0,
    kaisu45 integer DEFAULT 0,
    tensu45 integer DEFAULT 0,
    totalten integer DEFAULT 0,
    ftnmoney integer DEFAULT 0,
    ftnmoney_ftn integer DEFAULT 0,
    ftnmoney_koj integer DEFAULT 0,
    shokujinissu smallint DEFAULT 0,
    shokujiryoyohi integer DEFAULT 0,
    shokujiftn integer DEFAULT 0,
    shokujiftnkbn character(1) DEFAULT ''::bpchar,
    ykzftn integer DEFAULT 0,
    hknnum_s character(3),
    hknjanum_s character(8),
    creymd character(8),
    updymd character(8),
    hknid bigint DEFAULT 0,
    rjnhknid bigint DEFAULT 0,
    hospnum smallint NOT NULL,
    skykbn_receden character(1),
    tokki1 character(2),
    tokki2 character(2),
    tokki3 character(2),
    tokki4 character(2),
    tokki5 character(2),
    flg1 smallint DEFAULT 0,
    flg2 smallint DEFAULT 0,
    flg3 smallint DEFAULT 0,
    flg4 smallint DEFAULT 0,
    flg5 smallint DEFAULT 0,
    reserve_area character varying(50),
    henrei_siji_flg smallint DEFAULT 0,
    etccreateflg smallint DEFAULT 0
);

ALTER TABLE ONLY tbl_seikyu_main
    ADD CONSTRAINT tbl_seikyu_main_primary_key PRIMARY KEY (hospnum, sryym, nyugaikbn, ptid, receka, teisyutusaki, recesyubetu, hknjanum, hojokbn_key, tekstymd);

CREATE INDEX idx_seikyu_main_skyym ON tbl_seikyu_main USING btree (hospnum, skyym, skykbn);


CREATE TABLE tbl_rececom (
    ptid numeric(10,0) NOT NULL,
    nyugaikbn character(1) DEFAULT '0'::bpchar NOT NULL,
    sryka character(2) NOT NULL,
    sryym character(6) NOT NULL,
    hkncombi numeric(4,0) NOT NULL,
    srydd character(2) NOT NULL,
    sjkbn character(2) NOT NULL,
    "comment" character varying(1600),
    termid character varying(16),
    opid character varying(16),
    creymd character(8),
    upymd character(8),
    uphms character(6),
    hospnum numeric(2,0) NOT NULL
);

COMMENT ON TABLE tbl_rececom IS 'レセプトコメント';

ALTER TABLE ONLY tbl_rececom
    ADD CONSTRAINT tbl_rececom_primary_key PRIMARY KEY (hospnum, ptid, nyugaikbn, sryka, sryym, hkncombi, srydd, sjkbn);


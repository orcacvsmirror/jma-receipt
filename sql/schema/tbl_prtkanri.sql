CREATE TABLE "tbl_prtkanri" (
	"tbl_key" character(8) NOT NULL,
	"rennum" numeric(4,0) DEFAULT 0 NOT NULL,
	"tbl_group" character(14) NOT NULL,
	"shori_rennum" numeric(4,0) DEFAULT 0 NOT NULL,
	"shellid" character varying(20),
	"sryym" character varying(6),
	"skyymd" character varying(8),
	"priority" numeric(4,0) DEFAULT 0,
	"page" numeric(5,0) DEFAULT 0,
	"prtflg" character(1),
	"title" character varying(100),
	"termid" character varying(32),
	"opid" character varying(16),
	"prtnm" character varying(16),
	Constraint "tbl_prtkanri_primary_key" Primary Key ("tbl_key", "rennum", "tbl_group", "shori_rennum")
);

COMMENT ON TABLE "tbl_prtkanri" IS '��������';


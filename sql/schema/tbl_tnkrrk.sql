CREATE TABLE "tbl_tnkrrk" (
	"hospid" character(24) NOT NULL,
	"ptid" numeric(10,0) NOT NULL,
	"stymd" character(8) NOT NULL,
	"edymd" character(8),
	"termid" character varying(16),
	"opid" character varying(16),
	"creymd" character(8),
	"upymd" character(8),
	"uphms" character(6),
	Constraint "tbl_tnkrrk_primary_key" Primary Key ("hospid", "ptid", "stymd")
);

COMMENT ON TABLE "tbl_tnkrrk" IS 'ǯ������';


CREATE TABLE "tbl_yyk" (
	"hospid" character(24) NOT NULL,
	"srynaiyo" character(2) NOT NULL,
	"drcd" character(5) NOT NULL,
	"yykymd" character(8) NOT NULL,
	"keyyyktime" numeric(4,0) NOT NULL,
	"yykid" numeric(2,0) NOT NULL,
	"yykmaxcnt" numeric(3,0) DEFAULT 0,
	"yykcnt" numeric(3,0) DEFAULT 0,
	"yyktime" numeric(4,0) DEFAULT 0,
	"ptid" numeric(10,0) DEFAULT 0,
	"name" character varying(100),
	"sryka" character(2),
	"yykkbn" character(2),
	"kakren" character(2),
	"raiinzumi" character(1),
	"termid" character varying(16),
	"opid" character varying(16),
	"creymd" character(8),
	"upymd" character(8),
	"uphms" character(6),
	Constraint "tbl_yyk_primary_key" Primary Key ("hospid", "srynaiyo", "drcd", "yykymd", "keyyyktime", "yykid")
);

COMMENT ON TABLE "tbl_yyk" IS 'ͽ��';


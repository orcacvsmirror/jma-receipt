CREATE TABLE "tbl_dbkanri" (
	"kanricd" character(8) NOT NULL,
	"version" character varying(64),
	"dbsversion1" character varying(64),
	"dbsversion2" character varying(64),
	"dbrversion1" character varying(64),
	"dbrversion2" character varying(64),
	"termid" character varying(32),
	"opid" character varying(16),
	"creymd" character(8),
	"upymd" character(8),
	"uphms" character(6),
	Constraint "tbl_dbkanri_primary_key" Primary Key ("kanricd")
);

COMMENT ON TABLE "tbl_dbkanri" IS 'データベース管理情報';


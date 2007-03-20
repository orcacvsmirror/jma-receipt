CREATE TABLE tbl_syurrk (
    hospid character(24) NOT NULL,
    ptid numeric(10,0) NOT NULL,
    nyugaikbn character(1) NOT NULL,
    denpnum integer NOT NULL,
    syurrknum integer NOT NULL,
    syuedanum integer NOT NULL,
    joutaikbn character(1),
    sryka character(2),
    hkncombinum character(4),
    ssu_hknten integer DEFAULT 0,
    ssu_money integer DEFAULT 0,
    ssu_tgmoney integer DEFAULT 0,
    ssu_tgmoney_tax integer DEFAULT 0,
    sdo_hknten integer DEFAULT 0,
    sdo_money integer DEFAULT 0,
    sdo_tgmoney integer DEFAULT 0,
    sdo_tgmoney_tax integer DEFAULT 0,
    ztk_hknten integer DEFAULT 0,
    ztk_money integer DEFAULT 0,
    ztk_tgmoney integer DEFAULT 0,
    ztk_tgmoney_tax integer DEFAULT 0,
    tyk_hknten integer DEFAULT 0,
    tyk_money integer DEFAULT 0,
    tyk_tgmoney integer DEFAULT 0,
    tyk_tgmoney_tax integer DEFAULT 0,
    csy_hknten integer DEFAULT 0,
    csy_money integer DEFAULT 0,
    csy_tgmoney integer DEFAULT 0,
    csy_tgmoney_tax integer DEFAULT 0,
    syc_hknten integer DEFAULT 0,
    syc_money integer DEFAULT 0,
    syc_tgmoney integer DEFAULT 0,
    syc_tgmoney_tax integer DEFAULT 0,
    sjt_hknten integer DEFAULT 0,
    sjt_money integer DEFAULT 0,
    sjt_tgmoney integer DEFAULT 0,
    sjt_tgmoney_tax integer DEFAULT 0,
    msi_hknten integer DEFAULT 0,
    msi_money integer DEFAULT 0,
    msi_tgmoney integer DEFAULT 0,
    msi_tgmoney_tax integer DEFAULT 0,
    kns_hknten integer DEFAULT 0,
    kns_money integer DEFAULT 0,
    kns_tgmoney integer DEFAULT 0,
    kns_tgmoney_tax integer DEFAULT 0,
    gzu_hknten integer DEFAULT 0,
    gzu_money integer DEFAULT 0,
    gzu_tgmoney integer DEFAULT 0,
    gzu_tgmoney_tax integer DEFAULT 0,
    etc_hknten integer DEFAULT 0,
    etc_money integer DEFAULT 0,
    etc_tgmoney integer DEFAULT 0,
    etc_tgmoney_tax integer DEFAULT 0,
    ssn_hknten integer DEFAULT 0,
    ssn_money integer DEFAULT 0,
    ssn_tgmoney integer DEFAULT 0,
    ssn_tgmoney_tax integer DEFAULT 0,
    hou_hknten integer DEFAULT 0,
    hou_money integer DEFAULT 0,
    hou_tgmoney integer DEFAULT 0,
    hou_tgmoney_tax integer DEFAULT 0,
    nyn_hknten integer DEFAULT 0,
    nyn_money integer DEFAULT 0,
    nyn_tgmoney integer DEFAULT 0,
    nyn_tgmoney_tax integer DEFAULT 0,
    ryo_hknten integer DEFAULT 0,
    ryo_money integer DEFAULT 0,
    ryo_tgmoney integer DEFAULT 0,
    ryo_tgmoney_tax integer DEFAULT 0,
    total_hknten integer DEFAULT 0,
    total_money integer DEFAULT 0,
    total_tgmoney integer DEFAULT 0,
    total_tgmoney_tax integer DEFAULT 0,
    shohou_sai integer DEFAULT 0,
    tgmoney_tax_sai integer DEFAULT 0,
    jihi_1 integer DEFAULT 0,
    jihi_1_tax integer DEFAULT 0,
    jihi_2 integer DEFAULT 0,
    jihi_2_tax integer DEFAULT 0,
    jihi_3 integer DEFAULT 0,
    jihi_3_tax integer DEFAULT 0,
    jihi_4 integer DEFAULT 0,
    jihi_4_tax integer DEFAULT 0,
    jihi_5 integer DEFAULT 0,
    jihi_5_tax integer DEFAULT 0,
    jihi_6 integer DEFAULT 0,
    jihi_6_tax integer DEFAULT 0,
    jihi_7 integer DEFAULT 0,
    jihi_7_tax integer DEFAULT 0,
    jihi_8 integer DEFAULT 0,
    jihi_8_tax integer DEFAULT 0,
    jihi_9 integer DEFAULT 0,
    jihi_9_tax integer DEFAULT 0,
    jihi_10 integer DEFAULT 0,
    jihi_10_tax integer DEFAULT 0,
    jihi_total integer DEFAULT 0,
    jihi_total_tax integer DEFAULT 0,
    jihi_tax integer DEFAULT 0,
    rjn_ftn integer DEFAULT 0,
    koh_ftn integer DEFAULT 0,
    ykz_ftn integer DEFAULT 0,
    chosei integer DEFAULT 0,
    hkntekmoney integer DEFAULT 0,
    discount_kbn character(2),
    discount_money integer DEFAULT 0,
    rsishoshin_money integer DEFAULT 0,
    rsisaishin_money integer DEFAULT 0,
    rsisdo_money integer DEFAULT 0,
    rsietc_money integer DEFAULT 0,
    rsi_tax_sai integer DEFAULT 0,
    rsi_total integer DEFAULT 0,
    rsijibai_skymoney integer DEFAULT 0,
    skymoney_tax_sai integer DEFAULT 0,
    skymoney integer DEFAULT 0,
    rmsagaku integer DEFAULT 0,
    rmsagaku_tax_sai integer DEFAULT 0,
    ryoyohi_skj integer DEFAULT 0,
    skymoney_skj integer DEFAULT 0,
    skymoney_skj_tax integer DEFAULT 0,
    skymoney_skj_kei integer DEFAULT 0,
    ryoyohi_skj_jihi integer DEFAULT 0,
    skymoney_skj_jihi integer DEFAULT 0,
    skymoney_skj_jihi_tax integer DEFAULT 0,
    skymoney_skj_jihi_kei integer DEFAULT 0,
    ryoyohi_life integer DEFAULT 0,
    skymoney_life integer DEFAULT 0,
    skymoney_life_tax integer DEFAULT 0,
    skymoney_life_kei integer DEFAULT 0,
    ryoyohi_life_jihi integer DEFAULT 0,
    skymoney_life_jihi integer DEFAULT 0,
    skymoney_life_jihi_tax integer DEFAULT 0,
    skymoney_life_jihi_kei integer DEFAULT 0,
    termid character varying(16),
    opid character varying(16),
    creymd character(8),
    upymd character(8),
    uphms character(6)
);

ALTER TABLE ONLY tbl_syurrk
    ADD CONSTRAINT tbl_syurrk_primary_key PRIMARY KEY (hospid, ptid, nyugaikbn, denpnum, syurrknum, syuedanum);

COMMENT ON TABLE tbl_syurrk IS '��Ǽ����';


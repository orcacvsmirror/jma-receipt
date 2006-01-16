#!/bin/sh

if test -z "$JMARECEIPT_ENV" ; then
    JMARECEIPT_ENV="./etc/jma-receipt.env"
fi
if ! test -f "$JMARECEIPT_ENV"; then
    exit 0
fi

. $JMARECEIPT_ENV

MEDPHOTOTEMP="/tmp/medphoto"

#-------------------------------------------#
#    薬剤情報マスタ医薬品写真複写処理
#        
#	引数より
#        $1  SRYCD 医薬品コード（９桁）
#        $2  複写元 写真ファイル名
#        $3  複写先フォルダ
#        $4  JOBID 
#        $5  SHELLID
#
#       複写元ファイルの場所は環境変数より
#        $MEDPHOTOTEMP
#-------------------------------------------#
##      複写元ファイルの存在チェック
        if  [ -e $MEDPHOTOTEMP/$2 ]; then
	    echo $3/$1-$2
            cp $MEDPHOTOTEMP/$2 $3/$1-$2
        fi

	$DBSTUB -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE$4$5
	
	exit 

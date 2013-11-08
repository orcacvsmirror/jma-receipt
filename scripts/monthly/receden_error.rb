#!/usr/bin/ruby 

require "monthly/receden_common"
require "nkf"

$KCODE = "UTF-8"

class Receden_error < Receden_common

  class Erorr_info

    attr_accessor    :recenum,:receline,:recesbt,:ptnum,:name,:birthday,:sryym,:nyugaikbn,:hbtnum,:hknjanum,:honkzkkbn,:errcd,:recid,:line,:rownum,:label,:value,:msg,:header,:footer,:data

    def initialize
      @recenum=""
      @receline=0
      @recesbt=""
      @ptnum=""
      @name=""
      @birthday=""
      @sryym=""
      @nyugaikbn=""
      @hbtnum=["","","","",""]
      @hknjanum=""
      @honkzkkbn=""
      @errcd=""
      @recid=""
      @line=0
      @rownum=0
      @label=""
      @value=""
      @msg=""
      @header=""
      @footer=""
      @data=""
    end
  end

  def initialize
    @info=Recinfo.new
    @errors=Array.new
  end

  def empty?
    @errors.empty?
  end

  def push(errcd,*args)

    rece=args[0]
    csv=args[1]
    name=args[2]
    if csv && name && csv.hash.key?(name)
      key = csv[name].name
    end
    header=args[3]
    footer=args[4]
    info=nil

    err=Erorr_info.new

    if csv.nil?
    else
      err.line=csv.line
      err.receline=csv.receline
      err.data=csv.rows.join(",")
      if csv.hash.key?("RECID")
        err.recid=csv["RECID"].value
        id=csv["RECID"].value
        if id =~ /^(1|2|3|4|8|11|12|13|14)$/
          id="SAI"
        end
        if @info.rec.key?(id)
          if @info[id].hash.key?(key)
            err.label =@info[id].hash[key].label
            err.value =csv[key].value
            err.rownum=@info[id].hash[key].rownum + 1
          end
        end
      end
    end

    if rece.nil?
    else
      rece.re.each{|re|

        err.ptnum   =re["PTNUM"].hankaku
        err.recenum =re["RECENUM"].hankaku
        err.name    =re["NAME"].zenkaku
        err.birthday=re["BIRTHDAY"].wtos
        err.sryym   =re["SRYYM"].wtos[0,6]
        err.recesbt =re["RECESBT"].value

        if rece.sbt.exists?
          err.nyugaikbn=rece.sbt.nyugai
          err.honkzkkbn=rece.sbt.honkzk
        end

        rece.ho.each{|ho|
          err.hbtnum[0] =ho["HKNJANUM"].hankaku
          err.hknjanum  =ho["HKNJANUM"].hankaku
          break
        }

        rece.ko.each_with_index{|ko,i|
          err.hbtnum[i+1] =ko["FTNNUM"].hankaku
          break if i >= 3
        }
        break
      }
    end

    if header.nil?
    else
       err.header = header
    end

    if footer.nil?
    else
       err.footer = footer
    end

    err.errcd=errcd
    case errcd
    when "19100"
      err.msg="レセプト番号が６桁以内の数字ではありません。"
    when "19170"
      err.msg="レセプト番号が「１」からの昇順ではありません。"
    when "19230"
      err.msg="医療機関情報レコードの次レコードがレセプト共通レコード以外です。"
    when "19281"
      err.msg="医療機関情報レコードが記録されていません。"
    when "19282"
      err.msg="医療機関情報レコードが複数記録されています。"
    when "19283"
      err.msg="レセプト共通レコードが記録されていません。"
    when "19284"
      err.msg="請求年月が正しい暦年月ではありません。"
    when "21111"
      err.msg="請求データ内に履歴管理ブロックが記録されているか又は履歴管理ブロック内に請求データが記録されています。"
    when "21120"
      err.msg="レコード管理情報レコードの項目数が「５」ではありません。"
    when "21130"
      err.msg="レコード管理情報レコードの行番号が５桁以内の数字ではありません。"
    when "21140"
      err.msg="レコード管理情報レコードの枝番号が３桁以内の数字ではありません。"
    when "21150"
      err.msg="レコード管理情報レコードの管理番号のレコード識別が「ＲＣ」ではありません。"
    when "21160"
      err.msg="レコード管理情報レコードの管理情報が１００桁以内の英数字ではありません。"
    when "21200"
      err.msg="請求データと履歴管理ブロックの検索番号が一致していません。又は検索番号不備です。"
    when "21500"
      err.msg="請求できないレセプト種別が記録されました。"
    when "21590"
      err.msg="当該診療年月のレセプトは、翌月以降に請求可能となります。"
    when "21600"
      err.msg="診療年月が正しい暦年月ではありません。"
    when "21620"
      err.msg="被保険者証番号が記録されていません。"
    when "21630"
      err.msg="被保険者証記号にスペースが含まれています。"
    when "21640"
      err.msg="被保険者証番号にスペースが含まれています。"
    when "21650"
      err.msg="レセプト特記事項の桁数が２桁の倍数ではありません。"
    when "21660"
      err.msg="レセプト病棟区分の桁数が２桁の倍数ではありません。"
    when "21670"
      err.msg="保険者番号の記録が誤っています。"
    when "21680"
      err.msg="傷病名レコードの修飾語コードの桁数が４桁の倍数ではありません。"
    when "21690"
      err.msg="公費負担者番号の法別が医療観察の場合、公費単独レセプト以外又は公費受給者番号が記録されています。"
    when "21711"
      err.msg="公費受給者番号が記録されていません。"
    when "22020"
      err.msg="１レセプトに対し１００レコード以上の傷病名レコードが記録されています。９９レコードを超える傷病名レコードは記録できません。"
    when "23020"
      err.msg="当該レセプト種別に使用できない負担区分が記録されています。"
    when "23030"
      err.msg="当該レセプト種別に使用できない診療種別が記録されています。"
    when "23040"
      err.msg="適用レコードに記録できないコードが記録されています。"
    when "23060"
      err.msg="診療種別が昇順に記録されていません。"
    when "23070"
      err.msg="適用レコードに記録できないコメントコードが記録されています。"
    when "23110"
      err.msg="適用レコードの回数が記録されていないか又は０が記録されています。"
    when "23120"
      err.msg="点数・回数算定単位（剤）内の回数が一致していません。"
    when "23130"
      err.msg="適用レコードの算定日情報（回数）に０が記録されています。"
    when "23140"
      err.msg="点数・回数算定単位（剤）内の算定日情報（回数）が一致していません。"
    when "23150"
      err.msg="算定日情報（回数）の合計値と回数が一致していません。"
    when "23170"
      err.msg="算定日情報（回数）が正しい暦日に記録されていません。"
    when "23200"
      err.msg="日計表情報が記録されています。"
    when "23300"
      err.msg="老人レコードが記録されています。"
    when "23800"
      err.msg="コメントデータの修飾語コードの桁数が４の倍数ではありません。"
    when "23810"
      err.msg="コメントレコード以外で診療識別「０１」「９９」に記録されています。"
    when "23820"
      err.msg="１レセプト内に１０００レコード以上の症状詳記レコードが記録されています。９９９レコードを超える症状詳記レコードは記録できません。"
    when "23830"
      err.msg="レセプト内で先頭の症状詳記レコードに症状詳記区分が記録されていません。"
    when "23840"
      err.msg="使用できない症状詳記区分が記録されています。"
    when "23860"
      err.msg="適用情報レコードのコメントデータの修飾語コードの桁数が４の倍数ではありません。"
    when "23870"
      err.msg="適用情報レコードのコメントデータの修飾語コード数が６以上記録されています。５コードを超える修飾語コードは記録できません。"
    when "23880"
      err.msg="適用情報レコードのコメントコードが記録されていません。"
    when "23950"
      err.msg="使用できない医薬品コードが記録されています。"
    when "25390"
      err.msg="次の項目に、記録可能な桁数を超えるデータが記録されています。"
    when "25420"
      err.msg="レコードの項目数がレコード識別情報と一致しません。"
    when "25430"
      err.msg="次の項目の記録モードが誤っています。"
    when "25441"
      err.msg="次の項目に外字が記録されています。"
    when "25470"
      err.msg="保険者レコードが複数記録されています。"
    when "25521"
      err.msg="レセプト種別に対して、保険者レコード数または公費レコード数が一致しません。"
    when "25530"
      err.msg="当該項目の桁数が不足しています。"
    when "25540"
      err.msg="傷病名レコードが記録されていません。"
    when "25550"
      err.msg="適用レコードが記録されていません。"
    when "30010"
      err.msg="患者氏名が記録されていません。"
    when "30110"
      err.msg="当該レセプト種別では特記事項に「１７」（上位）は記録できません。"
    when "30120"
      err.msg="当該レセプト種別では特記事項に「１８」（一般）「１９」（低所）は記録できません。"
    when "30130"
      err.msg="当該レセプト種別では特記事項に「２２」（多上）は記録できません。"
    when "30140"
      err.msg="当該レセプト種別では特記事項に「２３」（多一）「２４」（多低）は記録できません。"
    when "30150"
      err.msg="特記事項に「２２」（多上）「２３」（多一）「２４」（多低）は記録できません。"
    when "30160"
      err.msg="特記事項に所得区分が記録されていますが、特定疾患医療がありません。"
    when "30170"
      err.msg="当該入院レセプトでは、特記事項に「９６」（災１）は記録できません。０点以外の公費点数が記録されています。"
    when "30180"
      err.msg="当該入院外レセプトでは、特記事項に「９６」（災１）は記録できません。入院外の被災者レセプトは、医保と公費の併用では請求できません。"
    when "30210"
      err.msg="入院年月日が正しい暦年月日で記録されていません。"
    when "30220"
      err.msg="診療年月以降の入院年月日が記録されています。"
    when "30230"
      err.msg="生年月日以前の入院年月日が記録されています。"
    when "30310"
      err.msg="診療実日数を記録してください。"
    when "30320"
      err.msg="第一公費診療実日数を記録してください。"
    when "30330"
      err.msg="第二公費診療実日数を記録してください。"
    when "30350"
      err.msg="第三公費診療実日数を記録してください。"
    when "30360"
      err.msg="第四公費診療実日数を記録してください。"
    when "30810"
      err.msg="第四公費負担者番号と第四公費受給者番号の組み合わせが重複しています。"
    when "30830"
      err.msg="第四公費に、併用レセプトでは請求できない公費負担者番号が記録されています。"
    when "30840"
      err.msg="第二公費負担者番号と第二公費受給者番号の組み合わせが重複しています。"
    when "30860"
      err.msg="第三公費負担者番号と第三公費受給者番号の組み合わせが重複しています。"
    when "30930"
      err.msg="第一公費に、併用レセプトでは請求できない公費負担者番号が記録されています。"
    when "30940"
      err.msg="第二公費に、併用レセプトでは請求できない公費負担者番号が記録されています。"
    when "30960"
      err.msg="第三公費に、併用レセプトでは請求できない公費負担者番号が記録されています。"
    when "30980"
      err.msg="公費負担者番号の記録優先順位が誤っています。"
    when "31030"
      err.msg="請求権消滅時効のレセプトです。"
    when "31050"
      err.msg="当該レセプト種別では特記事項に「２０」（二割）は記録できません。"
    when "31060"
      err.msg="特記事項に「０２」（長）と「１６」（長２）、「０２」（長）と「０３」（長処）、または「１６」（長２）と「０３」（長処）の組み合わせが同時に記録されています。いずれか一つのみ記録してください。"
    when "31160"
      err.msg="職務上の事由に誤ったコードが記録されています。"
    when "31170"
      err.msg="当該レセプト種別では特記事項に「２１」（高半）は記録できません。"
    when "31180"
      err.msg="当該診療年月では特記事項に「１５」（経過）は記録できません。"
    when "31190"
      err.msg="病棟区分に誤ったコードが記録されています。"
    when "31280"
      err.msg="特記事項に所得区分が複数種類記録されています。いずれか一つのみ記録してください。"
    when "31290"
      err.msg="未就学者に該当しない年齢です。"
    when "31300"
      err.msg="未就学者に該当する年齢です。"
    when "31330"
      err.msg="男女区分に誤ったコードが記録されています。"
    when "31350"
      err.msg="診療年月以降の生年月日が記録されています。"
    when "31380"
      err.msg="高齢受給者または後期高齢者に該当する年齢です。"
    when "31400"
      err.msg="本人の資格年齢（１５歳以上）に達していません。"
    when "31430"
      err.msg="高齢受給者に該当しない年齢です。"
    when "31450"
      err.msg="生年月日が正しい暦年月日で記録されていません。"
    when "31460"
      err.msg="被保険者証番号部に数字の記録がありません。"
    when "31480"
      err.msg="協会管掌（法別０１）の被保険者証記号に数字７桁又は８桁以外が記録されています。"
    when "31500"
      err.msg="協会管掌（法別０１）の被保険者証番号が７桁以内の数字ではありません。"
    when "31520"
      err.msg="第一公費の受給者番号が誤っています。"
    when "31550"
      err.msg="第二公費の受給者番号が誤っています。"
    when "31580"
      err.msg="第三公費の受給者番号が誤っています。"
    when "31590"
      err.msg="第四公費の受給者番号が誤っています。"
    when "31710"
      err.msg="被保険者証の記号に「都」、「都任継」以外の漢字、数字、平仮名、カタカナまたはアルファベットが記録されています。"
    when "31720"
      err.msg="被保険者証の記号の記録が必要な保険者ですが、被保険者証記号が記録されていません。"
    when "31750"
      err.msg="被保険者証の番号が数字８桁に規定されている保険者ですが、数字の桁数が８桁以外です。"
    when "31760"
      err.msg="当該レセプト種別では当該管掌の請求はできません。"
    when "31770"
      err.msg="被保険者証の記号が数字のみの保険者ですが、被保険者証記号に数字以外が記録されています。"
    when "31980"
      err.msg="船員保険（法別０２）の被保険者証記号が１０桁以内の数字でありません。"
    when "31990"
      err.msg="船員保険（法別０２）の被保険者証番号に数字以外が記録されました。"
    when "32010"
      err.msg="診療実日数が当該診療月の日数を超えています。"
    when "32020"
      err.msg="第一公費の診療実日数が当該診療月の日数を超えています。"
    when "32030"
      err.msg="第二公費の診療実日数が当該診療月の日数を超えています。"
    when "32040"
      err.msg="存在しない傷病名コードが記録されています。"
    when "32050"
      err.msg="存在しない修飾語コードが記録されています。"
    when "32060"
      err.msg="診療年月以降の診療開始日が記録されています。"
    when "32070"
      err.msg="診療開始日が正しい暦年月日で記録されていません。"
    when "32080"
      err.msg="転帰区分に誤ったコードが記録されています。"
    when "32090"
      err.msg="未コード化傷病名の傷病名称が記録されていません。"
    when "32120"
      err.msg="第三公費の診療実日数が当該診療月の日数を超えています。"
    when "32130"
      err.msg="第四公費の診療実日数が当該診療月の日数を超えています。"
    when "32200"
      err.msg="主傷病コードに誤ったコードが記録されています。"
    when "32210"
      err.msg="生年月日以前の診療開始日が記録されています。"
    when "32220"
      err.msg="生年月日以前の算定日が記録されています。"
    when "33031"
      err.msg="存在しないか又は現在有効でない適用コード（診療コード、医薬品コード、特定器材コード又はコメントコード）が記録されています。"
    when "33040"
      err.msg="きざみ計算診療行為の数量データが記録されていません。"
    when "33060"
      err.msg="減点医薬品の減点点数が記録されていません。"
    when "33070"
      err.msg="点数の記録が必要な箇所ですが、０又は点数が記録されていません。"
    when "33071"
      err.msg="点数の記録が必要な箇所ですが、点数が記録されていません。"
    when "33090"
      err.msg="医薬品の使用量が記録されていません。"
    when "33110"
      err.msg="特定器材の使用量が記録されていません。"
    when "33130"
      err.msg="特定器材の単価が記録されていません。"
    when "33160"
      err.msg="未コード化特定器材です。特定器材名称、商品名及び規格又はサイズのどちらかを記録してください。"
    when "33170"
      err.msg="記録された数量データが下限値以下のため点数計算ができません。"
    when "33190"
      err.msg="減点医薬品のコードのみで記録してください。"
    when "33800"
      err.msg="請求点数の計算結果がマイナスになっています。"
    when "33930"
      err.msg="存在しない修飾語コードがコメントに記録されています。"
    when "34380"
      err.msg="文字データの記録が必要なコメントコードですが、文字データが記録されていません。"
    when "34390"
      err.msg="文字データが数字のみ有効のコメントコードですが、文字データに数字以外が含まれています。"
    when "34400"
      err.msg="記録された文字データの桁数が、当該コメントに記録すべき文字データの桁数と一致しないため、コメントが正しく作成できません。"
    when "34410"
      err.msg="適用レコードコメントのコメントコードは文字データの記録が必要ですが、文字データが記録されていません。"
    when "34440"
      err.msg="適用レコードコメントのコメントコードは文字データが数字のみ有効ですが、文字データに数字以外が含まれています。"
    when "34470"
      err.msg="適用レコードコメントに記録された文字データの桁数が、当該コメントに記録すべき文字データの桁数と一致しないため、コメントが正しく作成できません。"
    when "34500"
      err.msg="適用レコードコメントに存在しないコメントコードが記録されています。"
    when "34590"
      err.msg="存在しない修飾語コードが適用レコードコメントに記録されています。"
    when "34650"
      err.msg="特定器材の単位コードに誤ったコードが記録されています。"
    when "34900"
      err.msg="食事・生活欄以外に食事・生活療養費関連のコードが記録されています。"
    when "34910"
      err.msg="食事・生活欄に食事・生活以外の診療行為が記録されました。"
    when "34950"
      err.msg="食事・生活欄に医薬品・特定器材が記録されました。"
    when "34960"
      err.msg="生活療養費が記録できないレセプト種別又は６５歳未満の患者に対し生活療養費が記録されました。"
    when "35140"
      err.msg="減免区分が「１」（減額）以外で、減額割合が記録されました。"
    when "35150"
      err.msg="減免区分が「１」（減額）以外で、減額金額が記録されました。"
    when "35200"
      err.msg="減免区分に規定外の数字が記録されました。"
    when "35210"
      err.msg="減額割合に減額範囲外の割合（％）が記録されました。"
    when "35280"
      err.msg="減額割合と減額金額の両方が記録されました。"
    when "35300"
      err.msg="現役並み所得者のレセプトに一部負担金・食事療養費・生活療養費標準負担額区分コードが記録されています。"
    when "35310"
      err.msg="食事療養回数が当月日数×３食分を超えています。"
    when "35320"
      err.msg="第一公費食事療養回数が当月日数×３食分を超えています。"
    when "35330"
      err.msg="第二公費食事療養回数が当月日数×３食分を超えています。"
    when "35340"
      err.msg="食事療養回数が診療実日数×３食分を超えています。"
    when "35350"
      err.msg="第一公費食事療養回数が第一公費診療実日数×３食分を超えています。"
    when "35360"
      err.msg="第二公費食事療養回数が第二公費診療実日数×３食分を超えています。"
    when "35370"
      err.msg="一部負担金・食事療養費・生活療養費標準負担額区分に誤ったコードが記録されています。"
    when "35390"
      err.msg="一部負担金・食事療養費・生活療養費標準負担額区分に誤ったコードが記録されています。"
    when "35410"
      err.msg="第三公費食事療養回数が当月日数×３食分を超えています。"
    when "35420"
      err.msg="第四公費食事療養回数が当月日数×３食分を超えています。"
    when "35430"
      err.msg="第三公費食事療養回数が第三公費診療実日数×３食分を超えています。"
    when "35440"
      err.msg="第四公費食事療養回数が第四公費診療実日数×３食分を超えています。"
    when "35500"
      err.msg="特記事項に「１９」（低所）が記録されていますが、標準負担額区分が記録されていません。"
    when "36390"
      err.msg="病床数の記録が必要です。"
    when "43230"
      err.msg="単位コードの記録が必要な特定器材ですが、単位コードが記録されていません。"
    when "46120"
      err.msg="同時算定不可の注加算が記録されています。"
    when "46410"
      err.msg="注加算の記録順序が誤っています。"
    when "44350"
      err.msg="通則加算が記録されましたが、基本手技が記録されていません。"
    when "44360"
      err.msg="通則加算と注加算の記録順が誤っています。"
    when "44550"
      err.msg="診療開始日以前の算定日が記録されています。"
    when "45010"
      err.msg="請求点数が誤っています。"
    when "45020"
      err.msg="第一公費の請求点数が誤っています。"
    when "45030"
      err.msg="第二公費の請求点数が誤っています。"
    when "45250"
      err.msg="第三公費の請求点数が誤っています。"
    when "45260"
      err.msg="第四公費の請求点数が誤っています。"
    when "45340"
      err.msg="食事療養費の請求額が誤っています。"
    when "45340"
      err.msg="食事療養費の請求額が誤っています。"
    when "45350"
      err.msg="第一公費食事療養費の請求額が誤っています。"
    when "45360"
      err.msg="第二公費食事療養費の請求額が誤っています。"
    when "45640"
      err.msg="第三公費食事療養費の請求額が誤っています。"
    when "45650"
      err.msg="第四公費食事療養費の請求額が誤っています。"
    when "46340"
      err.msg="初診料の算定回数が算定可能回数を超えています。"
    end

    @errors << err

  end

  def write(outfile)
    open(outfile,"w"){|f|
      @errors.each_with_index{|err,i|
        errdata =  sprintf("<ERR_RECENUM>%s</ERR_RECENUM>",err.recenum)
        errdata << sprintf("<ERR_PTNUM>%s</ERR_PTNUM>",err.ptnum)
        errdata << sprintf("<ERR_NAME>%s</ERR_NAME>",err.name)
        errdata << sprintf("<ERR_BIRTHDAY>%s</ERR_BIRTHDAY>",err.birthday)
        errdata << sprintf("<ERR_SRYYM>%s</ERR_SRYYM>",err.sryym)
        errdata << sprintf("<ERR_NYUGAIKBN>%s</ERR_NYUGAIKBN>",err.nyugaikbn)
        errdata << sprintf("<ERR_HBTNUM1>%s</ERR_HBTNUM1>",err.hbtnum[0])
        errdata << sprintf("<ERR_HBTNUM2>%s</ERR_HBTNUM2>",err.hbtnum[1])
        errdata << sprintf("<ERR_HBTNUM3>%s</ERR_HBTNUM3>",err.hbtnum[2])
        errdata << sprintf("<ERR_HBTNUM4>%s</ERR_HBTNUM4>",err.hbtnum[3])
        errdata << sprintf("<ERR_HBTNUM5>%s</ERR_HBTNUM5>",err.hbtnum[4])
        errdata << sprintf("<ERR_HKNJANUM>%s</ERR_HKNJANUM>",err.hknjanum)
        errdata << sprintf("<ERR_HONKZKKBN>%s</ERR_HONKZKKBN>",err.honkzkkbn)
        errdata << sprintf("<ERR_RECESBT>%s</ERR_RECESBT>",err.recesbt)
        errdata << sprintf("<ERR_ERRCD>%s</ERR_ERRCD>",err.errcd)
        errdata << sprintf("<ERR_RECID>%s</ERR_RECID>",err.recid)
        errdata << sprintf("<ERR_RECELINE>%d</ERR_RECELINE>",err.receline)
        errdata << sprintf("<ERR_ROWNUM>%d</ERR_ROWNUM>",err.rownum)
        errdata << sprintf("<ERR_LABEL>%s</ERR_LABEL>",err.label)
        errdata << sprintf("<ERR_VALUE>%s</ERR_VALUE>",err.value)
        errdata << sprintf("<ERR_MSG>%s</ERR_MSG>",err.msg)
        errdata << sprintf("<ERR_HEADER>%s</ERR_HEADER>",err.header)
        errdata << sprintf("<ERR_FOOTER>%s</ERR_FOOTER>",err.footer)
        errdata << sprintf("<ERR_LINE>%d</ERR_LINE>",err.line)
        errdata << sprintf("<ERR_DATA>%s</ERR_DATA>",err.data)
        errdata << sprintf("\n",err.data)
        f.print NKF.nkf("-Wex -Lu", errdata)
      }
    }
  end

  def size
    @errors.size
  end

end

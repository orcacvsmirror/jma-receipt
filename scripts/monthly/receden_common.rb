#!/usr/bin/ruby
# coding : utf-8
Encoding.default_external = "euc-jp"

require "monthly/receden_common_const"
require "date"

$KCODE = "UTF-8"

class Csvline
  attr_accessor :receline,:line,:fileline,:rows,:hash

  def initialize
    @receline=0
    @line=0
    @receline=0
    @rows=Array.new
    @hash=Hash.new
  end

  def []=(name,value)
    if @hash[name]
      @hash[name] = value
    end
  end

  def [](name)
    if @hash[name]
      @hash[name]
    end
  end
end


class Receden_common < Receden_common_const

  def sjis_to_euc(s)
    s=Iconv.iconv("EUC-JP","Shift_JIS",s)[0]
    return s
  end

  def csv_to_hash(info,csv)
    id=Array.new
    rows=Array.new
    ary=Array.new
    info.rows.each{|rowinfo|
      id << rowinfo.name
      row=Recedata.new
      row.name = rowinfo.name
      rows << row
    }
    csv.rows.each_with_index{|s,i|
      rows[i] != nil && rows[i].value = s.to_s
    }
    ary=[id,rows].transpose
#    csv.hash=Marshal.load(Marshal.dump(Hash[*ary.flatten]))
    csv.hash=Hash[*ary.flatten]
    return csv
  end

  def hankaku(s)
    han_or_zen(s) != 0 && s = ""
    return s
  end

  def zenkaku(s)
    han_or_zen(s) != 1 && s = ""
    return s
  end

  def han_or_zen(s)
    ret = 2
    if s == nil
      ret = -1
    else
      #半角
      if s.to_s =~ /^[ -~｡-ﾟ]*$/
        ret = 0
      end
      #全角
      if s.to_s =~ /^[^ -~｡-ﾟ]*$/
        ret = 1
      end
      #文字がない場合も半角とする
      if s.to_s == ""
        ret = 0
      end
    end
    return ret
  end

  def num(s)
    !(s =~ /^[0-9]+$/) && s = nil
    return s
  end

  def wtos(wareki)

    ret = ""

    if wareki.length < 7
      wareki = sprintf("%s%s",wareki, "01")
    end

    if wareki =~ /^[0-9]{7}$/
    else
      return ret
    end

    gengo=["M","T","S","H"]
    if /[1234]/ =~ wareki[0,1]
      ret=Date.parse(sprintf("%s%s.%s.%s",gengo[wareki[0,1].to_i - 1],wareki[1,2],wareki[3,2],wareki[5,2])).to_s.gsub(/-/,'')
    end

    return ret

  rescue

    return ret
  end

end



class Recedata < Receden_common

  attr_accessor :name,:value

  def initialize
    @name=""
    @value=""
  end

  def hankaku
    super(@value)
  end

  def zenkaku
    super(@value)
  end

  def num
    super(@value)
  end

  def wtos
    super(@value.to_s)
  end

  def nissu

    ret = nil

    myday=wtos
    if myday != ""
      day_from = Date.new(myday[0,4].to_i, myday[4,2].to_i,myday[6,2].to_i)
      day_to   = day_from >> 1
      ret = day_to - day_from
    end

    return ret

  end

end

class Infodata

  attr_accessor :label,:name,:type,:maxsize,:fixed,:required,:rownum

  def initialize
    @label=""
    @name=""
    @type=""
    @maxsize=0
    @fixed=false
    @required=false
    @rownum=0
  end

  def fixed?
    @fixed
  end

  def required?
    @required
  end

end


class Rowsinfo

  attr_accessor :rows,:hash

  def initialize(recinfo)
    @rows=Array.new
    @hash=Hash.new

    recinfo.each_with_index{|info , i|
      item=Infodata.new
      item.label=info[0]
      item.name=info[1]
      item.type=info[2]
      item.maxsize=info[3]
      item.fixed=info[4]
      item.required=info[5]
      item.rownum=i
      @rows << item
      @hash[item.name] = item
    }
  end

end

class Recinfo < Receden_common_const

  attr_reader :rec

  def initialize
    @rec=Hash.new

    @rec["IR"]=Rowsinfo.new(IRrecord)
    @rec["RE"]=Rowsinfo.new(RErecord)
    @rec["HO"]=Rowsinfo.new(HOrecord)
    @rec["RO"]=Rowsinfo.new(ROrecord)
    @rec["KO"]=Rowsinfo.new(KOrecord)
    @rec["KH"]=Rowsinfo.new(KHrecord)
    @rec["SY"]=Rowsinfo.new(SYrecord)
    @rec["SI"]=Rowsinfo.new(SIrecord)
    @rec["IY"]=Rowsinfo.new(IYrecord)
    @rec["TO"]=Rowsinfo.new(TOrecord)
    @rec["CO"]=Rowsinfo.new(COrecord)
    @rec["NI"]=Rowsinfo.new(NIrecord)
    @rec["SJ"]=Rowsinfo.new(SJrecord)
    @rec["GO"]=Rowsinfo.new(GOrecord)
    @rec["SAI"]=Rowsinfo.new(SAIrecord)
    @rec["ETC"]=Rowsinfo.new(ETCrecord)

  end

  def [](value)
    @rec[value]
  end
end


class Recesbt < Receden_common_const

  attr_reader :sskkn,:nyugai,:sikaku,:honkzk

  def initialize(recesbt)

   @sskkn  = ""
   @nyugai = ""
   @sikaku = [0,0,0,0,0]
   @honkzk = ""
   @exists = true

   if RECESBT.key?(recesbt)
     @sskkn  = RECESBT[recesbt][0]
     @nyugai = RECESBT[recesbt][1]
     @sikaku = RECESBT[recesbt][2]
     @honkzk = RECESBT[recesbt][3]
   else
     @exists = false
   end
  end

  def exists?
    @exists
  end

  def ho_count
    return @sikaku[0]
  end

  def ko_count
    return @sikaku[1...@sikaku.size].select{|ko| ko == 1}.size
  end

end


class KoSort < Receden_common_const

  def KoSort.key?(hbtnum)
    KOSORT.key?(hbtnum)
  end

  def KoSort.tandoku?(hbtnum)
    KOSORT[hbtnum][0]
  end

  def KoSort.pty(hbtnum)
    KOSORT[hbtnum][1]
  end

end

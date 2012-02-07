#!/usr/bin/ruby

$KCODE="UTF8"

require 'nkf'
require 'zlib'

CODES = {
  NKF::ASCII     => "ASCII",
  NKF::UTF8      => "UTF8",
}

def textview(file,f)
  f.read.scan(/<dia:object type=\"(.*?)\"(.*?)<\/dia:object>/m).each{|type, obj|

    name=""
    value=""
    text_size=""
    column_size=""
    char_type1=""
    char_type2=""

    if type=="Embed - Text" || type=="Standard - Text" || type=="ORCA - TextCircle"
      name=obj.scan(/<dia:attribute name="embed_id">.*?<dia:string>#(.*?)#/m).join

      value=obj.scan(/<dia:attribute name="string">.*?<dia:string>#(.*?)#/m).join
      if CODES[ NKF.guess(value) ]  == "ASCII"
        char_type1 = "1"
      end

      char_type2=obj.scan(/<dia:attribute name="embed_char_type">.*?<dia:enum val="(.*?)"/m).join
	  if ( char_type2 == "" )
        char_type2 = "0"
      end

      font=obj.scan(/<dia:attribute name="font">.*?<dia:font .*?family=\"(.*?)\"/m).join
      style=obj.scan(/<dia:attribute name="font">.*?<dia:font .*?style=\"(.*?)\"/m).join

      text_size=obj.scan(/<dia:attribute name="embed_text_size">.*?<dia:int val="(.*?)"/m).join
	  if ( text_size == "" )
        text_size = "0"
      end

      column_size=obj.scan(/<dia:attribute name="embed_column_size">.*?<dia:int val="(.*?)"/m).join
	  if ( column_size == "" )
        column_size = "0"
      end

      puts "#{File.basename(file)},#{type},#{name},#{font},#{style},#{text_size},#{column_size},#{value.gsub(/\n/m,'\\n')},#{char_type1},#{char_type2}"
    end
  }
end


puts "redfile,object,id,font,style,text_size,column_size,text,text_type1,text_type2"

ARGV.each{|file|
  begin
    Zlib::GzipReader.open(file){|f|
      textview(file,f)
	}
  rescue
    File.open(file){|f|
      textview(file,f)
    }
  end  
}


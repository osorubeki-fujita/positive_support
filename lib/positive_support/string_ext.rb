class String
  alias :__to_s__ :to_s
  private :__to_s__
  undef :to_s

  def to_s( *args )
    to_strf( *args )
  end

end

module PositiveSupport::StringExt

  # インスタンスの情報を整形した文字列にして返すメソッド
  # @param indent [Integer (>=0)] インデントの幅
  # @return [String]
  # @note 配列やハッシュを変換するメソッドから呼び出される。
  def to_strf( indent = 0 )
    " " * indent + __to_s__
  end

  # バイナリか否かを判定するメソッド
  # @return [Boolean]
  # @note YAML でエラーが発生するのを防ぐために定義している。
  def is_binary_data?
    false # 日本語がバイナリとみなされるのを防ぐ
  end

  # 全角数字を半角数字に変換するメソッド
  # @return [String]
  def zen_num_to_han
    ::Moji.zen_to_han( self , ::Moji::ZEN_ALNUM )
  end

  # 全角アルファベットを半角アルファベットに変換するメソッド
  # @return [String]
  def zen_alphabet_to_han
    ::Moji.zen_to_han( self , ::Moji::ZEN_ALPHA )
  end

  # ひらがなの濁点を除去するメソッド
  def remove_dakuten
    h = {
      "が" => "か" ,
      "ぎ" => "き" ,
      "ぐ" => "く" ,
      "げ" => "け" ,
      "ご" => "こ" ,
      "ざ" => "さ" ,
      "じ" => "し" ,
      "ず" => "す" ,
      "ぜ" => "せ" ,
      "ぞ" => "そ" ,
      "だ" => "た" ,
      "ぢ" => "ち" ,
      "づ" => "つ" ,
      "で" => "て" ,
      "ど" => "と" ,
      "ば" => "は" ,
      "び" => "ひ" ,
      "ぶ" => "ふ" ,
      "べ" => "へ" ,
      "ぼ" => "ほ" ,
      "ぱ" => "は" ,
      "ぴ" => "ひ" ,
      "ぷ" => "ふ" ,
      "ぺ" => "へ" ,
      "ぽ" => "ほ"
    }

    gsub( /[#{h.keys.join}]/ , h )
  end

  def hour_and_min?
     ::PositiveSupport::RegexpLibrary.string_of_hour_and_min =~ self
  end
  
  alias :is_hour_and_min? :hour_and_min?

  def to_array_of_hour_and_min
    if hour_and_min?
      split( /\:/ ).map( &:to_i )
    else
      raise "Error: #{ self } (#{self.class.name}) is not valid."
    end
  end

  # ファイル名を処理するメソッド
  def convert_slash_to_yen
    gsub( /\\/ , "\/" )
  end

  # ファイル名を処理するメソッド
  def convert_yen_to_slash
    gsub( /\// , "\\" )
  end

  def convert_comma_between_number_to_dot
    gsub( /(\d+)、(\d+)/ ) { $1 + "・" + $2 }
  end

end
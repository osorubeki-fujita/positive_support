# 整数のクラス (Integer) に機能を追加するためのモジュール
module PositiveSupport::IntegerExt

  # n 桁（デフォルトは3桁）ごとに文字 separator （デフォルトは “,” ）で区切るメソッド
  # @return [String]
  def to_currency( n = 3 , separator = "," )
    to_s.reverse.gsub( /(\d{#{n}})(?=\d)/ , '\1' + separator ).reverse
  end

  # 16進数の文字列に変換するメソッド
  # @return [String]
  def to_two_digit_hex
    str = to_s(16)
    if str.length == 1
      "0" + str
    else
      str
    end
  end

  def meaningful?
    natural_number?
  end

end
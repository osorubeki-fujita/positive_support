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
  
  # @!group 文字列への変換

  # rjust, ljust を用いて，小数点の桁揃えを行うメソッド
  # @param [Integer (natural number)] int 整数部の桁数
  # @param [Integer (natural number)] float 小数部の桁数
  # @return [String (number)]
  # @raise [IndexError] left, right のいずれかまたは両方が自然数でない場合に発生するエラー
  def pjust( int: 4 , float: 3 )
    raise "Error" unless [ int , float ].all?( &:natural_number? )
    to_s.rjust( int ).ljust( float + 1)
  end
  
  # @!endgroup

end
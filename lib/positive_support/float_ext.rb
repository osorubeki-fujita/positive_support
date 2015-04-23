module PositiveSupport::FloatExt

  # @!group 文字列への変換

  # rjust, ljust を用いて，小数点の桁揃えを行うメソッド
  # @param [Integer (natural number)] int 整数部の桁数
  # @param [Integer (natural number)] float 小数部の桁数
  # @return [String (number)]
  # @raise [IndexError] left, right のいずれかまたは両方が自然数でない場合に発生するエラー
  def pjust( int: 4 , float: 3 )
    /\A(\d+)\.(\d+)/ =~ self.to_s
    $1.rjust( int ) + "\." + $2.ljust( float )
  end

  # @!endgroup

end
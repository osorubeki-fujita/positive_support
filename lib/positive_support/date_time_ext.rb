# 日付・時刻を扱うクラス DateTime に機能を追加するモジュール
module PositiveSupport::DateTimeExt

  extend ::ActiveSupport::Concern

  # （日本の）祝日か否かを判定するメソッド
  # @return [Boolean]
  # @note 現状では祝日の定義をはっきりさせていないため、必ず false を返すということにしておく。
  # @todo 休日の定義
  def holiday?
    false
  end

  # DateTime のインスタンスを、hh:mm の形の文字列に変換するメソッド
  # @return [String]
  def to_s_hour_and_min
    self.strftime( "%H\:%M" )
  end

  # 日付・時刻を扱うクラス DateTime にクラスメソッドを追加するためのモジュール
  module ClassMethods

    # hh:mm の形の文字列を、DateTime のインスタンスに変換するメソッド
    # @param str [String] 変換する文字列
    # @param time_now [DateTime] 生成されるインスタンスに年月日の情報を付加するためのインスタンス（デフォルトは現在時刻）
    # @return [DateTime]
    def convert_str( str , time_now = ::DateTime.now , time_zone: "+09:00" )
      rational_for_time_zone = ::Kernel.Rational(9,24)
      time_now = time_now.new_offset( rational_for_time_zone )

      if str.string? and time_now.instance_of?( ::DateTime ) and ::PositiveSupport::RegexpLibrary.string_of_hour_and_min =~ str
        return ::DateTime.new( time_now.year , time_now.month , time_now.day , $1.to_i , $2.to_i , 0 , rational_for_time_zone )
      end
      
      raise "Error: The variable(s) are not valid. (\'str\'\: #{str} / Class: #{str.class.name})"
    end

  end

end
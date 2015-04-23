module PositiveSupport::Checker::ErrorFactory

  # エラーメッセージの書式を整えるためのメソッド
  # @param str [String] エラーメッセージの基本部分
  # @return [String]
  # @since 2014.01.31
  def self.change_paragraph_and_indent( str , indent: 4 )
    prefix = "\n" + " " * indent
    unless str.string?
      raise prefix + "The variable \'str\' should be an instance of \'String Class\'."
    end
    raise prefix + str
  end

end
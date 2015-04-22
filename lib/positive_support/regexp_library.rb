module PositiveSupport::RegexpLibrary

  class << self

    def string_of_hour_and_min
      /\A( ?\d|\d{1,2})\:(\d{2})\Z/
    end

    # 括弧に対する正規表現（日本語）
    # @return [Regexp]
    def regexp_for_parentheses_ja
      /([\(（〈\|【].+[】\|〉）\)])$/
    end

    # quotation に対する正規表現
    # @return [Regexp]
    def regexp_for_quotation
      /('.+')$/
    end

  end

end
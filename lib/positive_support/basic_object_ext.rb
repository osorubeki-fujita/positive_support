module PositiveSupport::BasicObjectExt

  extend ::ActiveSupport::Concern

  module ClassMethods

    # @!group 名前空間に関するメソッド

    # 上位の名前空間のリスト（すべて）
    # @return [::Array]
    def upper_namespaces
        # eval( self.name.split( "::" )[0..-2].join( "::" ) )
        # Module.nesting[1]
      self.module_eval do
        current_namespace = self
        return ::Module.nesting
      end
    end

    # 上位の名前空間が存在するか否かを判定するメソッド
    # @return [Boolean]
    def has_upper_namespaces?
      upper_namespaces.length > 1
      # /\:\:/ === name
    end

    # 上位の名前空間のリスト（すぐ上のみ）
    # @return [::Class (Const)]
    def upper_namespace
      _upper_namespaces = upper_namespaces.length > 1
      if _upper_namespaces.length > 1
        _upper_namespaces[1]
      else
        nil
      end
    end

  end

  alias :meaningful? :present?

  # 数値か否かを判定するメソッド
  # @return [Boolean]
  def number?
    kind_of?( Numeric )
  end

  # 整数か否かを判定するメソッド
  # @return [Boolean]
  def integer?
    kind_of?( Integer )
  end

  def natural_number?
    integer? and self > 0
  end

  # 文字列か否かを判定するメソッド
  # @return [Boolean]
  def string?
    instance_of?( String )
  end

  # 真偽値か否かを判定するメソッド
  # @return [Boolean]
  def boolean?
    instance_of?( TrueClass ) or instance_of?( FalseClass )
  end

end
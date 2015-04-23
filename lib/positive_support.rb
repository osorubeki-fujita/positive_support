require "positive_support/version"

require "active_support"
require "active_support/core_ext"
require "moji"

[ :basic_object , :date_time , :time , :hash , :symbol , :integer , :float , :string ].each do | filename |
  require_relative "positive_support/#{ filename }_ext"
end

require_relative "positive_support/regexp_library"
require_relative "positive_support/checker"
require_relative "positive_support/checker/error_factory"

module PositiveSupport

  extend ::ActiveSupport::Concern

  included do

    [ :BasicObject  , :DateTime , :Time , :Hash , :Symbol , :Integer , :Float , :String ].each do | class_name |
      eval <<-INCLUDE
        ::#{ class_name }.class_eval do
          include ::PositiveSupport::#{ class_name }Ext
        end
      INCLUDE
    end

    ::DateTime.class_eval do
      include PositiveSupport::TimeExt
    end

    ::BasicObject.class_eval do
      include PositiveSupport::Checker
    end

  end

end

include PositiveSupport
require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.2.4"

describe PositiveSupport do
  it "has a version number \'#{ version }\'" do
    expect( PositiveSupport::VERSION ).to eq( version )
    expect( ::Deplo.version_check( PositiveSupport::VERSION , spec_filename ) ).to eq( true )
  end
end

require_relative 'positive_support_spec/basic_object_ext.rb'

describe String do
  it "is converted by PositiveSupport\#convert_meta_character_in_regexp" do

    str_1a = "\(123\) \[abc\] \{def\}"
    str_2a = "2.3 * 5 + 0.5 = 12.0"
    str_3a = "\\" + " 2.3 ?" + " | " + "3.4 ?"
    str_4a = "+"
    str_5a = "2.3 * 5 +"
    
    str_1b = [ "\\" , "\(123" ,"\\" , "\)" , " " , "\\" , "\[" , "abc" , "\\" , "\]" , " " , "\\" , "\{" , "def" , "\\" , "\}" ].join
    str_2b = [ "2" , "\\" , "\." , "3" , " " , "\\" , "*" , " " , "5" , " " , "\\" , "\+" , " " , "0" , "\\" , "\." , "5" , " " , "\=" , " " , "12" , "\\" , "\." , "0" ].join
    str_3b = [ "\\" , "\\" , " " , "2" , "\\" , "\." , "3" , " " , "\\" , "\?" , " " , "\\" , "\|" , " " , "3" , "\\" , "\." , "4" , " " , "\\" , "\?" ].join
    str_4b = [ "\\" , "+" ].join
    str_5b = [ "2" , "\\" , "\." , "3" , " " , "\\" , "*" , " " , "5" , " " , "\\" , "\+" ].join
    
    ary_a = [ str_1a , str_2a , str_3a , str_4a , str_5a ]
    ary_b = [ str_1b , str_2b , str_3b , str_4b , str_5b ]

=begin
    puts ary_a
    puts ""
    puts ary_b
=end

    [ ary_a , ary_b ].transpose.each do | str_a , str_b |
      expect( str_a.convert_meta_character_in_regexp ).to eq( str_b )
    end
  end

  it "is converted by PositiveSupport\#convert_comma_between_number_to_dot" do
    expect( "23、45".convert_comma_between_number_to_dot ).to eq( "23・45" )
    expect( "3、528".convert_comma_between_number_to_dot ).to eq( "3・528" )
    expect( "123、45、678、9".convert_comma_between_number_to_dot ).to eq( "123・45・678・9" )
  end
end
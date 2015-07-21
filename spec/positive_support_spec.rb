require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = ::File.open( "#{ ::File.dirname( __FILE__ ) }/../.current_version" , "r:utf-8" ).read.chomp

describe PositiveSupport do
  it "has a version number \'#{ version }\'" do
    expect( ::Deplo.version_check( PositiveSupport::VERSION , spec_filename ) ).to eq( true )
  end
end

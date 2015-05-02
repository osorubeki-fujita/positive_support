require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.3.2"

describe PositiveSupport do
  it "has a version number \'#{ version }\'" do
    expect( PositiveSupport::VERSION ).to eq( version )
    expect( ::Deplo.version_check( PositiveSupport::VERSION , spec_filename ) ).to eq( true )
  end
end

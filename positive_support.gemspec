# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'positive_support/version'

Gem::Specification.new do |spec|
  spec.name = "positive_support"
  spec.version = PositiveSupport::VERSION
  spec.authors = ["Shu Fujita"]
  spec.email = ["osorubeki.fujita@gmail.com"]

  spec.summary = "This gem contains all \'positive_xxxx_support\' gems and provides useful extensions to Ruby built-in libraries."
  # spec.description = %q{TODO: Write a longer description or delete this line.}
  spec.homepage = "https://github.com/osorubeki-fujita/positive_support"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
    # raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1.6"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_development_dependency "capistrano"
  spec.add_development_dependency "deplo", ">= 0.2.1"

  spec.add_runtime_dependency "activesupport" , ">= 4.2.1"

  spec.add_runtime_dependency "positive_basic_support" , ">= 0.2.0"
  spec.add_runtime_dependency "positive_number_support" , ">= 0.1.2"
  spec.add_runtime_dependency "positive_group_support" , ">= 0.1.2"
  spec.add_runtime_dependency "positive_string_support" , ">= 0.1.3"
  spec.add_runtime_dependency "positive_symbol_support" , ">= 0.1.2"
  spec.add_runtime_dependency "positive_time_support" , ">= 0.1.2"
  spec.add_runtime_dependency "positive_web_support" , ">= 0.3.2"

  spec.add_runtime_dependency "positive_kernel_support" , ">= 0.1.0"
end

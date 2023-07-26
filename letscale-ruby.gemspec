# frozen_string_literal: true



Gem::Specification.new do |spec|
  spec.name = "letscale-ruby"
  spec.version = '0.2.1'
  spec.authors = ["Arun"]
  spec.email = ["arun@starapps.studio"]

  spec.summary = "Gem to send log to letscale"
  spec.description = "This gem is used to send Dj logs to letscale-dev "
  spec.homepage = "https://rubygems.org/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

 

  spec.files  = [
    'lib/letscale_ruby/railtie.rb',
    'lib/letscale-ruby.rb',
    'lib/letscale_ruby/models/letscale_ruby.rb',
    'lib/letscale_ruby/config/clock.rb',
    'lib/letscale_ruby/lib/tasks/clockwork.rake',
    
  ]
  
  spec.add_runtime_dependency 'rails', '>=6.1'
  spec.add_runtime_dependency 'clockwork', '~> 3.0.2'
  spec.add_runtime_dependency 'rake', '~>13.0.6'

end

# frozen_string_literal: true



Gem::Specification.new do |spec|
  spec.name = "log_generator"
  spec.version = '0.1.0'
  spec.authors = ["Arun"]
  spec.email = ["arun@starapps.studio"]

  spec.summary = "Gem to generate log"
  spec.description = "This gem is used to send Dj logs to letscale-dev "
  spec.homepage = "https://rubygems.org/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "https://github.com/starapps-studio/shopify-domains"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https://github.com/starapps-studio/shopify-domains"
  # spec.metadata["changelog_uri"] = "https://github.com/starapps-studio/shopify-domains/blob/main/CHANGELOG.md"

  spec.files  = [
    'lib/log_generator/railtie.rb',
    'lib/log_generator.rb',
    'lib/log_generator/models/log_generator.rb',
    'lib/log_generator/config/clock.rb',
    'lib/log_generator/lib/tasks/clockwork.rake',
    
  ]
  
  spec.add_runtime_dependency 'rails', '~>6'
  spec.add_runtime_dependency 'clockwork', '~> 3.0.2'
  spec.add_runtime_dependency 'rake', '~>13.0.6'

end

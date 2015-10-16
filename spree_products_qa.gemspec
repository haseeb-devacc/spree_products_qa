# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_products_qa'
  s.version     = '0.0.1'
  s.summary     = 'Spree extension that adds Q&A support for products'
  s.description = 'Each product can have separate Q&A section. Registered users can ask a question, that admins answer.'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Netguru'
  s.email     = 'hi@netguru.co'
  s.homepage  = 'http://netguru.co'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.4.7.beta'
  s.add_dependency 'spree_backend', '~> 2.4.7.beta' #extension dependency 3.0.4
  s.add_dependency 'sidekiq' #extension dependency


  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry' #extension dependency
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "auth_eng/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "auth_eng"
  s.version     = AuthEng::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gustavo Lobo"]
  s.email       = ["gustavolobo90@gmail.com"]
  s.homepage    = "http://github.com/gustavolobo/AuthEng"
  s.summary     = "Authentication Engine"
  s.description = "AuthEng is just Devise only with a different flow."
  
  s.require_path = '.'
  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end

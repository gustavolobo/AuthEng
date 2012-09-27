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
  s.add_dependency "devise", "~> 2.1.2"
  s.add_dependency "delayed_job_active_record", "~> 0.3.2"
  s.add_dependency "formtastic", "~> 2.2.1"
  s.add_dependency "haml", "~> 3.1.7"
  s.add_dependency "haml-rails", "~> 0.3.5"
  s.add_dependency "rails3_acts_as_paranoid", "~> 0.2.4"
  s.add_dependency "cancan", "~> 1.6.8"
  
  s.add_development_dependency "sqlite3"
end

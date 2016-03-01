$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scopes_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scopes_rails"
  s.version     = ScopesRails::VERSION
  s.authors     = ["Pavel Kalashnikov"]
  s.email       = ["kalashnikovisme@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ScopesRails."
  s.description = "TODO: Description of ScopesRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"

  s.add_development_dependency "sqlite3"
end

$:.push File.expand_path("../lib", __FILE__)

require "scopes_rails/version"

Gem::Specification.new do |s|
  s.name        = "scopes_rails"
  s.version     = ScopesRails::VERSION
  s.authors     = ["Pavel Kalashnikov"]
  s.email       = ["kalashnikovisme@gmail.com"]
  s.homepage    = "https://github.com/kalashnikovisme/scopes_rails"
  s.summary     = "Summary of ScopesRails."
  s.description = "Description of ScopesRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"
end

$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "resp_timer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "resp_timer"
  s.version     = RespTimer::VERSION
  s.authors     = ["rafael"]
  s.email       = ["skcc321@gmail.com"]
  s.homepage    = "https://github.com/skcc321"
  s.summary     = "log request execution time."
  s.description = "log request execution time."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.2"

  s.add_development_dependency "sqlite3"
end

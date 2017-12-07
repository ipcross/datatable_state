$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "datatable_state/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "datatable_state"
  s.version     = DatatableState::VERSION
  s.authors     = ["ipcross"]
  s.email       = ["cross@vgg.ru"]
  s.homepage    = "https://github.com/ipcross/datatable_state"
  s.summary     = "Saving DataTables state to database"
  s.description = "Saving page lengths, search values, etc."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end

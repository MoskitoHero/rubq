require_relative "lib/rubq/version"

Gem::Specification.new do |spec|
  spec.name        = "rubq"
  spec.version     = Rubq::VERSION
  spec.authors     = ["Cédric Delalande"]
  spec.email       = ["weengs@moskitohero.com"]
  spec.homepage    = "TODO"
  spec.summary     = "TODO: Summary of Rubq."
  spec.description = "TODO: Description of Rubq."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
end

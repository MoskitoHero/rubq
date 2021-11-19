require_relative "lib/rubq/version"

Gem::Specification.new do |spec|
  spec.name        = "rubq"
  spec.version     = Rubq::VERSION
  spec.authors     = ["Cédric Delalande"]
  spec.email       = ["weengs@moskitohero.com"]
  spec.homepage    = "https://github.com/MoskitoHero/rubq"
  spec.summary     = "Rubq allows access to Google Bigquery the rails way."
  spec.description = "Here be dragons. This is still very much of a work in progress. Unusable for now."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "http://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/MoskitoHero/rubq"
  spec.metadata["changelog_uri"] = "https://github.com/MoskitoHero/rubq/blob/main/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
  spec.add_dependency "google-cloud-bigquery", "~> 1.27", ">= 1.27"
end

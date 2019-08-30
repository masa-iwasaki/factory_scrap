lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "factory_scrap/version"

Gem::Specification.new do |spec|
  spec.name = "factory_scrap"
  spec.version = FactoryScrap::VERSION
  spec.authors = ["Masatoshi Iwasaki"]
  spec.email = ["mstshiwasaki@gmail.com"]

  spec.summary = %q{FactoryScrap is a tool to convert factory definitions of FactoryBot to Rails fixtures partially.}
  spec.description = %q{FactoryScrap is a tool to convert factory definitions of FactoryBot to Rails fixtures partially.}
  spec.homepage = "https://github.com/masa-iwasaki/factory_scrap"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "factory_bot", ">= 5.0.2"
  spec.add_dependency "ruby_parser"
  spec.add_dependency "ruby2ruby"
  spec.add_dependency "method_source"
  # for Ruby 2.4
  spec.add_dependency "activesupport", "~> 5.0"

  spec.add_development_dependency "codecov"
end

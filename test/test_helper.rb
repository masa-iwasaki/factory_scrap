$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "factory_scrap"

require "minitest/autorun"

if ENV["CI"]
  require "simplecov"
  SimpleCov.start

  require "codecov"
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

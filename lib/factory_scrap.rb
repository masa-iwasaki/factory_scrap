require "yaml"
require "active_support"
require "factory_bot"
require "ruby_parser"
require "ruby2ruby"
require "method_source"

require "factory_scrap/version"
require "factory_scrap/base"
require "factory_scrap/fixture"

module FactoryScrap
  class Error < StandardError; end

  class << self
    def base
      @base ||= Base.new
    end

    delegate :reset,
      :dump_fixtures,
      to: :base
  end
end

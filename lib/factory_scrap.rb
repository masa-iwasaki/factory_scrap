require "yaml"

require "factory_bot"
require "ruby_parser"
require "ruby2ruby"

require "factory_scrap/version"
require "factory_scrap/base"
require "factory_scrap/fixture"

module FactoryScrap
  class Error < StandardError; end

  class << self
    def base
      @base ||= Base.new
    end

    delegate :load_factories,
      :convert_to_fixtures,
      :reset,
      :fixtures,
      to: :base
  end
end

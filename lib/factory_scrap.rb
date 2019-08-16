require "factory_bot"
require "factory_scrap/version"

module FactoryScrap
  class Error < StandardError; end

  class << self
    def load_factories(path: path)
      FactoryBot.find_definitions
    end
  end
end

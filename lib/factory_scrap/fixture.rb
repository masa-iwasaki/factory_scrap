module FactoryScrap
  class Fixture
    def initialize(factory, attributes)
      @factory = factory
      @attributes = attributes
      @fixture_hash = {}
      @fixture_hash[factory.name.to_s] = attributes
    end

    def to_yaml
      # Remove "---" at the beginning of a yaml text
      lines = @fixture_hash.to_yaml.split(/\n/)
      lines.shift
      lines.join("\n")
    end
  end
end

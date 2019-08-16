module FactoryScrap
  class Base
    attr_reader :factories, :fixtures

    def load_factories
      ::FactoryBot.find_definitions
      @factories = ::FactoryBot.configuration.factories
    end

    def reset
      ::FactoryBot.reset_configuration
      @factories = @fixtures = nil
    end

    def convert_to_fixtures
      @fixtures = {}

      @factories.each do |factory|
        attrs = {}

        factory.definition.declarations.each do |attr|
          key, statement = parse_declaration_block(attr)
          attrs[key.to_s] = statement
        end
        @fixtures[factory.name] = Fixture.new(factory, attrs)
      end
    end

    private

    def parse_declaration_block(attr)
      ruby = attr.instance_variable_get("@block")
      parser = RubyParser.new
      ruby2ruby = Ruby2Ruby.new
      sexp = parser.process(ruby.source)

      [
        sexp[1][2],
        "<%=" + ruby2ruby.process(sexp[3].deep_clone) + "%>",
      ]
    end
  end
end

module FactoryScrap
  class Base
    attr_reader :factories, :fixtures

    def reset
      ::FactoryBot.reset_configuration
      @factories = @fixtures = nil
    end

    def dump_fixtures(dir)
      reset
      load_factories
      convert_to_fixtures
      @fixtures.each_pair do |klass_name_sym, fixture|
        filename = klass_name_sym.to_s.pluralize
        path = Pathname.new(dir).join(filename + ".yml")
        File.write(path, fixture.to_yaml)
      end

      nil
    end

    private

    def parse_declaration_block(blk)
      parser = RubyParser.new
      ruby2ruby = Ruby2Ruby.new

      sexp = parser.process(blk.source)

      [
        sexp[1][2],
        "<%= " + ruby2ruby.process(sexp[3].deep_clone) + " %>",
      ]
    end

    def load_factories
      ::FactoryBot.find_definitions
      @factories = ::FactoryBot.configuration.factories
    end

    def convert_to_fixtures
      @fixtures = {}

      @factories.each do |factory|
        attrs = {}

        factory.definition.declarations.each do |attr|
          blk = attr.instance_variable_get("@block")
          next if blk.nil?
          key, statement = parse_declaration_block(blk)
          attrs[key.to_s] = statement
        end
        @fixtures[factory.name] = Fixture.new(factory, attrs)
      end
    end
  end
end

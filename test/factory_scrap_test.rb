require "test_helper"
require "pathname"

class FactoryScrapTest < Minitest::Test
  def setup
    FactoryScrap.reset
  end

  def test_that_it_has_a_version_number
    refute_nil ::FactoryScrap::VERSION
  end

  def test_loading_factory_definitions
    assert FactoryBot.configuration.factories.count.zero?

    FactoryScrap.load_factories

    assert_operator FactoryBot.configuration.factories.count, :>, 0
  end

  def test_exporting_factory_to_yaml
    FactoryScrap.load_factories
    FactoryScrap.convert_to_fixtures

    assert_equal FactoryScrap.fixtures[:user].to_yaml,
      load_file_fixture("users.yml").rstrip
  end

  private

  def load_file_fixture(path)
    path = Pathname.new(__FILE__).join("../fixtures/").join(path)

    # Remove final new line for strict comparison
    File.read(path).rstrip
  end
end

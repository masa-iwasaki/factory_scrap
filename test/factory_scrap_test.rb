require "test_helper"

class FactoryScrapTest < Minitest::Test
  FACTORY_PATH = "../factories".freeze

  def test_that_it_has_a_version_number
    refute_nil ::FactoryScrap::VERSION
  end

  def test_loading_factory_definitions
    assert FactoryBot.configuration.factories.count.zero?

    FactoryScrap.load_factories(path: FACTORY_PATH)

    assert_operator FactoryBot.configuration.factories.count, :>, 0
  end
end

require "test_helper"
require "pathname"

class FactoryScrapTest < Minitest::Test
  def setup
    FactoryScrap.reset
  end

  def test_that_it_has_a_version_number
    refute_nil ::FactoryScrap::VERSION
  end

  def test_dumping_fixtures
    Dir.mktmpdir do |tmpdir|
      FactoryScrap.dump_fixtures tmpdir
      dumped_yaml = File.read("#{tmpdir}/users.yml").rstrip
      assert_equal dumped_yaml, load_file_fixture("users.yml")
    end
  end

  private

  def load_file_fixture(path)
    path = Pathname.new(__FILE__).join("../fixtures/").join(path)

    # Remove final new line for strict comparison
    File.read(path).rstrip
  end
end

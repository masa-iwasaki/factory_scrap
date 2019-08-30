# See an article below to define factories without ORMs
# https://thoughtbot.com/blog/tips-for-using-factory-girl-without-an-orm

# Avoid to repeat defining a model class because this might be
# evaluated more than once during tests
unless defined?(User)
  class Blog
    attr_reader :title
  end

  class User
    attr_reader :name, :blog, :email

    def initialize(attrs)
      @name = attrs[:name]
      @blog = Blog.new(attrs[:blog])
    end
  end
end

FactoryBot.define do
  factory :blog do
    title { "MyBlog" }
    initialize_with { new(attributes) }
  end

  factory :user do
    name { "MyName" }

    # TODO: Use real AR objects to check bypassing associations
    # blog { attributes_for(:blog) }

    a_method_without_block

    initialize_with { new(attributes) }

    after(:create) do |obj|
      obj.email = "foo@example.com"
    end
  end
end

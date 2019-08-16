# See an article below to define factories without ORMs
# https://thoughtbot.com/blog/tips-for-using-factory-girl-without-an-orm

# Avoid to repeat defining a model class because this might be
# evaluated more than once during tests
unless defined?(User)
  class User
    attr_accessor :name
  end
end

FactoryBot.define do
  factory :user do
    name { "Amy" }
  end
end

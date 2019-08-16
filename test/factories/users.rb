# See an article below to define factories without ORMs
# https://thoughtbot.com/blog/tips-for-using-factory-girl-without-an-orm

class User
  attr_accessor :name
end

FactoryBot.define do
  factory :user do
    name { "Amy" }
  end
end

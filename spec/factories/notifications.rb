# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    body "MyString"
    read false
    association :user, factory: :user, strategy: :build
  end
end

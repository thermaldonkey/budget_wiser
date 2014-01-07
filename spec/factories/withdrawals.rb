# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :withdrawal do
    value 1.5
    association :pay_period, factory: :pay_period, strategy: :build
  end
end

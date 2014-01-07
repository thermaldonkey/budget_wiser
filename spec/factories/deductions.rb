# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deduction do
    value 1.5
    monthly_frequency 1
    association :user, factory: :user, strategy: :build
  end
end

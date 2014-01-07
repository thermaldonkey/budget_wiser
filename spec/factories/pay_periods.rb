# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pay_period do
    gross_income 1.5
    net_income 1.5
    savings 1.5
    end_date "2014-01-06"
    start_date "2014-01-06"
    association :user, factory: :user, strategy: :build
  end
end

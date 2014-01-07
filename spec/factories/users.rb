# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name              "Thermal Donkey"
    password          "sup3r$ecret"
    pay_days          ["Friday"]
    allowance         0.75
    email             "user@thermaldonkey.com"
    pending_payment   1
  end
end

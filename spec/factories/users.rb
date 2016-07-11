FactoryGirl.define do
  factory :user do
    first_name  'Theo'
    last_name   'Nguyen'
    sequence(:email)    { |n| "theo#{n}@example.com" }
    password    '123123123'
  end
end

FactoryGirl.define do
  factory :like do
    comment
    association :user, factory: :user
  end
end
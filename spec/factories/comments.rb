FactoryGirl.define do
  factory :comment do
    sequence(:content)    { |n| "content #{n}" }
    user
  end
end

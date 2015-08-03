FactoryGirl.define do
  factory :player do
    sequence(:firstname) { |n| "John#{n}" }
    lastname { "Hook" }
    sequence(:nickname) { |n| "player#{n}" }
  end
end
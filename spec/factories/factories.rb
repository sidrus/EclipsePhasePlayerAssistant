require 'factory_girl'

FactoryGirl.define do
  sequence(:random_string) { |n| LoremIpsum.generate }
  sequence(:random_email) { |n| "user#{n}@example.com"  }

  sequence :character_name do |n|
    "Test Character #{n}"
  end

  factory :item do
    name { generate(:random_string) }
    description { generate(:random_string) }
  end

  factory :character do
    name { generate(:character_name) }
    money 3500
    notes 'This is a test note.'
    campaign 'Test Campaign'
  end
end

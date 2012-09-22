require 'ffaker'

FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.words(1).join(' ') }
  end

  factory :story do
    name { Faker::Lorem.sentence }
  end
end

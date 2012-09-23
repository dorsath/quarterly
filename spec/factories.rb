require 'ffaker'

FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.words(1).join(' ') }
  end

  factory :story do
    name { Faker::Lorem.sentence }
    # assignee { User.first || FactoryGirl.create(:user) }
  end

  factory :repository do
  end

  factory :user do
    name {  Faker::Name.name }
  end
end

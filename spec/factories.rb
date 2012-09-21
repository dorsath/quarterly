FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.words(1).join(' ') }
  end
end

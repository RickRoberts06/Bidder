FactoryGirl.define do
  factory :auction do
    sequence(:title)  {|n| "#{Faker::Company.catch_phrase}-#{n}"}
    details       Faker::Lorem.paragraph
    reserve_price     1000
    starting_price    200
    goal              10000
  end

end

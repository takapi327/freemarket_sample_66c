FactoryBot.define do
  factory :product do
    name              {Faker::Name.last_name}
    derivery          {Faker::Number.number(digits: 2)}
    status            {Faker::Number.number(digits: 2)}
    price             {Faker::Number.number(digits: 2)}
    burden            {Faker::Number.number(digits: 2)}
    content           {Faker::Number.number(digits: 2)}
    day               {Faker::Number.number(digits: 2)}
    association :user, factory: :user
  end
end
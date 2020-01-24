FactoryBot.define do
  factory :product do
    name              {Faker::Name.last_name}
    derivery          {Faker::Number.number(digits: 2)}
    status_id            {Faker::Number.number(digits: 2)}
    price             {Faker::Number.number(digits: 2)}
    burden_id            {Faker::Number.number(digits: 2)}
    content           {Faker::Number.number(digits: 2)}
    day_id               {Faker::Number.number(digits: 2)}
    category_id          {Faker::Number.number(digits: 1)}
    area_id              {Faker::Number.number(digits: 2)}
    association :user, factory: :user
  end
end
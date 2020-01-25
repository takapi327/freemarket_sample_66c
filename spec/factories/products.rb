FactoryBot.define do
  factory :product do
    name                 {Faker::Name.last_name}
    derivery             {Faker::Number.number(digits: 1)}
    status_id            {Faker::Number.between(from: 1, to: 6)}
    price                {Faker::Number.number(digits: 2)}
    burden_id            {Faker::Number.between(from: 1, to: 2)}
    content              {Faker::Number.number(digits: 2)}
    day_id               {Faker::Number.between(from: 1, to: 3)}
    category_id          {Faker::Number.between(from: 1, to: 13)}
    area_id              {Faker::Number.between(from: 1, to: 48)}
    user
    # category
  end
end
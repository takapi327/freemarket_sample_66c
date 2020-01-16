FactoryBot.define do
  factory :product do
    association :user, :factory => :user

    name                {"knit"}
    price               {"1000"}
    derivery            {"2019/01/15"}
    status              {"good"}
    burden              {"250"}
    content             {"新品です"}
    day                 {"2020/1/1"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
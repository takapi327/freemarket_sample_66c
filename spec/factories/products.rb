FactoryBot.define do
  factory :product do
    name              {"takao"}
    derivery          {"1"}
    status            {"1"}
    price             {"1"}
    burden            {"1"}
    content           {"1"}
    day               {"2020-01-01"}
    user_id           {"3698"}
    association :user, factory: :user
    association :image, factory: :image
  end
end

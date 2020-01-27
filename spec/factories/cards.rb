FactoryBot.define do
  factory :card do
    association :user, :factory => :user

    customer_id                {"cus_7fd022d0b3f38be951d2d7d71c6f"}
    card_id                    {"car_51341f788709791c717f3a84ac1f"}
  
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end

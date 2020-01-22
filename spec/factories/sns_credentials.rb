FactoryBot.define do
  
  factory :sns_credential do
    provider {Faker::Omniauth.facebook}
    uid {Faker::Omniauth.facebook}
    user
  end
end

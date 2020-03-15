FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    association :product, factory: :product
  end
end
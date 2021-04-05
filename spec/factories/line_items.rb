FactoryBot.define do
  factory :line_item do
    quantity { 1 }
    #association :product, factory: (:product, :with_image)
    product { association :product, :with_image }
    association :cart, factory: :cart
  end
end

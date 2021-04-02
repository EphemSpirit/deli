FactoryBot.define do
  factory :line_item do
    quantity { 1 }
    association :product, factory: :product
    association :cart, factory: :cart
  end
end

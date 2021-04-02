FactoryBot.define do
  factory :cart do
    factory :cart_with_an_item do
      transient do
        item_count { 1 }
      end

      after(:create) do |cart, evaluator|
        create_list(:line_item, evaluator.item_count, cart: cart)
        cart.reload
      end
    end
  end
end

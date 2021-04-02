FactoryBot.define do
  factory :product do
    name { "pasta thingy" }
    price { "9.99" }
    description { "MyText" }
    vegan { false }
    vegetarian { true }
    dairy_free { false }
    nut_free { true }
    available { true }
    factory :product_with_line_item do
      transient do
        line_items_count { 1 }
      end

      after(:create) do |product, evaluator|
        create_list(:line_item, evaluator.line_items_count, product: product)
        product.reload
      end
    end

    trait :with_image do
      image { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'canoli.jpg'), 'image/png') }
    end
  end
end

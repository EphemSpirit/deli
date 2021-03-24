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

    trait :with_image do
      image { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'canoli.jpg'), 'image/png') }
    end
  end

  factory :test_item do
    name { "New Item" }
    price { "30.00" }
    description { "New item! Buy it now!" }
    vegan { true }
    vegetarian { true }
    dairy_free { true }
    nut_free { false }
    available { true }

    trait :with_image do
      image {fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'bread.jpg'), 'image/png') }
    end
  end
end

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
end

FactoryBot.define do
  factory :admin do
    email { "test@deli.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end

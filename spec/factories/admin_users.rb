FactoryBot.define do
  factory :admin_user do
    email { "email@exmaple.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end

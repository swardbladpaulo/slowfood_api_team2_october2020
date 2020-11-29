FactoryBot.define do
  factory :user do
    email { "superuser@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end

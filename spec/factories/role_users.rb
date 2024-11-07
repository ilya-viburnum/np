FactoryBot.define do
  factory :role_user do
    association :role
    association :user
  end
end

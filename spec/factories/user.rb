FactoryBot.define do
  factory :user, class: "User" do
    email       { Faker::Internet.email }
    password    { Faker::Internet.password }
    first_name  { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name   { Faker::Name.last_name }

    trait :admin do
      after(:create) do |user|
        admin_role = create(:admin_role)
        create(:role_user, role: admin_role, user: user)
      end
    end
  end
end

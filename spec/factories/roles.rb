FactoryBot.define do
  factory :role do
    sequence(:name) { "Role #{_1}" }
  end

  factory :admin_role, class: Role do
    name { Role::ADMIN_ROLE_NAME }
  end
end

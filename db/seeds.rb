@admin_role = Role.find_or_create_by(name: Role::ADMIN_ROLE_NAME)

@admin_user = User.create_with(password: 123456,
                               first_name: Faker::Name.first_name,
                               middle_name: Faker::Name.first_name,
                               last_name: Faker::Name.last_name)
                  .find_or_create_by(email: "admin@example.com")

RoleUser.create!(user: @admin_user, role: @admin_role) unless @admin_user.is_admin?

User.create_with(password: 123456,
                 first_name: Faker::Name.first_name,
                 middle_name: Faker::Name.middle_name,
                 last_name: Faker::Name.last_name)
    .find_or_create_by(email: "user@example.com")

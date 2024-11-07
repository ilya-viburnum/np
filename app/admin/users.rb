ActiveAdmin.register User do
  actions :index

  filter :email
  filter :first_name
  filter :middle_name
  filter :last_name

  index do
    selectable_column
    column :first_name
    column :middle_name
    column :last_name
    column :email
    actions defaults: false do |user|
      if user.is_admin?
        item t("active_admin.buttons.suspend_admin"),
             suspend_admin_admin_user_path(user),
             method: :delete,
             data: { confirm: t("active_admin.notifications.confirm_message") }
      else
        item t("active_admin.buttons.appoint_admin"),
             appoint_admin_admin_user_path(user),
             method: :post,
             data: { confirm: t("active_admin.notifications.confirm_message") }
      end
    end
  end

  member_action :appoint_admin, method: :post
  member_action :suspend_admin, method: :delete

  controller do
    def appoint_admin
      RoleUser.create(user: resource, role: Role.find_by(name: 'admin'))
      flash[:notice] = "Appointed as admin"
      redirect_to admin_users_path
    end

    def suspend_admin
      resource.role_users.joins(:role).find_by(role: {name: 'admin'}).destroy
      flash[:notice] = "Suspended as admin"
      redirect_to admin_users_path
    end
  end
end

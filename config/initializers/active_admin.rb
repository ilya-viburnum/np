ActiveAdmin.setup do |config|
  config.comments = false
  config.site_title = "Main"
  config.site_title_link = :root
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.batch_actions = false
  config.localize_format = :long
end

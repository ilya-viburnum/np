class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :authenticate_user!

  def authenticate_admin_user!
    if current_user.nil?
      flash[:alert] = t("devise.failure.unauthenticated")
      redirect_to new_user_session_path
    elsif !current_user.is_admin?
      flash[:alert] = t("devise.admin.failure.unauthenticated")
      redirect_to root_path
    end
  end
end

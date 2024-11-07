class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def authenticate_user!
    unless current_user&.is_admin?
      flash[:alert] = "Access denied."
      redirect_to root_path
    end
  end
end

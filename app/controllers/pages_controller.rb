class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :authenticate_admin_user!, only: :posts_on_review

  def home
    if user_signed_in?
      redirect_to dashboard_path
    end
  end

  def posts_on_review
    @posts = Post.on_review.order(updated_at: :desc)
  end
end

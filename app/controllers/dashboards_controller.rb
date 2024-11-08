class DashboardsController < ApplicationController
  def show
    @user = current_user
    @search = @user.posts.ransack(params[:q])
    @posts = @search.result(distinct: true)
  end
end

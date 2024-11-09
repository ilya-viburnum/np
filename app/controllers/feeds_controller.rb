class FeedsController < ApplicationController
  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result(distinct: true).approved.order(published_at: :desc)
  end
end

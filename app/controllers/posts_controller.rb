class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy submit_review approve reject]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to dashboard_path, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to dashboard_path, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to dashboard_path, notice: "Post was successfully deleted."
  end

  def submit_review
    @post.submit_review!
    redirect_to dashboard_path, notice: "Review successfully submitted!"
  end

  def approve
    @post.approve!
    redirect_to dashboard_path, notice: "Post has been approved!"
  end

  def reject
    @post.reject!
    redirect_to dashboard_path, notice: "Post has been rejected!"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :status, :user_id, :region_id, images: [], files: [])
  end
end

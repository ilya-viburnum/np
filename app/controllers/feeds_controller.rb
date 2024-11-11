class FeedsController < ApplicationController
  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result(distinct: true).approved.order(published_at: :desc)
  end

  def export
    posts = Post.ransack(params[:q]).result(distinct: true).approved.order(published_at: :desc)
    ExportPostMailer.send_report(posts, current_user.email).deliver_now

    redirect_to feeds_path, notice: "The report generation has started. Upon completion, it will be sent to your email."
  end

  private

  def export_params
    params.require(:q).permit(:region_id_eq, :published_at_gteq, :published_at_lteq, :user_email_cont, :user_first_name_cont, :user_last_name_cont, :user_middle_name_cont)
  end
end

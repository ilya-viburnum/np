class ExportPostMailer < ApplicationMailer
  def send_report(posts, email)
    xls_package = Export::FileGenerator::Post.new(posts).call

    attachments["posts_report.xls"] = xls_package.to_stream.read
    mail(to: email, subject: "Отчет о постах")
  end
end

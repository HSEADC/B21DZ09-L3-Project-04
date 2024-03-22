class SupportMailer < ApplicationMailer
   def user_support_request_email
    @email = params[:support][:email]
    @comment = params[:support][:comment]
    @problem = params[:support][:problem]

    # attachments.inline['email_image.jpg'] = File.read('app/assets/images/email_image.png')
    mail(to: @email, subject: "Ваще обращение в поддержку принято")
  end

  def admin_support_request_email
    @email = params[:support][:email]
    @comment = params[:support][:comment]
    @problem = params[:support][:problem]
    @answer_id = params[:support][:answer_id]
    @comment_id = params[:support][:comment_id]
    mail(to: "admin@test.com", subject: "Новое обращение в поддержку")
  end
end

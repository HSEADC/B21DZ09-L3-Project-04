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
    if params[:support][:answer_id] != nil
      @answer_id = params[:support][:answer_id]
      @user_answer = Answer.find(params[:support][:answer_id])
    end
    if params[:support][:comment_id] != nil
      @comment_id = params[:support][:comment_id]
      @user_comment = Comment.find(params[:support][:comment_id])
    end
    mail(to: "admin@test.com", subject: "Новое обращение в поддержку")
  end
end

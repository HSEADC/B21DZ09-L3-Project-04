class SupportController < ApplicationController
 def request_support
    # @answer_id = params[answer_id]
    # @comment_id = params[comment_id]
    @support = Support.new(support_params)

    respond_to do |format|
      if @support.save
        format.html {redirect_to welcome_url, notice:"Support request was succesfully sent."}

        SupportMailer.with(support: @support).user_support_request_email.deliver_now
        SupportMailer.with(support: @support).admin_support_request_email.deliver_now
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def support_params
      params.require(:support).permit(:comment, :problem, :answer_id, :comment_id).merge(email: current_user.email)
    end

end

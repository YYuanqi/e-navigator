class NotificationMailer < ApplicationMailer
  default from: "test@example.com"

  def send_request_to_user(user)
    @user = user
    mail to: user.email, subject: "面接希望日が決まりました"
  end
end

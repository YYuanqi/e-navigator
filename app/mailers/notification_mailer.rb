class NotificationMailer < ApplicationMailer
  default from: "test@example.com"
  default parts_order: ["text/plain", "text/enriched", "text/html"]

  def send_request_to_user(to_user, from_user)
    @to_user = to_user
    @from_user = from_user
    mail to: to_user.email, subject: "面接希望日が決まりました"
  end
end

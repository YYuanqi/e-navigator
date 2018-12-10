# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def send_request
    user = User.first
    NotificationMailer.send_request_to_user(user)
  end
end

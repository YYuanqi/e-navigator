class InterviewMailer < ApplicationMailer
  default from: "test@example.com"
  default parts_order: ["text/plain", "text/enriched", "text/html"]

  def approve(interviewer, interviewee)
    @interviewer = interviewer
    @interviewee = interviewee
    mail to: interviewer.email, subject: "面接希望日が決まりました"
  end

  def apply(interviewer, interviewee, time)
    @interviewer = interviewer
    @interviewee = interviewee
    @time = time
    mail to: [ interviewee.email, interviewer.email ], subject: "面接日時が確定しました"
  end
end

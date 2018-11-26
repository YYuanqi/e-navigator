module InterviewsHelper

  def is_interviewer
    current_user != User.find(params[:user_id])
  end
end

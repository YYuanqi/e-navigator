module UsersHelper
  def get_interview_time(user)
    interview = user.interviews.find_by(status: :approved)
    unless interview == nil
      interview.time
    else
      '-'
    end
  end
end

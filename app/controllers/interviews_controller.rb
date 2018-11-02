class InterviewsController < ApplicationController
  
  def index
    @user = User.find(current_user.id)
    @interviews = @user.interviews.all
  end
  
  def new
     @interview = current_user.interviews.new
  end
  
  def create
    @interview = current_user.interviews.new(interview_params)
    if @interview.save
#      log_in @user
      flash[:success] = "新しい面接日程が追加されました。"
      redirect_to user_interviews_url
    else
      render 'new'
    end
  end
  
  def show
     @interview = current_user.interviews.build(interview_params)
  end

  private

    def interview_params
      params.require(:interview).permit(:time, :status)
    end
end

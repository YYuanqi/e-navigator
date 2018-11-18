class InterviewsController < ApplicationController
  before_action :logged_in_user
  before_action :set_interview, only: [:edit, :update, :destroy]


  def index
    @interviews = current_user.interviews.all
  end

  def new
     @interview = current_user.interviews.new
  end

  def create
    @interview = current_user.interviews.new(interview_params)
    if @interview.save
      flash[:success] = "面接が作成されました"
      redirect_to user_interviews_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @interview.update_attributes(interview_params)
      flash[:success] = "面接が更新されました"
      redirect_to user_interviews_url
    else
       render 'edit'
    end
  end

  def destroy
    @interview.destroy
    flash[:success] = "面接が削除されました"
    redirect_to user_interviews_url
  end

  def show
     @interview = current_user.interviews.build(interview_params)
  end

  private

    def interview_params
      params.require(:interview).permit(:time, :status)
    end

    def set_interview
      @interview = Interview.find(params[:id])
    end
end

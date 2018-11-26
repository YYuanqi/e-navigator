class InterviewsController < ApplicationController
  before_action :logged_in_user
  before_action :set_interview, only: [:edit, :update, :destroy, :apply]
  before_action :set_user, only: [:index, :show, :apply]
  include InterviewsHelper

  def index
    if is_interviewer
      @interviews = User.find(params[:user_id]).interviews.where.not(status: :approved)
      @interview = @user.interviews.find_by(status: :approved)
    else
      @interviews = @user.interviews.all
    end
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
  end

  def apply
    unless current_user == @user
      @interview.status = :approved
      @interview.save
      @user.interviews.where.not(id: @interview.id).update_all(status: :rejected)
      flash[:success] = "面接が承認されました"
    end
    redirect_to user_interviews_url
  end

  private

    def interview_params
      params.require(:interview).permit(:time, :status)
    end

    def set_interview
      @interview = Interview.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end

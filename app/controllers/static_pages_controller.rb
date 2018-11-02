class StaticPagesController < ApplicationController
  def home
    @interview = current_user.interviews.build if logged_in?
  end

  def help
  end
end

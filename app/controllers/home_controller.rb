class HomeController < ApplicationController
 
  def index
  end

  def user_list
    @user = User.first
    GuestEmailJob.perform_later(@user)
    render json: {
      status: true,
      user: @user
    } 
  end
end

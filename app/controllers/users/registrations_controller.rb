class Users::RegistrationsController < Devise::RegistrationsController
  # skip_before_action :verify_authenticity_token
  
  
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # debugger
    if @user.save
      # UserMailer.with(user: @user).welcome_email.deliver_now
      if request.format.json?
        render :status => 200, :json => {:success => true, :msg => "user created sucessfully", :user => @user}
      else
        redirect_to new_user_registration_path, notice: "user created sucessfully"
      end
    else
      if request.format.json?
        render :status => 200, :json => {:success => false, :msg => @user.errors.full_messages}
      else
        redirect_to new_user_registration_path, notice: @user.errors.full_messages
      end
    end
  end

  private

  def user_params
    params.require(:users).permit(:email,:password,:first_name,:last_name,:user_name)
  end


end

class UserMailer < ApplicationMailer

    def welcome_email(user)
      debugger
      @user = user
      mail(from: 'ovais30@gmail.com',to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end

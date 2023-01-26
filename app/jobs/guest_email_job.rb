class GuestEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    
    UserMailer.welcome_email(user).deliver_now
    # Do something later
  end
end

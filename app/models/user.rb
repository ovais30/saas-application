class User < ApplicationRecord
  
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  # Include default devise modules. Others available are:
  

  
  before_save :ensure_first_name_has_value

  private

  def ensure_first_name_has_value
    if first_name.nil?
      self.first_name = user_name unless user_name.blank?
    end
  end
end

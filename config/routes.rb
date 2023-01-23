Rails.application.routes.draw do
  
  root 'home#index'

  devise_for :users
  
  namespace :users do
    
      get 'registration/new', to: 'registrations#new'
    
  end

end

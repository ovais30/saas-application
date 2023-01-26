Rails.application.routes.draw do
  require "sidekiq/web"
  root 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations' }

  get 'user_list', to: "home#user_list", as: 'user_list'
  Rails.application.routes.draw do
    mount Sidekiq::Web => "/sidekiq"
  end
end

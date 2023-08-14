Rails.application.routes.draw do
  resources :posts
  root 'posts#index'

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, only: [:show]
end

Rails.application.routes.draw do
  resources :posts
  root 'posts#index'

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, only: [:index, :show]
  get 'invitations/update'
  get 'invitations/create'
  get 'invitations/destroy'

  get 'likes/create'
  get 'likes/destroy'
end

Rails.application.routes.draw do
  get '/notifications', to: 'notifications#index'
  get '/search', to: 'search#index'
  resources :posts
  resources :posts do
    resources :comments
  end
  root 'posts#index'

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, only: [:index, :show]
  get 'invitations/update'
  get 'invitations/create'
  get 'invitations/destroy'

  get 'likes/create'
  get 'likes/destroy'
end

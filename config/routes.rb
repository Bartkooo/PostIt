Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers => { :registrations => "registrations" }
  match 'users/:id' => 'users#show', via: :get
end

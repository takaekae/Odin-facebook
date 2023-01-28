Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #devise_scope :user do
  #  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end


  resources :posts

  resources :users, only: [:show, :index]
  resources :requests, only: [:new, :create, :show, :destroy]
  resources :friendships, only: [:new, :create, :show, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :profiles

  root to: "posts#index"

end

Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"

  get "tweets/search"
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
  resources :users,only: :show
end

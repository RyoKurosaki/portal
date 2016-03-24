Rails.application.routes.draw do

  resources :categories
  resources :activity_services
  resources :listings, :replace_id_with => 'access_token'
  devise_for :users
  root 'pages#index'
  get 'pages/index'
  # post 'payments/purchase'
  resources :payments, only: [:new] do
    collection do
      post 'purchase'
    end
  end

end

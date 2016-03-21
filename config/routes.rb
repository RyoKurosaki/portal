Rails.application.routes.draw do

  resources :activity_services
  resources :listings, :replace_id_with => 'access_token'
  devise_for :users
  root 'pages#index'
  get 'pages/index'

end

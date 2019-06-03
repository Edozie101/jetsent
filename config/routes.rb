Rails.application.routes.draw do
  devise_for :travellers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #
  resources :users
  resources :travel
  resources :order


  root controller: :home, action: :index
  resources :room_messages
  resources :rooms


  root to: "home#index"
end

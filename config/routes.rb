Rails.application.routes.draw do
  get 'store/index'
  devise_for :travellers, controllers: {
      registrations: 'registrations'
  }
  devise_for :users, controllers: {
      registrations: 'registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #
  resources :users
  resources :travel
  resources :order


  root controller: :home, action: :index
  resources :room_messages
  resources :rooms
  post '/search' => 'item#search'
    resources :item, only: [:show, :edit, :create, :new, :index]

  root to: "home#index"
end

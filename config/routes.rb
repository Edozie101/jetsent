Rails.application.routes.draw do
  resources :carts
  get 'store/index'

  devise_for :users, controllers: {
      registrations: 'registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }


  get '/find-orders' => 'orders#order_list'
  get "/content" => "content#index"
  post "/sendkeys" => "content#getJSON", :as => :getJSON
  post "/sendNo" => "content#sendPush", :as => :sendPush
  post "/sendNoU" => "users#sendPush", :as => :sendPushU
  get '/card/new' => 'billing#new_card', as: :add_payment_method




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #
  resources :users
  resources :travel
  resources :orders, defaults: { format: 'html' }

  resources :trips, only: [:create,:destroy, :edit,:show, :new], controllers:{
      travel: 'travel'
  }
  get :trips, action: :show, controller: :travel

  root controller: :home, action: :index
  resources :room_messages
  resources :rooms
  post '/search' => 'item#search'
    resources :item, only: [:show, :edit, :create, :new, :index]

  get '/globe' => 'travel#globe'

  root to: "home#index"
  get '/my_trips' => 'trips#my_trips'
  get '/my_orders' => 'orders#my_orders'
end

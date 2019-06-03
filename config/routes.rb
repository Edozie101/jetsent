Rails.application.routes.draw do
  get 'store/index'
  devise_for :travellers, controllers: {
      registrations: 'registrations'
  }
  devise_for :users, controllers: {
      registrations: 'registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "item#index"
  post '/search' => 'item#search'
    resources :item, only: [:show, :edit, :create, :new, :index]



end

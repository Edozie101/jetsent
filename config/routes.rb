Rails.application.routes.draw do
  devise_for :travellers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "item#index"
  post '/search' => 'item#search'
    resources :item, only: [:show, :edit, :create, :new, :index]



end

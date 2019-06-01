Rails.application.routes.draw do
  devise_for :travellers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  post '/search' => 'home#search'
  get '/show_item' => 'home#show_item'
  get '/item/:id(.:format)' => 'home#item'
  get 'items', to: :show_item, controller: 'home'

end

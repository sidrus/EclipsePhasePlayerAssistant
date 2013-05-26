EclipsePhasePlayerAssistant::Application.routes.draw do
  devise_for :users

  root :to=> 'static_pages#index'

  resources :items, {except: [:show, :create, :new]}
  get '/items/new/character/:char_id' => 'items#new', :as => 'new_character_item'
  post '/items/new/character/:char_id' => 'items#create', :as => 'create_character_item'
  post '/items/destroy/:item_id/character/:char_id' => 'items#destroy', :as => 'destroy_character_item'

  resources :characters
  get '/characters/:id/inventory' => 'characters#inventory', :as => 'character_inventory'
  get '/characters/:id/notes' => 'characters#notes', :as => 'character_notes'
  put '/characters/:id/money/' => 'characters#adjust_money', :as => 'character_money'
  post '/character/:id/clear_inv' => 'items#clear_all', :as => 'clear_inventory'

  match '*path' => redirect('/')
end

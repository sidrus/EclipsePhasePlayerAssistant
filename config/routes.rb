EclipsePhasePlayerAssistant::Application.routes.draw do
  devise_for :users

  root :to=> 'static_pages#index'

  resources :characters
  get '/characters/:id/inventory' => 'characters#inventory', :as => 'character_inventory'
  get '/characters/:id/notes' => 'characters#notes', :as => 'character_notes'
end

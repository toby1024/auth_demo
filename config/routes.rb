Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: "users/sessions"},
             path_names: {registration: "registrations"}

  root to: "home#index"

  get '/items/get_user_menus'
  get '/items/load_menu'
  resources :items

  resources :users

  resources :roles

  get '/permissions/get_menus_by_module', :defaults => {:format => :json}
  get '/permissions/load_permission_tree', :defaults => {:format => :json}
  resources :permissions

end

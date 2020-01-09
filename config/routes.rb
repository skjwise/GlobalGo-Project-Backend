Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: [:create, :index]
  resources :organizations, only: [:create, :index]
  resources :user_starred_projects
  resources :users, only: [:create, :index, :update ]
  resources :themes, only: [:create, :index]
  resources :countries, only: [:create, :index]
  # resources :project_donation_options, only: [:index]

  post '/login', to: 'auth#create'
  get '/profile' to: 'users#profile'
  # post '/fetch_projects', to: 'projects#fetch'
  # get '/get_project_count', to: 'countries#get_project_count'
  # post '/get_project_theme_count', to: 'countries#get_project_theme_count'
  # get '/find_last_project', to: 'projects#find_last_project'
  # get '/get_projects', to: 'countries#get_projects'
  # get '/delete_all', to: 'projects#delete_all'
  # post '/check_star', to: 'users#check_star'
  # post '/get_user_projects', to: 'user_starred_projects#get_projects'
  # post '/get_theme_projects', to: 'countries#get_theme_projects'
  # post '/remove_project', to: 'user_starred_projects#remove_project'
  # post '/find_donation_options', to: 'projects#find_options'
  # post '/update_star_orders', to: 'user_starred_projects#update_star_orders'

end

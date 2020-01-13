Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :projects, only: [:create, :index]
      resources :organizations, only: [:create, :index]
      resources :user_starred_projects
      resources :users, only: [:create, :index, :update ]
      resources :themes, only: [:create, :index]
      resources :countries, only: [:create, :index]
      resources :project_donation_options, only: [:index]

      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/fetch_projects', to: 'projects#fetch'

    end
  end
end

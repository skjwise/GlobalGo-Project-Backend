Rails.application.routes.draw do
  resources :projects
  resources :organizations
  resources :user_starred_projects
  resources :users
  resources :themes
  resources :countries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

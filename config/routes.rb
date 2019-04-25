Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'urls/create'
  get 'urls/new'
  get 'urls/index'
  devise_for :users
  root to: 'scraps#new'
  get 'scrapping', to: 'pages#scrapping'
  resources :properties, only: [ :index, :create ]
  resources :scraps
  resources :urls, only: [ :new, :create, :index ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

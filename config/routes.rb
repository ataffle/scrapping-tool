Rails.application.routes.draw do
  devise_for :users
  root to: 'scraps#new'
  get 'scrapping', to: 'pages#scrapping'
  resources :properties, only: [ :index, :new, :create ]
  resources :scraps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:new, :create,:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :bands

resources :bands, only: [:show] do
    resources :albums, only: [:new]
end

  #get '/bands/:band_id/albums/new', to: "albums#new", as: 'new_album'
  resources :albums, except: [:new, :index]

end

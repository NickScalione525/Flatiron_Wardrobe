Rails.application.routes.draw do
  get '/welcome', to: "welcome#home", as: "welcome_page"
  root to: "welcome#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  post '/logout' => 'sessions#destroy'

  resources :styles
  resources :outfits do 
    resources :styles
  end
  resources :users do
    resources :outfits
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

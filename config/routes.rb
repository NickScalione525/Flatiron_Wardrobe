Rails.application.routes.draw do

  resources :styles
  resources :outfits do 
    resources :styles
  end
  resources :users do
    resources :outfits
  end


  get '/welcome', to: "welcome#home", as: "welcome_page"
  root to: "welcome#home"

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'




  get '/auth/facebook/callback', to: "sessions#create_with_fb"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

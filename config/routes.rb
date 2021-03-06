Rails.application.routes.draw do



  resources :users, except: [:new, :create, :index] do
    resources :outfits
  end

  resources :outfits do 
    resources :styles, only: [:index, :new, :create, :show, :edit]
  end


  resources :styles



  get '/welcome', to: "welcome#home", as: "welcome_page"
  root to: "welcome#home"

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

 



  get '/auth/facebook/callback', to: "sessions#create_with_fb"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

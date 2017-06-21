Rails.application.routes.draw do
  get '/signup', to: 'users#new', as: 'signup'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  get '/flatgram', to: 'welcome#new', as: 'home'
  get '/signin', to: 'sessions#new', as: 'signin'

  # resources :comments
  resources :picture_tags
  resources :tags
  # resources :pictures
  # resources :users Commenting out since we added the routes again at the bottom
  resources :sessions, only: [:new, :index, :create]

  resources :pictures do
  resources :comments, shallow: true
  end

  #routes for following feature
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

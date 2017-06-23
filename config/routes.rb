Rails.application.routes.draw do


  get '/signup', to: 'users#new', as: 'signup'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  get '/flatgram', to: 'welcome#new', as: 'home'
  get '/signin', to: 'sessions#new', as: 'signin'



  resources :picture_tags
  resources :tags
  resources :sessions, only: [:new, :index, :create]



  #routes for following feature
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :pictures do
  resources :comments, shallow: true
  end

  resources :relationships, only: [:create, :destroy]
  get '/searchs', to: 'searchs#index', as: :searchs
  get ':username', to: 'profiles#show', as: :profile


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

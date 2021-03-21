Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :sessions
    
    get '/profiles', to: 'profiles#index'
    patch '/profiles/:id', to: 'profiles#update'

    get '/collaborations', to: 'collaborations#index'
    post '/collaborations', to: 'collaborations#create'
    patch '/collaborations/:id', to: 'collaborations#update'
    delete '/collaborations/:id', to: 'collaborations#destroy'
    get '/collaborations/pending', to: 'collaborations#pending'
    
    resources :posts
    resources :users
    get '/profiles/search/:endpoint', to: 'profiles#search'
  end
end 

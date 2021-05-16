Rails.application.routes.draw do

  
  
  #get 'user/show'
  
  root 'welcome#index'
  resources :likes
  resources :city
  resources :welcome
  resources :user
  resources :gossip do
    resources :comment do
      resources :likes
    end
    resources :likes
  end
  resources :sessions, only: [:new, :create, :destroy]
  #get 'welcome/show'
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'
  #get '/welcome/:id', to: 'welcome#show'
  #get 'welcome', to: 'welcome#show'
  ##get '/gossip/:id', to: 'gossip#show'
  #get '/user/:id', to: 'user#show'
  #get '/user/:user_id', to: 'user#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

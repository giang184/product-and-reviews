Rails.application.routes.draw do
  root to: 'index#show'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/admin' => 'users#admin'
  get '/index' => 'index#show'

  resources :products do
    resources :reviews
  end
end

Rails.application.routes.draw do
  root to: 'index#show'
  resources :products do
    resources :reviews
  end
end

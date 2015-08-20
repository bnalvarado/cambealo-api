Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :sessions, :only => [:create]
      resources :users do
      	resources :products
      end
      get '/products/:name', to: 'products#search'
      get '/products', to: 'products#all'
      resources :transactions
    end
  end
end

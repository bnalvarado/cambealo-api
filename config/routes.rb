Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :sessions, :only => [:create]
      resources :users
      resources :products
      get '/products/search/:name', to: 'products#search'
    end
  end
end

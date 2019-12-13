Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :menu_items
      resources :events
      resources :providers
      resources :users
      get '/current_user', to: 'auth#show'
      post '/auth', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

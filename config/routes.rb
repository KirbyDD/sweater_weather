Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'weather#show'
      get '/backgrounds', to: 'background#show'
      get '/foodie', to: 'foodie#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
    end
  end
end

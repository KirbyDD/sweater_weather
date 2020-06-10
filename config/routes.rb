Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'weather#show'
      get '/backgrounds', to: 'background#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#show'
      post '/road_trip', to: 'road_trip#create'
    end
  end
end

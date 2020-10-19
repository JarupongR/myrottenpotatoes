Rails.application.routes.draw do
  
end

Myrottenpotatoes::Application.routes.draw do

  resources :movies do
    resources :reviews
  end

  # Route that posts 'Search TMDb' form
  post '/movies/search_tmdb', :as => 'search_tmdb'

  root :to => redirect('/movies')
  
  get  'auth/:provider/callback' => 'sessions#create'
  get  'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
  get  'auth/twitter', :as => 'login'
end




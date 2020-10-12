Rails.application.routes.draw do
  
end

Myrottenpotatoes::Application.routes.draw do
  resources :movies
  root :to => redirect('/movies')
  get  'auth/:provider/callback' => 'sessions#create'
  get  'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
  get  'auth/twitter', :as => 'login'
end




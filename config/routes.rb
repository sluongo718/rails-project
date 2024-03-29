Rails.application.routes.draw do
  resources :recipe_categories
  resources :categories
  resources :ingredients
  resources :users

  resources :recipes do 
    resources :recipe_ingredients
  end

  resources :recipe_ingredients do
    collection do
      delete 'delete'
    end
  end

  root "static_pages#welcome"

  

  get "/signup" => "users#new"
  post "/signup" => "users#create"

  get "/login" => "sessions#new"
  post '/login' => "sessions#create"

  get '/auth/github/callback' => 'sessions#create'

  delete "/logout" => "sessions#destroy"

  get 'most_popular_user' => 'users#most_popular_user'

 
 
end

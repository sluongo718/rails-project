Rails.application.routes.draw do
  resources :ingredients
  resources :recipe_ingredients

  resources :recipes do 
    resources :recipe_ingredients
  end
  root "static_pages#welcome"
  resources :users
  get "/signup" => "users#new"
  post "/signup" => "users#create"

  get "/login" => "sessions#new"
  post '/login' => "sessions#create"

  delete "/logout" => "sessions#destroy"
 
end

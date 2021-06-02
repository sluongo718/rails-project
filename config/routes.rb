Rails.application.routes.draw do
  resources :recipe_categories
  resources :categories
  resources :ingredients
 

  resources :recipes do 
    resources :recipe_ingredients
  end

  resources :recipe_ingredients do
    collection do
      delete 'delete'
    end
  end

  root "static_pages#welcome"
  resources :users
  get "/signup" => "users#new"
  post "/signup" => "users#create"

  get "/login" => "sessions#new"
  post '/login' => "sessions#create"

  delete "/logout" => "sessions#destroy"
 
end

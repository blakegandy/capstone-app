Rails.application.routes.draw do
  namespace :api do
    get "/appointments" => "appointments#index"
    get "/appointments/:id" => "appointments#show"
    post "/appointments" => "appointments#create"
    patch "/appointments/:id" => "appointments#update"
    delete "/appointments/:id" => "appointments#destroy"

    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"


    post "/sessions" => "sessions#create"
  end
end

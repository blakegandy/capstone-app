Rails.application.routes.draw do
  namespace :api do
    get "/appointments" => "appointments#index"
    get "/appointments/:id" => "appointments#show"
    post "/appointments" => "appointments#create"

    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    post "/users" => "users#create"
  end
end

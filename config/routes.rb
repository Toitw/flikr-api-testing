Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root "static_pages#home"
  # Defines the root path route ("/")
  # root "articles#index"
  get "/search", to: "static_pages#search"
end

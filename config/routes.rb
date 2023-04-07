Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")  
  #root "users#index"
  
  get "/users/:id/posts", to: "posts#index"
  get "/users/:user_id/posts/:id", to: "posts#show"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"

  get "/posts/new", to: "posts#new"
  post "/posts/create", to: "posts#create"

  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new'
  post '/users/:user_id/posts/:id/comments/create', to: 'comments#create'
  
  post '/users/:user_id/posts/:post_id/likes/create', to: 'likes#create'
end

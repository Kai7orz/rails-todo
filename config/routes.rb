Rails.application.routes.draw do
  root "users#new"
  
  get "tasks/index" => "tasks#index"
  post "tasks/create" => "tasks#create"
  patch "tasks/update" => "tasks#update" 
  delete "tasks/destroy" => "tasks#destroy"

  get "/users/signup" ,to: "users#new" , as: "signup"
  get "/users/login" ,to: "users#login" , as: "login"
  post "/users" => "users#create"
  get "/users/:id" ,to: "users#show", as: "user"
  get "/users/edit/:id" ,to: "users#edit", as: "edit"
  post "/users/validate",to: "users#validate", as: "validate"
  patch "/users/:id" ,to: "users#update"
  delete "/users/:id", to: "users#destroy", as: "destroy"


end

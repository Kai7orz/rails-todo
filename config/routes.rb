Rails.application.routes.draw do
  root "users#new"
  get "tasks/index" => "tasks#index"
  post "tasks/create" => "tasks#create"
  patch "tasks/update" => "tasks#update" 
  delete "tasks/destroy" => "tasks#destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/users/:id" ,to: "users#show"

end

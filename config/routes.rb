Rails.application.routes.draw do
  root to: "books#index"
  
  resources :books do 
    patch 'read' => "books#leer", on: :member 
    resources :comments
  end
  devise_for :users
end

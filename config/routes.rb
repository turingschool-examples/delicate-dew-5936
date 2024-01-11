Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb

resources :amusement_parks do
  resources :rides
end

resources :mechanics do
  resources :rides, through: :ride_mechanics
end
end

Rails.application.routes.draw do
  resources :mechanics, only: :show
  post "/mechanics/:id", to: "mechanics#edit"
  resources :amusement_park, only: :show
end

Rails.application.routes.draw do
  resources :mechanics, only: :show

  post "/mechanics/:id", to: "mechanics#create"
end

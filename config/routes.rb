Rails.application.routes.draw do

  get "/", to: "forcasts#index"
  get "/index", to: "forcasts#index"
  post "/search", to: 'forcasts#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :songs  #   includes all routes for all methods, no need to specify each b/c using all of them
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

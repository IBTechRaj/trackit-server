Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users #, only: [:create]
  resources :curriculums
   post "/login", to: "sessions#login"
   get "/auto_login", to: "sessions#auto_login"
   get "/user_is_authed", to: "sessions#user_is_authed"
   get "/logged_in", to: "application#logged_in?"
end

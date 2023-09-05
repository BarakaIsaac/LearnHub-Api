Rails.application.routes.draw do
  # User routes
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'
  post '/enroll', to: 'users#enroll'

  resources :courses
  resources :enrollments, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

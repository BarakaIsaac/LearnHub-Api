Rails.application.routes.draw do
  # User routes
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'

  resources :courses do
    resources :enrollments, only: [:create, :index]
    resources :lessons
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

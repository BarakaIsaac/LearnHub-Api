Rails.application.routes.draw do
  # User routes
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'
  get '/users/:user_id/courses/:course_id/isEnrolled', to: 'courses#is_enrolled'



  resources :courses do
    resources :lessons
    member do
      post 'enroll'
      delete 'unenroll'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  get 'score', to: "games#score"
  get "new", to: 'games#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

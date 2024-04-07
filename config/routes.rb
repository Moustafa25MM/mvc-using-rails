Rails.application.routes.draw do
  # Define a named route 'movies_path' for 'movies#index'
  get 'movies/index', as: 'movies'

  # Defines the root path route ("/")
  root "movies#index"
end
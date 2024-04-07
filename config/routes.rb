Rails.application.routes.draw do
  root "movies#index"

  get 'movies/index', as: 'movies'

  get '*path', to: redirect('/')
end
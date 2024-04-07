class Movie < ApplicationRecord
    has_many :movie_actors
    has_many :actors, through: :movie_actors
    has_many :movie_filming_locations
    has_many :filming_locations, through: :movie_filming_locations
    has_many :movie_countries
    has_many :countries, through: :movie_countries

    has_many :reviews
  end
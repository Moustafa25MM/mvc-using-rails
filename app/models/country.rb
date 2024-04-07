class Country < ApplicationRecord
    has_many :movie_countries
    has_many :movies, through: :movie_countries
  end
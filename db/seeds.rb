# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

# Path to CSV files at the project root
movie_file = Rails.root.join('movies.csv')
review_file = Rails.root.join('reviews.csv')

CSV.foreach(movie_file, headers: true) do |row|
  movie = Movie.find_or_create_by!(
    title: row['Movie'],
    year: row['Year']
  ) do |m|
    m.description = row['Description']
    m.director = row['Director']
  end

  filming_location = FilmingLocation.find_or_create_by!(name: row['Filming location'])
  country = Country.find_or_create_by!(name: row['Country'])

  MovieFilmingLocation.find_or_create_by!(movie: movie, filming_location: filming_location)
  MovieCountry.find_or_create_by!(movie: movie, country: country)

  actor = Actor.find_or_create_by!(name: row['Actor'])
  MovieActor.find_or_create_by!(movie: movie, actor: actor)
end

CSV.foreach(review_file, headers: true) do |row|
  movie = Movie.find_by!(title: row['Movie'])
  Review.create!(
    movie: movie,
    user: row['User'],
    stars: row['Stars'],
    review: row['Review']
  )
end
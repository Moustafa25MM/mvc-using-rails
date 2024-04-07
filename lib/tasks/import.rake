require 'csv'

namespace :import do
  desc "Import movies and reviews from CSV files"
  task csv: :environment do
    movie_file = File.join Rails.root, 'movies.csv'
    review_file = File.join Rails.root, 'reviews.csv'

    # Import Movies and Actors
    CSV.foreach(movie_file, headers: true) do |row|
        movie = Movie.find_or_create_by!(
          title: row['Movie'],
          year: row['Year']
        ) do |m|
          m.description = row['Description']
          m.director = row['Director']
        end
      
        # Assumes FilmingLocation and Country models have a 'name' attribute
        filming_location = FilmingLocation.find_or_create_by!(name: row['Filming location'])
        country = Country.find_or_create_by!(name: row['Country'])
      
        MovieFilmingLocation.find_or_create_by!(movie: movie, filming_location: filming_location)
        MovieCountry.find_or_create_by!(movie: movie, country: country)
      
        actor = Actor.find_or_create_by!(name: row['Actor'])
        MovieActor.find_or_create_by!(movie: movie, actor: actor)
      end

    # Import Reviews
    CSV.foreach(review_file, headers: true) do |row|
      movie = Movie.find_by!(title: row['Movie'])
      Review.create!(
        movie: movie,
        user: row['User'],
        stars: row['Stars'],
        review: row['Review']
      )
    end

    puts "Import completed."
  end
end
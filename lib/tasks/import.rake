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
        description: row['Description'],
        year: row['Year'],
        director: row['Director'],
        filming_location: row['Filming location'],
        country: row['Country']
      )

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
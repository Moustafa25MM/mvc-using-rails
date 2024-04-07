class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:actors).select('movies.*, COALESCE(AVG(reviews.stars), 0) as average_stars')
                   .left_joins(:reviews)
                   .group('movies.id')
                   .order('average_stars DESC')
  end
end
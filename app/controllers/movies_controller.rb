class MoviesController < ApplicationController
  def index
    base_query = Movie.select('movies.*, COALESCE(AVG(reviews.stars), 0) as average_stars')
                      .left_joins(:reviews)
                      .group('movies.id')

    if params[:search].present?
      @movies = base_query.joins(:actors)
                          .where('actors.name ILIKE ?', "%#{params[:search]}%")
                          .select('movies.*, actors.name as searched_actor_name')
                          .group('movies.id', 'actors.name')
    else
      @movies = base_query
    end

    @movies = @movies.order('average_stars DESC')
  end
end
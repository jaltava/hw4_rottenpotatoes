class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_similar_movies(movie_id)
    movie = Movie.find(movie_id)
    return Movie.find_all_by_director(movie.director)
  end
end

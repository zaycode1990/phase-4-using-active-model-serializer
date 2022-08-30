class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  def summary
    movie = Movie.find(params[:id])
    render json:movie, serializer:MovieSummarySerializer
  end

  private

  def render_not_found_response
    render json: { error: "Movie not found" }, status: :not_found
  end
end


class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	def new
		@movie = Movie.new
	end

	def create
  	Movie.create(movie_params[:movie])
		redirect_to movies_path
  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def vote
  	@movie = Movie.find(params[:id])
  	@movie.rank += 1
  end

	private
	def movie_params
  	params.permit(movie:[:name, :director, :description, :rank])
	end
end

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

	private
	def movie_params
  	params.permit(movie:[:name, :director, :description, :rank])
	end
end

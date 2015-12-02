class MoviesController < ApplicationController
	before_action only: [:show, :edit, :update, :vote] { @movie = Movie.find(params[:id]) }

	def index
		@movies = Movie.all.order(:rank).reverse
	end

	def new
		@movie = Movie.new
	end

	def create
  	@movie = Movie.create(movie_params[:movie])
		if @movie.save
  		redirect_to movies_path
  	else
  		render :new 
  	end
  end

  def show; end

  def edit; end

  def update
  	@movie.update(movie_params[:movie])
  	redirect_to movie_path(@movie)
  end

  def destroy
		Movie.destroy(params[:id])
		redirect_to movies_path
	end

  def vote
  	@movie.update(rank: @movie.rank += 1)
  	redirect_to :back
  end

	private
	def movie_params
  	params.permit(movie:[:name, :director, :description, :rank])
	end
end

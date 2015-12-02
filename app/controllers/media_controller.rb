class MediaController < ApplicationController
	before_action only: [:show, :edit, :update, :destroy, :vote] { @medium = Medium.find(params[:id]) }
	before_action only: [:index, :albums_index] { @albums = Medium.albums }
	before_action only: [:index, :books_index] { @books = Medium.books }
	before_action only: [:index, :movies_index] { @movies = Medium.movies }
	before_action only: [:show, :update, :destroy] { @type = @medium.type.pluralize }

	def index
		@albums.all.order(:rank).reverse.take(5)
		@books.all.order(:rank).reverse.take(5)
		@movies.all.order(:rank).reverse.take(5)
	end

	def albums_index
		@albums.all.order(:rank).reverse
		render :albums_index
	end

	def books_index
		@books.all.order(:rank).reverse
		render :books_index
	end

	def movies_index
		@movies.all.order(:rank).reverse
		render :movies_index
	end

	def show; end

	def new
		@medium = Medium.new
		@type = params[:type]
	end

	def create
  	@medium = Medium.new(media_params[:medium])

  	if @medium.save
  		redirect_to @medium
  	else
  		render new_polymorphic_path(@medium.type)
  	end
  end

  def edit; end

  def update
  	@medium.update(media_params[:medium])
  	redirect_to @medium
  end

  def destroy
		Medium.destroy(params[:id])
		redirect_to polymorphic_path(@type)
	end

 	def vote
  	@medium.update(rank: @medium.rank += 1)
  	redirect_to :back
  end

	private

	def media_params
		params.permit(medium:[:name, :creator, :description, :rank, :type])
	end
end

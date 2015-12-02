class MediaController < ApplicationController
	before_action only: [:show, :edit, :update, :destroy, :vote] { @medium = Medium.find(params[:id]) }
	before_action only: [:index, :albums_index] { @albums = Medium.albums }
	before_action only: [:index, :books_index] { @books = Medium.books }
	before_action only: [:index, :movies_index] { @movies = Medium.movies }
	before_action only: [:show, :edit, :destroy, :vote] { @type = @medium.type.pluralize }

	def index
		@albums.all.order(:rank).reverse.take(5)
		@books.all.order(:rank).reverse.take(5)
		@movies.all.order(:rank).reverse.take(5)
	end

	def albums_index
		@albums.all.order(:rank).reverse
		render :media_index
	end

	def books_index
		@books.all.order(:rank).reverse
		render :media_index
	end

	def movies_index
		@movies.all.order(:rank).reverse
		render :media_index
	end

	def show; end

	def new
		@medium = Medium.new
		@type = params[:type]
	end

	def create
  	@medium = Medium.create(media_params[:medium])

  	if @medium.save
  		redirect_to @medium
  	else
  		render "new"
  	end
  end

  def edit; end

  def update
  	media_type = @medium.type.downcase.singularize

  	@medium.update(
  		creator: params[media_type][:creator], 
  		name: params[media_type][:name], 
  		cddescription: params[media_type][:description])
  	redirect_to @medium
  end

  def destroy
		Medium.destroy(params[:id])
		redirect_to polymorphic_path(@type.downcase)
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

class AlbumsController < ApplicationController
	before_action only: [:show, :edit, :update, :vote] { @album = Album.find(params[:id]) }

	def index
		@albums = Album.all.order(:rank).reverse
	end

	def new
		@album = Album.new
	end

	def create
  	@album = Album.create(album_params[:album])
		if @album.save
  		redirect_to albums_path
  	else
  		render :new 
  	end
  end

  def show
  end

  def edit
  end

  def update
  	@album.update(album_params[:album])
  	redirect_to album_path(@album)
  end

  def destroy
		Album.destroy(params[:id])
		redirect_to albums_path
	end

	def vote
  	@album.update(rank: @album.rank += 1)
  	redirect_to :back
  end

	private
	def album_params
  	params.permit(album:[:name, :artist, :description, :rank])
	end
end

class AlbumsController < ApplicationController
	def index
		@albums = Album.all
	end

	def new
		@album = Album.new
	end

	def create
  	Album.create(album_params[:album])
		redirect_to albums_path
  end

  def show
  	@album = Album.find(params[:id])
  end

  def edit
  	@album = Album.find(params[:id])
  end

  def update
  	@album = Album.find(params[:id])
  	@album.update(album_params[:album])
  	redirect_to album_path(@album)
  end

  def vote
  	@album = Album.find(params[:id])
  	@album.rank += 1
  end

  def destroy
		Album.destroy(params[:id])

		redirect_to albums_path
	end

	private
	def album_params
  	params.permit(album:[:name, :artist, :description, :rank])
	end
end

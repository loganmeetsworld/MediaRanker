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

	private
	def album_params
  	params.permit(album:[:name, :artist, :description, :rank])
	end
end

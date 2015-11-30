class WelcomeController < ApplicationController
	def index
		@albums = Album.all
		@books = Book.all
		@movies = Movie.all
	end
end

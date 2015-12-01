class WelcomeController < ApplicationController
	def index
		@albums = Album.all.order(:rank).reverse.take(5)
		@books = Book.all.order(:rank).reverse.take(5)
		@movies = Movie.all.order(:rank).reverse.take(5)
	end
end

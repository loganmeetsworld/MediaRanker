class WelcomeController < ApplicationController
  def index
    @albums = Medium.albums.all.order(:rank).reverse.take(5)
    @books = Medium.books.all.order(:rank).reverse.take(5)
    @movies = Medium.movies.all.order(:rank).reverse.take(5)
  end
end

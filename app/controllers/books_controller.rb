class BooksController < ApplicationController
	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
  	Book.create(book_params[:book])
		redirect_to books_path
  end

	private

	def book_params
  	params.permit(book:[:name, :author, :description, :rank])
	end
end

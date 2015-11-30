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

  def show
  	@book = Book.find(params[:id])
  end

  def vote
  	@book = Book.find(params[:id])
  	@book.rank += 1
  	render "index"
  end

	private

	def book_params
  	params.permit(book:[:name, :author, :description, :rank])
	end
end

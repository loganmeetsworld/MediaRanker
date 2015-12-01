class BooksController < ApplicationController
	before_action only: [:show, :edit, :update, :vote] { @book = Book.find(params[:id]) }

	def index
		@books = Book.all.order(:rank).reverse
	end

	def new
		@book = Book.new
	end

	def create
  	Book.create(book_params[:book])
		redirect_to books_path
  end

  def show
  end

  def edit
  end

  def update
  	@book.update(book_params[:book])
  	redirect_to book_path(@book)
  end

  def destroy
		Book.destroy(params[:id])
		redirect_to books_path
	end

 	def vote
  	@book.update(rank: @book.rank += 1)
  	redirect_to :back
  end

	private

	def book_params
  	params.permit(book:[:name, :author, :description, :rank])
	end
end

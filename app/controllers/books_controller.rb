class BooksController < ApplicationController
layout 'books'

	def index
		@books = Book.order('id ASC').limit(10)
	end

	def show
		@book = Book.find(params[:id])
	end

	def search
		@books = Book.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(10)
	end

	def register
		@book = Book.find(params[:id])
		@book.users << current_user
		redirect_to action: :search
	end

	private

	def set_shelfrecord
		@user = current_user
		@book = book(params[:id])
	end
	def books_params
		params.require(:BooksUser).permit(:user_id, :book_id).merge(book_id: params[:book_id])
	end
end

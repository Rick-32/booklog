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
end

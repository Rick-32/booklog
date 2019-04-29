class BooksUsersController < ApplicationController
layout 'bookshelves'
  def index
    # @user = User.find(params[:id])他のユーザーの本棚を閲覧する機能を追加する場合
    @booklist = BooksUser.where(user_id: current_user.id)
  end

  def show
    @books_user = BooksUser.find(params[:id])
    @book_id = @books_user.book_id
    @book = Book.find(@book_id)
  end

  def edit
    @user_id = params[:user_id]
    @books_user_id = params[:books_user_id]

  end

  def destroy
    @list = BooksUser.find(params[:id])
    @list.destroy
  end
end

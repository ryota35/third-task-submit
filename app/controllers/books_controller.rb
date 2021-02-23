class BooksController < ApplicationController

  def index
    @books = Book.all
    @new = Book.new
    @user = current_user
  end

  def create
    @new = Book.new(book_params)
    @new.user_id = current_user.id
    if @new.save
      redirect_to book_path(@new.id), notice:'You have created book successfully.'
    else
      @books = Book.all
      @user = current_user
      render "index"
    end
  end

  def show
    @new = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice:'You have updated book successfully.'
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end

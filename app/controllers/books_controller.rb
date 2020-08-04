class BooksController < ApplicationController
  def start
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render action: :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

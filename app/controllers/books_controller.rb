class BooksController < ApplicationController
  def new
  end

  def index
    @book_new = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to @book
  end
  
  

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

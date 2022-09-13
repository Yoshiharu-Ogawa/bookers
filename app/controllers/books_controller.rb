class BooksController < ApplicationController
  def new
  end

  def index
    @book_new = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def create
    @book_new = Book.new(book_params)
    if @book_new.save
      redirect_to @book_new
      flash[:notice] = "Book was successfully created"
    else
      @books = Book.all
      render :index
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:notice] = "Book was successfully"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

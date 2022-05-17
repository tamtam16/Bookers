class BooksController < ApplicationController
  def index
    @book = Book.new # post new book
    @books = Book.all # get all book
    
  end

  def show
    @book = Book.find(params[:id]) # find the book by id
  end

  def edit
    @book = Book.find(params[:id]) # find the book by id
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book), notice: 'Book was successfully updated.'
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
      @books = Book.all # get all book
      render :index
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path notice: 'Book was successfully destroyed'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
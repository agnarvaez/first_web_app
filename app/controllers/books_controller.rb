class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.create(book_params)

  end

  def update
  end

  def destroy
  end

  private
  def book_params

  end
end

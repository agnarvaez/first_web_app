class BooksController < ApplicationController

  before_action :set_book, only: [ :show, :edit, :update, :destroy ]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was created successfully.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was updated successfully.' }
        format.json { render :show, status: :updated, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @book.destroy
      respond_to do |format|
        format.html { redirect_to books_url, notice: 'Book was destroyed successfully.' }
        format.json { head :no_content }
      end
    else
      flash[:error] = "Boook not destroyed"
      redirect_back
    end
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :price, :category_id, :publisher_id, :publish_date, :isbn, author_ids:[ ])
  end
end

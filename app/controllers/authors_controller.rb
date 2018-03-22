class AuthorsController < ApplicationController

  before_action :set_author, only: [ :show, :edit, :update, :destroy ]

  def index
    @authors = Author.all
  end

  def show
    @books = @author.books
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was created successfully.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was updated successfully.' }
        format.json { render :show, status: :updated, location: @author }
      else
        format.html { render :edit }
        format.json { render @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @author.destroy
      redirect_to authors_url, notice: 'Author was successfully destroyed'
    else
      flash[:error] = "Could not delete author."
      redirect_back
    end
  end

private
  def set_author
    @author = Author.find(params[:id])
  end
  def author_params
    params.require( :author ).permit( :first_name, :last_name, :genre, :dobirth, :dodeath )
  end
end

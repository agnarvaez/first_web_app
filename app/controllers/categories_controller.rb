class CategoriesController < ApplicationController

  before_action :set_category, only: [ :edit, :update, :show, :destroy ]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was created successfully.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was updated successfully.' }
        format.json { render :show, status: :updated, location: @category }
      else
        format.html { render :edit }
        format.json { render @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_url, notice: 'Category was destroyed successfully.' }
        format.json { head :no_content }
      end
    else
      flash[:error] = "Category not deleted"
      redirect_back
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:title)
  end
end

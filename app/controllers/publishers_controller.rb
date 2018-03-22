class PublishersController < ApplicationController

  before_action :set_publisher, only: [ :edit, :show, :update, :destroy ]
  def index
    @publishers = Publisher.all
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, notice: 'Publisher was created successfully.' }
        format.json { render :show, status: :created, location: @publisher }
      else
        format.html { render :new }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to @publisher, notice: 'Publisher was updated successfully.' }
        format.json { render :show, status: :updated, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to publishers_url, notice: 'Publisher was destroyed successfully.' }
      format.json { head :no_content }
    end
  end

  private
  def set_publisher
    @publisher = Publisher.find(params[ :id ])
  end
  def publisher_params
    params.require(:publisher).permit(:title, :city, :state)
  end
end

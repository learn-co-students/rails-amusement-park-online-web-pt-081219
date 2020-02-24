class AttractionsController < ApplicationController
  def new 
    @attraction = Attraction.new
  end 

  def create 
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else 
      render :new
    end 
  end 

  def show 
    @attraction = Attraction.find_by(id: params[:id])
    @user = User.find_by(id: params[:id])
  end 

  def index 
    @attractions = Attraction.all
  end 

  def edit 
    @attraction = Attraction.find_by(id: params[:id])
  end 

  def update 
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    if @attraction.save 
      redirect_to attraction_path(@attraction)
    else
      redirect_to edit_attraction_path(@attraction)
    end 
  end 

  private 

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
  end 
end 
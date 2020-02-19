class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update]
    before_action :admin_only, except: [:index, :show]
  
    def index
      @attractions = Attraction.all
    end
  
    def new
      @attraction = Attraction.new
    end
  
    def create
      @attraction = Attraction.create(attraction_params)
      if @attraction.valid?
        redirect_to attraction_path(@attraction), notice: 'Attraction was successfully created.'
      else
        render :new
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      @attraction.update(attraction_params)

      if @attraction.save
        #checks if valid and then saves
      # if @attraction.valid?
      #   @attraction.save
        redirect_to attraction_path(@attraction), notice: 'Attraction was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @attraction.destroy
      redirect_to attractions_path
    end
  
    private
    def set_attraction
      @attraction = Attraction.find_by(id: params[:id])
      #would usually be in the update action with below
      #   @attraction.assign_attributes(attraction_params)
    end
  
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
  end

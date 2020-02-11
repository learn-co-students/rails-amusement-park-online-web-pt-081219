class AttractionsController < ApplicationController
    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            redirect_to attractions_path
        end
    end

    def index
        @user = User.find(session[:user_id])
        @attractions = Attraction.all
    end

    def show
        @user = User.find(session[:user_id])
        @attraction = Attraction.find(params[:id])
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end

    private
    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
      end
end
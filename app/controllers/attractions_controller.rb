class AttractionsController < ApplicationController
    before_action :require_login

    def index
        @attractions = Attraction.all
    end
    def new
        @attraction = Attraction.new
    end
    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end
    def show
        @attraction = Attraction.find(params[:id])
        @ride = Ride.new
    end
    def edit
        @attraction = Attraction.find_by(:id => params[:id])
    end

    def update
        @attraction = Attraction.find_by(:id => params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end
    

    private
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
    end
    def require_login
        redirect_to '/' unless session.include? :user_id
    end
end

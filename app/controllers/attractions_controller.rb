class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all 
    end 

    def show 
        @attraction = Attraction.find(params[:id])
        @ride = Ride.new(:user_id => session[:user_id], :attraction_id => @attraction.id)
        render :show 
        return 
        # binding.pry
    end 

    def edit
        @attraction = Attraction.find(params[:id]) 
    end 

    def update 
        @attraction = Attraction.find(params[:id])
        @attraction.update(name: params[:attraction][:name])
        redirect_to attraction_path(@attraction)

    end 

    def new 
        @user = User.find(session[:user_id])
        if @user.admin == true 
            @attraction = Attraction.new
            render :new 
        else 
            redirect_to attractions_path
            return 
        end  
    end 

    def create 
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
        return
    end 
    

    private 

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end 
end




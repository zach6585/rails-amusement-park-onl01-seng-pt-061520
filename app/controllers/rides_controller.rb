class RidesController < ApplicationController
    def create 
        # binding.pry
        @ride = Ride.create(ride_params)
        @user = @ride.user
        @ridden = @ride.take_ride
        # binding.pry
        # @user.update(@ridden.)
        # # binding.pry
        redirect_to controller: 'users', action: 'show', id: @user.id, message: @ridden
        # redirect_to user_path(@user), params: request.query_parameters
        return  
    end
    
    private 

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end 
end

require 'pry'
class UsersController < ApplicationController
     
    def new 
        @user = User.new 
    end 

    def show
        # binding.pry
        if params.include?("message")
            @message = params[:message]
        end 
        if session[:user_id]
            @user = User.find(session[:user_id])
        else 
            redirect_to '/'
            return
        end 
    end 

    def create 
        # binding.pry
        @user = User.new(user_params)
        # if params[:user[admin]] == "admin"
        # binding.pry
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            # binding.pry
            redirect_to user_path(@user)
            return
        else 
            redirect_to new_user_path
        end 
    end 

    def home 
    end 

    def update
        binding.pry 
    end 
    def signin
        @users = User.all 
    end 

    def signed
        @user = User.find_by(:name => params[:user_name])
        if @user.authenticate(params[:user_password])
            if params[:user_admin] != false
                @user.admin = true 
                # @user.update(user_params) 
            end  
            session[:user_id] = @user.id
            redirect_to user_path(@user)
            return
        else
            redirect_to signed_path
        end 
    end 

    def destroy 
        session.delete(:user_id)
        redirect_to root_path
        return
    end 

    private 

    def user_params 
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end 
end

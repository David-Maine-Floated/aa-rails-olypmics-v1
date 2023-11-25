require 'byebug'


class UsersController < ApplicationController

    def create 
        # debugger 
        @user = User.create(user_params)

        if @user.save 
            redirect_to gardens_url 
        else  
            render 'new'
        end
    end


private 

    def user_params  
        params.require(:user).permit(:username)
    end


end
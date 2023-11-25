
require 'byebug'

class FlowersController < ApplicationController  

    def create 
        @flower = Flower.create(flower_params)
        @garden = Garden.find(flower_params[:garden_id])
        if @flower.save 
            redirect_to garden_url(@garden)
        else  
            
            redirect_to garden_url(@garden)
        end
    end

    def destroy  
        @flower = Flower.find(params[:id])
        @garden = Garden.find(@flower[:garden_id])
        Flower.delete(params[:id])
          
        redirect_to garden_url(@garden)
    end

private 
    def flower_params 
        params.require(:flower).permit(:flower_type, :gardener_id, :garden_id)
    end
end
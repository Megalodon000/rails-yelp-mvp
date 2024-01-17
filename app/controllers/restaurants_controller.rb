class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: %i[show edit update destroy chef]

    def top
        @restaurants = Restaurant.where(rating: 5)
    end

    def index
        @restaurant = Restaurant.all
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to @restaurant, notice: "Restaurant was successsfully created"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @restaurant = Restaurant.find(params[:id])
        if @restaurant.update(restaurant_params)
            redirect_to @restaurant, notice: "Restaurant was successsfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def chef
        @chef_name = @restaurant.chef_name
    end

    def edit
        @restaurant = Restaurant.find(params[:id])
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to @restaurant, notice: "Restaurant was successsfully destroyed"
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
end

class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

   def show
    #@restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new # needed to instantiate the form_for
  end

   def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to restaurant_path(@restaurant)
  end

  def edit
    #@restaurant = Restaurant.find(params[:id])
  end

  def update
    #@restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    #@restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path
  end
 private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end

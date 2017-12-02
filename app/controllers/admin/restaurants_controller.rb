class Admin::RestaurantsController < ApplicationController

  before_action :check_admin
  before_action :find_restaurant, only: [:show]


  def index
    @restaurants=Restaurant.all
  end

 def new
  @restaurant=Restaurant.new
 end

 def create
  @restaurant=Restaurant.new(restaurant_params)

  if @restaurant.save
    flash[:notice]= "新增成功"
    redirect_to admin_restaurants_path
  else
    flash[:alert]= "新增失敗"
    render :new
  end
 end




  private

  def find_restaurant
    @restaurant=Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name,:tel,:address,:opening_hours,:description)
  end

end

class Admin::RestaurantsController < ApplicationController

  before_action :check_admin
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]


  def index
    @restaurants=Restaurant.page(params[:page]).per(10)
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

 def update 

  if @restaurant.update(restaurant_params)
    flash[:notice]= "更新成功"
    redirect_to admin_restaurant_path(@restaurant)
  else
    flash[:alert]= "更新失敗"
    render :edit
  end

 end

  def destroy
    @restaurant.delete
    redirect_to admin_restaurants_path
  end




  private

  def find_restaurant
    @restaurant=Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description,:image)
  end

end

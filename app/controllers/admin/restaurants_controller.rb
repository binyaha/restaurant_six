class Admin::RestaurantsController < ApplicationController

  before_action :check_admin
  before_action :find_restaurant, only: [:show]


  def index
    @restaurants=Restaurant.all
  end

 def new
  @restaurant=Restaurant.new
 end



  private

  def find_restaurant
    @restaurant=Restaurant.find(params[:id])
  end

end

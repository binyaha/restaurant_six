class Admin::RestaurantsController < ApplicationController

  before_action :check_admin

  def index
    @restaurants=Restaurant.all
  end

end

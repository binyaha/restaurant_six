class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @categories=Category.all
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  private

  def check_admin
    unless current_user.admin?
      flash[:alert] = "你不是管理員"
      redirect_to root_path
    end

  end

end

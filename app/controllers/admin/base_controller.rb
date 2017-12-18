class Admin::BaseController < ApplicationController
  

#function1-step12 優化後才變到這邊 撰寫check_admin的method 會給restaurants和categories的controller用
  private

  def check_admin
    unless current_user.admin?  #admin?方法尚未定義 
      flash[:alert] = "你不是管理員"
      redirect_to root_path #如果不是管理員則轉到前台首頁
    end

  end
#------------------由於admin?方法尚未定義 轉到model user

end
class RestaurantsController < ApplicationController

#function1-step3. 建立一個前台controller 然後建立一個初始的index method 一開始沒任何的內容
def index
#----------------------轉到controller admin::restaurants

#function5-step2 傳入所有餐廳資料跟分類資料 分類資料是做按鈕用的
  @restaurants=Restaurant.page(params[:page]).per(9)
  @categories=Category.all
end
#------------看view restaurant/index.html.erb(前台的)

#unction5-step5  傳入要顯示的餐廳資料
def show
  @restaurant=Restaurant.find(params[:id])
#------------------看前台的show.html.erb

  @comment=Comment.new
  
end

end

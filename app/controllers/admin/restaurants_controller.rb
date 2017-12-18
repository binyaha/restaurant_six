class Admin::RestaurantsController < Admin::BaseController

#function1-step11 增加檢查是否是管理著的功能
  before_action :check_admin
#------轉到controller admin::base

#這是程式優化
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
#-----------------

#function1-step4 建立一個後台controller 然後建立一個初始的index method 一開始沒任何的內容
  def index
#-----------------------轉到view。 restaurants/index.html.erb
#function2-step2 讀取index頁面需要的資料 原始是Restaurant.all 後來加入分頁功能
    @restaurants=Restaurant.page(params[:page]).per(10)  #function3-step6改寫成這樣 接著看view index
#-------------------轉到view admin/restaurants/index頁面
  end

#function2-step5 建立new頁面
 def new
  @restaurant=Restaurant.new  
 end
 #------轉到view new.html.rb

#function2-step8 如果儲存成功回首頁 儲存失敗則render現在頁面 
 def create
  @restaurant=Restaurant.new(restaurant_params) #restaurant_params方法還沒寫

  if @restaurant.save
    flash[:notice]= "新增成功"
    redirect_to admin_restaurants_path
  else
    flash[:alert]= "新增失敗"
    render :new
  end
 end
 #-------- 驗證資料和restaurant_params方法還沒寫 這裡先寫restaurant_params看最下面的private方法

#unction2-step15 update功能 跟create寫法差不多 差在編輯的資料不同 用.update 還有render頁面不同
 def update 

  if @restaurant.update(restaurant_params)
    flash[:notice]= "更新成功"
    redirect_to admin_restaurant_path(@restaurant)
  else
    flash[:alert]= "更新失敗"
    render :edit
  end

 end
 #---------update功能完成 一樣在controller做destroy功能


#unction2-step16 呼叫按鈕傳進來的params的資料後刪除，常犯錯的原因常常出在index view頁面的delete按鈕沒寫method
  def destroy
    @restaurant.delete
    redirect_to admin_restaurants_path
  end
#-----------玩能function2 餐廳後台CRUD  接著做function3 gem 新增與前端 轉到gemfile

#function2-step13 def edit 需要的資料跟def show一樣 下場也一樣，後來被before_action取代
#--------轉到view edit.html.erb


  private

#function2-step11 show功能裡面的內容 跟before_action搭配 故已經找不到def show
  def find_restaurant
    @restaurant=Restaurant.find(params[:id])
  end
#-----------轉到view show.html.erb

#function2-step9 送進表單必須的驗證 有幾項屬性是後來新增的
  def restaurant_params

    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description,:image, :category_id) 
    #function2-step8 傳入參數多了:category_id 接著做category的CRUD 看controller categories
  end
#--------------轉到model restaurant 寫驗證傳入資料是否正確功能
end

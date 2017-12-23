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

#function9-step2
def feeds
  @recent_restaurants=Restaurant.order(create_at: :desc).limit(10)
  @recent_comments=Comment.order(create_at: :desc).limit(10)

end

 def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

#-------------
  def dashboard
    @restaurant=Restaurant.find(params[:id])
  end

  def favorite
    @restaurant = Restaurant.find(params[:id])
    @restaurant.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    favorite=Favorite.where(user: current_user, restaurant: @restaurant)
    favorite.destroy_all
    redirect_back(fallback_location: root_path)
  end

end

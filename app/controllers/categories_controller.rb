class CategoriesController < ApplicationController

#unction5-step7 餐廳分類按鈕用的參數 每個參數用途 如以下的註釋 可以跟之後的view頁面交叉比對
  def show
    @categories = Category.all  #按下按鈕後 上排的按鈕必需存在 所以需要有所有的categories
    @category = Category.find(params[:id]) #知道按下按鈕後 知道對應的分類是哪一個
    @restaurants = @category.restaurants.page(params[:page]).per(9) #找出特定分類的餐廳資料
  end
end
#------------看view categories/show.html.erb

class Admin::CategoriesController < Admin::BaseController

#function4-step4 先驗證管理者身份 
  before_action :check_admin
#--------看def index

#程式優化
  before_action :find_category, only: [:update, :destroy]
#--------

#function4-step9 傳入index頁面的資料
  def index
    @categories = Category.all
#----------轉到view index頁面

#function4-step15 接收到edit按鈕的id 如果有id 就把id對應的data傳到form內
    if params[:id]
      @category = Category.find(params[:id])
    else
#--------此時點edit 可看到form內出現對應的分類名稱 接著做update 看底下的def update


#function4-step11 要給index 新增分類的form用的
      @category = Category.new
#--------------------看底下
    end
  end

#function4-step11 (在index方法也有一段) 跟restaurant差不多 差別在render的頁面是index 而create方法之前沒有@categories 這邊要重新拿資料
  def create
    @category=Category.new(category_params)
    if @category.save
      flash[:notice]= "Add a new category"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
#----------要寫category_params 方法 看最下面

  end

#function4-step16 跟create功能出不多 要注意的地方也是一樣
  def update
    
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "category was successfully updated"
    else
      @categories = Category.all
      render :index
    end
  end
#------------看底下的 destroy

#function4-step17  destroy標準寫法
  def destroy
    
    @category.destroy
    flash[:alert] = "category was successfully deleted"
    redirect_to admin_categories_path

  end
#---------完成分類的CRUD 到這後台已完成 開始做function5 前台 看routes.rb

  private
  #function4-step12 允許傳入name屬性
  def category_params
    params.require(:category).permit(:name)
  end
  #-------到model category 驗證name屬性必須存在

#程式優化
  def find_category
    @category = Category.find(params[:id])
  end
#----------

end

class ApplicationController < ActionController::Base
  
  #function1-step8 在所有的controller動作前都驗證身份
  before_action :authenticate_user!
  #-----------此時開啟網頁，會看到登入的頁面，註冊後可進到前台&後台．轉到view/layout的application
  protect_from_forgery with: :exception


end

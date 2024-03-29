class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller? 


  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name,  :history, :self_introduction, :pho, :age, :gender, :residence, :image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email,  :history, :self_introduction, :pho, :age, :gender, :residence, :image])
    end

    # paramsハッシュからユーザーを取得します。
    def set_user
      @user = User.find(params[:id])
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end

    def admin_users
      redirect_to root_url if current_user.admin?
      flash[:danger] = "管理者は削除出来ません"
    end

end

class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    # current_memberが存在し、adminであるかどうかを確認
    unless current_member&.admin?
      flash[:alert] = "管理者のみアクセスできます。"
      redirect_to root_path
    end
  end
end

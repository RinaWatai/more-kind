class Admin::FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
    @facilities = @facilities.tagged_with(params[:tag]) if params[:tag].present?
    @facilities = @facilities.page(params[:page]).per(10)
  end
  
  def show
    @facility = Facility.find(params[:id])
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to admin_facilities_path, notice: '施設が削除されました。'
  end
  
  private

  def tag_params
    params.require(:facility).permit(:title, :body, :tag_list, :image)
  end
end

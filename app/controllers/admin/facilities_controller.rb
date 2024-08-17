class Admin::FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
    @facilities = @facilities.tagged_with(params[:tag]) if params[:tag].present?
    @facilities = @facilities.page(params[:page]).per(10)
  end


  private

  def tag_params
    params.require(:facility).permit(:title, :body, :tag_list)
  end
end

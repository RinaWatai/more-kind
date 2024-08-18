class Member::FacilitiesController < ApplicationController
before_action :authenticate_member!, only: [:create, :edit, :update, :destroy]
    def new
      @facility = Facility.new
    end
  
    def index
      @facilities = Facility.all
      @facilities = @facilities.tagged_with(params[:tag]) if params[:tag].present?
      @facilities = @facilities.page(params[:page]).per(10)
    end
    
    def show
      @facility = Facility.find(params[:id])
      @comment = Comment.new
      @comments = Comment.all
    end
    
    def create
      @facility = Facility.new(facility_params)
      @facility.member = current_member
      @facility.save
        redirect_to member_facility_path(@facility)
    end
    
    def edit
      @facility = Facility.find(params[:id])
    end
    
    def update
      @facility = Facility.find(params[:id])
      if @facility.update(facility_params)
        redirect_to member_facility_path(@facility), notice: '施設が正しく更新されました。'
      else
        render :edit
      end
    end
    
    def destroy
      @facility = Facility.destroy
      redirect_to member_facilities_path, notice: '登録した施設を削除しました。'
    end
    
    private
    
    def facility_params
      params.require(:facility).permit(:title, :body, :member_id, :tag_list, :image)
    end
    
end

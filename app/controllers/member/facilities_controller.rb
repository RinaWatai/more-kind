class Member::FacilitiesController < ApplicationController
    def new
      @facility = Facility.new
    end
  
    def index
      @facilities = Facility.page(params[:page]).per(10)
    end
    
    def show
      @facility = Facility.find(params[:id])
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
        redirect_to @facility, notice: '施設が正しく更新されました。'
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
      params.require(:facility).permit(:title, :body, :member_id)
    end
end

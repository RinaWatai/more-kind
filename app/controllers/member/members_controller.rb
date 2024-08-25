class Member::MembersController < ApplicationController
  def index
    @members = Member.all
  end
  
  def show
    @member = current_member
    #@member = Member.find(params[:id])
    facility_ids = current_member.comments.pluck(:facility_id).uniq
    @facilities = Facility.where(id: facility_ids)
  end
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to member_path(@member)
    else
      render :new
    end
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    
    if @member.update(member_params)
      redirect_to member_member_path(@member)
    else
      render :edit
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_path
  end
  
  def confirm_withdraw
    @member = current_member
    @member.update(is_deleted: true, name: "退会済み")
    reset_session
    redirect_to root_path, notice: "ご利用ありがとうございました"
  end
  
  private
  
  def member_params
    params.require(:member).permit(:name, :email, :image)
  end
end
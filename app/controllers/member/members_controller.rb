class Member::MembersController < ApplicationController
  def index
    @members = Member.all
  end
  
  def show
    @member = current_member
    @member = Member.find(params[:id])
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
      redirect_to member_path(@member)
    else
      render :edit
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members_path
  end
  
  private
  
  def member_params
    params.require(:member).permit(:name, :email)
  end
end
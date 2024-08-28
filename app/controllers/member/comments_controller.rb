class Member::CommentsController < ApplicationController
  before_action :authenticate_member!, only: [:edit, :create, :destroy, :update]
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.member_id = current_member.id
    @comment.facility_id = params[:facility_id]
    if @comment.save
      redirect_to member_facility_path(@comment.facility_id)
    else
      flash[:alert] = "既に評価済みです。"
      redirect_to member_facility_path(@comment.facility_id)
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    facility_id = @comment.facility_id
    @comment.destroy
    redirect_to member_facility_path(facility_id)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :facility_id, :rate)
  end
end
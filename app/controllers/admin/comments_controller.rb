class Admin::CommentsController < ApplicationController
  
    def destroy
      @comment = Comment.find(params[:id])
      facility_id = @comment.facility_id
      @comment.destroy
      redirect_to admin_facility_path(facility_id)
    end

  private

  def comment_params
    params.require(:comment).permit(:body, :facility_id, :rate)
  end
end

class Member::CommentsController < ApplicationController
    def new
      @comment = Comment.new
    end
    
    def index
      @comments = Comment.page(params[:page]).per(10)
    end
    
    def show
      @comment = Comment.find(params[:id])
    end
    
    def create
      @comment.new
        @comment.save
          redirect_to member_facility_path(comment_params)
    end
    
    def edit
      @comment = Comment.find(params[:id])
    end
    
    def update
      @comment.new
      @comment.save
        redirect_to member_facility_path(comment_params)
    end
    
    def destroy
      @comment.destroy
        redirect_to member_facility_path
    end
    
    private
    
    def comment_params
      params.require(:comment).permit(:body, :rate, :member_id, :facility_id)
    end
end

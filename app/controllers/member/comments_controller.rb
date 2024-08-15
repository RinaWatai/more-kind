class Member::CommentsController < ApplicationController
before_action :authenticate_member!, only: [:edit, :create, :destroy, :update]
  
    def new
      @comment = Comment.new
    end
  
    def index
      @comments = Comment.page(params[:page]).per(10)
    end
  
  
    def create
      @comment = Comment.new(comment_params)
      @comment.member_id = current_member.id
      @comment.facility_id = params[:facility_id]
      if @comment.save
        redirect_to member_facility_path(@comment.facility_id), notice: 'コメントが作成されました。'
      else
        render :new, alert: 'コメントの作成に失敗しました。'
      end
    end
  
    def edit
      @comment = Comment.find(params[:id])
    end
  
    def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to member_facility_path(@comment.facility_id), notice: 'コメントが更新されました。'
      else
        render :edit, alert: 'コメントの更新に失敗しました。'
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      facility_id = @comment.facility_id
      @comment.destroy
      redirect_to member_facility_path(facility_id), notice: 'コメントが削除されました。'
    end
  
    private
  
    def comment_params
      params.require(:facility).permit(:body)
    end

end
class Member::FacilitiesController < ApplicationController
  before_action :authenticate_member!, only: [:create, :new, :edit, :update, :destroy]
    def new
      @facility = Facility.new
    end
  
def index
  @facilities = Facility.all
  @facilities = @facilities.tagged_with(params[:tag]) if params[:tag].present?
  @facilities = @facilities.latest if params[:latest]
  @facilities = @facilities.old if params[:old]

  if params[:star_count]
    # 評価のある施設のみを選別し、評価順に並べ替える
    facilities_with_ratings = @facilities.select do |facility|
      valid_comments = facility.comments.joins(:member).where(members: { is_deleted: false })
      valid_comments.present? && valid_comments.average(:rate).present?
    end

    # 各施設ごとの評価を計算し、評価順に並び替え
    facilities_with_ratings.sort_by! do |facility|
      valid_comments = facility.comments.joins(:member).where(members: { is_deleted: false })
      -valid_comments.average(:rate).to_f
    end

    @facility_ratings = facilities_with_ratings.each_with_object({}) do |facility, hash|
      valid_comments = facility.comments.joins(:member).where(members: { is_deleted: false })
      hash[facility.id] = valid_comments.average(:rate).to_f.round(1)
    end

    # 評価がある施設のみをページネーション対応に変換
    @facilities = Kaminari.paginate_array(facilities_with_ratings).page(params[:page]).per(10)
  else
    # クエリをActiveRecord::Relationとして取得
    @facilities = @facilities.page(params[:page]).per(10)

    # 各施設ごとの評価を計算
    @facility_ratings = @facilities.each_with_object({}) do |facility, hash|
      valid_comments = facility.comments.joins(:member).where(members: { is_deleted: false })
      hash[facility.id] = valid_comments.average(:rate).to_f.round(1) if valid_comments.present?
    end
  end
end
      
def show
  @facility = Facility.find(params[:id])
  @comment = Comment.new
  @comments = Comment.includes(:member).where(facility: @facility).where(members: { is_deleted: false })

  # コメントの評価を計算する
  @average_rating = @comments.average(:rate).to_f.round(1)
end
    
  def create
    @facility = Facility.new(facility_params)
    @facility.tag_list = Tag.where(id: params[:facility][:tag_ids]).pluck(:name).join(',')
    @facility.member = current_member
  
    if @facility.save
      redirect_to member_facility_path(@facility.id)
    else
      render :new
    end
  end
    
    def update
      @facility = Facility.find(params[:id])
      @facility.tag_list = Tag.where(id: params[:facility][:tag_ids]).pluck(:name).join(',')
      if @facility.update(facility_params)
        redirect_to member_facility_path(@facility), notice: '施設が正しく更新されました。'
      else
        render :edit
      end
    end
    
    def edit
      @facility = Facility.find(params[:id])
    end
    
    def destroy
      @facility = Facility.destroy
      redirect_to member_facilities_path, notice: '登録した施設を削除しました。'
    end
    
    def search
      @facility_ratings = {} unless @facility_ratings
      @facilities = Facility.search(params[:keyword]).page(params[:page]).per(10)
      render 'index'
    end
    
    private
    
    def facility_params
      params.require(:facility).permit(:title, :body, :member_id, :image, :postcode, :prefecture_code, :address_city, :address_street, :address_building)
    end

end

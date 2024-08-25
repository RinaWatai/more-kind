class Facility < ApplicationRecord
#アソシエーション
  has_many :comments, dependent: :destroy
  belongs_to :member
  has_many :tags
  has_one_attached :image
  
  #tag機能
  acts_as_taggable_on :tags

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  #検索機能
  def self.search(search)
    unless search.blank?
      Facility.where('title LIKE(?)', "%#{search}%")
    else
      Facility.order('created_at DESC')
    end
  end
  
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :high_rating, -> {
    left_joins(:comments).group(:id).order('AVG(comments.rate) DESC')
  }

  def average_rating
    return 0 if comments.empty?
    comments.average(:rate).to_f
  end
  
  include JpPrefecture
  jp_prefecture :prefecture_code

  #都道府県コードから都道府県名に変換変換
  def prefecture_name
  JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end

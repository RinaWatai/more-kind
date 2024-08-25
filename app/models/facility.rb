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
  
end

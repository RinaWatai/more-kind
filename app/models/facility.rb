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
  
  def average_rating
    return 0 if comments.empty?
    comments.average(:rating).to_f
  end
  
end

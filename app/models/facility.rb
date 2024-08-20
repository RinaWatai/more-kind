class Facility < ApplicationRecord
#アソシエーション
  has_many :comments, dependent: :destroy
  belongs_to :member
  has_one_attached :image
  
  #tag機能
  acts_as_taggable_on :tags
  has_many :favorites, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def self.search(search)
    unless search.blank?
      Facility.where('title LIKE(?)', "%#{search}%")
    else
      Facility.order('created_at DESC')
    end
  end
end

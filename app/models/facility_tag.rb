class FacilityTag < ApplicationRecord
#アソシエーション
  belongs_to :tag
  belongs_to :facility
  
  def average_rating
    comments.where.not(member: { is_deleted: true }).average(:rating).to_f
  end
end

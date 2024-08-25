class Comment < ApplicationRecord
# アソシエーション
  belongs_to :member
  belongs_to :facility
  
#facilityにたいして1commentしかできない制限
  validates :member_id, uniqueness: { scope: :facility_id }
  
# ★評価
  validates :rate, numericality: {
  less_than_or_equal_to: 5.0,
  greater_than_or_equal_to: 0.5 }, presence: true
end

class Comment < ApplicationRecord
# アソシエーション
  belongs_to :member
  belongs_to :facility
  
# ★評価
  validates :rate, numericality: {
  less_than_or_equal_to: 5.0,
  greater_than_or_equal_to: 1.0 }, presence: true
end

class Facility < ApplicationRecord
#アソシエーション
  has_many :comment, dependent: :destroy
  has_many :facility_tag, dependent: :destroy
  belongs_to :member
end

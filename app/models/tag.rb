class Tag < ApplicationRecord
#アソシエーション
  has_many :facility_tag, dependent: :destroy
end

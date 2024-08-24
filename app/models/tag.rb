class Tag < ApplicationRecord
#アソシエーション
  has_many :facilities, dependent: :destroy
end

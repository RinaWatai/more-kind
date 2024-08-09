class FacilityTag < ApplicationRecord
#アソシエーション
  belongs_to :tag
  belongs_to :facility
end

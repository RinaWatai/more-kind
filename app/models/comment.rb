class Comment < ApplicationRecord
# アソシエーション
  belongs_to :member
  belongs_to :facility
end

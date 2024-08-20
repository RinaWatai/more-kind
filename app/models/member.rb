class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # アソシエーション
  has_many :facilities, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image
  
  def member_image
    unless self.image.attached?
      file_path = Rails.root.join('app/assets/images/member_no_image.png')
      self.image.attach(io: File.open(file_path), filename: 'member-no-image.png', content_type: 'image/png')
    end
    self.image
  end
end
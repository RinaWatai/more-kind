class Facility < ApplicationRecord
  include Geocoder::Model::ActiveRecord

  # アソシエーション
  has_many :comments, dependent: :destroy
  belongs_to :member
  has_many :tags, dependent: :destroy
  has_one_attached :image

  # tag機能
  acts_as_taggable_on :tags

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  validates :postcode, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true

  # 検索機能
  def self.search(search)
    unless search.blank?
      Facility.where('title LIKE(?)', "%#{search}%")
    else
      Facility.order('created_at DESC')
    end
  end

  # ソート機能
  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
  scope :high_rating, -> {
    left_joins(:comments).group(:id).order('AVG(comments.rate) DESC')
  }

  # ★の総合評価
  def average_rating
    return 0 if comments.empty?
    comments.average(:rate).to_f
  end

  include JpPrefecture
  jp_prefecture :prefecture_code

  # 都道府県コードから都道府県名に変換
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  # Google map
  geocoded_by :full_address
  after_validation :geocode, if: :address_city_changed? || :address_street_changed?

  private

  # 住所のフルアドレスを返すメソッド
  def full_address
    [address_city, address_street, address_building].compact.join(' ')
  end
end
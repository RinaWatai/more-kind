class HomesController < ApplicationController

  def top
    @facilities = Facility.includes(:comments).all
    
    # 各施設ごとの評価を計算する
    @facility_ratings = @facilities.each_with_object({}) do |facility, hash|
      # コメントを取得し、関連するメンバーが削除されていないものにフィルタリング
      valid_comments = facility.comments.joins(:member).where(members: { is_deleted: false })
      hash[facility.id] = valid_comments.average(:rate).to_f.round(1) if valid_comments.present?
    end

    # 評価が高い順にソート
    @facilities_sorted = @facilities.sort_by { |facility| -@facility_ratings[facility.id].to_f }
                                     .take(3)
  end

  def about
  end
end
class HomesController < ApplicationController

  def top
    @facilities_sorted = Facility.joins(:comments)
                                 .select('facilities.*, AVG(comments.rate) as average_rate')
                                 .group('facilities.id')
                                 .order('average_rate DESC')
                                 .limit(3)
  end

  def about
  end
end
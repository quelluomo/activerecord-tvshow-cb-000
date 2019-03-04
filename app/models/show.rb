class Show < ActiveRecord::Base

  def self.highest_rating
    Show.maximum("rating")
  end

  def self.most_popular_show
    self.where("rating = ?", self.highest_rating).first
  end

  def self.lowest_rating
    Show.minimum("rating")
  end

  def self.least_popular_show
    self.where("rating = ?", self.lowest_rating).first
  end

  def self.ratings_sum
    self.sum("rating")
  end

  def self.popular_shows
    self.all.each do |shows|
      shows.where("rating > 5")
    end
  end

  end

end

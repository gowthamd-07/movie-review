class Review < ApplicationRecord

  #=========================== Call backs =======================================
  after_save :update_rating_average
  after_destroy :update_rating_average

  #=========================== Associations ======================================

  belongs_to :movie
  belongs_to :user

  private

  def update_rating_average
    self.movie.update(rating_average: self.movie.reviews.average(:star))
  end
end

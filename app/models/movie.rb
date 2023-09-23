class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  #======================== Scopes ==============================

  scope :created, -> (select_date) { where("movies.release_date = ?", select_date) }
  scope :movie_name, -> (name) { where("movies.name = ?", name)}
end

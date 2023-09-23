class AddRatingAverageToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :rating_average, :float
  end
end

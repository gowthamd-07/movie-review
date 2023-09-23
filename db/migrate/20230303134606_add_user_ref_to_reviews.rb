class AddUserRefToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :user, index: true, foreign_key: true
  end
end

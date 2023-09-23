class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :star
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end

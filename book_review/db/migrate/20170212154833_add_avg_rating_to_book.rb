class AddAvgRatingToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :avg_rating, :float
  end
end

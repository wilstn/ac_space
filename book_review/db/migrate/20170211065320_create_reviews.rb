class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :post
      t.integer :rating

      t.timestamps
    end
  end
end

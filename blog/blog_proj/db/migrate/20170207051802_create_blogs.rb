class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :category
      t.string :author
      t.text :post

      t.timestamps
    end
  end
end

class RemoveStuffFromBlog < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :stuff, :string
  end
end

class AddColumnsToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :remark, :text
    add_column :comments, :blog_id, :integer
  end
end

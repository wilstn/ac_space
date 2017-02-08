class AddStuffToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :stuff, :string
  end
end

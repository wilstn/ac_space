class AddColumn1ToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :email, :string
    add_column :comments, :user, :string
  end
end

class CreateJstimers < ActiveRecord::Migration[5.0]
  def change
    create_table :jstimers do |t|

      t.timestamps
    end
  end
end

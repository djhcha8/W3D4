class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :title
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end

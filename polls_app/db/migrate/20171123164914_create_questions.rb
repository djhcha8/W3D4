class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :quest
      t.integer :poll_id, null: false
      t.timestamps
    end
  end
end

class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id, :goal_id
      t.string :status
      t.float :quantity
      t.text :content
      t.timestamps
    end
  end
end

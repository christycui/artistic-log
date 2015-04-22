class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, :frequency, :unit
      t.float :quantity, :user_id
      t.timestamps
    end
  end
end

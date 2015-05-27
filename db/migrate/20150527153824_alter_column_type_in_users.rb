class AlterColumnTypeInUsers < ActiveRecord::Migration
  def change
    change_column :goals, :user_id, :integer
  end
end

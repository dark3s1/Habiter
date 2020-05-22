class RemoveLengthFromHabits < ActiveRecord::Migration[5.2]
  def change
    remove_column :habits, :length, :integer
    remove_column :habits, :real, :integer
    remove_column :habits, :start_time, :datetime
  end
end

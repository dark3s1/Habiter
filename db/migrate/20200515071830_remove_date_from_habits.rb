class RemoveDateFromHabits < ActiveRecord::Migration[5.2]
  def change
    remove_column :habits, :date, :date
  end
end

class AddStartTimeToReals < ActiveRecord::Migration[5.2]
  def change
    add_column :reals, :start_time, :datetime
  end
end

class AddStartTimeToPositionparent < ActiveRecord::Migration[5.2]
  def change
    add_column :positionparents, :start_time, :datetime
  end
end

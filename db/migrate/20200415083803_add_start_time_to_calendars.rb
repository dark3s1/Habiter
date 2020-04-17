class AddStartTimeToCalendars < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :start_time, :datetime
  end
end

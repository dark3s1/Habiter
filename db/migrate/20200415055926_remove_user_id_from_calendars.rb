class RemoveUserIdFromCalendars < ActiveRecord::Migration[5.2]
  def change
    remove_reference :calendars, :user_id, foreign_key: true
  end
end

class CreateCalendarHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_habits do |t|
      t.references :calendar, foreign_key: true
      t.references :habit, foreign_key: true

      t.timestamps
    end
  end
end

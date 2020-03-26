class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.date :date
      t.string :color

      t.timestamps
    end
  end
end

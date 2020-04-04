class CreateHabitTags < ActiveRecord::Migration[5.2]
  def change
    create_table :habit_tags do |t|
      t.references :habit, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end

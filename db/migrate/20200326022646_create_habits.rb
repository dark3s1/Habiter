class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.string :name
      t.string :color
      t.integer :length
      t.integer :target
      t.integer :real
      t.date :date

      t.timestamps
    end
  end
end

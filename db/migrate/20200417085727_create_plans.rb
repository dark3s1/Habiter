class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.references :habit, foreign_key: true
      t.integer :time
      t.datetime :date

      t.timestamps
    end
  end
end

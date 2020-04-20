class CreateReals < ActiveRecord::Migration[5.2]
  def change
    create_table :reals do |t|
      t.integer :time
      t.datetime :date

      t.timestamps
    end
  end
end

class CreatePositionparents < ActiveRecord::Migration[5.2]
  def change
    create_table :positionparents do |t|
      t.date :day

      t.timestamps
    end
  end
end

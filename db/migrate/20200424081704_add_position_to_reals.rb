class AddPositionToReals < ActiveRecord::Migration[5.2]
  def change
    add_column :reals, :position, :integer
  end
end

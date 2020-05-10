class AddPositionparentToReals < ActiveRecord::Migration[5.2]
  def change
    add_reference :reals, :positionparent, foreign_key: true
  end
end

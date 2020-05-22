class RemovePositionparentIdFromReals < ActiveRecord::Migration[5.2]
  def change
    remove_column :reals, :positionparent_id, :reference
  end
end

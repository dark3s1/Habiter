class RemovePositionparentFromReals < ActiveRecord::Migration[5.2]
  def change
    remove_column :reals, :positionparent, :reference
  end
end

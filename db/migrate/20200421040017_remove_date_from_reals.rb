class RemoveDateFromReals < ActiveRecord::Migration[5.2]
  def change
    remove_column :reals, :date, :datetime
  end
end

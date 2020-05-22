class RemoveUserFromReals < ActiveRecord::Migration[5.2]
  def change
    remove_column :reals, :user, :reference
  end
end

class AddDeletedAtToCoordinates < ActiveRecord::Migration[7.0]
  def change
    add_column :coordinates, :deleted_at, :datetime
    add_index :coordinates, :deleted_at
  end
end

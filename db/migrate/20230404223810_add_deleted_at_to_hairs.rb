class AddDeletedAtToHairs < ActiveRecord::Migration[7.0]
  def change
    add_column :hairs, :deleted_at, :datetime
    add_index :hairs, :deleted_at
  end
end

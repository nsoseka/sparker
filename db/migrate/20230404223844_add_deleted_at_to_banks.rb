class AddDeletedAtToBanks < ActiveRecord::Migration[7.0]
  def change
    add_column :banks, :deleted_at, :datetime
    add_index :banks, :deleted_at
  end
end

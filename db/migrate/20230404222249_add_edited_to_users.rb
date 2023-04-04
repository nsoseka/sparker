class AddEditedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :edited, :boolean, default: false
  end
end

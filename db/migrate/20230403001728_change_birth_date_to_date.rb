class ChangeBirthDateToDate < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :birth_date
    add_column :users, :birth_date, :date
  end
end

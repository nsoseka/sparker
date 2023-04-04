class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :state
      t.references :user

      t.timestamps
    end
  end
end

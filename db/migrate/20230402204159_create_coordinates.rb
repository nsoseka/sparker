class CreateCoordinates < ActiveRecord::Migration[7.0]
  def change
    create_table :coordinates do |t|
      t.string :lat
      t.string :lng
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end

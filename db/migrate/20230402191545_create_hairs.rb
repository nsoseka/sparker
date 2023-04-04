class CreateHairs < ActiveRecord::Migration[7.0]
  def change
    create_table :hairs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :color
      t.string :hair_type

      t.timestamps
    end
  end
end

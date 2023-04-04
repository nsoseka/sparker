class CreateBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :banks do |t|
      t.date :card_expire
      t.string :card_number
      t.string :card_type
      t.string :currency
      t.string :iban
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

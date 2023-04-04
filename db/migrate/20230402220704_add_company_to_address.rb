class AddCompanyToAddress < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :company
  end
end

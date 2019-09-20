class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :country
      t.reference :user
      t.reference :company

      t.timestamps
    end
  end
end
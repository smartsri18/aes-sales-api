class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.string :mobile_number
      t.text :address

      t.timestamps
    end
  end
end

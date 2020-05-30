class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :invoice, foreign_key: true
      t.string :name
      t.string :code
      t.decimal :rate, precision: 10, scale: 2
      t.integer :quantity
      t.decimal :total_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end

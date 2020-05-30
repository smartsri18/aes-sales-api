class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :entity_name
      t.integer :entity_type
      t.date :purchased_date
      t.decimal :taxable_amount, precision: 10, scale: 2
      t.integer :gst_amount
      t.decimal :invoice_amount, precision: 10, scale: 2
      t.integer :paid_status

      t.timestamps
    end
  end
end

# == Schema Information
#
# Table name: invoices
#
#  id             :integer          not null, primary key
#  entity_name    :string
#  entity_type    :integer
#  purchased_date :date
#  taxable_amount :decimal(10, 2)
#  gst_amount     :integer
#  invoice_amount :decimal(10, 2)
#  paid_status    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Invoice < ApplicationRecord
  has_many :products

  enum entity_type: [:customer, :vendor]
  enum paid_status: [:pending, :success, :failed]

  accepts_nested_attributes_for :products
end
